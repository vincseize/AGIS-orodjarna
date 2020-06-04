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
from ..externals import path, field_index
from pathlib import Path
import webbrowser
import datetime
import tempfile

class check_raster_sources(QgsProcessingAlgorithm):
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
        return check_raster_sources()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This
        string should be fixed for the algorithm, and must not be localised.
        The name should be unique within each provider. Names should contain
        lowercase alphanumeric characters only and no spaces or other
        formatting characters.
        """
        return 'check_raster_sources'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('Preveri rasterske vire')

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
        help_text = """To orodje sprejme izrisane SE-je (meje SE) ter mapo s fotoskicami. 
        Rezultat je izpis mankajočih fotoskic.
        Z orodjem je mogoče tudi pripisati koordinatni sistem mej SE vsem rastrom v mapi, ki so navedeni v sloju meje SE.
        Fotoskice morajo biti v formatu tif.
        
        Z izbrano opcijo "Nastavi koordinatni sistem" spremenimo izvorne podatke fotoskic!
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

        strparam =QgsProcessingParameterString('dem_suffix', self.tr('Pripona za digitalni model višin'), optional=True, multiLine=False, defaultValue='_dem')
        self.addParameter(strparam)

        param = QgsProcessingParameterBoolean('assign_crs', self.tr('Nastavi koordinatni sistem (KS) fotoskic na KS sloja z SE -ji (spremeni izvorne datoteke fotoskic!)'), defaultValue=False)
        self.addParameter(param)

        fids = QgsProcessingParameterField('fid', self.tr('fid'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons', allowMultiple=False, defaultValue=self.tr('fid'))
        fids.setFlags(fids.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(fids)

        sus = QgsProcessingParameterField('su_id', self.tr('Koda_id'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('Koda_id'))
        sus.setFlags(sus.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(sus)

        param = QgsProcessingParameterField('meas_source', self.tr('vir meritev'), optional=False, type=QgsProcessingParameterField.Any, parentLayerParameterName='su_polygons',allowMultiple=False, defaultValue=self.tr('vir meritev'))
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

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

  
        su_polygons = parameters['su_polygons']
        raster_extension = 'tif'
        assign_crs = parameters['assign_crs']
        dem_suffix = parameters['dem_suffix']
        field_fid = parameters['fid']
        field_su = parameters['su_id']
        field_source = parameters['meas_source']
       
        #Fix geometries
        fixed_geometries = processing.run("native:fixgeometries", {
                'INPUT': su_polygons,
                'OUTPUT': 'memory:'
            }, context=context)['OUTPUT']
        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}

        #Get unique values of "vir meritve" values
        sources = []
        count = 0
        for f in fixed_geometries.uniqueValues(field_index(fixed_geometries, field_source)):
            try:
                sources.append(int(f))
            except:
                feedback.pushDebugInfo('Če vir \"%s\" ni totalka, ni veljaven vir merive! ' % f)
        
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
             
        #Clip                   
        no_source = []
        error_raster = []
        error_unknown = []
        success_assign = []
        different_crs = []
        total = 100.0 / fixed_geometries.featureCount() if fixed_geometries.featureCount() else 0
   
        for current, feature in enumerate(fixed_geometries.getFeatures()):
            if str(feature[field_source]).isdigit():   
                su_layer = fixed_geometries.materialize(QgsFeatureRequest().setFilterFid(feature.id()))
                #Get raster 
                raster_path = '%s\\FS %s.%s' %(fotoskice_dict[str(feature[field_source])], feature[field_source], raster_extension)          
                raster_path_dem = '%s\\FS %s%s.%s' %(fotoskice_dict[str(feature[field_source])], feature[field_source], dem_suffix, raster_extension)   
                rlayer = QgsRasterLayer(raster_path, 'fs_raster')  
                rlayer_dem =  QgsRasterLayer(raster_path_dem, 'fs_raster_dem')  
                rasters = {rlayer:raster_path, rlayer_dem:raster_path_dem}
                for layer, path in rasters.items():
                    if not layer.isValid():
                        feedback.reportError(self.tr('Težave z branjem fotoskice: %s' % path))
                        error_raster.append(str(feature[field_source])) 
                    else:
                        if layer.crs() != fixed_geometries.crs() and not assign_crs:
                            feedback.reportError(self.tr('FS nima istega koordinatnega sistema kot meje SE: %s' % feature[field_source]))
                            different_crs.append(feature[field_source])
                        elif assign_crs and layer.crs() != fixed_geometries.crs():
                            try: 
                                layer = processing.run('gdal:assignprojection', {
                                    'CRS': fixed_geometries.crs(),
                                    'INPUT': layer
                                }, context=context) 
                                success_assign.append()
                            except:
                                feedback.reportError(self.tr('Rastru ni bilo mogoče pripisati koordinatnega sistema: %s' % path))
                                error_unknown.append(path)
            else:  
                no_source.append(str(feature[field_su]))  
            feedback.setProgress(int(current * total))


        if len(no_source) != 0: 
            feedback.reportError(self.tr('SE brez navedene FS kot vira meritev: %s')  % str(no_source))
        if len(error_raster) != 0: 
            feedback.reportError(self.tr('Fotoskice, ki jih ni bilo mogoče prebrati (preveri poimenovanja map in datotek FS): %s')  % str(error_raster))
        if len(error_unknown) != 0: 
            feedback.reportError(self.tr('Fotoskice, ki jim ni bilo mogoče pripisati KS: %s')  %str(error_unknown))

        if len(different_crs) != 0:
            feedback.pushDebugInfo(self.tr('Fotoskice z drugačnim koordinatnim sistemomo: %s' % different_crs))
        else:
            feedback.pushDebugInfo(self.tr('Fotoskice brez težav'))
        return {}


