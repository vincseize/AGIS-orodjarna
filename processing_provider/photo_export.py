# -*- coding: utf-8 -*-

"""
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
Matjaž Mori, ZVKDS CPA

"""

from PyQt5.QtCore import QCoreApplication, QObject,QFileInfo,QVariant
from PyQt5.QtGui import QIcon
from qgis.utils import iface
from qgis.core import (Qgis,
                       QgsProcessingParameterString,
                       QgsProcessing,
                       QgsFeatureSink,
                       QgsMessageLog,
                       QgsProcessingException,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterFile,
                       QgsApplication,
                       QgsFields,
                       QgsField,
                       QgsProject,
                       QgsFeature,
                       QgsProcessingParameterFeatureSink,
                       QgsVectorLayer,
                       QgsFeatureRequest,
                       QgsProcessingUtils,
                       NULL)
import processing
import datetime
import sys
import os
from shutil import copyfile

from pathlib import Path
from ..externals import path, field_index

class PhotoExport(QgsProcessingAlgorithm):
    """
    This is algorithm that takes a folder and creates list of files with exif attributes.
    """
    PHOTO_FOLDER = 'PHOTO_FOLDER'
    OUTPUT = 'OUTPUT'
    

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return PhotoExport()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This
        string should be fixed for the algorithm, and must not be localised.
        The name should be unique within each provider. Names should contain
        lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'photo_export'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('02 Preimenuj in uredi fotografije')

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string
        should be localised.
        """
        return self.tr(u'Fotoarhiv')
        pass

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to. This
        string should be fixed for the algorithm, and must not be localised.
        The group id should be unique within each provider. Group id should
        contain lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'fotoarhiv'
        pass

    def shortHelpString(self):
        """
        Returns a localised short helper string for the algorithm. This string
        should provide a basic description about what the algorithm does and the
        parameters and outputs associated with it..
        """

        help = ("""
            Izberemo mapo "Fotoarhiv"!
            Orodje bo poiskalo geopaket s seznamom fotografij, preimenovalo fotografije in  jih pospravilo v ustrezne mape glede na žanr. 
            
            Mapa mora vsebovati le en geopaket!!
            V fotoarhivu ne smejo obstajat mape Dokumentarni, Delovni..
            
            <h3></h3>
            <ul>
            </ul>
            """)
        return self.tr(help)

    def icon(self):
        """
        Should return a QIcon which is used for your provider inside
        the Processing toolbox.
        """
        return QIcon()

    def initAlgorithm(self, config=None):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """

        self.addParameter(
            QgsProcessingParameterFile(
                self.PHOTO_FOLDER, 
                self.tr('Fotoarhiv'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue=None
            )
        )

        try:
            default_code = os.path.basename(QgsProject.instance().fileName())
            default_code = str(default_code)[:7]
        except:
            default_code = ''


        self.addParameter(
            QgsProcessingParameterString(
                'project_code', 
                'Številka projekta', 
                multiLine=False, 
                defaultValue=default_code
            )
        )


        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT,
                self.tr('Fotografije pripravljene za izbrisat')
            )
        )


    def readDir(self, dir, feedback): 
        files_count = 0
        for dirpath, dirnames, filenames in os.walk(dir):
            for name in filenames:
                file_path = os.path.join(dirpath, name)
                extension = os.path.splitext(name)[1].lower()
                if extension == '.gpkg':
                    photos_list_path = file_path 
                    layer_name = os.path.splitext(name)[0]
                    files_count = files_count + 1
      
        if files_count > 1:
            raise Exception("V mapi fotoarhiv je več geopaketov, dovoljen je le eden!")
        else:
            return (photos_list_path, layer_name)

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """

        photos_folder =  parameters[self.PHOTO_FOLDER]
        project_code = parameters['project_code']
        feedback.pushInfo('Berem mapo s fotografijami: %s' % str(photos_folder))
        base = os.path.basename(photos_folder)
        if base != 'Fotoarhiv':
            raise Exception("Ni bila izbrana mapa Fotoarhiv!")


        # Find and load geopackage photos list
        geopackage = self.readDir(photos_folder, feedback) 
        geopackage_path = str(geopackage[0])
        geopackage_layer = str(geopackage[1])

        gpkg_layer = geopackage_path + "|layername=" + geopackage_layer
        feedback.pushInfo('Nalagam sloj: \n %s' % gpkg_layer)
        vlayer = QgsVectorLayer(gpkg_layer, geopackage_layer, "ogr")
        if not vlayer.isValid():
            raise Exception("Seznama fotografij ni bilo mogoče prebrati!")
        else:
            features = vlayer.getFeatures()


        #Create temp layer for removed photos

        (sink, dest_id) = self.parameterAsSink(
                    parameters,
                    self.OUTPUT,
                    context,
                    vlayer.fields(),
                    vlayer.wkbType(),
                    vlayer.sourceCrs()
                )
        if sink is None:
            raise QgsProcessingException(self.invalidSinkError(parameters, self.OUTPUT))




        # Get list of features sorted by date taken
        request = QgsFeatureRequest()

        clause = QgsFeatureRequest.OrderByClause('datum posnetka', ascending=True)
        orderby = QgsFeatureRequest.OrderBy([clause])
        request.setOrderBy(orderby)
        features = vlayer.getFeatures(request)

 
        no_type = []    
        for feature in features:
            if feature["žanr"] == NULL and feature["izbriši"] != True:
                no_type.append(feature['ime'])    
        if len(no_type) > 0:
            raise Exception(str("Manjka žanr fotografij: %s" % no_type))

       



        #Get unique values of "žanr" values
        photo_type = vlayer.fields().indexOf('žanr')
        types = vlayer.uniqueValues(photo_type)

        photo_delete = vlayer.fields().indexOf('izbriši')
        deleted_uniqe = vlayer.uniqueValues(photo_delete)

        if True in deleted_uniqe:
            try:
                delete_folder = os.path.join(photos_folder, 'Za izbrisat')
                os.mkdir(delete_folder)
            except:
                raise Exception("Mape %s ni bilo mogoče ustvariti, morda že obstaja!" % delete_folder)
 
        if "Nedokumentarni" in types:
            folder = os.path.join(photos_folder, "Nedokumentarni posnetki")
            try:
                os.mkdir(folder)
            except:
                raise Exception("Mape %s ni bilo mogoče ustvariti, morda že obstaja!" % folder)

        if "Delovni" in types or  "Strokovni" in types:
            folder = os.path.join(photos_folder, "Dokumentarni posnetki")
            try:
                os.mkdir(folder)
            except:
                raise Exception("Mape %s ni bilo mogoče ustvariti, morda že obstaja!" % folder)
        


        #Remove features to be deleted
        counter = 0
        counter_docu = 0
        counter_nedocu = 0
        counter_deleted = 0
        total = vlayer.featureCount()
        feedback.pushInfo('Št. vseh fotografij: %s' % str(total))
        zeros = len(str(total))


        vlayer.startEditing()
        features = vlayer.getFeatures(request)
        for current, feature in enumerate(features):
            field_delete = field_index(vlayer, 'izbriši')
            field_path = field_index(vlayer, 'originalno ime')
            photo_type = field_index(vlayer, 'žanr')
        
            photo_path =  feature[field_path]
            photo_name = os.path.splitext(os.path.basename(photo_path))[0]
            photo_ext = os.path.splitext(os.path.basename(photo_path))[1]
        
            date = field_index(vlayer, 'datum posnetka')
            if feature[field_delete]: 
                counter_deleted += 1
                sink.addFeature(feature, QgsFeatureSink.FastInsert)
                photo_name = os.path.basename(photo_path)
                dst = os.path.join(delete_folder, photo_name )
                copyfile(feature[field_path], dst)
                vlayer.deleteFeature(feature.id())
                
             
            elif feature[photo_type] == 'Delovni' or  feature[photo_type] == 'Strokovni':
                counter_docu += 1                       
                folder_keep = os.path.join(photos_folder, "Dokumentarni posnetki")
                new_name = str(project_code) + '_' + str(counter_docu).zfill(zeros) + str(photo_ext)   
                dst_keep = os.path.join(folder_keep, new_name)
                copyfile(feature[field_path], dst_keep)
                """
                if "."  in feature[20]: 
                    old_name = os.path.splitext(photo_name)[0]
                    vlayer.changeAttributeValue(feature.id(), 20, str(photo_name))
                """
                vlayer.changeAttributeValue(feature.id(), 1, str(new_name))
                vlayer.changeAttributeValue(feature.id(), 20, str(dst_keep))
                

            elif feature[photo_type] == 'Nedokumentarni':
                counter_nedocu += 1    
                folder_keep = os.path.join(photos_folder, 'Nedokumentarni posnetki')
                photo_name = os.path.basename(photo_path)
                dst = os.path.join(folder_keep, photo_name )
                copyfile(feature[field_path], dst)
                vlayer.changeAttributeValue(feature.id(), 20, str(dst))

            # Stop the algorithm if cancel button has been clicked
            if feedback.isCanceled():
                break
        vlayer.commitChanges()
        #Remove  
       
        feedback.pushInfo('Št. vseh fotografij za izbrisat: %s' % str(counter_deleted))
        feedback.pushInfo('Št. vseh fotografij dokumentarnih fotografij: %s' % str(counter_docu))
        feedback.pushInfo('Št. vseh fotografij nedokumentarnih fotografij: %s' % str(counter_nedocu))
    
        """    
        vlayer.startEditing()
        for feature in features:
            vlayer.changeAttributeValue(feature.id(),2, 1)
        vlayer.commitChanges() 
        """    

        """
        fields = QgsFields()
        fields.append( QgsField( "fid", QVariant.Int ) )         #0
        fields.append( QgsField( "ime", QVariant.String ) )      #1
        fields.append( QgsField( "sektor", QVariant.String ) )   #2
        fields.append( QgsField( "kvadrant", QVariant.String ) ) #3
        fields.append( QgsField( "sonda", QVariant.String ) )    #4
        fields.append( QgsField( "SE", QVariant.String ) )    #5
        fields.append( QgsField( "PN", QVariant.String ) )    #6
        fields.append( QgsField( "FS", QVariant.String ) )    #7
        fields.append( QgsField( "VZ", QVariant.String ) )     #8
        fields.append( QgsField( "FL", QVariant.String ) )     #9
        fields.append( QgsField( "opis", QVariant.String ) )    #10
        fields.append( QgsField( "pogled", QVariant.String ) )   #11
        fields.append( QgsField( "vrsta", QVariant.String ) )    #12
        fields.append( QgsField( "oznake", QVariant.Bool ) )     #13
        fields.append( QgsField( "žanr", QVariant.String ) )     #14
        fields.append( QgsField( "avtor", QVariant.String ) )     #15
        fields.append( QgsField( "opombe", QVariant.String ) )     #16
        fields.append( QgsField( "izbriši", QVariant.Bool ) )    #17
        fields.append( QgsField( "datum posnetka", QVariant.DateTime ) )     #18
        fields.append( QgsField( "originalno ime", QVariant.String ) )      #19
        fields.append( QgsField( "pot", QVariant.String ) )     #20



        crsProject = QgsProject.instance().crs()        
        (sink, dest_id) = self.parameterAsSink(parameters, self.OUTPUT,
            context, fields, 100, crsProject) #100=WKBUnknown
        countFiles=0
        

   
        self.listOfFiles = []
           


        total = 100.0 / len(self.listOfFiles)



        for iFeat, file_path in enumerate(self.listOfFiles):   
            feedback.setProgress(int(iFeat * total))    
            filename_w_ext = os.path.basename(file_path)
            filename, file_extension = os.path.splitext(filename_w_ext)
            feedback.pushInfo(filename)
            #Create new Feature
            newFeat = QgsFeature(fields)
            newFeat.setAttribute("fid", iFeat)
            newFeat.setAttribute("ime", filename)

            with open(file_path, 'rb') as image_file:
                tags = exifread.process_file(image_file, stop_tag="EXIF DateTimeOriginal")
                date = tags["EXIF DateTimeOriginal"]     
                newFeat.setAttribute("datum posnetka", str(date)) #14

            newFeat.setAttribute("pot", file_path)
            # Add a feature in the sink
            sink.addFeature(newFeat, QgsFeatureSink.FastInsert)
            countFiles=countFiles+1
     

        msgInfo=self.tr(str(countFiles) + " fotografij dodanih v seznam.")
        feedback.pushInfo(msgInfo)
    


        # Retrieve the feature source and sink. The 'dest_id' variable is used
        # to uniquely identify the feature sink, and must be included in the
        # dictionary returned by the processAlgorithm function.
    
   
        #feedback.pushInfo('Seznam že obstaja, posodabljam...')



        
        return 
        """
        self.dest_id = dest_id
        return {self.OUTPUT: dest_id}

    def postProcessAlgorithm(self, context, feedback):
        """
        PostProcessing Tasks to define the Symbology
        """
        output = QgsProcessingUtils.mapLayerFromString(self.dest_id, context)
        style = path('styles')/'Seznam fotografij.qml'
        feedback.pushInfo(str(style))

        output.loadNamedStyle(str(style))
        output.triggerRepaint()

        return {self.OUTPUT: self.dest_id}
