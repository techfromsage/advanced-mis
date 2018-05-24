---
layout: site
title: Event Data Overview
body_class: event-data
---

Event data contains information about how users interact with Talis Aspire. For example, who accesses
which reading lists when, how often LTI integrations are utilised, how students are interacting with
the Talis Player, how academics are using the list editing tools.

It can give you a good picture of how your rollout of Talis Aspire is progressing, feeding into management
reporting, or alternatively as a rich source for your student analytics programme.

Event data is streamed into your Advanced MIS data warehouse in near real time. In the future, events
can also be emitted to an [xAPI](https://xapi.com/overview/) or [IMS Caliper](https://www.imsglobal.org/activity/caliper) endpoint of your choosing.

Inside the warehouse, data exists in three forms:

1. Raw events - a single record for each recorded event, with all properties available
2. 1hr sliding window aggregate - a single record per hour for a class of events, grouped by up to 4 pre-defined properties
3. 24hr sliding window aggregate - a single record per 24hr for a class of events, grouped by up to 4 pre-defined properties

Due to the nature of event data, it has the potential to become very large over time. Therefore it is
only kept for a retention period before being dropped, as follows:

* Raw event data is kept for up to 7 days, giving you enough time to export it on a nightly basis if required
* 1hr sliding window aggregated data is kept for 30 days
* 24hr sliding window aggregated data is kept for 36 months
