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
19.2.2020

"""

from PyQt5.QtCore import QCoreApplication, QObject,QFileInfo
from PyQt5.QtGui import QIcon
from qgis.utils import iface
from qgis.core import (Qgis,
                       QgsProcessing,
                       QgsFeatureSink,
                       QgsMessageLog,
                       QgsProcessingException,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterFile,
                       QgsApplication,
                       NULL)
import processing
import datetime
import sys
import os

from ..externals import path, checkDuplicates, value_error
from pathlib import Path


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
            Tukaj pride pomoč..
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
                self.tr('Foto folder'), 
                behavior=QgsProcessingParameterFile.Folder, 
                fileFilter='All files (*.*)', 
                defaultValue=None
            )
        )


    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """

        # Retrieve the feature source and sink. The 'dest_id' variable is used
        # to uniquely identify the feature sink, and must be included in the
        # dictionary returned by the processAlgorithm function.
       

        results ={}

        return results
