---
title: List Owner Notifications
layout: site
body_class: recipe
keywords: reading lists, academic engagement, notifications
description: Get user details to help build notification emails or contact lists for list owners
---

## Background

Sometimes you want to find all the list owners for a set of lists so that you can notify them for some reason. Possible reasons include:

* Notify that their list has rolled over and is ready to update.
* Notify that their list has not been updated for some time.
* Notify that their list has been published.

## The Data

Reading lists can have a list owner assigned to them. This is a user who must already exist within Talis Aspire.

We'll be joining the `f_rl_lists` table to the `f_rl_users` table using the `owner_url` which is a unique reference to that user in Talis Aspire.

## The Query

Here is the query

```redshift
SELECT
    f_rl_lists.title,
    f_rl_lists.url,
    f_rl_users.email,
    f_rl_users.first_name,
    f_rl_users.surname
FROM
    f_rl_lists,
    f_rl_users
WHERE
    f_rl_lists.owner_url = f_rl_users.profile_url
```

This is the basic form of the query which joins the `f_rl_lists` and `f_rl_users` tables together to provide a view of the information you'd need to generate a mail merge type email.

To cater for some of the use cases outlined at the top of this recipe, the following `WHERE` clauses could be used.

### Only lists in a particular time period

You probably don't want to know about all list owners since the year dot, so reporting on particular time periods may be useful.

```redshift
SELECT
    f_rl_lists.title,
    f_rl_lists.url,
    f_rl_users.email,
    f_rl_users.first_name,
    f_rl_users.surname
FROM
    f_rl_lists,
    f_rl_users
WHERE
    f_rl_lists.time_period = 'Year 2019/20'
AND
    f_rl_lists.owner_url = f_rl_users.profile_url
```

### Only lists older than some date

In this query, rather than just getting all lists, we get only the lists that have a particular time period but have not been updated since a target date. 

```redshift
SELECT
    f_rl_lists.title,
    f_rl_lists.url,
    f_rl_users.email,
    f_rl_users.first_name,
    f_rl_users.surname
FROM
    f_rl_lists,
    f_rl_users
WHERE
    f_rl_lists.time_period = 'Year 2019/20'
AND
    f_rl_lists.last_updated <= '2018-09-01'::date 
AND
    f_rl_lists.owner_url = f_rl_users.profile_url
```

### All lists published but with unpublished changes since some date

In this query we first limit to things which have been updated since a target date but which have a status of published with changes.  They might need reminding that their lists need publishing if they are happy with their changes! 

```redshift
SELECT
    f_rl_lists.title,
    f_rl_lists.url,
    f_rl_users.email,
    f_rl_users.first_name,
    f_rl_users.surname
FROM
    f_rl_lists,
    f_rl_users
WHERE
    f_rl_lists.status = 'Published with changes'
AND
    f_rl_lists.last_updated >= '2018-09-01'::date 
AND
    f_rl_lists.owner_url = f_rl_users.profile_url
```

## Assumptions and limitations

Your lists would need to have a list owner for these queries to make sense.  If you are in the habit of having list owners who are not academic staff, then this may not be an approach that makes so much sense!

## Things to try 

### Send Scheduled Reports
Take the output of these queries and use them to build an email in a tool that allows you to then send the email on your behalf.  Add a scheduling component to the mix and you could have a notification pipeline which looks like:

* At a defined frequency (once a week, once a month, termly, etc)
* Run a query to get the users of interest in that time. You could either pass in a date to the query, or you could use a query that automatically generates a date using something like `date_trunc('week', current_timestamp - interval '1 week')`
* Pass the output of the query into a function that builds the email output
* Send the email output to an email service for delivery.

Exactly which tools that you choose to use will vary according to those you are comfortable with. If you are interested in doing this it might be worth asking the Talis Developer Community, or [raising a support ticket](https://support.talis.com).

Here are some links to ways to do this sort of thing in popular tools.

* In Power BI you can [subscribe to reports](https://docs.microsoft.com/en-us/power-bi/service-report-subscribe)
* In Tableau, you can also [scheudle and subscribe to reports](https://www.tableau.com/learn/tutorials/on-demand/understanding-schedules-and-subscriptions)
 