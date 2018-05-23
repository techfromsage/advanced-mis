---
layout: site
title: Application Data Overview
body_class: app-data
---

Advanced MIS contains all list, item, user and hierarchy data in your Talis Aspire tenancy.

The data is a replica - not live data - and is pushed to the data warehouse and reformatted to optimise
for management reporting. Data can either be automatically or manually pushed, see the [Pushing Content]({{ site.baseurl }}/topics/pushing.html)
topic for more information.

Refer to the data dictionary topics below to discover how to use the data:

| Entity  | Description | Fact Table Name |
|---|---|---|
| [Lists]({{ site.baseurl }}/topics/lists.html) | Reading list data | `f_rl_lists`
| [Items]({{ site.baseurl }}/topics/items.html) | Reading list item data | `f_rl_items`
| [Users]({{ site.baseurl }}/topics/users.html) | Reading list user records | `f_rl_users`
| [Hierarchy]({{ site.baseurl }}/topics/hierarchy.html) | Reading list hierarchy data | `f_rl_hierarchy`
| [Digitisations]({{ site.baseurl }}/topics/digitisations.html) | Copyright cleared request data | `f_dc_requests`
