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


### SQL Workbench



### Tableau

1. Choose "Connect to a server/Amazon Redshift"

![Tableau Connections Screenshot]({{ site.url }}/images/topics/connecting/tableau-connect.jpg)


2. In the "Server" field enter the domain name
3. In the "Database" field enter your database name
4. In the "User" field enter your username
5. In the "Password" field enter your password

In the next screen, make sure you are in the public schema. You should see a list of fact tables on the right (prefixed f_). From here you can create the data source for the workbook.

![Tableau Connected Screenshot]({{ site.url }}/images/topics/connecting/tableau-connected.jpg)
