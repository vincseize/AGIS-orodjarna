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

class se_textures(QgsProcessingAlgorithm):
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
        return se_textures()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This
        string should be fixed for the algorithm, and must not be localised.
        The name should be unique within each provider. Names should contain
        lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'se_textures'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('SE > teksture')

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
        help_text = """To orodje sprejme izrisane SE-je (meje SE) ter mapo s fotoskicami in izreže posamezne SE.
        Fotoskice morajo biti v formatu tif.
        Rezultat so teksture za vsak posamezen SE. 
        Operacija lahko traja nekaj časa, trajanje je odvisno od velikosti in števila fotoskic. 
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

        fids = QgsProcessingParameterField('fid', self.tr('fid'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons', allowMultiple=False, defaultValue=self.tr('fid'))
        fids.setFlags(fids.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(fids)

        sus = QgsProcessingParameterField('su_id', self.tr('SE (koda_id)'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('Koda_id'))
        sus.setFlags(sus.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(sus)

        param = QgsProcessingParameterField('meas_source', self.tr('vir meritev'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('vir meritev'))
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)


        try:
            default_out_folder = Path(QgsProject.instance().homePath())/self.tr('SE teksture')
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


        # We add a feature sink in which to store our processed features (this
        # usually takes the form of a newly created vector layer when the
        # algorithm is run in QGIS).


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
        raster_extension = 'tif'

        field_fid = parameters['fid']
        field_su = parameters['su_id']
        field_source = parameters['meas_source']

        #Functions

        def field_index(layer, field):
            field_index = layer.fields().indexOf(field)
            return field_index

        def select_features(layer, expression):
            layer.selectByExpression(expression)
            selection = layer.selectedFeatures()  
            return selection

        #Fix geometries
        fixed_geometries = processing.run("native:fixgeometries", {
                'INPUT': su_polygons,
                'OUTPUT': 'memory:'
            }, context=context)['OUTPUT']

        feedback.pushDebugInfo(self.tr('Geometrije popravljene..'))
        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}

        #Get unique values of "vir meritve" values
        sources = []
        for f in fixed_geometries.uniqueValues(field_index(fixed_geometries, field_source)):
            try:
                sources.append(int(f))
            except:
                feedback.pushDebugInfo(self.tr('\"%s\" je neveljaven vir, izpuščam.' %f))

        #Get dictionary of raster sources
        fotoskice_dict = {}
        fotoskice_list = []
        for f in Path(rasters_folder).iterdir():
            if f.is_dir():
                fs_name = ''.join(filter(lambda x: x.isdigit(), f.name))
                fotoskice_list.append(int(fs_name))
                fotoskice_dict[fs_name] = str(f)    


        #Check for missing data
        feedback.pushDebugInfo('FS: %s' % fotoskice_list)
        feedback.pushDebugInfo('Viri: %s' % sources)
        missing_rasters = [f for f in sources if f not in fotoskice_list ]
        if len(missing_rasters) != 0:
            feedback.reportError(self.tr('Manjkajoče fotoskice:'))
            feedback.reportError(str(missing_rasters))
  
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
 
     
        #Clip                   
        no_source = []
        error_raster = []
        error_unknown = []
        total = 100.0 / fixed_geometries.featureCount() if fixed_geometries.featureCount() else 0
   
        for current, feature in enumerate(fixed_geometries.getFeatures()):
            if str(feature[field_source]).isdigit():   
                su_layer = fixed_geometries.materialize(QgsFeatureRequest().setFilterFid(feature.id()))
                #Get raster 
                raster_path = '%s\\FS %s.%s' %(fotoskice_dict[str(feature[field_source])], feature[field_source], raster_extension)            
                rlayer = QgsRasterLayer(raster_path, 'fs_raster')   
                if not rlayer.isValid():
                    feedback.reportError(self.tr('Težave z nalaganjem: %s' % raster_path))
                    error_raster.append(str(feature[field_source])) 
                else:
                    # Clip raster by mask SU                            
                    out = rasters_out_folder + '\\' + str(feature[field_su]) + '_' + str(feature[field_source]) + '.tif'                       
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
                            'MASK': su_layer,
                            'MULTITHREADING': False,
                            'NODATA': None,
                            'OPTIONS': '',
                            'SET_RESOLUTION': False,
                            'SOURCE_CRS': su_layer.crs(),
                            'TARGET_CRS': su_layer.crs(),
                            'X_RESOLUTION': None,
                            'Y_RESOLUTION': None,
                            'OUTPUT': out
                        }, context=context)['OUTPUT']  
                        raster_status = 1
                    except:
                        feedback.reportError(self.tr('Ni bilo mogoče obrezati rastra: SE %s, FS %s!' %(feature[field_su],feature[field_source])))  
                        error_unknown.append(str(feature[field_source]))    
            else:  
                no_source.append(str(feature[field_su]))  

            feedback.setProgress(int(current * total))

        if len(no_source) != 0: 
            feedback.reportError(self.tr('SE brez navedene FS kot vira meritev: %s')  % str(no_source))
        if len(error_raster) != 0: 
            feedback.reportError(self.tr('Fotoskice, ki jih ni bilo mogoče uporabiti (preveri poimenovanja map in datotek FS): %s')  % str(error_raster))
        if len(error_unknown) != 0: 
            feedback.reportError(self.tr('Fotoskice, ki jih ni bilo mogoče obrezati (preveri ): %s')  %str(error_unknown))
        return {}


