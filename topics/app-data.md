---
layout: site
title: Application Data Overview
body_class: app-data
---

Advanced MIS contains all list, item, user and hierarchy data in your Talis Aspire tenancy.

The data is a replica - not live data - and is pushed to the data warehouse and reformatted to optimise
for management reporting. Data can either be automatically or manually pushed, see the [Pushing Content]({{ site.baseurl }}/topics/pushing.html)
topic for more information.

Part of the refactoring for management reporting involves:

* Dropping high-cardinality columns, such as `title`
* Exploding dates into their parts to enable queries such as *Find users who mostly log in on Tuesdays in September*
* Flattening data structures
* Adding external identifiers so data can be linked in to other sources

Refer to the data dictionary topics below to discover how to use the different entities in the warehouse:

| Entity  | Description | Fact Table Name |
|---|---|---|
| [Lists]({{ site.baseurl }}/topics/lists.html) | Reading list data | `f_rl_lists`
| [Items]({{ site.baseurl }}/topics/items.html) | Reading list item data | `f_rl_items`
| [Users]({{ site.baseurl }}/topics/users.html) | Reading list user records | `f_rl_users`
| [Hierarchy]({{ site.baseurl }}/topics/hierarchy.html) | Reading list hierarchy data | `f_rl_hierarchy`
| [Digitisations]({{ site.baseurl }}/topics/digitisations.html) | Copyright cleared request data | `f_dc_requests`

**WARNING:** Because this is a beta service, the data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.

### TODO list

This service is in beta. The current todo list for Application Data is:

* Provide a fact table for hierarchy data
* For fact tables `f_rl_*`, provide `TIMESTAMP` columns for exploded dates
* For fact tables `f_dc_*`, provide exploded dates for existing `TIMESTAMP` columns
* Complete documentation

