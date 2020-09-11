<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" readOnly="0" styleCategories="AllStyleCategories" version="3.14.1-Pi" hasScaleBasedVisibilityFlag="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal mode="0" durationField="" fixedDuration="0" endField="" durationUnit="min" endExpression="" startField="" startExpression="" accumulate="0" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <referencedLayers/>
  <referencingLayers/>
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
              <Option type="invalid" name="properties"/>
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
    <alias index="0" field="fid" name=""/>
    <alias index="1" field="ime" name=""/>
    <alias index="2" field="sektor" name=""/>
    <alias index="3" field="kvadrant" name=""/>
    <alias index="4" field="sonda" name=""/>
    <alias index="5" field="SE" name=""/>
    <alias index="6" field="PN" name=""/>
    <alias index="7" field="FS" name=""/>
    <alias index="8" field="VZ" name=""/>
    <alias index="9" field="FL" name=""/>
    <alias index="10" field="opis" name=""/>
    <alias index="11" field="pogled" name=""/>
    <alias index="12" field="vrsta" name=""/>
    <alias index="13" field="oznake" name=""/>
    <alias index="14" field="žanr" name=""/>
    <alias index="15" field="avtor" name=""/>
    <alias index="16" field="opombe" name=""/>
    <alias index="17" field="izbriši" name=""/>
    <alias index="18" field="datum posnetka" name=""/>
    <alias index="19" field="relativna pot" name=""/>
    <alias index="20" field="pot" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="fid" applyOnUpdate="0" expression=""/>
    <default field="ime" applyOnUpdate="0" expression=""/>
    <default field="sektor" applyOnUpdate="0" expression=""/>
    <default field="kvadrant" applyOnUpdate="0" expression=""/>
    <default field="sonda" applyOnUpdate="0" expression=""/>
    <default field="SE" applyOnUpdate="0" expression=""/>
    <default field="PN" applyOnUpdate="0" expression=""/>
    <default field="FS" applyOnUpdate="0" expression=""/>
    <default field="VZ" applyOnUpdate="0" expression=""/>
    <default field="FL" applyOnUpdate="0" expression=""/>
    <default field="opis" applyOnUpdate="0" expression=""/>
    <default field="pogled" applyOnUpdate="0" expression=""/>
    <default field="vrsta" applyOnUpdate="0" expression=""/>
    <default field="oznake" applyOnUpdate="0" expression=""/>
    <default field="žanr" applyOnUpdate="0" expression=""/>
    <default field="avtor" applyOnUpdate="0" expression=""/>
    <default field="opombe" applyOnUpdate="0" expression=""/>
    <default field="izbriši" applyOnUpdate="0" expression=""/>
    <default field="datum posnetka" applyOnUpdate="0" expression=""/>
    <default field="relativna pot" applyOnUpdate="0" expression=""/>
    <default field="pot" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" exp_strength="0" field="fid" constraints="3" notnull_strength="1"/>
    <constraint unique_strength="0" exp_strength="0" field="ime" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="sektor" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="kvadrant" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="sonda" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="SE" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="PN" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="FS" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="VZ" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="FL" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="opis" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="pogled" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="vrsta" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oznake" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="žanr" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="avtor" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="opombe" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="izbriši" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="datum posnetka" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="relativna pot" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="pot" constraints="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="fid"/>
    <constraint desc="" exp="" field="ime"/>
    <constraint desc="" exp="" field="sektor"/>
    <constraint desc="" exp="" field="kvadrant"/>
    <constraint desc="" exp="" field="sonda"/>
    <constraint desc="" exp="" field="SE"/>
    <constraint desc="" exp="" field="PN"/>
    <constraint desc="" exp="" field="FS"/>
    <constraint desc="" exp="" field="VZ"/>
    <constraint desc="" exp="" field="FL"/>
    <constraint desc="" exp="" field="opis"/>
    <constraint desc="" exp="" field="pogled"/>
    <constraint desc="" exp="" field="vrsta"/>
    <constraint desc="" exp="" field="oznake"/>
    <constraint desc="" exp="" field="žanr"/>
    <constraint desc="" exp="" field="avtor"/>
    <constraint desc="" exp="" field="opombe"/>
    <constraint desc="" exp="" field="izbriši"/>
    <constraint desc="" exp="" field="datum posnetka"/>
    <constraint desc="" exp="" field="relativna pot"/>
    <constraint desc="" exp="" field="pot"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;date_taken&quot;" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="35" type="field" hidden="0" name="fid"/>
      <column width="283" type="field" hidden="0" name="ime"/>
      <column width="-1" type="field" hidden="0" name="sektor"/>
      <column width="154" type="field" hidden="0" name="kvadrant"/>
      <column width="-1" type="field" hidden="0" name="sonda"/>
      <column width="-1" type="field" hidden="0" name="SE"/>
      <column width="-1" type="field" hidden="0" name="PN"/>
      <column width="-1" type="field" hidden="0" name="FS"/>
      <column width="-1" type="field" hidden="0" name="opis"/>
      <column width="-1" type="field" hidden="0" name="pogled"/>
      <column width="-1" type="field" hidden="0" name="vrsta"/>
      <column width="-1" type="field" hidden="0" name="oznake"/>
      <column width="-1" type="field" hidden="0" name="žanr"/>
      <column width="-1" type="field" hidden="0" name="avtor"/>
      <column width="-1" type="field" hidden="0" name="opombe"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" hidden="0" name="VZ"/>
      <column width="-1" type="field" hidden="0" name="FL"/>
      <column width="-1" type="field" hidden="0" name="izbriši"/>
      <column width="-1" type="field" hidden="0" name="datum posnetka"/>
      <column width="-1" type="field" hidden="0" name="relativna pot"/>
      <column width="-1" type="field" hidden="0" name="pot"/>
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
    <attributeEditorContainer groupBox="0" visibilityExpressionEnabled="0" showLabel="1" name="Metadata" columnCount="2" visibilityExpression="">
      <attributeEditorField index="1" showLabel="1" name="ime"/>
      <attributeEditorField index="15" showLabel="1" name="avtor"/>
      <attributeEditorField index="16" showLabel="1" name="opombe"/>
      <attributeEditorField index="18" showLabel="1" name="datum posnetka"/>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Lokacija" columnCount="1" visibilityExpression="">
        <attributeEditorField index="2" showLabel="1" name="sektor"/>
        <attributeEditorField index="3" showLabel="1" name="kvadrant"/>
        <attributeEditorField index="4" showLabel="1" name="sonda"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Tip" columnCount="1" visibilityExpression="">
        <attributeEditorField index="11" showLabel="1" name="pogled"/>
        <attributeEditorField index="12" showLabel="1" name="vrsta"/>
        <attributeEditorField index="13" showLabel="1" name="oznake"/>
        <attributeEditorField index="14" showLabel="1" name="žanr"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer groupBox="0" visibilityExpressionEnabled="0" showLabel="1" name="Stratigrafija" columnCount="3" visibilityExpression="">
      <attributeEditorField index="5" showLabel="1" name="SE"/>
      <attributeEditorField index="7" showLabel="1" name="FS"/>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="" columnCount="1" visibilityExpression="">
        <attributeEditorField index="6" showLabel="1" name="PN"/>
        <attributeEditorField index="8" showLabel="1" name="VZ"/>
        <attributeEditorField index="9" showLabel="1" name="FL"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorField index="10" showLabel="1" name="opis"/>
    <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="" columnCount="1" visibilityExpression="">
      <attributeEditorField index="20" showLabel="1" name="pot"/>
      <attributeEditorField index="17" showLabel="1" name="izbriši"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="FL"/>
    <field editable="1" name="FS"/>
    <field editable="1" name="PN"/>
    <field editable="1" name="SE"/>
    <field editable="1" name="VZ"/>
    <field editable="1" name="avtor"/>
    <field editable="1" name="date_taken"/>
    <field editable="0" name="datum posnetka"/>
    <field editable="1" name="delete"/>
    <field editable="1" name="fid"/>
    <field editable="1" name="ime"/>
    <field editable="1" name="izbriši"/>
    <field editable="1" name="kvadrant"/>
    <field editable="1" name="opis"/>
    <field editable="1" name="opombe"/>
    <field editable="1" name="oznake"/>
    <field editable="1" name="path"/>
    <field editable="1" name="pogled"/>
    <field editable="0" name="pot"/>
    <field editable="1" name="relativna pot"/>
    <field editable="1" name="sektor"/>
    <field editable="1" name="sonda"/>
    <field editable="1" name="vrsta"/>
    <field editable="1" name="žanr"/>
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
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>COALESCE( "ime", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
