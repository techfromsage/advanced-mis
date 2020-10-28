---
title: List Activity
layout: site
body_class: recipe
keywords: analytics, stats, user behaviour,
description: Working with list events to understand list activity
---

## Background

Sometimes you might want to know about how people are finding the lists. The sort of questions you might ask are:

* Are students using the LTI integration to get to lists?
* Are lists or sections being linked to with the LTI integration?
* When are lists most heavily used in the academic year?
* When are lists most heavily edited in the academic year?
* Which students are viewing which lists?
* Are students interacting with the online systems that are being made available to support COVID course delivery adjustments?
* Which items on a list have most interactions?
* Which links to external content are most popular?

## Queries

It is useful to know how much data you have available to you And you'll have different amounts of data depending on which timeseries tables you are looking in. This query finds the earliest and latest date an event was seen for each event_class.

```redshift
-- min and max dates for each event
select event_class, min(time_window), max(time_window)
from f_event_timeseries_24hr
group by event_class;
```

Sometimes you want to know how often an event happened over time. This query will give you the number of list views each month split over each of the list view modes. This will give you up to 4 data series that you could plot on a line chart to compare student views against academic edits to see when peak periods were for both of those user types.

```redshift
-- list view mode over time
select 
    split_part(dimension_3, ':', 1) as view_mode,
    sum(event_count), 
    date_part('YEAR', time_window) as year,
    date_part('MONTH', time_window) as month
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
group by view_mode, year, month
order by view_mode, year, month;
```

Maybe you want to know whether LTI or direct requests are most prevalent. Here we use the second part of dimension_3 to inspect the method used for the request into Talis Aspire. 

```redshift
select
    split_part(dimension_3, ':', 2) as view_method,
    sum(event_count), 
    date_part('YEAR', time_window) as year,
    date_part('MONTH', time_window) as month    
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
group by view_method, year, month
order by year, month;
```

Maybe you want to know whether sections or lists are the most popular when creating an LTI link in the VLE.

```redshift
select
    split_part(dimension_2, ':', 1) as entry_point,
    sum(event_count) 
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
and split_part(dimension_3, ':', 2) = 'lti' 
group by entry_point;
```

Maybe you are building a system to give a personal tutor a view of what a student is interacting with. Or you want to see which students are not engaging with online systems.

```redshift
select distinct dimension_4, dimension_1
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
order by dimension_4;
```

Beyond the list itself, there is a wealth of detail about how individuals are using the lists. Maybe you want to know which item across all lists is clicked on the most?

```redshift
select dimension_2, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.click'
group by dimension_2
order by sum(event_count) DESC
limit 10;
```

Or maybe you want to know which list features, such as online resource links, bookstore links, catalogue links etc are used the most when leaving the list?

```redshift
select split_part(dimension_3, ':', 2) as interaction_type, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.click'
group by interaction_type;
```

Or maybe you are only interested in external links and which destinations are proving the most popular?

```redshift
select dimension_4, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.external_link.click'
group by dimension_4
```

## Assumptions

When working with user ids in `dimension_4` you will likely want to link this back to a user in your own systems or data warehouse. you can often use the `user.identifed` event to build a set of mapping data that will enable you to link an ID from the SAML conversation, with the internal `talis_guid` used to identify users in Talis Aspire.

## Taking it further

These example queries just get data from the event. The identifiers in the dimensions are intended for you to use in JOINs with the `f_rl_items` and `f_rl_lists` views to get things like list titles and so on. You can then also bring in other information like list status, time periods or importances to further filter and group your view of the data.

When working with list events such as `list.entry_point` or `list.item.click` you can split `dimension_3` into pieces to use each piece as a different grouping or filtering field.