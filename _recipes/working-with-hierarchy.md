---
title: Working With The Hierarchy
layout: site
body_class: recipe
keywords: reading lists, hierarchy
description: Explore how you can query up or down the hierarchy.
---

## Background
When reporting any kind of activity, the first and most obvious way to group data for summary is by the school, department or faculty that is responsible for the creation and maintenance of a list in the University.

The Hierarchy in Talis Aspire is 'free form' in that you can have as many hierarchy levels as you like, and the type of 'node' in each level is for you to choose from a set list of types.  Each university can use its own terminology for how it describes a cluster of teaching blocks and the organisational group responsible for maintaining them.

In this example we we will use the following hierarchy nomenclature:

- A `node` is any point in the hierarchy.
- A `module` is a node with a type of 'module'
- A `department` is an organisation group within the university which has responsibility for delivering the teaching for the modules. It is a node with a type of 'department'
- An `institution` is often the top level of the hierarchy. It is a predefined node with the type of 'institution' and the code 'INSTITUTION'.   

### Questions you might be asking

Often people want to circulate reports to departments to show them how well they are getting on in rolling out reading lists, and to give them lists of modules for which some sort of action needs to be taken. These are often reported monthly, termly or yearly.

The questions people want to help answer in these reports are often as follows:

- How many modules should have lists?
- How many modules don't have lists?
- How many modules do have lists?
- Report each of the above by department
- Report the details on any exceptions so that someone can take action

## The Hierarchy data

In Talis Aspire, because the hierarchy is designed to be flexible to many different ways of describing an institution, there are some key things to consider when querying the hierarchy.  

In the `f_rl_hierarchy` view you will see a flat representation of what is actually a one-to-many relationship between a node and its parents.  For example where a node of type module, has more than one parent, then each parent is included in the parents columns separated by a semi-colon and space (`; `).

You can check to see if this is likely to affect your data using a query like the following:

```redshift
select hierarchy_url 
from f_rl_lists 
where hierarchy_url like '%; %'
limit 1; 
```

Because you often want to group and aggregate 'up' or 'down' the hierarchy, we have extracted this information into to separate tables to facilitate easier access to this data.

The two views are as follows:

- [`f_rl_hierarchy_descendants`]({{ site.baseurl }}/topics/hierarchy-descendants.html) — descendant relationships for each node in the hierarchy. It is important to note that nodes will appear multiple times if they are great (up to 5 levels deep) grand children of a multi level hierarchy.
- [`f_rl_hierarchy_parents`]({{ site.baseurl }}/topics/hierarchy-parents.html) — parent relationships for each node in the hierarchy.

## A basic query using parent relationships

In this example we want to count how many nodes have parents but do not have lists.

```redshift
select count(f_rl_hierarchy.url), parents.parent_url
from
    f_rl_hierarchy,
    f_rl_hierarchy_parents as parents
where
    total_list_count = 0
and
    f_rl_hierarchy.url = parents.url
group by 
    parents.parent_url
```

## A more complex example with parent relationships

This query shows us list length across each department, and also calculates averages of list length per department. We can also see the same for section counts.  This can be used to give an indication of how people are using lists and whether they are using sections to break up long lists into manageable chunks.

```redshift
select 
    distinct(parent_url),
    min(item_count) OVER (PARTITION BY parent_url) as "Min Length", 
    max(item_count) OVER (PARTITION BY parent_url) as "Max Length", 
    avg(item_count) OVER (PARTITION BY parent_url) as "Average Length",
    min(section_count) OVER (PARTITION BY parent_url) as "Min Number of Sections",
    max(section_count) OVER (PARTITION BY parent_url) as "Max Number of Sections",
    avg(section_count) OVER (PARTITION BY parent_url) as "Average Number of Sections"
from 
    f_rl_lists, 
    f_rl_hierarchy_parents
where
    f_rl_lists.hierarchy_url = f_rl_hierarchy_parents.url
group by parent_url, item_count, section_count
```

## A Basic query using descendant relationships

Maybe we want to run a query that uses a specific department as the starting point, or where we want to know an aggregate at the level of the department. In this example, we are looking to find out how many nodes of type 'Module' we have below each department.  Perhaps we have a hierarchy where modules can be combined in many different ways to form courses within those departments, but we don't want to count at the Course level

```redshift
select 
    descendants.url as "department", 
    count(descendants.descendant_url) as "Children"
from  
    f_rl_hierarchy_descendants as descendants,
    f_rl_hierarchy
where
    f_rl_hierarchy.type = 'Module'
and 
    f_rl_hierarchy.url = descendants.descendant_url
group by 
    descendants.url
```

## Assumptions and limitations

The main thing to remember is that the hierarchy descendants views are pre-calculated to 5 levels of hierarchy. This means that where a node is a child of two different parents it will appear twice in any count, once for each parent.  Often this is what you want... but not always!

The maximum number of __parents__ that the `f_rl_hierarchy_parents` view can show for any given node is 100. In Talis Aspire there is no enforced limit. The number of __children__ a node can have is unlimited. If this reasonable default causes you any issues in querying the table, do let us know through our support channels.