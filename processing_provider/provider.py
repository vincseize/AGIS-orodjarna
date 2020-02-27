from qgis.core import QgsProcessingProvider
from PyQt5.QtGui import QIcon
import os
from pathlib import Path
from ..externals import path
#import algorithm
#from .fileslist import Files2Table
#from .katvkat import IzvoziKatalogVWord
#from .se_catalog import IzvoziKatalogSeVWord
from .strati_word_catalog import StratiWordCatalog


class Provider(QgsProcessingProvider):
    def __init__(self):
        self.plugin_dir = os.path.dirname(__file__)
        QgsProcessingProvider.__init__(self)

    def loadAlgorithms(self, *args, **kwargs):
        #self.addAlgorithm(Files2Table())
        #self.addAlgorithm(IzvoziKatalogVWord())
        self.addAlgorithm(StratiWordCatalog())
        # add additional algorithms here
        # self.addAlgorithm(MyOtherAlgorithm())


    def id(self):
        return 'agis_orodjarna'

    def name(self, *args, **kwargs):
        """The human friendly name of your plugin in Processing.

        This string should be as short as possible (e.g. "Lastools", not
        "Lastools version 1.0.1 64-bit") and localised.
        """
        return self.tr('AGIS orodjarna')

    def icon(self):
        """Should return a QIcon which is used for your provider inside
        the Processing toolbox.
        """
        icon_path = path('icons')/"agis_toolbox.png"
        return QIcon(str(icon_path))
