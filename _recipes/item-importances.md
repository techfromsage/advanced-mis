---
title: Item Importances
layout: site
body_class: recipe
keywords: reading lists, Item Importances
description: Explore how importances are used in your reading lists.
---

## Background

Items on lists can be given a level of importance. This is used to indicate to students that they may wish to pay more or less attention to certain works.

Libraries often use the item importance in their purchase decision making processes and so want to track items which have importances and those that don't

### Questions you might be asking

* How many items don't have importances?
* Which departments are not using importances?
* Do _Essential Reading_ items get more views than _Further Reading_ items?
* When we are reviewing lists is it worth paying attention to items marked as _Background Reading_?
* Are academics flagging everything as _Essential_?

## Events

This recipe includes some queries that use events.

There are a few things to be aware of when working with events in Talis Aspire Advanced MIS. Events are grouped into time windows with a count or sum per time window.  Events are available for the last 30 days with a 1 hour granularity, and for the last 36 months with a 1 day granularity.  Also as Talis add more events into Advanced MIS you may want to check when the first event of a particular class appears, as it may not be available for the full time range you are interested in.

Here are a couple of queries to see how far back event data is available:

```redshift
-- data available since:
select min(time_window) from f_event_timeseries_24hr;

-- data available since for specific event:
select min(time_window) from f_event_timeseries_24hr
WHERE event_class = 'list.item.external_link.click';
```

It may be that there are different dates returned. For example, the reading intentions were only added to Advanced MIS from December 2018, but we have events in the database going back to May 2018.

## A Basic Query

We start with a simple query to find out how many items do not have an importance set.

```redshift
-- count the items
select count(item_guid)
from f_rl_items
where importance = '';

-- which items are they?
select item_url
from f_rl_items
where importance = '';
```

We could then look to see how many items there are for each importance type:

```redshift
select importance, count(importance)
from f_rl_items
group by importance;
```
Which gives something like

<table border="1" style="border-collapse:collapse">
<tr><th>importance</th><th>count</th></tr>
<tr><td></td><td>7863</td></tr>
<tr><td>Recommended</td><td>4211</td></tr>
<tr><td>Suggested for student purchase</td><td>700</td></tr>
<tr><td>Essential</td><td>2289</td></tr>
<tr><td>Optional</td><td>1981</td></tr>
</table>

## Linking importances to the hierarchy

We need to know that lists are linked to the hierarchy, and items are linked to lists.
We need to also know about the hierarchy, for example that there are schools or departments which have modules,
and it is these modules which are linked to lists

```redshift
select
       hierarchy.url,
       items.importance,
       count(items.importance)
from
     f_rl_items items,
     f_rl_hierarchy_descendants hierarchy,
     f_rl_lists lists
where
      -- join lists to the hierarchy
      lists.hierarchy_url = hierarchy.url
  and
      -- join lists to their items
      lists.list_guid = items.list_guid
  and
      -- look for only nodes in the hierarchy that have a descendant of type 'Module'
      hierarchy.descendant_url
          in (
              select url
              from f_rl_hierarchy
              where type = 'Module'
              )
group by
         hierarchy.url,
         items.importance
order by
         hierarchy.url,
         items.importance
;
```

This might give us something like this which can then be processed into a chart

<table border="1" style="border-collapse:collapse">
<tr><th>url</th><th>importance</th><th>count</th></tr>
<tr><td>http://demo.talisaspire.com/courses/buseco</td><td></td><td>1</td></tr>
<tr><td>http://demo.talisaspire.com/courses/buseco</td><td>Essential</td><td>3</td></tr>
<tr><td>http://demo.talisaspire.com/courses/buseco</td><td>Optional</td><td>2</td></tr>
<tr><td>http://demo.talisaspire.com/courses/buseco</td><td>Recommended</td><td>5</td></tr>
<tr><td>http://demo.talisaspire.com/courses/buseco</td><td>Suggested for student purchase</td><td>1</td></tr>
<tr><td>http://demo.talisaspire.com/courses/gol001</td><td></td><td>2</td></tr>
<tr><td>http://demo.talisaspire.com/courses/hum110</td><td></td><td>4</td></tr>
<tr><td>http://demo.talisaspire.com/courses/hum110</td><td>Essential</td><td>1</td></tr>
<tr><td>http://demo.talisaspire.com/courses/hum110</td><td>Optional</td><td>1</td></tr>
<tr><td>http://demo.talisaspire.com/departments/acc001</td><td></td><td>12</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td></td><td>198</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td>Essential</td><td>264</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td>Journals</td><td>231</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td>Optional</td><td>33</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td>Recommended</td><td>495</td></tr>
<tr><td>http://demo.talisaspire.com/departments/man01</td><td>Suggested for student purchase</td><td>132</td></tr>
<tr><td>http://demo.talisaspire.com/modules/inv101</td><td></td><td>27</td></tr>
<tr><td>http://demo.talisaspire.com/modules/inv101</td><td>Suggested for student purchase</td><td>4</td></tr>
<tr><td>http://demo.talisaspire.com/schools/bs02</td><td></td><td>735</td></tr>
<tr><td>http://demo.talisaspire.com/schools/bs02</td><td>Suggested for student purchase</td><td>49</td></tr>
</table>

## Assumptions and limitations

* It may be that importances are not consistently added to items.
* It may be that items in previous time periods did not have importances set as rigorously,
or that the definitions of what the importance means have changed over time, or between departments.

## Things to try

You could also now link in the `f_event_timeseries_24hr` table, looking for `list.item.view` events linked to the items that have importances.
