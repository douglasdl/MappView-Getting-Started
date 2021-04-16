# MappView Getting Started
Simple 2 pages navigation based on Help explanations tutorial.

## Getting started
This section shows the steps necessary for creating a simple mapp View HMI application with 2 pages.

### Topics in this section:

- [Creating a new ARsim project](#Creating-a-new-ARsim-project)  
- [Adding a mapp View HMI application](#Adding-a-mapp-View-HMI-application)  
- [Adding a visualization package](#Adding-a-visualization-package)
- [Designing a page](#Designing-a-page)
- [Adding the HMI application to the active configuration](#Adding-the-HMI-application-to-the-active-configuration)
- [Binding widgets to data](#Binding-widgets-to-data)
- [Testing the HMI application](#Testing-the-HMI-application)


#### Creating a new ARsim project
The first step is to create an Automation Studio project with an appropriate name.

The two checkboxes in this window must be unselected!

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView1.png)
 
Clicking on Next opens the next window, where a name for the configuration can be defined and the hardware selected manually.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView2.png)
 
The hardware can be limited by filtering a standard PC.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView3.png)
 
Finish creates the project.


### Adding a mapp View HMI application
In this step, a mapp View package is added to the Logical View.

By selecting the Logical View, you can add the mapp View package from the Object Catalog with drag-and-drop or a double-click. Setting the filter to "mapp View" limits the results in the list of objects.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView4.png)
![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView5.png)
  
After it has been added, the mapp View package is displayed in the Logical View.

The mapp View package can only be added once in the Logical View. If the package already exists, it will no longer be shown in the Object Catalog.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView6.png)
 
The next step involves adding a visualization package where the pages will be configured.

The name of the mapp View package cannot be changed. It can be added only underneath the root node.


### Adding a visualization package
This step adds a visualization package to the mapp View package in the Logical View.

The Visualization package is used for the logical management of visualization components such as visualization pages.

A visualization package can be added from the Object Catalog by first selecting the mapp View package.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView7.png) 

After the visualization package has been added, it is possible to begin designing a page in the next step.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView8.png)

The name of a visualization package can be changed by selecting it and pressing F2. This name is only used to logically manage HMI components and has no additional effect.


### Designing a page
This section describes the steps necessary for designing a page.

#### Task definition
The HMI application should consist of two pages. Each page will have an area for navigating between the two pages, with individual content displayed on the left side.

- Page1: Displays the speed using a gauge 
- Page2: Displays the temperature using a numeric output field 

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappViewMockup.png)
 
These images are a mock-up of the pages to be created.

Topics in this section:

- [Creating a layout with 2 areas](#Creating-a-layout-with-two-areas)  
- [Adding pages](#Adding-pages)
- [Adding the necessary pieces of content](#Adding-the-necessary-content)
- [Widgets for displaying text and values](#Widgets-for-displaying-text-and-values)
- [Navigating between two pages](#Navigating-between-two-pages)
- [Configuring pages](#Configuring-pages)


#### Creating a layout with two areas

The page will be split into two areas, which will be defined by a layout. The size of the HMI application will be set to 800 x 600 (W x H), with the area for navigation set to a width of 100 pixels on the right side.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView9.png)
 
The first step is to add a layout from the Object Catalog after selecting package "Layouts" in the visualization package.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView10.png)
 
Double-clicking on the layout file opens it in the Automation Studio workspace in XML format.

##### Layout after editing

The layout file needs a unique ID that can be referenced on the page. The size of the layout must also be defined with "width" and "height".

The two areas are defined in section <Areas> section with IDs unique to the layout. Attributes "width" and "height" define the size of the area, and attributes "top" and "left" define the starting position.

```xml
<?xml version="1.0" encoding="utf-8"?>
<ldef:Layout id="Layout01" height="600" width="800" xmlns:ldef="http://www.br-automation.com/iat2015/layoutDefinition/v2">
	<Areas>
		<Area id="AreaMain" height="600" width="700" left="0" top="0" />
		<Area id="AreaNavigation" height="600" width="100" left="700" top="0" />
	</Areas>
</ldef:Layout>
```

#### Adding pages

Two pages are added from the Object Catalog to the Pages node in the visualization package.

The name of the page package in the Logical View must be unique; the underlying filenames can be defined as needed.

When referencing a page in the HMI application, it is not the filename but the ID reference for the page that matters. The package name and filenames are used to logically manage the HMI application components in the Logical View.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView11.png)
 
After the pages have been added, the respective content can be added, edited and then assigned to the corresponding areas in the .page files of each page package.


#### Adding the necessary content

This step adds three content files from the Object Catalog to their respective positions in the Logical View, where they can then be edited and assigned to an area in the .page file.

Content is necessary for the following tasks:

- Content of Page1: Displaying the speed 
- Content of Page2: Displaying the temperature 
- Navigation content for both pages 

A piece of content that should be used on several pages can be managed under the Pages/AreaContents node. This package can be split up into further packages as required by the project's organization.

Page content can be added from the Object Catalog after selecting a page or package AreaContents. In this example, the pieces of contents have been renamed to better express their functions.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView12.png)

The next steps involve editing the pieces of content (ID, size, etc.) and then assigning them to an area on the pages.


#### Widgets for displaying text and values

This step configures the two pieces of content for displaying speed and temperature.

The content editor is opened by double-clicking on the respective content file (.content).

##### Content for speed

After opening the piece of content with filename Page1Content.content, it is displayed with a default name and size ("width" and "height").

The following properties can then be changed in the Properties window.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView13.png)

- Name: Page1Content - This name is used as the ID for assigning to the area on the left of Page1. 
- height: 600 - Corresponds to the entire height of the layout being used on the page. 
- width: 700 - Corresponds to the entire width of the layout being used on the page minus the area for navigation (100 pixels). 
 
From the Widget Catalog, widget "Label" is added on the piece of content using drag-and-drop.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView14.png)

