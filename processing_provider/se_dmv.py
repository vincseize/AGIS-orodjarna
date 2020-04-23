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

from qgis.PyQt.QtCore import QCoreApplication, QFileInfo
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
                       QgsRasterLayer)
from qgis import processing
from ..externals import path

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
            QgsProcessingParameterVectorLayer(
                'se_polygons', 
                'meje SE', 
                types=[QgsProcessing.TypeVectorPolygon], defaultValue=None
                )
            )


        default_folder = path('project_path')/'Fotoskice'
        self.addParameter(
            QgsProcessingParameterFile(
                'raster_folder', 
                'Mapa z FS', 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue= str(default_folder)
                )
            )

        self.addParameter(
            QgsProcessingParameterRasterDestination(
                'Raster_ven', 
                'raster_ven', 
                createByDefault=True, 
                defaultValue=None
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
        
        se_polygons = self.parameterAsVectorLayer(
            parameters,
            'se_polygons',
            context
        )
        
        rasters_folder = self.parameterAsFile(
            parameters,
            'raster_folder',
            context
        )
        
  
        # Temp
        results = {}
        outputs = {}
        

        #Fix geometries
        se_polygons = processing.run("native:fixgeometries", {
                'INPUT': se_polygons,
                'OUTPUT': 'memory:'
            }, context=context)['OUTPUT']
        
        feedback.pushInfo(self.tr('Geometry fixed.'))
        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}


        def call_raster():
            feedback.pushInfo(str(rasters_folder))
        call_raster()



        #Get unique values of "vir meritve" values
        values = se_polygons.fields().indexOf('vir meritev')
        sources = se_polygons.uniqueValues(se_polygons.fields().indexOf('vir meritev'))
     
        default_raster = path('project_path')/'Fotoskice/FS 1001/FS 1001_dem.tif'
        layer = QgsRasterLayer(str(default_raster), 'sss')
        def StringToRaster(raster):
            # Check if string is provided
            feedback.pushInfo(str(default_raster))
            fileInfo = QFileInfo(raster)
            path = fileInfo.filePath()
            feedback.pushInfo(str(path))
            baseName = fileInfo.baseName()
            feedback.pushInfo(str(baseName))
            layer = QgsRasterLayer(path, baseName)
            QgsProject.instance().addMapLayer(layer)
            if layer.isValid() is True:
                feedback.pushInfo("Layer was loaded successfully!")
            else:
                feedback.pushInfo("Unable to read basename and file path - Your string is probably invalid")
            return layer

      
        for feature in se_polygons.getFeatures():
            if str(feature['vir meritev']).isdigit():
                feedback.pushInfo(str(feature['vir meritev']))
                #Drape (set Z value from raster)
                draped_feature = processing.run("native:setzfromraster", {
                    'BAND': 1,
                    'INPUT': feature,
                    'NODATA': 0,
                    'RASTER': default_raster,
                    'SCALE': 1,
                    'OUTPUT': 'memory'
                }, context=context)['OUTPUT']
                source = draped_feature
            else:
                feedback.pushInfo("Ta ne gre:")
                feedback.pushInfo(str(feature['vir meritev']))
        














                
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

        (sink, dest_id) = self.parameterAsSink(
            parameters,
            self.OUTPUT,
            context,
            source.fields(),
            source.wkbType(),
            source.sourceCrs()
        )

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
