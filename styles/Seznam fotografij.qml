<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" version="3.16.7-Hannover" styleCategories="AllStyleCategories" maxScale="0" readOnly="0" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal endExpression="" startExpression="" startField="" mode="0" endField="" durationUnit="min" accumulate="0" enabled="0" durationField="" fixedDuration="0">
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
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ime">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sektor">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kvadrant">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sonda">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="SE">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="PN">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FS">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="VZ">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FL">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="opis">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
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
                <Option type="QString" name="Sever" value="S"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Jug" value="J"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Vzhod" value="V"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Zahod" value="Z"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Severovzhod" value="SV"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Severozahod" value="SZ"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Jugovzhod" value="JV"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Jugozahod" value="JZ"/>
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
                <Option type="QString" name="Tloris" value="T"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Presek" value="P"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Stranski pogled" value="SP"/>
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
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
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
                <Option type="QString" name="Strokovni" value="Strokovni"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Delovni" value="Delovni"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Nedokumentarni" value="Nedokumentarni"/>
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
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="opombe">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option type="bool" name="Editable" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="izbriši">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="datum posnetka">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="originalno ime">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pot">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option type="int" name="DocumentViewer" value="1"/>
            <Option type="int" name="DocumentViewerHeight" value="0"/>
            <Option type="int" name="DocumentViewerWidth" value="0"/>
            <Option type="bool" name="FileWidget" value="false"/>
            <Option type="bool" name="FileWidgetButton" value="true"/>
            <Option type="QString" name="FileWidgetFilter" value=""/>
            <Option type="Map" name="PropertyCollection">
              <Option type="QString" name="name" value=""/>
              <Option type="invalid" name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
            <Option type="int" name="RelativeStorage" value="0"/>
            <Option type="int" name="StorageMode" value="0"/>
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
    <alias field="originalno ime" name="" index="19"/>
    <alias field="pot" name="Fotografija" index="20"/>
  </aliases>
  <defaults>
    <default expression="" field="fid" applyOnUpdate="0"/>
    <default expression="" field="ime" applyOnUpdate="0"/>
    <default expression="" field="sektor" applyOnUpdate="0"/>
    <default expression="" field="kvadrant" applyOnUpdate="0"/>
    <default expression="" field="sonda" applyOnUpdate="0"/>
    <default expression="" field="SE" applyOnUpdate="0"/>
    <default expression="" field="PN" applyOnUpdate="0"/>
    <default expression="" field="FS" applyOnUpdate="0"/>
    <default expression="" field="VZ" applyOnUpdate="0"/>
    <default expression="" field="FL" applyOnUpdate="0"/>
    <default expression="" field="opis" applyOnUpdate="0"/>
    <default expression="" field="pogled" applyOnUpdate="0"/>
    <default expression="" field="vrsta" applyOnUpdate="0"/>
    <default expression="" field="oznake" applyOnUpdate="0"/>
    <default expression="" field="žanr" applyOnUpdate="0"/>
    <default expression="" field="avtor" applyOnUpdate="0"/>
    <default expression="" field="opombe" applyOnUpdate="0"/>
    <default expression="" field="izbriši" applyOnUpdate="0"/>
    <default expression="" field="datum posnetka" applyOnUpdate="0"/>
    <default expression="" field="originalno ime" applyOnUpdate="0"/>
    <default expression="" field="pot" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="fid" unique_strength="1" constraints="3" notnull_strength="1" exp_strength="0"/>
    <constraint field="ime" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="sektor" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="kvadrant" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="sonda" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="SE" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="PN" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="FS" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="VZ" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="FL" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="opis" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="pogled" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="vrsta" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="oznake" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="žanr" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="avtor" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="opombe" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="izbriši" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="datum posnetka" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="originalno ime" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint field="pot" unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="fid" exp="" desc=""/>
    <constraint field="ime" exp="" desc=""/>
    <constraint field="sektor" exp="" desc=""/>
    <constraint field="kvadrant" exp="" desc=""/>
    <constraint field="sonda" exp="" desc=""/>
    <constraint field="SE" exp="" desc=""/>
    <constraint field="PN" exp="" desc=""/>
    <constraint field="FS" exp="" desc=""/>
    <constraint field="VZ" exp="" desc=""/>
    <constraint field="FL" exp="" desc=""/>
    <constraint field="opis" exp="" desc=""/>
    <constraint field="pogled" exp="" desc=""/>
    <constraint field="vrsta" exp="" desc=""/>
    <constraint field="oznake" exp="" desc=""/>
    <constraint field="žanr" exp="" desc=""/>
    <constraint field="avtor" exp="" desc=""/>
    <constraint field="opombe" exp="" desc=""/>
    <constraint field="izbriši" exp="" desc=""/>
    <constraint field="datum posnetka" exp="" desc=""/>
    <constraint field="originalno ime" exp="" desc=""/>
    <constraint field="pot" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting icon="" type="5" name="Odpri sliko" notificationMessage="" action="[%pot%]" isEnabledOnlyWhenEditable="0" id="{0d76a795-dfc0-4ef6-b2bc-ed00f5421beb}" capture="0" shortTitle="Odpri sliko">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Layer"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting icon="" type="1" name="Kopiraj sliko" notificationMessage="2" action="from io import BytesIO&#xd;&#xa;import win32clipboard&#xd;&#xa;from PIL import Image&#xd;&#xa;&#xd;&#xa;def send_to_clipboard(clip_type, data):&#xd;&#xa;    win32clipboard.OpenClipboard()&#xd;&#xa;    win32clipboard.EmptyClipboard()&#xd;&#xa;    win32clipboard.SetClipboardData(clip_type, data)&#xd;&#xa;    win32clipboard.CloseClipboard()&#xd;&#xa;filepath = &quot;[% replace( &quot;pot&quot;, '\\', '\\\\')%]&quot;&#xd;&#xa;image = Image.open(filepath)&#xd;&#xa;output = BytesIO()&#xd;&#xa;image.convert(&quot;RGB&quot;).save(output, &quot;BMP&quot;)&#xd;&#xa;data = output.getvalue()[14:]&#xd;&#xa;output.close()&#xd;&#xa;&#xd;&#xa;send_to_clipboard(win32clipboard.CF_DIB, data)&#xd;&#xa;&#xd;&#xa;" isEnabledOnlyWhenEditable="0" id="{eeb01e6d-1b8a-46c8-a806-870dafd100a0}" capture="0" shortTitle="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Layer"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting icon="" type="1" name="Kopiraj opis slike v odložišče" notificationMessage="" action="from PyQt5.Qt import QApplication&#xd;&#xa;clipboard = QApplication.clipboard()&#xd;&#xa;clipboard.setText(&quot;[% &quot;opis&quot;  || 'Pogled proti ' ||  &quot;pogled&quot;  || '. (foto ' ||   &quot;avtor&quot;  ||  ')'%]&quot;) " isEnabledOnlyWhenEditable="0" id="{26e90517-c45c-4715-96b3-053a6a86371e}" capture="0" shortTitle="">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="1" sortExpression="&quot;žanr&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" name="fid" hidden="0" width="35"/>
      <column type="field" name="ime" hidden="0" width="283"/>
      <column type="field" name="sektor" hidden="0" width="-1"/>
      <column type="field" name="kvadrant" hidden="0" width="154"/>
      <column type="field" name="sonda" hidden="0" width="-1"/>
      <column type="field" name="SE" hidden="0" width="-1"/>
      <column type="field" name="PN" hidden="0" width="-1"/>
      <column type="field" name="FS" hidden="0" width="-1"/>
      <column type="field" name="opis" hidden="0" width="-1"/>
      <column type="field" name="pogled" hidden="0" width="-1"/>
      <column type="field" name="vrsta" hidden="0" width="-1"/>
      <column type="field" name="oznake" hidden="0" width="-1"/>
      <column type="field" name="žanr" hidden="0" width="-1"/>
      <column type="field" name="avtor" hidden="0" width="-1"/>
      <column type="field" name="opombe" hidden="0" width="-1"/>
      <column type="actions" hidden="0" width="-1"/>
      <column type="field" name="VZ" hidden="0" width="-1"/>
      <column type="field" name="FL" hidden="0" width="-1"/>
      <column type="field" name="izbriši" hidden="0" width="-1"/>
      <column type="field" name="datum posnetka" hidden="0" width="-1"/>
      <column type="field" name="pot" hidden="0" width="-1"/>
      <column type="field" name="originalno ime" hidden="0" width="119"/>
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
    <attributeEditorContainer showLabel="1" groupBox="0" name="Metadata" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="2">
      <attributeEditorField showLabel="1" name="ime" index="1"/>
      <attributeEditorField showLabel="1" name="avtor" index="15"/>
      <attributeEditorField showLabel="1" name="datum posnetka" index="18"/>
      <attributeEditorField showLabel="1" name="opombe" index="16"/>
      <attributeEditorContainer showLabel="1" groupBox="1" name="Lokacija" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField showLabel="1" name="sektor" index="2"/>
        <attributeEditorField showLabel="1" name="kvadrant" index="3"/>
        <attributeEditorField showLabel="1" name="sonda" index="4"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" groupBox="1" name="Tip" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="2">
        <attributeEditorField showLabel="1" name="žanr" index="14"/>
        <attributeEditorField showLabel="1" name="pogled" index="11"/>
        <attributeEditorField showLabel="1" name="vrsta" index="12"/>
        <attributeEditorField showLabel="1" name="oznake" index="13"/>
        <attributeEditorField showLabel="1" name="izbriši" index="17"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer showLabel="1" groupBox="0" name="Stratigrafija" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="3">
      <attributeEditorField showLabel="1" name="SE" index="5"/>
      <attributeEditorField showLabel="1" name="FS" index="7"/>
      <attributeEditorContainer showLabel="1" groupBox="1" name="" visibilityExpressionEnabled="0" visibilityExpression="" columnCount="1">
        <attributeEditorField showLabel="1" name="PN" index="6"/>
        <attributeEditorField showLabel="1" name="VZ" index="8"/>
        <attributeEditorField showLabel="1" name="FL" index="9"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" name="opis" index="10"/>
    <attributeEditorField showLabel="1" name="pot" index="20"/>
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
    <field editable="0" name="ime"/>
    <field editable="1" name="izbriši"/>
    <field editable="1" name="kvadrant"/>
    <field editable="1" name="opis"/>
    <field editable="1" name="opombe"/>
    <field editable="1" name="originalno ime"/>
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
