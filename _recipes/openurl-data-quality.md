---
title: OpenURL Data Quality
layout: site
body_class: recipe
keywords: reading lists, data quality, link quality
description: Find all resources that may have sub-optimum data for use in successful OpenURL links.
---

## Background
This Advanced MIS recipe looks at how you can query the Advanced MIS database to see if there are items which do not have enough metadata to make a reliable Open URL. This can help you to monitor the quality of resources being added into Talis Aspire, and with further querying could help you find departments or academics who might need assistance to improve their bookmarking processes.

## The Query

Here is the query we can use:

```sql
SELECT ...
```

This will give us links to items which may need further editing.

## Assumptions and Limitations

When working with data it is always useful to make sure that we understand exactly what is being captured and the circumstances of that capture. This then means we can then understand what the data is telling us and what it can’t tell us.

In this case it is worth remembering that the Advanced MIS application data used in this query is automatically refreshed once a week. You can see from the _advanced MIS_ page in your tenancy when this was last refreshed.  You can also manually update the data from here.

## Things to try

You might want to use a third party tool to schedule the running of the SQL query and to email the results to you or a team on a periodic basis.

There are a number of ways that the query could be altered to show additional details.  The actual SQL is left as a task for the reader, but you could for example:

* Add a date range to the WHERE clause to filter for items added within the last week.
* Join the list URL to the all lists table to find the hierarchy node associated with this, and then query the hierarchy tables to get more detail on where in the hierarchy the list with the affected item sits.