The text is configured using property "Text" of widget Label.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView15.png)

The next step is to add widget "RadialGauge" from the Object Catalog. The size of the widget can be adjusted using the resize handles.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView16.png)
 
Information about how to bind the widget to an OPC UA variable is described in a later section.

##### Content for temperature

After opening the piece of content with filename Page2Content.content, it is displayed with a default name and size ("width" and "height").

As before, its name and width must be changed.

- Name: Page2Content - This name is used as the ID for assigning to the area on the left of Page2. 
- height: 600 - Corresponds to the entire height of the layout being used on the page. 
- width: 700 - Corresponds to the entire width of the layout being used on the page minus the area for navigation (100 pixels). 

The next step is to add widget "Label" and widget "NumericOutput" from the Widget Catalog to the piece of content.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView17.png)

The piece of content for navigation is configured in the next step.


#### Navigating between two pages

This step configures the content for displaying the navigation options between pages.

The content editor is opened by double-clicking on the content file (.content).

##### Content for navigation

After opening the piece of content with filename Navigation.content, it is displayed with its default name and size ("width" and "height").

The following properties can then be changed in the Properties window.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView18.png)

- Name: NavigationContent - This name is used as the ID for assigning to the area on the right of Page1 and Page2. 
- height: 600 - Corresponds to the entire height of the layout being used on the page. 
- width: 100 - Corresponds to the entire width of the navigation content in the layout. 
 
From the Widget Catalog, widget "NavigationBar" is added on the piece of content using drag-and-drop.

This so-called container widget serves as a "carrier" for the NavigationButton widgets it contains. For more information, see Widget description.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView19.png)

Now two NavigationButton widgets from the Widget Catalog are added to the navigation bar; the sizes are changed using "Resize handles" and vertically aligned to each other.

In the properties of each widget, the description text of the NavigationButton and the page assigned by the button for navigation must be configured at property pageId. Page1 for the first NavigationButton; Page2 for the second NavigationButton. 

The IDs of the pages are used when configuring the .page files.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView20.png)

In the next step, the visualization pages are configured by assigning the contents to the corresponding areas using the .page files configuration.


#### Configuring pages

This step configures the pages by assigning the pieces of content to the respective areas for the layout being used.

Double-clicking on the PAGE file opens it in the Automation Studio workspace in the visual editor.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView21.png)

The page file needs a unique ID that can be referenced in the visualization object. In addition, the layout to be used must be referenced in attribute layoutId.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView22.png)

By selecting an area in the workspace, the assignment properties of the area are displayed in the Properties window.

The corresponding piece of content must be assigned for each area.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView23.png)
  
The same procedure is repeated for Page2 (although the page name and content for AreaMain must be adjusted accordingly).

##### Configuring the background color for content

A piece of content does not have a background color when being designed in the content editor. This can only be defined when assigning an area with attribute backColor, for example.

For this example, rgba(204, 255, 153,1) is used for Page1Content, rgba(153, 204, 255,1) for Page2Content, and rgba(0, 89, 179,1) for NavigationContent. 

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView24.png)
 
The configuration of colors and color gradients is documented in the chapter Themes and styles.

In the next step, the HMI application is configured from the previously created visualization pages in the Configuration View.


### Adding the HMI application to the active configuration

Until now, pages and their components (layout and content) have been created in the Logical View.

