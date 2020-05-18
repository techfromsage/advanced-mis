---
title: Create your own tables
layout: site
body_class: recipe
keywords: data storage, data analysis, create tables
description: Strategies for adding custom data tables into your Advanced MIS instance.
---

## Background 

There are a number of occasions when adding your own data into Advanced MIS makes sense. Advanced MIS allows you to create your own data tables within the Data Warehouse.

You might want to:

- Keep track of aggregation query results over time: 
- Monitor trends from the weekly application data snapshot.
- Build custom datasets that help you group queries
- Build a mapping table for linking two sets of data.
- Bringing data from external sources into the same place for easier querying

This article sets out a number of useful approaches or questions where creating your own tables could be useful.

## Persistent trends

Basically counts over time. Some things in the application data are transient, but don't necessarily warrant or generate events that can be counted.

### Some example questions

- Count the number of draft lists each week.
    - Might want to track when in the year there are more drafts.
    - or to track the number of lists which have been published each week if you rollover to draft.
- Tracking numbers of items without importance
    - might be part of a campaign to reduce the number through raising awareness.
- Tracking resource type used in lists over time.
- Summarizing events that have happened for things linked to the hierarchy.
- Extracting information from `f_events_raw_daily` that you would like to keep for longer than the age limit on that view. 

## Method overview

- Create a table
- With a self determined frequency capture something into the table
- Report on the rows

### Create a table

This is a one time operation. As well as the fields related to counting that you want to keep, you will also want to ensure that you are capturing a time component. You would want to consider the following.

- Date/Time that the row was added. This is useful for checking that the scheduled process ran as expected.
- Date/Time that the row is reporting on.

The design of the table —the columns and their types— will be up to you but would need to support whatever report you wanted to run.

An example create table syntax might look like this. We are going to track the status of lists in each time period over time to see how the flow of list statuses looks over the year.

```redshift
CREATE TABLE IF NOT EXISTS list_status_trends (
    date_calculated DATE not null,
    date_reported DATE not null,
    published_count VARCHAR(255),
    published_with_changes_count VARCHAR(255),
    draft_count VARCHAR(255),
    archived_count VARCHAR(255),
    time_period VARCHAR(255)
)
```

You would then run a task in some program with scheduling ability to insert some data into this table.

### Insert data

We're going to capture the data weekly. The weekly automatic refresh of the Advanced MIS application data happens on a Sunday, so we would suggest that you run aggregations on a Monday.

The insert query might look like the example given here. The order of the fields should match the order they were created in.

```redshift
INSERT INTO list_status_trends (
SELECT
    getdate() as date_calculated,
    date_trunc('week', getdate()) as date_reported,
    count(CASE WHEN status='Published' then 1 end) as published_count,
    count(CASE WHEN status='Published With Unpublished Changes' then 1 end) as published_with_changes_count,
    count(CASE WHEN status='Draft' then 1 end) as draft_count,
    count(CASE WHEN status='Archived' then 1 end) as archived_count,
    time_period
from f_rl_lists
group by time_period
)
```

### Scheduling

You would need a scheduling tool to allow you to run this query on a regular basis. Some examples might be:

- On a *nix machine you can use the cron to run a command on a regular basis. the `psql` tool is a command line client for postgres databases.
- On windows you can use the Task Scheduler to run tasks in a power shell. You can use ODBC commands to connect to Advanced MIS and run queries.
- [nodered.org](http://nodered.org) is a tool for orchestrating and scheduling workflows that interact with many different systems. There are connectors available for scheduling and for connecting to postgres databases.

### Access your captured trend data

You can use normal Business Intelligence tools or scripts to pull the data back, or include it in another query, just like you would any other data in Advanced MIS.

