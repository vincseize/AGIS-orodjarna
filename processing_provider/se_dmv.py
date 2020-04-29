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
                       QgsCoordinateReferenceSystem)
from qgis import processing
from ..externals import path
from pathlib import Path
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
                'se_polygons', 
                self.tr('meje SE'), 
                types=[QgsProcessing.TypeVectorPolygon], defaultValue=None
                )
            )

        try:
            default_in_older = Path(QgsProject.instance().homePath()).parents[0]/self.tr('Fotoskice')
        except:
            default_in_older = ''
        
        self.addParameter(
            QgsProcessingParameterFile(
                'raster_in', 
                self.tr('Folder with rasters'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue= str(default_in_older)
                )
            )

        try:
            default_out_folder = Path(QgsProject.instance().homePath())/self.tr('SE površine')
        except:
            default_out_folder = ''

        self.addParameter(
            QgsProcessingParameterFile(
                'raster_out', 
                self.tr('Output folder for SU surfaces'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue= str(default_out_folder)
                )
            )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                'Featuire_ven', 
                'featuire_ven', 
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
        

        # Temp
        results = {}
        outputs = {}
        

        #Fix geometries
        se_polygons = processing.run("native:fixgeometries", {
                'INPUT': parameters['se_polygons'],
                'OUTPUT': 'memory:'
            }, context=context)['OUTPUT']
        
        feedback.pushDebugInfo(self.tr('Geometry fixed.'))
        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}

        #Get unique values of "vir meritve" values
        values = se_polygons.fields().indexOf(self.tr('vir meritev'))
        sources = se_polygons.uniqueValues(se_polygons.fields().indexOf(self.tr('vir meritev')))
        feedback.pushDebugInfo(str(sources))
  
        #Get list of raster sources
        fotoskice_list = [''.join(filter(lambda x: x.isdigit(), f.name)) for f in Path(rasters_folder).iterdir() if f.is_dir()]
 
        #Check for missing data
        missing_rasters = [f for f in sources if f not in fotoskice_list ]
        feedback.reportError(self.tr('Missing rasters:'))
        feedback.reportError(str(missing_rasters))

        #Create rasters output directory
        if Path(rasters_out_folder).exists():
            feedback.pushDebugInfo('Output directory exists: %s' % rasters_out_folder)
        else:
            Path(rasters_out_folder).mkdir(parents=True, exist_ok=True)
            feedback.pushDebugInfo(self.tr('Creating output directory: %s' % rasters_out_folder))

        #Create sink for results   
        fields = se_polygons.fields()
        fields.append(QgsField( self.tr('Issues'), QVariant.String))
    
        (sink, dest_id) = self.parameterAsSink(
            parameters,
            self.OUTPUT,
            context,
            fields,
            se_polygons.wkbType(),
            se_polygons.sourceCrs()
        )         
             
         
        drape_errors = []
        no_source = []
        feedback.reportError(self.tr('Vse ok do sem'))
        feedback.pushDebugInfo(self.tr('Vse ok do sem'))


        #Drape

        for feature in se_polygons.getFeatures():
            vir = str(feature['vir meritev'])
            if vir.isdigit():   
                attr = 'vir meritev'
                feat = se_polygons.materialize(QgsFeatureRequest().setFilterFid(feature.id()))   
                raster_type = 'dem'
                raster_extension = 'tif'
                #Get raster dem
                raster_path = [f for f in Path(rasters_folder).glob('**/*%s.%s' % (raster_type, raster_extension)) if ''.join(filter(lambda x: x.isdigit(), f.name)) == vir]
                try:
                    layer = QgsRasterLayer(str(raster_path[0]), 'sda')           
                    layer.setCrs( se_polygons.sourceCrs() )    
                    #Drape (set Z value from raster)
                    source = processing.run("native:setzfromraster", {
                        'BAND': 1,
                        'INPUT': feat,
                        'NODATA': 0,
                        'RASTER': layer,
                        'SCALE': 1,
                        'OUTPUT': 'memory:'
                    }, context=context)['OUTPUT']                     
                  
                    source_provider=source.dataProvider()
                    source_provider.addAttributes([QgsField( self.tr('Issues'), QVariant.String)])
                    source.updateFields()
  
                    #Check for null 
                    draped_vertices = processing.run("native:extractvertices", {
                            'INPUT': source,
                            'OUTPUT': 'memory:'
                        }, context=context)['OUTPUT']  
   
                    no_elevation = 0
                    for draped_vertices in draped_vertices.getFeatures():
                        geom = draped_vertices.geometry()
                        geom = geom.constGet()
                        if geom.z() == 0:
                            no_elevation = no_elevation + 1 
                     
                    feedback.pushInfo(self.tr('ELEs errors: %s')  %str(no_elevation))

                    source.startEditing()
                    fields = source.fields()
                    field = fields.indexFromName(self.tr('Issues'))
                    for draped in source.getFeatures():   
                        id = draped.id()             
                        if no_elevation == 0:      
                            source.startEditing()
                            source.changeAttributeValue(id, field, 'No issues detected')
                            source.commitChanges()                            
                        else: 
                            source.startEditing()
                            source.changeAttributeValue(id, field, '%s vertices without elevation' % no_elevation )
                            source.commitChanges()  
                         

                    for draped in source.getFeatures():  
                        sink.addFeature(draped, QgsFeatureSink.FastInsert)   
                except:
                    drape_errors.append('%s:%s' %(str(feature['Koda_id']), str(feature['vir meritev'])))  
        
            else:
                no_source.append(str(feature['vir meritev']))  
            
            
        

        feedback.pushInfo(self.tr('Source errors: %s')  %str(no_source))

        feedback.reportError(self.tr('Drape errors: %s')  %str(drape_errors))
        """
        
        feedback.setCurrentStep(2)
        if feedback.isCanceled():
            return {}

        # Clip raster by mask layer
        alg_params = {
            'ALPHA_BAND': False,
            'CROP_TO_CUTLINE': True,
            'DATA_TYPE': 0,
            'EXTRA': '',
            'INPUT': parameters['FSkica'],
            'KEEP_RESOLUTION': True,
            'MASK': outputs['ExtractByAttribute']['OUTPUT'],
            'MULTITHREADING': False,
            'NODATA': None,
            'OPTIONS': '',
            'SET_RESOLUTION': False,
            'SOURCE_CRS': 'ProjectCrs',
            'TARGET_CRS': 'ProjectCrs',
            'X_RESOLUTION': None,
            'Y_RESOLUTION': None,
            'OUTPUT': parameters['Raster_ven']
        }
        outputs['ClipRasterByMaskLayer'] = processing.run('gdal:cliprasterbymasklayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        results['Raster_ven'] = outputs['ClipRasterByMaskLayer']['OUTPUT']
        return results

        """



       
        # If source was not found, throw an exception to indicate that the algorithm
        # encountered a fatal error. The exception text can be any string, but in this
        # case we use the pre-built invalidSourceError method to return a standard
        # helper text for when a source cannot be evaluated
        if source is None:
            raise QgsProcessingException(self.invalidSourceError(parameters, self.INPUT))
        

        # Send some information to the user
        feedback.pushInfo('CRS is {}'.format(source.sourceCrs().authid()))

        # If sink was not created, throw an exception to indicate that the algorithm
        # encountered a fatal error. The exception text can be any string, but in this
        # case we use the pre-built invalidSinkError method to return a standard
        # helper text for when a sink cannot be evaluated
        if sink is None:
            raise QgsProcessingException(self.invalidSinkError(parameters, self.OUTPUT))

        # Compute the number of steps to display within the progress bar and
        # get features from source
        total = 100.0 / source.featureCount() if source.featureCount() else 0
        features = source.getFeatures()

        for current, feature in enumerate(features):
            # Stop the algorithm if cancel button has been clicked
            if feedback.isCanceled():
                break

            # Add a feature in the sink
            sink.addFeature(feature, QgsFeatureSink.FastInsert)

            # Update the progress bar
            feedback.setProgress(int(current * total))

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
        return {self.OUTPUT: dest_id}


