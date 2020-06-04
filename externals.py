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
    
  
    path = path[item]
    return path

#Return field index
def field_index(layer, field):
    field_index = layer.fields().indexOf(field)
    return field_index


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

