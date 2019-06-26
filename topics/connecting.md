---
layout: site
title: Connecting
body_class: connecting
---

This article explains how to connect to various third party tools you might use to query Advanced MIS.

You will need four bits of information in all cases, these will be supplied to you by Talis when Advanced MIS is activated:

1. Server domain name
2. Database name
3. User name
4. Password

Third party tools with specific instructions on this page are:

* [SQLWorkbenchJ](#sqlworkbenchj)
* [Tableau](#tableau)
* [Power BI](#power-bi)

### SQLWorkbenchJ

The process for connecting to SQLWorkbenchJ will be similar for many other SQL clients, so the instructions here can be followed for those too.

1. First, follow [the instructions here](https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-using-workbench.html) for adding the Amazon Redshift driver to your installation of SQLWorkbenchJ
2. Launch SQLWorkbenchJ and choose **File > Connection Window** from the menu. You should see the dialog below:

![SQLWorkbenchJ Connection Screenshot]({{ site.baseurl }}/images/topics/connecting/sqlworkbenchj-connect.jpg)

3. In the driver drop down, select `Amazon Redshift (com.amazon.redshift.jdbc.Driver)`
4. In the URL field, add the server domain, followed by `/` and then your database name
5. Add the username and password in the correct fields
6. Click OK

In the next screen, you should see the workspace window. Choose **Tools > Show Database Explorer** to have a look around.

![SQLWorkbenchJ Connection Screenshot]({{ site.baseurl }}/images/topics/connecting/sqlworkbenchj-connected.jpg)

### Tableau

1. Choose "Connect to a server/Amazon Redshift"

![Tableau Connections Screenshot]({{ site.baseurl }}/images/topics/connecting/tableau-connect.jpg)


2. In the "Server" field enter the domain name
3. In the "Database" field enter your database name
4. In the "User" field enter your username
5. In the "Password" field enter your password

In the next screen, make sure you are in the public schema. You should see a list of fact tables on the right (prefixed f_). From here you can create the data source for the workbook.

![Tableau Connected Screenshot]({{ site.baseurl }}/images/topics/connecting/tableau-connected.jpg)

### Power BI

Connecting to Power BI involves 2 components; the desktop client and the Power BI online web based service.

In both cases, the connection details that Talis Supply will be required.

#### Power BI Desktop App

Power BI Desktop allows you to create a new data connection to Redshift Services.
Simply enter user names, passwords and host when requested.

The domain to use in the connection string _must_ be the SSL version of the domain. We are not currently able to add our own certificate to the Redshift connection.

You will have the option to create a connection as a Direct Query or Import connection type.

* Import — Use this option if you plan to publish dataset to the Power Bi Online Service. This is the default and Microsoft recommended way to connect in Power BI as it uses the underlying Power BI data engine.
* Direct Query — Use this option if you want to get live data on the desktop client only, or if you have an on premise Power BI gateway setup (see below). [Read more about Direct Query](https://docs.microsoft.com/en-us/power-bi/desktop-use-directquery).

Microsoft details [how to connect to a Redshift source](https://docs.microsoft.com/en-us/power-bi/desktop-connect-redshift).

#### Power BI Service

We are unable to open database access to Power BI Service as there are no specific Azure servers that are hosting the service, and we'd have to open ports for every Azure server across the globe.

If you plan to publish reports using the Power BI service, please either: 

* Use the Import connection type.
* Setup a local [on premise Power BI gateway](https://docs.microsoft.com/en-us/power-bi/service-gateway-onprem) to proxy the redshift connection. You can tell us what the IP of your on premise gateway is and we will allow connections from that IP address.  This has been supported in Power BI gateway since the [May 2019 release of the gateway](https://powerbi.microsoft.com/en-us/blog/on-premises-data-gateway-may-2019-update-is-now-available/). 