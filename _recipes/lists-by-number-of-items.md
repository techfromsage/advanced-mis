---
title: Lists by number of items
layout: site
body_class: recipe
keywords: reading lists, items, list analytics, list quality
description: Get information on lists and modules by the number of items or sections they contain.
---

## Background
This recipe will sort all lists at your university by the number of items they contain.  The sort of questions you might answer are:

* How many lists have zero or very few items?
  * This may represent lists which need more engagement by list developers to provide useful resources for students.
* Do any lists have particularly high numbers of items?
  * This may indicate lists which are over-enriched with content, and which may discourage student engagement via information overload.
* Do particular departments or faculty have longer or shorter lists than an average length?
* Are departments or faculty following list length guidelines that the university may have set?

## Data sources
The data we will be using comes entirely from the ``f_rl_lists`` table, which contains data for all lists at your University.  See the table definition for more information on what content exists within this table.

```redshift
-- To view the table schema in SQL:
DESCRIBE f_rl_lists;
 
-- To view the table schema in PSQL:
\d f_rl_lists
```

## The Query
The query will pull back a selection of fields for every list in the tenancy, and order the lists by item count, descending from highest to lowest number of lists.  It will also exclude any Archived lists.

```redshift
SELECT 
  url, 
  title, 
  item_count, 
  section_count, 
  status, 
  hierarchy_url, 
  time_period, 
  owner, 
  date_created, 
  last_updated 
FROM 
  public.f_rl_lists
WHERE 
  status != 'Archived'
ORDER BY 
  item_count DESC
```

The formatting of a response will be determined by the tool you are using to make the query, and you may have choices to make reading easier.  In the following example we are using a pgsql client and are listing the field data rather than viewing it in a traditional tabular-style:

```redshift
-[ RECORD 1 ]-+----------------------------------------------------------------------------------
url           | http://broadminster.ac.uk/lists/E742E880-CD1C-6EF2-6761-7C820F435081
title         | Neurology and science
item_count    | 105
section_count | 10
status        | Draft
hierarchy_url |
time_period   |
owner         |
date_created  | 2016-01-12 00:00:00
last_updated  | 2016-01-12 00:00:00
-[ RECORD 2 ]-+----------------------------------------------------------------------------------
url           | http://broadminster.ac.uk/lists/FF0284F2-D41A-F984-DAB2-E069110ED291
title         | This History of Horticulture on Mars
item_count    | 101
section_count | 17
status        | Published
hierarchy_url | http://broadminster.ac.uk/courses/hhm43
time_period   | 2019/20
owner         |
date_created  | 2017-07-05 00:00:00
last_updated  | 2018-08-31 00:00:00
```
 

## Variations on a theme
Try out some of these modifications to the query:

To change the order from highest-to-lowest, to lowest-to-highest, change the ‘order by line’ to:

```redshift
ORDER BY item_count ASC
```

To list all tables by the number of sections, instead of items, change the ‘order by’ line to:

```redshift
ORDER BY section_count DESC
```

To search only for published lists, modify the `where status !=` line to:
(The available statuses are “Published”, “Draft”, “Archived”, “Published with Unpublished Changes”)

```redshift
WHERE status = 'Published'
```

If your lists are attached to a level in the hierarchy which has parents —for example, if all modules are attached to a department— then we can add this grouping to our output:

```redshift
SELECT 
  lists.url, 
  lists.title, 
  lists.item_count, 
  lists.section_count, 
  lists.status, 
  lists.hierarchy_url, 
  lists.time_period, 
  lists.owner, 
  lists.date_created, 
  lists.last_updated, 
  modules.url AS department 
FROM public.f_rl_lists AS lists
LEFT JOIN 
  public.f_rl_hierarchy_descendants AS modules 
  	ON modules.descendant_url = lists.hierarchy_url
WHERE 
  lists.status != 'Archived'
ORDER BY 
  lists.item_count DESC
```

