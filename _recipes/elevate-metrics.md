---
title: Talis Elevate Metrics
layout: site
body_class: recipe
keywords: elevate, metrics, dashboards
description: Some high level Talis Elevate metrics for use in a dashboard
---

## Background

You have some key things that you want to track at a high level so that you can get a snapshot of how performance has been and demonstrate to the university the levels of engagement that you are having.

In this recipe we will show and explain some SQL that you can use to generate some high level metrics.

After using the queries in this recipe you will be able to add some headline metrics to a dashboard.

## The metrics

These are the metrics we will explore. We'll detail what it is we are looking for in the data that allows us to tell these things. We'll also explain what the metrics might mean and why you might be interested in them.

- [Background](#background)
- [The metrics](#the-metrics)
  - [Number of resources in use](#number-of-resources-in-use)
  - [Views on resources](#views-on-resources)
  - [Class comments and replies](#class-comments-and-replies)
  - [Personal notes](#personal-notes)
  - [Hours spent in Talis Elevate resources](#hours-spent-in-talis-elevate-resources)
  - [Number of academics using Talis Elevate](#number-of-academics-using-talis-elevate)

### Number of resources in use

You might be interested to see how many Talis Elevate resources are being used in teaching.
This can give an indication of volume of uptake by academics as only academic users can create resources.

You might use date ranges to limit to a particular academic year or to a period of time when you were running a pilot with Talis Elevate.

```redshift
select count(distinct resource_id) as num_resources
from f_elevate_resources
where date_created between '2022-01-01'::date and '2022-12-31'::date
```

Possible variations:

- You might group the results by the `uploaded_by` column of `f_elevate_resources` which would give you a count of resources uploaded by each academic.

### Views on resources

The number of views on a resource in a defined period.

Views are defined as any view of a resource by a user who is not a contributor. This is essentially student views of a resource.

```redshift
select sum(event_count) as num_views
from f_event_timeseries_24hr
where event_class = 'player.view' 
and time_window between '2022-01-01'::date and '2022-12-31'::date
```

### Class comments and replies

Class comments are public annotations that are visible to the whole class.  The events being counted here are just for students.  We are also counting replies to comments as these also indicate the overall level of student interaction on a resource.

```redshift
select sum(event_count) as public_comments
from f_event_timeseries_24hr
where event_class in (
    'player.annotate.createannotation.classcomment', 
    'player.annotate.createannotation.anonymouscomment',
    'player.annotate.createreply'
    ) 
and time_window between '2022-01-01'::date and '2022-12-31'::date
```

Possible variations:

- You may want to find which student has made the most comments. You can use `dimension_4` (the user's id in Talis Elevate) to group these results.

### Personal notes

Personal notes are visible only to students and are used for personal study notes that they might not want to share with the whole class.

```redshift
select sum(event_count) as personal_notes
from f_event_timeseries_24hr
where event_class in ('player.annotate.createannotation.personalnote') 
and time_window between '2022-01-01'::date and '2022-12-31'::date
```

Possible variations:

- You may want to find which student has used personal notes the most. You can use `dimension_4` (the user's id in Talis Elevate) to group these results.

### Hours spent in Talis Elevate resources

The time a student spends in the Talis Elevate Player is tracked. This is active time where the student is scrolling the screen or moving their mouse around the document.  We don't count time when the student may have wandered off to make a cuppa.

```redshift
select round(sum(event_sum)/1000/60/60::float,2) as hours
from f_event_timeseries_24hr
where event_class in ('player.timer.2')
and time_window between '2022-01-01'::date and '2022-12-31'::date
```

Possible variations:

- You may be more interested in minutes than hours and so could adjust the sum to not divide by the additional 60 minutes to get hours.
- You may want to find which student has spent the most time in resources. You can use `dimension_4` (the user's id in Talis Elevate) to group these results and turn it into a list of students spending most time in resources.  You could use this to identify users to approach for focus groups or surveys.

### Number of academics using Talis Elevate

There are different definitions of 'using' and you need to be careful how you are defining this to understand what the data is telling you.

Use could be defined as a resource having been viewed by a student, therefore it must have been uploaded at some point, but not necessarily in the reporting period. This is different to counting use as having uploaded a document as that may have been uploaded in a previous reporting period, but still have use in this one.

In both cases, in order to count the academics we need to be looking at the resources that were used in order to work out who uploaded them.

Here we give two variations of a query which use these two definitions of `using Talis Elevate`.

```redshift
-- Usage defined as a view on a document which was uploaded by an academic.

select count(distinct r.uploaded_by) as num_academics_with_views_on_their_resources
from 
    f_event_timeseries_24hr e, 
    f_elevate_resources r
where event_class = 'player.view'
and time_window between '2022-01-01'::date and '2022-12-31'::date
and e.dimension_3 = r.resource_id
```

```redshift
-- Usage defined as uploading a document during the reporting period.

select count(distinct r.uploaded_by) as num_academics_uploading
from f_elevate_users u, f_elevate_resources r
where r.date_created between '2021-09-01'::date and '2022-12-31'::date
and u.role = 'academic'
and u.talis_guid = r.uploaded_by
group by u.role
```

Possible variations:

- You might consider yet another alternative definition of active usage as being academics that are encouraging comments on their uploaded documents.  You could adjust the first query to use the `player.annotate.createannotation` event class (or its sub classes for the different annotation types) to only look at those academics with student interactions on their resources.
- You could pull additional detail from the `f_elevate_resources` view to allow further grouping of usage - for example, grouping by `format` (video, document, etc.) would tell you which academics were favouring which resource formats, or which formats students found most useful.