In this section, the HMI application is configured and the necessary settings made on the mapp View server. This configuration takes place in the Configuration View under the mapp View node.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView25.png)

In the first step, an HMI application must be added and configured with the existing components of the Logical View.

#### Topics in this section:

- [Adding an HMI application](#Adding-an-HMI-application)  
- [Configuring the mapp View server](#Configuring-the-mapp-View-server)  


#### Adding an HMI application

The first step is to select the mapp View package in the Configuration View and add an HMI application from the Object Catalog using drag-and-drop.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView26.png)

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView27.png)
        
Double-clicking on the file with extension .vis opens it in the editor in XML format.

Since only two pages have been created at this point, it is sufficient to make the following changes to the HMI application.

```xml
   <?xml version="1.0" encoding="utf-8"?>
  <vdef:Visualization id="FirstVisu" xmlns:vdef="http://www.br-automation.com/iat2015/visualizationDefinition/v2">
        <StartPage pageRefId="Page1" />
        <Pages>
                 <Page refId="Page1"/> 
                 <Page refId="Page2" />
        </Pages> 
```

Attribute 		Description 
Visualization ID 	Unique name of the HMI application. This name is used to access the mapp View server so that the correct HMI application is delivered to the client. 
StartPage pageRefId 	Page that is shown first when the HMI application is provided to the client. 
Page refId 		Pages from the components in the Logical View that will be provided to a client for this HMI application.
Attribute id of the .page files is used.
```xml
<pdef:Page id="Page1" layoutRefId="Layout01" xmlns:pdef="http://www.br-automation.com/iat2015/pageDefinition/v2">
``` 

The next step involves configuring the mapp View server settings. The HMI application can then be tested in the browser.


#### Configuring the mapp View server

In this step, the mapp View server configuration is opened. No changes are necessary for this example. 

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView28.png)
 
Port 81 is preset in the configuration for HTTP communication between the HMI application client (browser) and the mapp View server. This is required when starting the HMI application in the browser.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView29.png)


### Binding widgets to data

Until now, the HMI application has not been bound to any data from the control application.

To do so, each IEC variable in the different programs that should be used in the HMI application must also be made available as an OPC UA variable in the project.

These steps show how to create a program in the Logical View that contains the variables for speed and temperature. These variables are "enabled" in the OPC UA default view configuration in the Configuration View and then bound to the corresponding widgets (RadialGauge and NumericOutput).

#### Saving bindings

If a source from the content editor is bound to a widget, its binding is saved in a binding file.

A binding file must be added from the Object Catalog to the mapp View node in the Configuration View and then edited.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView30.png)

The binding file needs a unique ID that can be referenced in the visualization object. 

##### Configuring the binding file

After the binding is added, it already has an ID that must be referenced in the visualization object.

```xml
   <?xml version="1.0" encoding="utf-8"?>
  <BindingsSet id="binding_0" xmlns="http://www.br-automation.com/iat2015/binding/engineering/v2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <Bindings>
                
        </Bindings> 
  </BindingsSet>
```

#### Referencing the binding in the visualization object

"BindingSet id" must be referenced in section <BindingsSets> of the visualization object (.vis).

```xml
        <BindingsSets>
            <BindingsSet refId="binding_0" />
        </BindingsSets> 
```
 
At least one binding file must be added to the project and referenced in the visualization object.

#### Topics in this section:

- [Adding a program](#Adding-a-program)
- [OPC UA configuration](#OPC-UA-configuration)  
- [Displaying a value](#Displaying-values)  
- [Displaying a value and unit](#Value-binding)  


#### Adding a program

To complete this task, a program containing variables must be added.

##### Task definition

A program named "Program" will be added to the Logical View in this step (in the desired programming language). This program will use the following local variables:

- Speed [data type = INT] 
- Temperature [data type =REAL] 

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView31.png) 

The OPC UA configuration is made in the next step.


#### OPC UA configuration

The following steps are necessary for the OPC UA configuration:

- [Enabling the OPC UA server in the CPU configuration](#Enabling-the-OPC-UA-server) 
- [Adding an OPC UA default view configuration](#Adding-an-OPC-UA-default-view-configuration) 
- [Enabling the variables to be used as OPC UA variables in the HMI application](#IEC-variable-→-OPC-UA-variable) 

##### Enabling the OPC UA server

The OPC UA server is enabled in the CPU configuration under the OPC UA system node.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView32.png)

##### Adding an OPC UA default view configuration

The OPC UA default view configuration needs to be added once under the Connectivity / OPC UA node from the Object Catalog in the Configuration View.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView33.png)

##### IEC variable → OPC UA variable

After opening the OPC UA default view (OpcUaMap.uad), the OPC UA variables in the Properties window must be enabled by selecting the variables (Enable="True").

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView34.png)
 
From this point on, these OPC UA variables can also be used as the source for binding to a widget's property (e.g. "value").

The individual attributes of an OPC UA variable are described further on.


#### Displaying values

This step shows how to bind OPC UA variable "Program:Speed" to widget RadialGauge in Page1Content.

Select the RadialGauge widget after opening the piece of content in the content editor. The browse dialog box is opened by selecting the "..." button for property "value".

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView35.png)

The variable selection dialog box shows all variables in the OPC UA default view under the "OPC UA" tab. In order to link the value of the OPC UA variable, the value attribute of the variable must be linked.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView36.png)

Since the value on widget "RadialGauge" is read-only, the binding mode can be set to read-only. Once bound, the variable is shown in the "value/Binding" row. The binding itself is saved in the binding file with the ID selected in the dialog box. 

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView37.png) 

