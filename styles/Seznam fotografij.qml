<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" readOnly="0" version="3.16.7-Hannover" minScale="1e+08" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal accumulate="0" endExpression="" startField="" mode="0" startExpression="" durationUnit="min" durationField="" endField="" enabled="0" fixedDuration="0">
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
      <value>COALESCE( "ime", '&lt;NULL>' )</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ime">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sektor">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kvadrant">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sonda">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="SE">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="PN">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FS">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="VZ">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FL">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="opis">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pogled">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="S" type="QString" name="Sever"/>
              </Option>
              <Option type="Map">
                <Option value="J" type="QString" name="Jug"/>
              </Option>
              <Option type="Map">
                <Option value="V" type="QString" name="Vzhod"/>
              </Option>
              <Option type="Map">
                <Option value="Z" type="QString" name="Zahod"/>
              </Option>
              <Option type="Map">
                <Option value="SV" type="QString" name="Severovzhod"/>
              </Option>
              <Option type="Map">
                <Option value="SZ" type="QString" name="Severozahod"/>
              </Option>
              <Option type="Map">
                <Option value="JV" type="QString" name="Jugovzhod"/>
              </Option>
              <Option type="Map">
                <Option value="JZ" type="QString" name="Jugozahod"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vrsta">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="T" type="QString" name="Tloris"/>
              </Option>
              <Option type="Map">
                <Option value="P" type="QString" name="Presek"/>
              </Option>
              <Option type="Map">
                <Option value="SP" type="QString" name="Stranski pogled"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oznake">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="žanr">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="Strokovni" type="QString" name="Strokovni"/>
              </Option>
              <Option type="Map">
                <Option value="Delovni" type="QString" name="Delovni"/>
              </Option>
              <Option type="Map">
                <Option value="Nedokumentarni" type="QString" name="Nedokumentarni"/>
              </Option>
              <Option type="Map">
                <Option value="Dokumentarni" type="QString" name="Dokumentarni"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="avtor">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="opombe">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="izbriši">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="datum posnetka">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="allow_null"/>
            <Option value="true" type="bool" name="calendar_popup"/>
            <Option value="yyyy-MM-dd HH:mm:ss" type="QString" name="display_format"/>
            <Option value="yyyy-MM-dd HH:mm:ss" type="QString" name="field_format"/>
            <Option value="false" type="bool" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="originalno ime">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pot">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option value="1" type="int" name="DocumentViewer"/>
            <Option value="0" type="int" name="DocumentViewerHeight"/>
            <Option value="0" type="int" name="DocumentViewerWidth"/>
            <Option value="false" type="bool" name="FileWidget"/>
            <Option value="true" type="bool" name="FileWidgetButton"/>
            <Option value="" type="QString" name="FileWidgetFilter"/>
            <Option type="Map" name="PropertyCollection">
              <Option value="" type="QString" name="name"/>
              <Option type="invalid" name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
            <Option value="0" type="int" name="RelativeStorage"/>
            <Option value="0" type="int" name="StorageMode"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="fid" index="0" name=""/>
    <alias field="ime" index="1" name=""/>
    <alias field="sektor" index="2" name=""/>
    <alias field="kvadrant" index="3" name=""/>
    <alias field="sonda" index="4" name=""/>
    <alias field="SE" index="5" name=""/>
    <alias field="PN" index="6" name=""/>
    <alias field="FS" index="7" name=""/>
    <alias field="VZ" index="8" name=""/>
    <alias field="FL" index="9" name=""/>
    <alias field="opis" index="10" name=""/>
    <alias field="pogled" index="11" name=""/>
    <alias field="vrsta" index="12" name=""/>
    <alias field="oznake" index="13" name=""/>
    <alias field="žanr" index="14" name=""/>
    <alias field="avtor" index="15" name=""/>
    <alias field="opombe" index="16" name=""/>
    <alias field="izbriši" index="17" name="Za izbrisat"/>
    <alias field="datum posnetka" index="18" name=""/>
    <alias field="originalno ime" index="19" name=""/>
    <alias field="pot" index="20" name="Fotografija"/>
  </aliases>
  <defaults>
    <default field="fid" expression="" applyOnUpdate="0"/>
    <default field="ime" expression="" applyOnUpdate="0"/>
    <default field="sektor" expression="" applyOnUpdate="0"/>
    <default field="kvadrant" expression="" applyOnUpdate="0"/>
    <default field="sonda" expression="" applyOnUpdate="0"/>
    <default field="SE" expression="" applyOnUpdate="0"/>
    <default field="PN" expression="" applyOnUpdate="0"/>
    <default field="FS" expression="" applyOnUpdate="0"/>
    <default field="VZ" expression="" applyOnUpdate="0"/>
    <default field="FL" expression="" applyOnUpdate="0"/>
    <default field="opis" expression="" applyOnUpdate="0"/>
    <default field="pogled" expression="" applyOnUpdate="0"/>
    <default field="vrsta" expression="" applyOnUpdate="0"/>
    <default field="oznake" expression="" applyOnUpdate="0"/>
    <default field="žanr" expression="" applyOnUpdate="0"/>
    <default field="avtor" expression="" applyOnUpdate="0"/>
    <default field="opombe" expression="" applyOnUpdate="0"/>
    <default field="izbriši" expression="" applyOnUpdate="0"/>
    <default field="datum posnetka" expression="" applyOnUpdate="0"/>
    <default field="originalno ime" expression="" applyOnUpdate="0"/>
    <default field="pot" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="fid" notnull_strength="1" exp_strength="0" unique_strength="1"/>
    <constraint constraints="0" field="ime" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="sektor" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="kvadrant" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="sonda" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="SE" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="PN" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="FS" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="VZ" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="FL" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="opis" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="pogled" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="vrsta" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="oznake" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="žanr" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="avtor" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="opombe" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="izbriši" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="datum posnetka" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="originalno ime" notnull_strength="0" exp_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="pot" notnull_strength="0" exp_strength="0" unique_strength="0"/>
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
    <constraint exp="" desc="" field="originalno ime"/>
    <constraint exp="" desc="" field="pot"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting id="{e2091ed9-e0d3-4277-8816-899a530b21e2}" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Odpri sliko" type="5" name="Odpri sliko" action="[%pot%]" notificationMessage="" icon="">
      <actionScope id="Layer"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting id="{66761b74-6cdd-4cbc-b203-c02c31fe1189}" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="" type="1" name="Kopiraj sliko" action="from io import BytesIO&#xd;&#xa;import win32clipboard&#xd;&#xa;from PIL import Image&#xd;&#xa;&#xd;&#xa;def send_to_clipboard(clip_type, data):&#xd;&#xa;    win32clipboard.OpenClipboard()&#xd;&#xa;    win32clipboard.EmptyClipboard()&#xd;&#xa;    win32clipboard.SetClipboardData(clip_type, data)&#xd;&#xa;    win32clipboard.CloseClipboard()&#xd;&#xa;filepath = &quot;[% replace( &quot;pot&quot;, '\\', '\\\\')%]&quot;&#xd;&#xa;image = Image.open(filepath)&#xd;&#xa;output = BytesIO()&#xd;&#xa;image.convert(&quot;RGB&quot;).save(output, &quot;BMP&quot;)&#xd;&#xa;data = output.getvalue()[14:]&#xd;&#xa;output.close()&#xd;&#xa;&#xd;&#xa;send_to_clipboard(win32clipboard.CF_DIB, data)&#xd;&#xa;&#xd;&#xa;" notificationMessage="2" icon="">
      <actionScope id="Layer"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting id="{e6b7fada-bf2e-4fa8-8a44-f546f4720203}" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="" type="1" name="Kopiraj opis slike v odložišče" action="from PyQt5.Qt import QApplication&#xd;&#xa;clipboard = QApplication.clipboard()&#xd;&#xa;clipboard.setText(&quot;[% &quot;opis&quot;  || 'Pogled proti ' ||  &quot;pogled&quot;  || '. (foto ' ||   &quot;avtor&quot;  ||  ')'%]&quot;) " notificationMessage="" icon="">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;date_taken&quot;" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" name="fid" width="35"/>
      <column hidden="0" type="field" name="ime" width="283"/>
      <column hidden="0" type="field" name="sektor" width="-1"/>
      <column hidden="0" type="field" name="kvadrant" width="154"/>
      <column hidden="0" type="field" name="sonda" width="-1"/>
      <column hidden="0" type="field" name="SE" width="-1"/>
      <column hidden="0" type="field" name="PN" width="-1"/>
      <column hidden="0" type="field" name="FS" width="-1"/>
      <column hidden="0" type="field" name="opis" width="-1"/>
      <column hidden="0" type="field" name="pogled" width="-1"/>
      <column hidden="0" type="field" name="vrsta" width="-1"/>
      <column hidden="0" type="field" name="oznake" width="-1"/>
      <column hidden="0" type="field" name="žanr" width="-1"/>
      <column hidden="0" type="field" name="avtor" width="-1"/>
      <column hidden="0" type="field" name="opombe" width="-1"/>
      <column hidden="0" type="actions" width="-1"/>
      <column hidden="0" type="field" name="VZ" width="-1"/>
      <column hidden="0" type="field" name="FL" width="-1"/>
      <column hidden="0" type="field" name="izbriši" width="-1"/>
      <column hidden="0" type="field" name="datum posnetka" width="-1"/>
      <column hidden="0" type="field" name="pot" width="-1"/>
      <column hidden="0" type="field" name="originalno ime" width="119"/>
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
      <attributeEditorField showLabel="1" index="1" name="ime"/>
      <attributeEditorField showLabel="1" index="15" name="avtor"/>
      <attributeEditorField showLabel="1" index="18" name="datum posnetka"/>
      <attributeEditorField showLabel="1" index="16" name="opombe"/>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" showLabel="1" name="Lokacija" groupBox="1">
        <attributeEditorField showLabel="1" index="2" name="sektor"/>
        <attributeEditorField showLabel="1" index="3" name="kvadrant"/>
        <attributeEditorField showLabel="1" index="4" name="sonda"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2" showLabel="1" name="Tip" groupBox="1">
        <attributeEditorField showLabel="1" index="14" name="žanr"/>
        <attributeEditorField showLabel="1" index="11" name="pogled"/>
        <attributeEditorField showLabel="1" index="12" name="vrsta"/>
        <attributeEditorField showLabel="1" index="13" name="oznake"/>
        <attributeEditorField showLabel="1" index="17" name="izbriši"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="3" showLabel="1" name="Stratigrafija" groupBox="0">
      <attributeEditorField showLabel="1" index="5" name="SE"/>
      <attributeEditorField showLabel="1" index="7" name="FS"/>
      <attributeEditorContainer visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" showLabel="1" name="" groupBox="1">
        <attributeEditorField showLabel="1" index="6" name="PN"/>
        <attributeEditorField showLabel="1" index="8" name="VZ"/>
        <attributeEditorField showLabel="1" index="9" name="FL"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" index="10" name="opis"/>
    <attributeEditorField showLabel="1" index="20" name="pot"/>
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
    <field name="FL" labelOnTop="0"/>
    <field name="FS" labelOnTop="0"/>
    <field name="PN" labelOnTop="0"/>
    <field name="SE" labelOnTop="0"/>
    <field name="VZ" labelOnTop="0"/>
    <field name="avtor" labelOnTop="0"/>
    <field name="date_taken" labelOnTop="0"/>
    <field name="datum posnetka" labelOnTop="0"/>
    <field name="delete" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="ime" labelOnTop="0"/>
    <field name="izbriši" labelOnTop="0"/>
    <field name="kvadrant" labelOnTop="0"/>
    <field name="opis" labelOnTop="0"/>
    <field name="opombe" labelOnTop="0"/>
    <field name="originalno ime" labelOnTop="0"/>
    <field name="oznake" labelOnTop="0"/>
    <field name="path" labelOnTop="0"/>
    <field name="pogled" labelOnTop="0"/>
    <field name="pot" labelOnTop="0"/>
    <field name="relativna pot" labelOnTop="0"/>
    <field name="sektor" labelOnTop="0"/>
    <field name="sonda" labelOnTop="0"/>
    <field name="vrsta" labelOnTop="0"/>
    <field name="žanr" labelOnTop="0"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>COALESCE( "ime", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
