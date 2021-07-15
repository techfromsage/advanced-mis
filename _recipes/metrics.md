---
title: Metrics
layout: site
body_class: recipe
keywords: reading lists, metrics, dashboards
description: Some high level metrics for use in a dashboard
---

## Background

You have some key things that you want to track at a high level so that you can get a snapshot of how performance has been and demonstrate to the university the levels of engagement that you are having.

In this recipe we will show and explain some SQL that you can use to generate some high level metrics.

After using the queries in this recipe you will be able to add some headline metrics to a dashboard.

## The metrics

These are the metrics we will explore. We'll detail what it is we are looking for in the data that allows us to tell these things. We'll also explain what the metrics might mean and why you might be interested in them.

- [Number of student views of a lists](#number-of-student-views-of-lists)
- [Interactions with a list by a student](#staff-and-student-interactions-with-lists)
- [Read Interactions with a list by staff](#staff-and-student-interactions-with-lists)
- [Edits of a list by academics](#edits-of-a-list-by-academics-or-library-staff)
- [Edits of a list by librarby staff](#edits-of-a-list-by-academics-or-library-staff)
- [Number of published lists](#number-of-published-lists)
- [Number of visists to lists that come via LTI](#number-of-visits-to-lists-via-lti)
- [Number of clicks on external resources](#number-of-clicks-on-external-resources)
- [Number of students using reading intentions.](#number-of-students-using-reading-intentions)

### Number of student views of lists

When understanding the engagement of students with their reading lists, the fundamental question is "Have they looked at their list?"

This query will establish just how many views of lists there are. A View is defined as being any time a list was loaded for view by a user who is not logged in, or is logged in without holding any special permissions to edit lists. A list view is counted whenever someone follows a link to an item, section or complete list, as they have viewed some or all of the content on that list.

You could take this further by also counting how many unique student students were viewing lists - but you will need to take into account whether the student was likely to be logged in before you can count them.

```redshift
-- list entry point number of hits count
select
	split_part(dimension_3, ':', 1) as view_mode,
	sum(event_count)
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.entry_point'
and view_mode = 'view'
group by view_mode
order by view_mode;
```

See the [`list.entry_point` event description]({{ site.baseurl }}/topics/timeseries.html#list-entry_point) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.

### Staff and Student Interactions with lists

An interaction is basically any click on the list that in some way interacts with the list. Typical examples might be clicking on external links, changing a reading intention, using the share item link, adding to bookmarks, toggling the expanded detail display for an item, and so on.

For Staff interactions this does __not__ include editing lists.

```redshift
-- item clicks by view mode
with students as (
      select
        split_part(dimension_3, ':', 1) as view_mode,
        sum(event_count) as student_interactions
      from f_event_timeseries_24hr_last_3_months
      where event_class = 'list.item.click'
      and view_mode = 'view'
      group by view_mode
    ),
staff as (
      select
        split_part(dimension_3, ':', 1) as view_mode,
        sum(event_count) as staff_interactions
      from f_event_timeseries_24hr_last_3_months
      where event_class = 'list.item.click'
      and view_mode in ('view_as_student', 'view_draft', 'edit')
      group by view_mode
    )
select
    sum(students.student_interactions) as student_interctions,
    sum(staff.staff_interactions) as staff_interactions
from students, staff;
```

See the [`list.item.click` event description]({{ site.baseurl }}/topics/timeseries.html#list-item-click) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.
- You might want to be more specific about which click actions you are counting. You can filter on `dimension_3` to only include click events you are interested in.
- It's not a long stretch to modify this query to include list level detail if you are wanting to find which lists had the most interactions.  You would need to include `dimension_1` (the list identifier) in both 'with' queries and modify the last select statement to also group the results by `dimension_1` 

### Edits of a list by Academics or Library Staff

We track what edits are made to a list so that you can see how often people are making changes to their lists and when in the year is popular.

This query uses some data about the user's job role which is found on the user's profile and which is editable by them.  This means that there may be inaccuracies here if people selected a role different to what you might have expected.  However, you can play with the different values to see if the proportions are roughly as you expect and to identify any outliers.  It is also important to note that these job roles do __not__ confer any special privileges on the user, you would have to look at the `aspire_role` column to determine those... but then you wouldn't be able to differentiate between library staff and academics so easily.

The `job_role` will contain some specific values.  We've commented out some values in this query so that you can see what we have included and excluded and to make it simple for you to tweak to suit your local preferences.

To report on library staff edits, just select a different set of job roles in the first query.

```redshift
with academic_users as (
    select
        talis_guid
    from f_rl_users
    where job_role in (
        -- 'an undergraduate',
        'an academic',
        -- 'a postgraduate',
        'a lecturer',
        'a teacher',
        -- 'non-teaching faculty',
        'a researcher',
        'a learning technologist',
        -- 'a librarian',
        'educational support'
    )
)
select
    sum(event_count) as num_edits
from
    f_event_timeseries_24hr_last_3_months events,
    academic_users
where event_class = 'list.edit'
and events.dimension_4 = academic_users.talis_guid
```
See the [`list.edit` event description]({{ site.baseurl }}/topics/timeseries.html#list-edit) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.
- You might want to be more specific about which edit actions you are counting. You can filter on `dimension_2` to only include click events you are interested in.
- It's not a long stretch to modify this query to include list level detail if you are wanting to find which lists had the most interactions.  You would need to include `dimension_3` (the list identifier) in both 'with' queries and modify the last select statement to also group the results by `dimension_3` 

### Number of published lists

In Talis Aspire there are a number of states that the list can appear in. These are reported in the `status` column of `f_rl_lists`.  When counting published lists it is important to remember that some will be reported as published with unpublished changes. This is still a published list which students can view.

```redshift
select
    count(url) as num_lists
from f_rl_lists
where status in ('Published', 'Published with Unpublished Changes');
```

Possible variations:

- Depending on your local practice, the number of lists that are published may span several time periods. You may want to add additional filters to cater for this.
- Depending on your local practice, you may want to take into account hierarchy nodes that the lists are attached to and filter in/out sets of modules to get totals for each department, faculty, school, etc.

### Number of visits to lists via LTI

The integration between Talis Aspire and your learning management system is vital for ensuring that students can easily find their reading list.

This metric shows how many visits to lists come via LTI and therefore demonstrates how valuable that integration is.

```redshift
-- list entry point number of hits count by LTI
select
	split_part(dimension_3, ':', 2) as view_mode,
	sum(event_count)
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.entry_point'
and view_mode = 'lti'
group by view_mode;
```

See the [`list.entry_point` event description]({{ site.baseurl }}/topics/timeseries.html#list-entry_point) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.
- The view mode might also be `direct`. To see the proportion of visits that are direct compared to LTI, simply remove the filter for `view_mode` and you'll get a summary for both routes.

### Number of clicks on external resources

In this age of electronic content and making resources available for students to read online, knowing how well the resources are being used is key.

If you imagine the path to reading a resource and gaining understanding as a funnel, at the top (widest) part of the funnel is the initial discovery of the resource on the reading list. Below that is the intention to click on the link and go and read the resource, below that the actual reading of the resource.

Talis Aspire Reading Lists allows you to see what is happening at the top of the funnel. This query example gives a count of the number of clicks on external resources. These are things such as web address links, library catalogue links, bookstore links, open url, view online button and so on.

```redshift
select
    sum(event_count) as external_link_clicks
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.item.click'
and split_part(dimension_3, ':', 2) = 'external_link'
```

See the [`list.item.click` event description]({{ site.baseurl }}/topics/timeseries.html#list-item-click) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.
- You might want to be more specific about which external link click actions you are counting. You can filter on the third part of `dimension_3` to only include click events you are interested in.
- It's not a long stretch to modify this query to include list level detail if you are wanting to find which lists had the most interactions.  You would need to include `dimension_1` (the list identifier) in both 'with' queries and modify the last select statement to also group the results by `dimension_1` 
- There is a user dimension that we can also talk about. For example, you could count all the users who have clicked on the external resource and divide that by the number of clicks - or look at the distribution of clicks across users to see who engages students are in the content proffered.

### Number of students using reading intentions

Talis Aspire reading lists allows students to manage their reading by marking things as _will read_, _reading_, _have read_ and _won't read_. This query allows you to see how often students are using these features.

```redshift
select
    sum(event_count) as reading_intention_clicks
from f_event_timeseries_24hr_last_3_months
where event_class = 'list.item.click'
and split_part(dimension_3, ':', 2) = 'reading_intention'
```

See the [`list.item.click` event description]({{ site.baseurl }}/topics/timeseries.html#list-item-click) for more about this event.

Possible variations:

- You might want to choose a different date range using `time_window` from `f_event_timeseries_24hr`, in our example the last 90 days of stats from _today_ are visible in the `f_events_timeseries_24hr_last_3_months` view.
- It's not a long stretch to modify this query to include list level detail if you are wanting to find which lists had the most interactions.  You would need to include `dimension_1` (the list identifier) in both 'with' queries and modify the last select statement to also group the results by `dimension_1`
