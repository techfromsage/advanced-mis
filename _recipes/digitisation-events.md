---
title: Digitisation View Events
layout: site
body_class: recipe
keywords: reading lists, student activity, copyright clearance, digitisations
description: A look at events which can be used to track digitisation views.
---

## Background

You are trying to report on how often students are viewing digitisations.  You have seen that there are a number of different events that could capture that type of activity and you need some clarification. If this is you, this recipe is the one you were looking for!

Questions you might be looking to answer:

* How many of our scanned copyright clearance requests are being looked at?
* How many digitisation views are coming from reading lists?

## The event classes

This summary shows which events are triggered under the given scenarios.  The scenarios are elaborated on in the detail section of this recipe.

* A click on a list to a view online button that points at a digitisation will record the following events.
  * An `event_class` of `list.item.click` that is categorized in `dimension_3` as an `<view_mode>:external_link:view_online_button` click. This reflects the **location** in the list that the user was clicking from and not necessarily the type of link that was clicked.
  * An `event_class` of `list.item.external_link.click` where the click is labelled as `digitisation`. This reflects the **type** of external link clicked, and not the location of the click in the item.
* A view of a digitisation in the Talis Player will trigger the following event. This is not guaranteed to have been triggered from a reading list.
  * An `event_class` of  `digitisation.view`

## The detail

It is important to remember that the process of accessing a digitisation may go via a reading list, or may be via an external link direct to the digitisation. Additionally, there are 2 locations in a reading list that could point to the digitisation and the student may click either of them.

This means you can never expect the number of digitisation views in the Talis Player, and the number of digitisation clicks from a reading list to be exactly the same.

### Did a student click from the list?

There are two queries that will determine if a student used the reading list to get to digitisations.  

This first query detects whether a user clicked on the digitisation link labelled 'Digital copy' that shows in the expanded item details in the library availability section.  

**Important**: This is **not** a click to a digitisation that appeared in the view online button location of the item, even though the actual button next to 'Digital copy' is labelled 'View Online'.

![showing the location of digital copy view online button]({{ site.baseurl }}/images/recipes/digitisation-events/digital-copy-link-location.png)

```redshift
-- clicks on an item to the 'Digital Copy' link
select 
    sum(event_count), 
    date_part('YEAR', time_window) as Year, 
    date_part('MONTH', time_window) as Month
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.item.click'
and dimension_3 like '%:external_link:content'
group by Year, Month
order by Year, Month ASC
;
```

A student click on the 'View Online' button located in the collapsed item details will always be categorized with a `dimension_3` like `view:external_link:view_online_button`. However, you won't know what type of link was clicked, just that it was clicked in that location.

![Showing the location of the view online button]({{ site.baseurl }}/images/recipes/digitisation-events/View-online-button-location.png)

In order to look at what **type** of links are clicked from your reading lists - and disregarding the location of the click in the item display - you could use a query that uses the `list.item.external_link.click` event class.

This query will report on all clicks of a link that took a user away from the reading list. It will report the domain and type of link as categorized by Talis.

```redshift
select 
    sum(event_count), 
    date_part('YEAR', time_window) as Year, 
    date_part('MONTH', time_window) as Month
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.item.external_link.click'
group by Year, Month
order by Year, Month ASC
;
```

The two queries in this section are different ways of counting the click events and so may not align to the same figure for the reasons given about location of link verses type of link.

### Did students view digitisations?

This query will identify if a student has viewed a digitisation in the Talis Player. This is the best way to count how many times a digitisation has been viewed. It should be the preferred statistic for measuring levels of digitisation usage over time.

```redshift
select 
    sum(event_count), 
    date_part('YEAR', time_window) as Year, 
    date_part('MONTH', time_window) as Month
from f_event_timeseries_24hr_last_3_months
where event_class = 'digitisation.view'
group by Year, Month
order by Year, Month ASC
;
```

## Assumptions and limitations

* Do not assume that a click on the list which takes a user to the digitisation results in a view of the digitisation.  A public list may have users clicking on the link that don't have a university account and so can't access the digitisation itself.
* The event classes discussed in this recipe relate to different ways of counting the click events and so may not align to the same figure for the reasons given about the location of link in the item display being a separate concept to the type of link.

## Things to try

* Adjust the date ranges being reported on by either adding a where clause on the `time_window` or using one of the alternative timeseries views which contain events further back in time.
