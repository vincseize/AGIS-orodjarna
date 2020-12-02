<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" minScale="1e+08" readOnly="0" version="3.10.8-A Coruña" styleCategories="AllStyleCategories" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
    </property>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
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
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kvadrant">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sonda">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
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
              <Option type="Map">
                <Option type="QString" value="Dokumentarni" name="Dokumentarni"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="avtor">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="Editable"/>
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
    <field name="originalno ime">
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
            <Option type="bool" value="false" name="FileWidget"/>
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
    <alias field="fid" name="" index="0"/>
    <alias field="ime" name="" index="1"/>
    <alias field="sektor" name="" index="2"/>
    <alias field="kvadrant" name="" index="3"/>
    <alias field="sonda" name="" index="4"/>
    <alias field="SE" name="" index="5"/>
    <alias field="PN" name="" index="6"/>
    <alias field="FS" name="" index="7"/>
    <alias field="VZ" name="" index="8"/>
    <alias field="FL" name="" index="9"/>
    <alias field="opis" name="" index="10"/>
    <alias field="pogled" name="" index="11"/>
    <alias field="vrsta" name="" index="12"/>
    <alias field="oznake" name="" index="13"/>
    <alias field="žanr" name="" index="14"/>
    <alias field="avtor" name="" index="15"/>
    <alias field="opombe" name="" index="16"/>
    <alias field="izbriši" name="Za izbrisat" index="17"/>
    <alias field="datum posnetka" name="" index="18"/>
    <alias field="relativna pot" name="" index="19"/>
    <alias field="originalno ime" name="" index="20"/>
    <alias field="pot" name="Fotografija" index="21"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="fid"/>
    <default applyOnUpdate="0" expression="" field="ime"/>
    <default applyOnUpdate="0" expression="" field="sektor"/>
    <default applyOnUpdate="0" expression="" field="kvadrant"/>
    <default applyOnUpdate="0" expression="" field="sonda"/>
    <default applyOnUpdate="0" expression="" field="SE"/>
    <default applyOnUpdate="0" expression="" field="PN"/>
    <default applyOnUpdate="0" expression="" field="FS"/>
    <default applyOnUpdate="0" expression="" field="VZ"/>
    <default applyOnUpdate="0" expression="" field="FL"/>
    <default applyOnUpdate="0" expression="" field="opis"/>
    <default applyOnUpdate="0" expression="" field="pogled"/>
    <default applyOnUpdate="0" expression="" field="vrsta"/>
    <default applyOnUpdate="0" expression="" field="oznake"/>
    <default applyOnUpdate="0" expression="" field="žanr"/>
    <default applyOnUpdate="0" expression="" field="avtor"/>
    <default applyOnUpdate="0" expression="" field="opombe"/>
    <default applyOnUpdate="0" expression="" field="izbriši"/>
    <default applyOnUpdate="0" expression="" field="datum posnetka"/>
    <default applyOnUpdate="0" expression="" field="relativna pot"/>
    <default applyOnUpdate="0" expression="" field="originalno ime"/>
    <default applyOnUpdate="0" expression="" field="pot"/>
  </defaults>
  <constraints>
    <constraint field="fid" exp_strength="0" constraints="3" unique_strength="1" notnull_strength="1"/>
    <constraint field="ime" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="sektor" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="kvadrant" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="sonda" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="SE" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="PN" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="FS" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="VZ" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="FL" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="opis" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="pogled" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="vrsta" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="oznake" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="žanr" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="avtor" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="opombe" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="izbriši" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="datum posnetka" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="relativna pot" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="originalno ime" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="pot" exp_strength="0" constraints="0" unique_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="fid" desc=""/>
    <constraint exp="" field="ime" desc=""/>
    <constraint exp="" field="sektor" desc=""/>
    <constraint exp="" field="kvadrant" desc=""/>
    <constraint exp="" field="sonda" desc=""/>
    <constraint exp="" field="SE" desc=""/>
    <constraint exp="" field="PN" desc=""/>
    <constraint exp="" field="FS" desc=""/>
    <constraint exp="" field="VZ" desc=""/>
    <constraint exp="" field="FL" desc=""/>
    <constraint exp="" field="opis" desc=""/>
    <constraint exp="" field="pogled" desc=""/>
    <constraint exp="" field="vrsta" desc=""/>
    <constraint exp="" field="oznake" desc=""/>
    <constraint exp="" field="žanr" desc=""/>
    <constraint exp="" field="avtor" desc=""/>
    <constraint exp="" field="opombe" desc=""/>
    <constraint exp="" field="izbriši" desc=""/>
    <constraint exp="" field="datum posnetka" desc=""/>
    <constraint exp="" field="relativna pot" desc=""/>
    <constraint exp="" field="originalno ime" desc=""/>
    <constraint exp="" field="pot" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting notificationMessage="" type="5" id="{935ca84f-cdfe-476f-b3d1-57e697c79b75}" capture="0" shortTitle="Odpri sliko" action="[%pot%]" isEnabledOnlyWhenEditable="0" name="Odpri sliko" icon="">
      <actionScope id="Field"/>
      <actionScope id="Layer"/>
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="&quot;date_taken&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" type="field" width="35" name="fid"/>
      <column hidden="0" type="field" width="283" name="ime"/>
      <column hidden="0" type="field" width="-1" name="sektor"/>
      <column hidden="0" type="field" width="154" name="kvadrant"/>
      <column hidden="0" type="field" width="-1" name="sonda"/>
      <column hidden="0" type="field" width="-1" name="SE"/>
      <column hidden="0" type="field" width="-1" name="PN"/>
      <column hidden="0" type="field" width="-1" name="FS"/>
      <column hidden="0" type="field" width="-1" name="opis"/>
      <column hidden="0" type="field" width="-1" name="pogled"/>
      <column hidden="0" type="field" width="-1" name="vrsta"/>
      <column hidden="0" type="field" width="-1" name="oznake"/>
      <column hidden="0" type="field" width="-1" name="žanr"/>
      <column hidden="0" type="field" width="-1" name="avtor"/>
      <column hidden="0" type="field" width="-1" name="opombe"/>
      <column hidden="0" type="actions" width="-1"/>
      <column hidden="0" type="field" width="-1" name="VZ"/>
      <column hidden="0" type="field" width="-1" name="FL"/>
      <column hidden="0" type="field" width="-1" name="izbriši"/>
      <column hidden="0" type="field" width="-1" name="datum posnetka"/>
      <column hidden="0" type="field" width="-1" name="relativna pot"/>
      <column hidden="0" type="field" width="-1" name="pot"/>
      <column hidden="0" type="field" width="119" name="originalno ime"/>
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
    <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2" showLabel="1" name="Metadata" groupBox="0">
      <attributeEditorField showLabel="1" name="ime" index="1"/>
      <attributeEditorField showLabel="1" name="avtor" index="15"/>
      <attributeEditorField showLabel="1" name="datum posnetka" index="18"/>
      <attributeEditorField showLabel="1" name="opombe" index="16"/>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" showLabel="1" name="Lokacija" groupBox="1">
        <attributeEditorField showLabel="1" name="sektor" index="2"/>
        <attributeEditorField showLabel="1" name="kvadrant" index="3"/>
        <attributeEditorField showLabel="1" name="sonda" index="4"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2" showLabel="1" name="Tip" groupBox="1">
        <attributeEditorField showLabel="1" name="žanr" index="14"/>
        <attributeEditorField showLabel="1" name="pogled" index="11"/>
        <attributeEditorField showLabel="1" name="vrsta" index="12"/>
        <attributeEditorField showLabel="1" name="oznake" index="13"/>
        <attributeEditorField showLabel="1" name="izbriši" index="17"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="3" showLabel="1" name="Stratigrafija" groupBox="0">
      <attributeEditorField showLabel="1" name="SE" index="5"/>
      <attributeEditorField showLabel="1" name="FS" index="7"/>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" showLabel="1" name="" groupBox="1">
        <attributeEditorField showLabel="1" name="PN" index="6"/>
        <attributeEditorField showLabel="1" name="VZ" index="8"/>
        <attributeEditorField showLabel="1" name="FL" index="9"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" name="opis" index="10"/>
    <attributeEditorField showLabel="1" name="pot" index="21"/>
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
    <field name="ime" editable="0"/>
    <field name="izbriši" editable="1"/>
    <field name="kvadrant" editable="1"/>
    <field name="opis" editable="1"/>
    <field name="opombe" editable="1"/>
    <field name="originalno ime" editable="1"/>
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
    <field labelOnTop="0" name="originalno ime"/>
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
