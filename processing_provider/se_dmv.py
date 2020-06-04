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
"""

from qgis.PyQt.QtCore import QCoreApplication, QFileInfo, QVariant

from qgis.core import (QgsProject,
                       QgsProcessing,
                       QgsFeatureSink,
                       QgsProcessingException,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterFeatureSource,
                       QgsProcessingParameterVectorLayer,
                       QgsProcessingParameterRasterLayer,
                       QgsProcessingParameterFile,
                       QgsProcessingParameterFeatureSink,
                       QgsProcessingParameterFeatureSink,
                       QgsProcessingParameterRasterDestination,
                       QgsProcessingMultiStepFeedback,
                       QgsRasterLayer,
                       QgsVectorLayer,
                       QgsFeatureRequest,
                       QgsField,
                       QgsCoordinateReferenceSystem,
                       QgsProcessingParameterBoolean,
                       QgsProcessingParameterDefinition,
                       QgsGeometry,
                       QgsFeature,
                       QgsProcessingParameterField,
                       QgsProcessingParameterString,
                       QgsRasterBandStats
                       )
from qgis import processing
from ..externals import path
from pathlib import Path
import webbrowser
import datetime
import tempfile

class se_dmv(QgsProcessingAlgorithm):
    """
    This is an example algorithm that takes a vector layer and
    creates a new identical one.

    It is meant to be used as an example of how to create your own
    algorithms and explain methods and variables used to do it. An
    algorithm like this will be available in all elements, and there
    is not need for additional work.

    All Processing algorithms should extend the QgsProcessingAlgorithm
    class.
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    INPUT = 'INPUT'
    OUTPUT = 'OUTPUT'

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return se_dmv()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This
        string should be fixed for the algorithm, and must not be localised.
        The name should be unique within each provider. Names should contain
        lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'se_dmv'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('SE > DMV')

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string
        should be localised.
        """
        return self.tr('')

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to. This
        string should be fixed for the algorithm, and must not be localised.
        The group id should be unique within each provider. Group id should
        contain lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return ''

    def shortHelpString(self):
        """
        Returns a localised short helper string for the algorithm. This string
        should provide a basic description about what the algorithm does and the
        parameters and outputs associated with it..
        """
        help_text = """To orodje sprejme območja SE-jev ter mapo s fotoskicami in doda poligonom SE nadmorske višine. 
        Za posamezni SE izdela DMV.
        """
        return self.tr(help_text)

    def initAlgorithm(self, config=None):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """

        self.addParameter(
            QgsProcessingParameterFeatureSource(
                'su_polygons', 
                self.tr('meje SE'), 
                types=[QgsProcessing.TypeVectorPolygon], defaultValue=None
                )
            )

        try:
            default_in_older = Path(QgsProject.instance().homePath())/self.tr('Fotoskice')
        except:
            default_in_older = ''
        
        self.addParameter(
            QgsProcessingParameterFile(
                'raster_in', 
                self.tr('Mapa s fotoskicami'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue= str(default_in_older)
                )
            )

        
        strparam =QgsProcessingParameterString('raster_suffix', 'Pripona fotoskic za digitalni model višin)', optional=True, multiLine=False, defaultValue='_dem')
        strparam.setFlags(strparam.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(strparam)

        fids = QgsProcessingParameterField('fid', self.tr('fid'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons', allowMultiple=False, defaultValue=self.tr('fid'))
        fids.setFlags(fids.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(fids)

        sus = QgsProcessingParameterField('su_id', self.tr('Koda_id'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('Koda_id'))
        sus.setFlags(sus.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(sus)

        param = QgsProcessingParameterField('meas_source', self.tr('vir meritev'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('vir meritev'))
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)


        try:
            default_out_folder = Path(QgsProject.instance().homePath())/self.tr('SE površine')
        except:
            default_out_folder = ''

        self.addParameter(
            QgsProcessingParameterFile(
                'raster_out', 
                self.tr('Mapa kamor bodo shranjene površine SE'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue= str(default_out_folder)
                )
            )

        # Temp, unused
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                'Feature_out', 
                'feature_out', 
                type=QgsProcessing.TypeVectorAnyGeometry, 
                createByDefault=True, 
                defaultValue=None
                )
            )


        # We add a feature sink in which to store our processed features (this
        # usually takes the form of a newly created vector layer when the
        # algorithm is run in QGIS).


        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT,
                self.tr('Output layer')
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        feedback = QgsProcessingMultiStepFeedback(10, feedback)
        # Retrieve the feature source and sink. The 'dest_id' variable is used
        # to uniquely identify the feature sink, and must be included in the
        # dictionary returned by the processAlgorithm function.
        
        rasters_folder = self.parameterAsFile(
            parameters,
            'raster_in',
            context
        ) 

        rasters_out_folder = self.parameterAsFile(
            parameters,
            'raster_out',
            context
        )
        
        su_polygons = parameters['su_polygons']
        raster_suffix = parameters['raster_suffix']
        raster_extension = 'tif'
        
        field_fid = parameters['fid']
        field_su = parameters['su_id']
        field_source = parameters['meas_source']
        issues_field = self.tr('Napake')

        #Create log file
        logfolder = Path(QgsProject.instance().homePath()) 
        if logfolder.is_dir():
            logfile = str(logfolder/'AGIS SE-DMV_log.txt')
        else:
            logfile = tempfile.TemporaryFile()

        # Temp, unused
        results = {}
        outputs = {}
        
        
        #Functions

        def field_index(layer, field):
            field_index = layer.fields().indexOf(field)
            return field_index


        def log_write(*argv, **kwargs): 
            with open(logfile, "a") as text_file: 
                for arg in argv:
                    text_file.write("%s\n" % arg)
                for k,v in kwargs.items():
                    text_file.write("%s: %s\n" % (k, v))

        def select_features(layer, expression):
            layer.selectByExpression(expression)
            selection = layer.selectedFeatures()  
            return selection



        #Start log        
        log_write(self.tr('Začetek loga: '), date=datetime.datetime.now())
        processes_log = []

        #Fix geometries
        fixed_geometries = processing.run("native:fixgeometries", {
                'INPUT': su_polygons,
                'OUTPUT': 'memory:'
            }, context=context)['OUTPUT']

        processes_log.append("native:fixgeometries")
        feedback.pushDebugInfo(self.tr('Geometrije popravljene..'))
        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}
    
        #Create sink for results   
        fixed_geometries_provider=fixed_geometries.dataProvider()
        fixed_geometries_provider.addAttributes([QgsField(issues_field, QVariant.String)])
        fixed_geometries.updateFields()

        (sink, dest_id) = self.parameterAsSink(
            parameters,
            self.OUTPUT,
            context,
            fixed_geometries.fields(),
            fixed_geometries.wkbType(),
            fixed_geometries.sourceCrs()
        )

        #Get unique values of "vir meritve" values
        sources = fixed_geometries.uniqueValues(field_index(fixed_geometries, field_source))
        log_write(self.tr('Seznam vseh virov meritev navedenih v sloju z mejami SE:'), sorted(sources))

        #Get dictionary of raster sources
        fotoskice_dict = {}
        fotoskice_list = []
        for f in Path(rasters_folder).iterdir():
            if f.is_dir():
                fs_name = ''.join(filter(lambda x: x.isdigit(), f.name))
                fotoskice_list.append(int(fs_name))
                fotoskice_dict[fs_name] = str(f)    
       
        log_write(self.tr('Seznam vseh Fotoskic najdenih v mapi projekta:'), sorted(fotoskice_list))

        #Check for missing data
        missing_rasters = [f for f in sources if f not in fotoskice_list ]
        feedback.reportError(self.tr('Manjkajoče fotoskice:'))
        feedback.reportError(str(missing_rasters))
        log_write(self.tr('Manjkajoče fotoskice:'), sorted(missing_rasters))

        #Create rasters output directory
        if Path(rasters_out_folder).exists():
            feedback.pushDebugInfo('Mapa obstaja: %s' % rasters_out_folder)
        else:
            Path(rasters_out_folder).mkdir(parents=True, exist_ok=True)
            feedback.pushDebugInfo(self.tr('Mapa ne obstaja, ustvarjam: %s' % rasters_out_folder))

                  
       #Merge identical SU-s (same SU id, same raster source)        
        merged_features = []
        for feature in fixed_geometries.getFeatures():    
            selection = select_features(fixed_geometries, "\"%s\"=%s and \"%s\"=%s" % (field_su, feature[field_su], field_source, feature[field_source]))
            geoms = QgsGeometry.fromWkt('GEOMETRYCOLLECTION()') 
            if len(selection) > 1:
                merged_features.append(self.tr(str('SE %s FS %s (%sx)' %(feature[field_su], feature[field_source], len(selection)))))
            for feat in selection:
                geoms = geoms.combine(feat.geometry()) 
                fixed_geometries.startEditing()                
                fixed_geometries.changeGeometry(feature.id(),geoms) 
                fixed_geometries.commitChanges()  
            fixed_geometries.removeSelection()

        for feature in fixed_geometries.getFeatures():
            selection = select_features(fixed_geometries, "\"%s\"=%s and \"%s\"=%s" % (field_su, feature[field_su], field_source, feature[field_source]))
            nr = len(selection)
            for feat in selection:
                while nr > 1:
                    fixed_geometries.startEditing()
                    fixed_geometries.deleteFeature(feat.id())
                    fixed_geometries.commitChanges()
                    nr = nr - 1
            fixed_geometries.removeSelection()

        merged_features = [ (i) for i in set(merged_features) ]
        log_write(self.tr('Združene SE:'), sorted(merged_features))        
     

        points_source = []
        #List of points from TS measurments layers 
        su_points = []

        #Drape
   
                              
        drape_errors = []
        no_source = []
        ffield = field_index(fixed_geometries, issues_field) 
        for feature in fixed_geometries.getFeatures():
            fixed_geometries.startEditing()
            if str(feature[field_source]).isdigit():   
                su_layer = fixed_geometries.materialize(QgsFeatureRequest().setFilterFid(feature.id()))
                #Get raster dem
                raster_path = '%s\\FS %s%s.%s' %(fotoskice_dict[str(feature[field_source])], feature[field_source], raster_suffix, raster_extension)
                try:       
                    rlayer = QgsRasterLayer(raster_path, 'fs_raster')   
                    if assign_crs and rlayer.crs() != fixed_geometries.crs():
                        try: 
                            rlayer = processing.run('gdal:assignprojection', {
                                'CRS': fixed_geometries.crs(),
                                'INPUT': rlayer
                            }, context=context)                    
                        except:
                            feedback.reportError(self.tr('Rastru ni bilo mogoče pripisati koordinatnega sistema: %s' % raster_path))
                
                    #Drape (set Z value from raster)
                    draped = processing.run("native:setzfromraster", {
                        'BAND': 1,
                        'INPUT': su_layer,
                        'NODATA': 0,
                        'RASTER': rlayer,
                        'SCALE': 1,
                        'OUTPUT': 'memory:'
                    }, context=context)['OUTPUT']                       

                    #Check for null elevations
                    draped_vertices = processing.run("native:extractvertices", {
                            'INPUT': draped,
                            'OUTPUT': 'memory:'
                        }, context=context)['OUTPUT']  

                    no_elevation = 0
                    vertices = 0
                    
                    for draped_vertex in draped_vertices.getFeatures():
                        vertices = vertices + 1
                        geom = draped_vertex.geometry()
                        geom = geom.constGet()
                        if geom.z() == 0:
                            no_elevation = no_elevation + 1 
                
                    # Clip raster by mask SU
                
                    field = field_index(draped, issues_field)        
                    for dfeature in draped.getFeatures():    
                        id = dfeature.id()                             
                        out = rasters_out_folder + '/' + str(dfeature[field_su]) +'_' + str(dfeature[field_source]) + '.tif'                                    
                        if Path(out).exists():
                            feedback.pushDebugInfo('%s obstaja, prepisujem...' % out)
                            Path(out).unlink()                                                  
                        try:
                            cliped_raster = processing.run('gdal:cliprasterbymasklayer',  {
                                'ALPHA_BAND': False,
                                'CROP_TO_CUTLINE': True,
                                'DATA_TYPE': 0,
                                'EXTRA': '',
                                'INPUT': rlayer,
                                'KEEP_RESOLUTION': True,
                                'MASK': draped,
                                'MULTITHREADING': False,
                                'NODATA': None,
                                'OPTIONS': '',
                                'SET_RESOLUTION': False,
                                'SOURCE_CRS': draped.crs(),
                                'TARGET_CRS': draped.crs(),
                                'X_RESOLUTION': None,
                                'Y_RESOLUTION': None,
                                'OUTPUT': out
                            }, context=context)['OUTPUT']  
                            raster_status = 1
                        except:
                            draped.startEditing()  
                            draped.changeAttributeValue(id, field, self.tr('Ni bilo mogoče obrezati rastra!'))
                            draped.commitChanges() 
                            feedback.reportError(self.tr('sssshhhhhhhhssss'))
                            raster_status = 0

                        draped.startEditing()  
                        if no_elevation == 0 and raster_status == 1:      
                            draped.changeAttributeValue(id, field, self.tr('Brez težav.'))
                            draped.commitChanges() 
                        elif no_elevation == 0 and raster_status == 0:      
                            draped.changeAttributeValue(id, field, self.tr('Višine so ok, vendar ni bilo mogoče obrezati rastra!'))
                            draped.commitChanges() 
                        else: 
                            draped.changeAttributeValue(id, field, '%s od %s verteksov brez nadmorske višine!!' % (no_elevation,vertices)  )
                            draped.commitChanges()  
                    for fdraped in draped.getFeatures():
                        sink.addFeature(fdraped, QgsFeatureSink.FastInsert)  
                             
                except:
                    drape_errors.append('%s:%s' %(str(feature[field_su]), str(feature[field_source])))      
                    a = feature.id()
                    b = feature[field_fid]
                    c =field_index(fixed_geometries, issues_field)
                
                    fixed_geometries.startEditing()
                    fixed_geometries.changeAttributeValue(a, b, c)
                    fixed_geometries.commitChanges()
                    sink.addFeature(feature, QgsFeatureSink.FastInsert)               
                    
            elif str(feature[field_su]) in su_points:
                points_source.append(str(feature[field_source]))  
                fixed_geometries.startEditing()
                fixed_geometries.changeAttributeValue(feature.id(), ffield, 'ddddaaaa') 
                fixed_geometries.commitChanges()
                #To do: Add Surface from points
                sink.addFeature(feature, QgsFeatureSink.FastInsert) 
            else:  
                fixed_geometries.startEditing()
                fixed_geometries.changeAttributeValue(feature.id(), ffield, 'aaaaaaaaaaaa')
                #feedback.reportError(self.tr(feature[field_source]))   
                #----
                fixed_geometries.commitChanges()
                no_source.append(str(feature[field_source]))  
                sink.addFeature(feature, QgsFeatureSink.FastInsert)  


        feedback.pushInfo(self.tr('Source errors: %s')  %str(no_source))
        feedback.reportError(self.tr('Drape errors: %s')  %str(drape_errors))
        feedback.reportError(self.tr('TS Sources: %s')  %str(points_source))
        feedback.reportError(self.tr('Vse ok do sem'))     

        
       
        # If source was not found, throw an exception to indicate that the algorithm
        # encountered a fatal error. The exception text can be any string, but in this
        # case we use the pre-built invalidSourceError method to return a standard
        # helper text for when a source cannot be evaluated
       
        """
        if source is None:
            raise QgsProcessingException(self.invalidSourceError(parameters, self.INPUT))
        """    

     
        # If sink was not created, throw an exception to indicate that the algorithm
        # encountered a fatal error. The exception text can be any string, but in this
        # case we use the pre-built invalidSinkError method to return a standard
        # helper text for when a sink cannot be evaluated
        if sink is None:
            raise QgsProcessingException(self.invalidSinkError(parameters, self.OUTPUT))

        # Compute the number of steps to display within the progress bar and
        # get features from source
       
        """
        total = 100.0 / source.featureCount() if source.featureCount() else 0
        features = source.getFeatures()

        for current, feature in enumerate(features):


            # Update the progress bar
            feedback.setProgress(int(current * total))
        """

        # To run another Processing algorithm as part of this algorithm, you can use
        # processing.run(...). Make sure you pass the current context and feedback
        # to processing.run to ensure that all temporary layer outputs are available
        # to the executed algorithm, and that the executed algorithm can send feedback
        # reports to the user (and correctly handle cancellation and progress reports!)
        if False:
            buffered_layer = processing.run("native:buffer", {
                'INPUT': dest_id,
                'DISTANCE': 1.5,
                'SEGMENTS': 5,
                'END_CAP_STYLE': 0,
                'JOIN_STYLE': 0,
                'MITER_LIMIT': 2,
                'DISSOLVE': False,
                'OUTPUT': 'memory:'
            }, context=context, feedback=feedback)['OUTPUT']

        # Return the results of the algorithm. In this case our only result is
        # the feature sink which contains the processed features, but some
        # algorithms may return multiple feature sinks, calculated numeric
        # statistics, etc. These should all be included in the returned
        # dictionary, with keys matching the feature corresponding parameter
        # or output names.

        log_write(processes_log=processes_log)
        log_write(end_log='\n')
        webbrowser.open(logfile)


        return {self.OUTPUT: dest_id}


