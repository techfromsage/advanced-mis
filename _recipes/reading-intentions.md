---
title: Reading Intentions
layout: site
body_class: recipe
keywords: reading lists, student activity, learning analytics
description: Use reading intentions to show whether students are interacting with lists. Find out which students are interacting with which lists for use in retention metrics.
---

## Background
This Advanced MIS recipe looks at how users are using the reading intentions in a tenancy. Looking at reading intentions tells you that the lists are being looked at and used by a student to plan their reading for a course. The sort of questions you might answer are:

* Are students engaging with reading lists?
* Are students using the reading list features to manage their reading?
* What proportion of students might be returning to their lists on a regular basis?
* What time of year do students engage with their lists most?
* Have our marketing efforts resulted in an increase in engagement with reading lists?


## Events

There are a few things to be aware of when working with events in Talis Aspire Advanced MIS. Events are grouped into time windows with a count or sum per time window.  Events are available for the last 30 days with a 1 hour granularity, and for the last 36 months with a 1 day granularity.  Also as Talis add more events into Advanced MIS you may want to check when the first event of a particular class appears, as it may not be available for the full time range you are interested in.

Here are a couple of queries to see how far back event data is available:

```redshift
-- data available since:
select min(time_window) from f_event_timeseries_24hr;
 
-- data available since for specific event:
select min(time_window) from f_event_timeseries_24hr
WHERE event_class = 'annotations.readingIntention';
```

It may be that there are different dates returned. For example, the reading intentions were only added to Advanced MIS from December 2018, but we have events in the database going back to May 2018.


## The Query

This query picks out the dimensions that we are interested in and renames them for clarity in our result table.  It groups the reading intentions by the previous value that was set and then the new value that was chosen.  Why have we done this?

This allows us to see whether people are changing the reading intention only once, or whether they are coming back again and again to update reading intentions to reflect their current plan for reading.

Here is the query

```redshift
SELECT 
  sum(event_count) AS "Intention Changes", 
  dimension_3 AS "Changed From", 
  dimension_2 AS "Changed To"
FROM 
  f_event_timeseries_24hr
WHERE 
  event_class = 'annotations.readingIntention' 
AND 
  dimension_1 = 'demo'
GROUP BY dimension_3, dimension_2
ORDER BY "Intention Changes" DESC;
```

Here are some example results:

```text
intention changes | changed from        | changed to         
------------------+---------------------+--------------------
            13486 | null                | HaveConsumed       
             9171 | null                | PlanToConsume      
             3195 | PlanToConsume       | HaveConsumed       
             2648 | null                | CurrentlyConsuming 
             1286 | CurrentlyConsuming  | HaveConsumed       
             1112 | null                | DecidedNotToConsume
              575 | PlanToConsume       | null               
              507 | PlanToConsume       | CurrentlyConsuming 
... cut for brevity ...
```

We can see that where people have previously set ‘Plan to Consume’ they have later updated this to ‘HaveConsumed’.  


## Assumptions and limitations
When working with data it is always useful to make sure that we understand exactly what is being captured and the circumstances of that capture. This then means we can then understand what the data is telling us and what it can’t tell us.

* Reading intentions are set by a user, and therefore there is no guarantee that a resource has actually been read.
* Where data is set by a user there must always be some doubt about the final figures as users may have selected the wrong value the first time and then later fixed, or just been playing with the feature to see what it did.


## Things to try 

There are a number of ways that the query could be altered to show additional details.  The actual SQL is left as a task for the reader, but you could for example:

* Add a time window date range to the WHERE clause to filter for use in particular semesters
* Pull out the month and year from the time window and include this in your grouping to see how frequency of use of the reading intention changes over the academic year. This might allow you to see an upturn in engagement at a particular point in the year which might coincide with a specific marketing drive or communication to academics or students.


