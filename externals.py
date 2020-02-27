import os
from pathlib import Path
from qgis.core import (QgsProject
                       )

def path(item):
    path = {}
    plugin_dir = os.path.dirname(__file__)

    path['plugin'] = Path(plugin_dir)
    path['styles'] = path['plugin']/"styles"
    path['icons'] = path['plugin']/"icons"
    path['dependencies'] = path['plugin']/"dependencies"
    path = path[item]
    return path

# Checks duplicates and returnes value error
def checkDuplicates(features, name, feedback):
    list = []
    for feature in features:
        list.append(feature[name])
    duplicates = 0
    for element in list:
        if list.count(element) > 1:
            feedback.pushInfo("%s %s se pojavi: %s - krat!" % (name, element, list.count(element)))
            duplicates = duplicates + 1
        else:
            pass
    if duplicates == 0:
        feedback.pushInfo("Ni podvojenih %s" % name)
    else:
        raise ValueError

def value_error(id, value, feedback):
    feedback.reportError("Pri %s manjaka vrednost  %s!" % (id, value),False)
    raise ValueError



def layer(item):

    layer = {}
    """
    layer['test'] = QgsRasterLayer('ontextualWMSLegend=0&crs=EPSG:3794&dpiMode=7&featureCount=10&format=image/jpeg&layers=SI.GURS.ZPDZ:DOF050&styles=&tileMatrixSet=EPSG:3794_BDOF5&url=http://prostor4.gov.si:80/ows2-gwc-pub/service/wmts', 'MsUS', 'wms')

    #Define groups
    root = QgsProject.instance().layerTreeRoot()
    if not root.findGroup("Podlage"):
        podlage_group = root.addGroup("Podlage")
    else:
        podlage_group = root.findGroup("Podlage")

    if not root.findGroup("Prostorske enote"):
        prostorske_group = root.addGroup("Prostorske enote")
    else:
        prostorske_group = root.findGroup("Prostorske enote")

     if not root.findGroup("Prostorske enote"):
         prostorske_group = root.addGroup("Prostorske enote")
     else:
         prostorske_group = root.findGroup("Prostorske enote")

    if not root.findGroup("Historične podlage"):
        historicne_group = root.addGroup("Historične podlage")
    else:
        historicne_group = root.findGroup("Historične podlage")

    if not root.findGroup("Prostorske enote"):
        prostorske_group = root.addGroup("Prostorske enote")
    else:
        prostorske_group = root.findGroup("Prostorske enote")



    podlage_zls = path('styles')/'ZLS 1.qlr'
    layer['podlage_zls'] = QgsLayerDefinition().loadLayerDefinition(str(podlage_zls), QgsProject.instance(), podlage_group)

    podlage_gurs = path('styles')/'GURS.qlr'
    layer['podlage_gurs'] = QgsLayerDefinition().loadLayerDefinition(str(podlage_gurs), QgsProject.instance(), podlage_group)

    """
    return layer
