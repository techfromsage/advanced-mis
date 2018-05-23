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


### SQLWorkbenchJ

The process for connecting to SQLWorkbenchJ will be similar for many other SQL clients, so the instructions here can be followed for those too.

1. First, follow [the instructions here](https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-using-workbench.html) for adding the Amazon Redshift driver to your installation of SQLWorkbenchJ
2. Launch SQLWorkbenchJ and choose **File > Connection Window** from the menu. You should see the dialog below:

![SQLWorkbenchJ Connection Screenshot]({{ site.url }}/images/topics/connecting/sqlworkbenchj-connect.jpg)

3. In the driver drop down, select `Amazon Redshift (com.amazon.redshift.jdbc.Driver)`
4. In the URL field, add the server domain, followed by `/` and then your database name
5. Add the username and password in the correct fields
6. Click OK

In the next screen, you should see the workspace window. Choose **Tools > Show Database Explorer** to have a look around.

![SQLWorkbenchJ Connection Screenshot]({{ site.url }}/images/topics/connecting/sqlworkbenchj-connected.jpg)

### Tableau

1. Choose "Connect to a server/Amazon Redshift"

![Tableau Connections Screenshot]({{ site.url }}/images/topics/connecting/tableau-connect.jpg)


2. In the "Server" field enter the domain name
3. In the "Database" field enter your database name
4. In the "User" field enter your username
5. In the "Password" field enter your password

In the next screen, make sure you are in the public schema. You should see a list of fact tables on the right (prefixed f_). From here you can create the data source for the workbook.

![Tableau Connected Screenshot]({{ site.url }}/images/topics/connecting/tableau-connected.jpg)