For further information, see Value binding.


### Displaying values and units

This step shows how to add a unit to OPC UA variable "Program:Temperature" and bind it to the NumericOutput widget in Page2Content.

The system of units is used for node binding. 
The system of units is only active if a text configuration exists. 

#### OPC UA variable units

Before the widget can be bound to the variable, the OPC UA variable must be edited. In this example, the physical unit of variable "Temperature" is degrees Celsius.

Editing takes place once again in the OPC UA default view of the Configuration View. 

After selecting a variable, its unit can be selected in the Engineering Unit Catalog.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView38.png)
 
#### Binding the "value" property to the OPC UA variable

In the Content Designer, the OPC UA variable is assigned to property value of wisget NumericOutput in the variable selection dialog box.

In contrast to a pure value binding, the entire node is connected here. This transfers all attributes of the OPC UA variable to the widget.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView39.png)
 
After selecting variable Program:Temperature, it will be displayed in the Properties window.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView40.png)
 
#### Configuring unit switching

In order for the unit to also be displayed in the NumericOutput widget, the corresponding unit property must also be configured. The unit must be specified for the each system of units: metric, imperial and US imperial. The OPC UA unit is automatically converted to the system of units configured for the mapp View HMI application.

unit="{'metric':'CEL','imperial':'myNamespace|FAH','imperial-us':'FAH'}"

The unit is transferred to each system of units as common code. The associated namespace can be specified in the unit by separating it with the pipe character "|". The default namespace (http://www.opcfoundation.org/UA/units/un/cefact) is used if one is not specified.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView41.png)
 
Starting with mapp View 1.3, the unit for each measurement system can be configured at the unit property by entering the common code in a dialog box.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView42.png)
 
Switching the system of units can be done with widget MeasurementSystemSelector.

A text system configuration must exist in the Configuration View in order for the value to be displayed properly at runtime. If this configuration file does not exist, "XX" will be displayed in place of the value.


### Testing the HMI application

The HMI application can be tested with a browser from the point at which the first HMI application pages (.page) were referenced in the HMI application (.vis).

After this is successfully built and transferred to the ARsim, the HMI application is delivered to the browser (Google Chrome) with the URL:

localhost:81/index.html?visuId=FirstVisu

The "Visualization id" projected in the HMI application (.vis) is transferred as visuId.

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/MappView43.png)

![Imagem](https://raw.githubusercontent.com/douglasdl/images/main/FirstVisu.gif)


#### Value binding

Value binding is used if only the value is needed without units or limits. 
Data forwarding only involves the value of the bound variable. 


Example

<Binding mode="oneWay">
    <Source xsi:type="opcUa" refId="::AsGlobalPV:gMainLogic.par.coffeeType" attribute="value" />
    <Target xsi:type="brease" widgetRefId="ImageSwitchCoffeeType" contentRefId="myContent" attribute="selectedIndex" />
</Binding>
Attribute"xsi:type" specifies which type of data source is bound.
Attribute refId as well as attributes widgetRefId and contentRefId (for widgets) reference the data source.
For details, see Possible data sources. 

The following values are available for "attribute" with value binding: 

xsi:type attribute 
opcUa value 
brease Name of a bindable property of a widget with a scalar data type.
See the widget documentation.
e.g. the attribute with the name "value" from NumericInput

 
session value 
server value 
snippet value 
expression result
Name of an operand
 
text value 

Use case
Displaying an OPC UA variable on a widget

Widgets located in different pieces of content can be bound using session variables. See use case Connect two contents using a session variable.
Directly binding widgets in different pieces of content is not permitted! 
