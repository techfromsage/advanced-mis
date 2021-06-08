---
layout: site
title: Application Data Overview
body_class: app-data
---

Advanced MIS contains all list, item, user and hierarchy data in your Talis Aspire tenancy.
You will see information from Reading Lists, Copyright Clearance and Talis Elevate. 

The data is a replica - not live data - and is pushed to the data warehouse and reformatted to optimise
for management reporting. Data can either be automatically or manually pushed, see the [Pushing Content]({{ site.baseurl }}/topics/pushing.html)
topic for more information.

Part of the refactoring for management reporting involves:

* Dropping high-cardinality columns, such as `student_note`
* Exploding dates into their parts to enable queries such as *Find users who mostly log in on Tuesdays in September*
* Flattening data structures
* Adding external identifiers so data can be linked to other sources
* Calculating new lookup tables based on the existing data. For example a view that links all isbns with the item it appears on.

## Diagram

There is is a (rather large!!) [entity relationship diagram]({{ site.baseurl }}/topics/entity-relationships.html) available.

## Details

Refer to the data dictionary topics below to discover how to use the different entities in the warehouse:

| Entity  | Description | Fact Table Name |
|---|---|---|
| [Lists]({{ site.baseurl }}/topics/lists.html) | Reading list data | `f_rl_lists`
| [Items]({{ site.baseurl }}/topics/items.html) | Reading list item data | `f_rl_items`
| [Users]({{ site.baseurl }}/topics/users.html) | Reading list user records | `f_rl_users`
| [Hierarchy]({{ site.baseurl }}/topics/hierarchy.html) | Hierarchy records | `f_rl_hierarchy`
| [Hierarchy Descendants]({{ site.baseurl }}/topics/hierarchy-descendants.html) | Calculated view of all descendants of a given node | `f_rl_hierarchy-descendants`
| [Hierarchy Parents]({{ site.baseurl }}/topics/hierarchy-parents.html) | Linking table from a given node to its parents | `f_rl_hierarchy-parents`
| [ISBN Link]({{ site.baseurl }}/topics/isbn-link.html) | Linking table from an isbn to all items it appears on | `f_rl_lists`
| [Rollovers]({{ site.baseurl }}/topics/rollovers.html) | Reading list rollover data | `f_rl_list_rollover_relationships`
| [Digitisations]({{ site.baseurl }}/topics/digitisations.html) | Copyright cleared request data | `f_dc_requests`
| [Elevate Users]({{ site.baseurl }}/topics/elevate-users.html) | Talis Elevate users | `f_elevate_users`
| [Elevate Modules]({{ site.baseurl }}/topics/elevate-modules.html) | Talis Elevate modules | `f_elevate_modules`
| [Elevate Resources]({{ site.baseurl }}/topics/elevate-resources.html) | Talis Elevate resources | `f_elevate_resources`
| [Elevate Module Resource Links]({{ site.baseurl }}/topics/elevate-module-resource-links.html) | Linking table between Talis Elevate modules and resources | `f_elevate_module_resource_links`

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
