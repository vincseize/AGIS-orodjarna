<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.10.8-A Coruña" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" maxScale="0" minScale="1e+08" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "date_taken", '&lt;NULL>' )</value>
    </property>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ime">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sektor">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kvadrant">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sonda">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="SE">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PN">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="FS">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="VZ">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="FL">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="opis">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pogled">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="S" name="Sever"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="J" name="Jug"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="V" name="Vzhod"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Z" name="Zahod"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="SV" name="Severovzhod"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="SZ" name="Severozahod"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="JV" name="Jugovzhod"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="JZ" name="Jugozahod"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="vrsta">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="T" name="Tloris"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="P" name="Presek"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="SP" name="Stranski pogled"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="oznake">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" value="" name="CheckedState"/>
            <Option type="QString" value="" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="žanr">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Strokovni" name="Strokovni"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Delovni" name="Delovni"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Nedokumentarni" name="Nedokumentarni"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="avtor">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Urška Pajnič" name="Urška Pajnič"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Maja Lavrič" name="Maja Lavrič"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Matevž Lavrinc" name="Matevž Lavrinc"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Jure Gregorič" name="Jure Gregorič"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="opombe">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="izbriši">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" value="" name="CheckedState"/>
            <Option type="QString" value="" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datum posnetka">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="yyyy-MM-dd HH:mm:ss" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd HH:mm:ss" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="relativna pot">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pot">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option type="int" value="1" name="DocumentViewer"/>
            <Option type="int" value="0" name="DocumentViewerHeight"/>
            <Option type="int" value="0" name="DocumentViewerWidth"/>
            <Option type="bool" value="true" name="FileWidget"/>
            <Option type="bool" value="true" name="FileWidgetButton"/>
            <Option type="QString" value="" name="FileWidgetFilter"/>
            <Option type="Map" name="PropertyCollection">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
            <Option type="int" value="0" name="RelativeStorage"/>
            <Option type="int" value="0" name="StorageMode"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="fid" index="0"/>
    <alias name="" field="ime" index="1"/>
    <alias name="" field="sektor" index="2"/>
    <alias name="" field="kvadrant" index="3"/>
    <alias name="" field="sonda" index="4"/>
    <alias name="" field="SE" index="5"/>
    <alias name="" field="PN" index="6"/>
    <alias name="" field="FS" index="7"/>
    <alias name="" field="VZ" index="8"/>
    <alias name="" field="FL" index="9"/>
    <alias name="" field="opis" index="10"/>
    <alias name="" field="pogled" index="11"/>
    <alias name="" field="vrsta" index="12"/>
    <alias name="" field="oznake" index="13"/>
    <alias name="" field="žanr" index="14"/>
    <alias name="" field="avtor" index="15"/>
    <alias name="" field="opombe" index="16"/>
    <alias name="" field="izbriši" index="17"/>
    <alias name="" field="datum posnetka" index="18"/>
    <alias name="" field="relativna pot" index="19"/>
    <alias name="" field="pot" index="20"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="fid"/>
    <default expression="" applyOnUpdate="0" field="ime"/>
    <default expression="" applyOnUpdate="0" field="sektor"/>
    <default expression="" applyOnUpdate="0" field="kvadrant"/>
    <default expression="" applyOnUpdate="0" field="sonda"/>
    <default expression="" applyOnUpdate="0" field="SE"/>
    <default expression="" applyOnUpdate="0" field="PN"/>
    <default expression="" applyOnUpdate="0" field="FS"/>
    <default expression="" applyOnUpdate="0" field="VZ"/>
    <default expression="" applyOnUpdate="0" field="FL"/>
    <default expression="" applyOnUpdate="0" field="opis"/>
    <default expression="" applyOnUpdate="0" field="pogled"/>
    <default expression="" applyOnUpdate="0" field="vrsta"/>
    <default expression="" applyOnUpdate="0" field="oznake"/>
    <default expression="" applyOnUpdate="0" field="žanr"/>
    <default expression="" applyOnUpdate="0" field="avtor"/>
    <default expression="" applyOnUpdate="0" field="opombe"/>
    <default expression="" applyOnUpdate="0" field="izbriši"/>
    <default expression="" applyOnUpdate="0" field="datum posnetka"/>
    <default expression="" applyOnUpdate="0" field="relativna pot"/>
    <default expression="" applyOnUpdate="0" field="pot"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="fid"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ime"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="sektor"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kvadrant"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="sonda"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="SE"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="PN"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="FS"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="VZ"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="FL"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="opis"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pogled"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vrsta"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="oznake"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="žanr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="avtor"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="opombe"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="izbriši"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="datum posnetka"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="relativna pot"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pot"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="fid"/>
    <constraint exp="" desc="" field="ime"/>
    <constraint exp="" desc="" field="sektor"/>
    <constraint exp="" desc="" field="kvadrant"/>
    <constraint exp="" desc="" field="sonda"/>
    <constraint exp="" desc="" field="SE"/>
    <constraint exp="" desc="" field="PN"/>
    <constraint exp="" desc="" field="FS"/>
    <constraint exp="" desc="" field="VZ"/>
    <constraint exp="" desc="" field="FL"/>
    <constraint exp="" desc="" field="opis"/>
    <constraint exp="" desc="" field="pogled"/>
    <constraint exp="" desc="" field="vrsta"/>
    <constraint exp="" desc="" field="oznake"/>
    <constraint exp="" desc="" field="žanr"/>
    <constraint exp="" desc="" field="avtor"/>
    <constraint exp="" desc="" field="opombe"/>
    <constraint exp="" desc="" field="izbriši"/>
    <constraint exp="" desc="" field="datum posnetka"/>
    <constraint exp="" desc="" field="relativna pot"/>
    <constraint exp="" desc="" field="pot"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="&quot;date_taken&quot;">
    <columns>
      <column type="field" name="fid" width="35" hidden="0"/>
      <column type="field" name="ime" width="283" hidden="0"/>
      <column type="field" name="sektor" width="-1" hidden="0"/>
      <column type="field" name="kvadrant" width="154" hidden="0"/>
      <column type="field" name="sonda" width="-1" hidden="0"/>
      <column type="field" name="SE" width="-1" hidden="0"/>
      <column type="field" name="PN" width="-1" hidden="0"/>
      <column type="field" name="FS" width="-1" hidden="0"/>
      <column type="field" name="opis" width="-1" hidden="0"/>
      <column type="field" name="pogled" width="-1" hidden="0"/>
      <column type="field" name="vrsta" width="-1" hidden="0"/>
      <column type="field" name="oznake" width="-1" hidden="0"/>
      <column type="field" name="žanr" width="-1" hidden="0"/>
      <column type="field" name="avtor" width="-1" hidden="0"/>
      <column type="field" name="opombe" width="-1" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
      <column type="field" name="VZ" width="-1" hidden="0"/>
      <column type="field" name="FL" width="-1" hidden="0"/>
      <column type="field" name="izbriši" width="-1" hidden="0"/>
      <column type="field" name="datum posnetka" width="-1" hidden="0"/>
      <column type="field" name="relativna pot" width="-1" hidden="0"/>
      <column type="field" name="pot" width="-1" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer columnCount="2" groupBox="0" visibilityExpressionEnabled="0" name="Ime" visibilityExpression="" showLabel="1">
      <attributeEditorField name="ime" index="1" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="3" groupBox="0" visibilityExpressionEnabled="0" name="Lokacija" visibilityExpression="" showLabel="1">
      <attributeEditorField name="sektor" index="2" showLabel="1"/>
      <attributeEditorField name="kvadrant" index="3" showLabel="1"/>
      <attributeEditorField name="sonda" index="4" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="3" groupBox="0" visibilityExpressionEnabled="0" name="Stratigrafija" visibilityExpression="" showLabel="1">
      <attributeEditorField name="SE" index="5" showLabel="1"/>
      <attributeEditorField name="FS" index="7" showLabel="1"/>
      <attributeEditorContainer columnCount="1" groupBox="1" visibilityExpressionEnabled="0" name="" visibilityExpression="" showLabel="1">
        <attributeEditorField name="PN" index="6" showLabel="1"/>
        <attributeEditorField name="VZ" index="8" showLabel="1"/>
        <attributeEditorField name="FL" index="9" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorField name="opis" index="10" showLabel="1"/>
    <attributeEditorContainer columnCount="4" groupBox="0" visibilityExpressionEnabled="0" name="Tip" visibilityExpression="" showLabel="1">
      <attributeEditorField name="pogled" index="11" showLabel="1"/>
      <attributeEditorField name="vrsta" index="12" showLabel="1"/>
      <attributeEditorField name="oznake" index="13" showLabel="1"/>
      <attributeEditorField name="žanr" index="14" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="3" groupBox="0" visibilityExpressionEnabled="0" name="Metadata" visibilityExpression="" showLabel="1">
      <attributeEditorField name="avtor" index="15" showLabel="1"/>
      <attributeEditorField name="opombe" index="16" showLabel="1"/>
      <attributeEditorField name="datum posnetka" index="18" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" groupBox="1" visibilityExpressionEnabled="0" name="" visibilityExpression="" showLabel="1">
      <attributeEditorField name="pot" index="20" showLabel="1"/>
      <attributeEditorField name="delete" index="-1" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="FL" editable="1"/>
    <field name="FS" editable="1"/>
    <field name="PN" editable="1"/>
    <field name="SE" editable="1"/>
    <field name="VZ" editable="1"/>
    <field name="avtor" editable="1"/>
    <field name="date_taken" editable="1"/>
    <field name="datum posnetka" editable="0"/>
    <field name="delete" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="ime" editable="1"/>
    <field name="izbriši" editable="1"/>
    <field name="kvadrant" editable="1"/>
    <field name="opis" editable="1"/>
    <field name="opombe" editable="1"/>
    <field name="oznake" editable="1"/>
    <field name="path" editable="1"/>
    <field name="pogled" editable="1"/>
    <field name="pot" editable="0"/>
    <field name="relativna pot" editable="1"/>
    <field name="sektor" editable="1"/>
    <field name="sonda" editable="1"/>
    <field name="vrsta" editable="1"/>
    <field name="žanr" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="FL"/>
    <field labelOnTop="0" name="FS"/>
    <field labelOnTop="0" name="PN"/>
    <field labelOnTop="0" name="SE"/>
    <field labelOnTop="0" name="VZ"/>
    <field labelOnTop="0" name="avtor"/>
    <field labelOnTop="0" name="date_taken"/>
    <field labelOnTop="0" name="datum posnetka"/>
    <field labelOnTop="0" name="delete"/>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="ime"/>
    <field labelOnTop="0" name="izbriši"/>
    <field labelOnTop="0" name="kvadrant"/>
    <field labelOnTop="0" name="opis"/>
    <field labelOnTop="0" name="opombe"/>
    <field labelOnTop="0" name="oznake"/>
    <field labelOnTop="0" name="path"/>
    <field labelOnTop="0" name="pogled"/>
    <field labelOnTop="0" name="pot"/>
    <field labelOnTop="0" name="relativna pot"/>
    <field labelOnTop="0" name="sektor"/>
    <field labelOnTop="0" name="sonda"/>
    <field labelOnTop="0" name="vrsta"/>
    <field labelOnTop="0" name="žanr"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>COALESCE( "ime", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
