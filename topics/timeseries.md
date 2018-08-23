---
layout: site
title: "Data dictionary: Timeseries events"
body_class: timeseries
---

Timeseries data differs from the [raw]({{site.baseurl}}/topics/raw.html) data in that it is grouped
by a number of dimensions and then rolled up into a sliding window. This compresses the amount of data
significantly, which is useful for dashboarding and trend analysis.

There are two different tables representing the two sliding window lengths:

1. `f_event_timeseries_1hr` where the event counts and sums are per hour
1. `f_event_timeseries_24hr` where the event counts and sums are per day

Each sliding window has its own data retention policy [which is documented here]({{site.baseurl}}/topics/limits.html).

Both tables share a common schema, with up to four `dimension_*` columns available. The definition of
these columns depends on the `event_class` in question and is documented in detail below.

### All rows

### All rows

| Column | Datatype | Description | Example |
| --- | --- | --- | --- |
| `uuid` | `VARCHAR(64)` | Unique identifier for this event aggregation | |
| `event_class` | `VARCHAR(128` | Class of event - see below for `property_*` field mappings | `list.view` |
| `time_window` | `TIMESTAMP` | Start time of the window | `2018-05-23 15:00:00.0` |
| `arrival_time` | `TIMESTAMP` | Usually the same as `time_window`, but could be +1 period for events that arrive late. | `2018-05-23 15:00:00.0` |
| `dimension_*` | `VARCHAR(128)` | Where `*` is value from `1` through `4`, definitions vary by `event_class` | |
| `event_count` | `INTEGER` | Number of times this event occurred within the window | `5` |
| `event_sum` | `INTEGER` | Some events can also aggregate a sum, which is a running total of a numeric field in the event itself, during the window. Otherwise `0`. The unit of this value will depend on the `event_class`.  | `3215` |


<br/>

### Events with class `login.success`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | SSO Service ID, which is usually equivalent to the tenancy short code | `broadminster` |

<br/>

### Events with class `bookmark.created`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `addToList`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `list.publish`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `player.timer.2`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | SSO Service ID, which is usually equivalent to the tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `event_sum` | The sum in milliseconds of the time spent playing content for the given dimensions and window | `55212` |

<br/>

### Events with class `player.view`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | SSO Service ID, which is usually equivalent to the tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `list.view`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_3` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `list.item.view`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_3` | List item's Globally Unique ID, can be joined to [`public.f_rl_items.item_guid`]({{ site.baseurl }}/topics/items.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `lti.link.followed`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | An identifier matching the course context the LTI launch was made from. Where available, is one of `custom_canvas_course_id`, `custom_knowledge_grouping_code`, `lis_course_offering_sourcedid`, `context_id` from the LTI launch payload, in that order of preference.  | `ABF201` |
| `dimension_3` | The user ID from the LTI payload, either from `lis_person_sourcedid` or `user_id` in that order of preference   | `3` |

<br/>

### Events with class `reviews.actions.status.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | Status the review was set to |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `reviews.actions.setOutcome.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | Outcome the review was set to |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

### Events with class `reviews.actions.assignUser.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | Tenant code | `broadminster` |
| `dimension_2` | The Globally Unique ID of the user whom the review was assigned to, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | The Globally Unique ID of the user assigning the review, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>

