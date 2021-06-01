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
                       QgsProcessingUtils,
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
                       NULL)
import processing
import datetime
import sys
import os

from ..externals import path, checkDuplicates, value_error
from pathlib import Path

import exifread

try:
    import exif
    from exif import Image
    iface.messageBar().pushMessage("EXIF module found!", duration=3)
except:
    import subprocess
    subprocess.check_call(['python', '-m', 'pip', 'install', 'exif'])
    iface.messageBar().pushMessage("Error", "No exif module found, installing!", level=Qgis.Critical, duration=10)


class PhotoGetList(QgsProcessingAlgorithm):
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
        return PhotoGetList()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This
        string should be fixed for the algorithm, and must not be localised.
        The name should be unique within each provider. Names should contain
        lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'photo_list'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('Pripravi seznam fotografij')

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
            Izberemo mapo kjer so vse fotografije projekta. Fotografije so lahko v podmapah, ni pa potrebno.

            Priporočljivo je izbrati mapo \"Fotoarhiv\", in vse fotografije shraniti v podmapi \"Začasno\".

            Seznam fotografij shranimo kot .gpkg v mapo fotoarhiv.
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
                self.tr('Mapa s fotografijami'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue=None
            )
        )
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT,
                self.tr('Seznam fotografij')
            )
        )



    def readDir(self, dir, feedback): 
        files_count = 0
        for dirpath, dirnames, filenames in os.walk(dir):
            for name in filenames:
                file_path = os.path.join(dirpath, name)
                extension = os.path.splitext(name)[1].lower()
                if extension in ('.tif', '.jpg', '.png', '.raw', '.nef', '.dng', '.arw'):
                    self.listOfFiles.append(file_path) 
                else:
                    feedback.pushInfo('Ni fotografija: %s' % file_path)
                    files_count = files_count + 1

        
        feedback.pushInfo('Najdenih fotografij: %s.' % len(self.listOfFiles))               
        if files_count > 0:
            feedback.pushInfo("%s datotek, ki niso fotografije!" % files_count)


    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """

        photos_folder =  parameters[self.PHOTO_FOLDER]
        feedback.pushInfo('Berem mapo s fotografijami: %s' % str(photos_folder))

    
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
        self.readDir(photos_folder, feedback)    


        total = 100.0 / len(self.listOfFiles)

        files_list = []

        for iFeat, file_path in enumerate(self.listOfFiles):  
            try:
                with open(file_path, 'rb') as image_file:
                    tags = exifread.process_file(image_file, stop_tag="EXIF DateTimeOriginal")
                    date = tags["EXIF DateTimeOriginal"]     
            except:
                date = ''

            files_list.append({'file_path': str(file_path), 'date':date})

             # A function that returns the 'year' value:
        def myFunc(e):
            return str(e['date'])
        files_list.sort(key=myFunc)  

        for iFeat, file_path in enumerate(files_list): 
            date = file_path['date']
            feedback.pushInfo(str(file_path['file_path']))
            """
            features = sorted(dest_id.getFeatures(), key="datum posnetka")
            feedback.pushInfo(str('evo0'))
            for a in dest_id.getFeatures():
            
            """


        for iFeat, photo_file in enumerate(files_list):   
            feedback.setProgress(int(iFeat * total))  
            file_path = photo_file['file_path']
            date = photo_file['date']
            filename_w_ext = os.path.basename(file_path)
            filename, file_extension = os.path.splitext(filename_w_ext)
            #feedback.pushInfo(filename)
            #Create new Feature
            newFeat = QgsFeature(fields)
            newFeat.setAttribute("fid", iFeat)
            newFeat.setAttribute("ime", filename_w_ext)
            newFeat.setAttribute("originalno ime", file_path)      
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
    
        



        
        self.dest_id = dest_id
        return {self.OUTPUT: dest_id}

    def postProcessAlgorithm(self, context, feedback):
        """
        PostProcessing Tasks to define the Symbology
        """
        output = QgsProcessingUtils.mapLayerFromString(self.dest_id, context)
        style = path('styles')/'Seznam fotografij.qml'
        #feedback.pushInfo(str(style))

        output.loadNamedStyle(str(style))
        output.triggerRepaint()

        return {self.OUTPUT: self.dest_id}
