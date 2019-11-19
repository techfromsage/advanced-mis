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
<a name="reading-intention"></a>

### Events with class `annotations.readingIntention`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The new reading intention   | `CurrentlyConsuming` |
| `dimension_3` | If applicable, the previous reading intention | `HaveConsumed` |

<br/>
<a name="login-success"></a>

### Events with class `login.success`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | SSO Service ID, which is usually equivalent to the tenancy short code | `broadminster` |

<br/>
<a name="bookmark-created"></a>

### Events with class `bookmark.created`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="addToList"></a>

### Events with class `addToList`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-publish"></a>

### Events with class `list.publish`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `dimension_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html). | `0B9954BA-8E4D-69DC-422F-AAB2A3F74568` |

<br/>
<a name="player-timer-2"></a>

### Events with class `player.timer.2`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `event_sum` | The sum in milliseconds of the time spent playing content for the given dimensions and window | `55212` |

<br/>
<a name="player-timer-2-contributors"></a>

### Events with class `player.timer.2.contributors`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `event_sum` | The sum in milliseconds of the time spent playing content for the given dimensions and window | `55212` |

<br/>
<a name="player-view"></a>

### Events with class `player.view`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="player-view-contributors"></a>

### Events with class `player.view.contributors`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="player-annotate-createannotation"></a>

### Events with class `player.annotate.createannotation`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="player-annotate-createreply"></a>

### Events with class `player.annotate.createreply`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="player-download"></a>

### Events with class `player.download`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The module ID relating to the content being played |
| `dimension_3` | The resource ID relating to the content being played |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-entry_point"></a>

### Events with class `list.entry_point`
Only available when using new list view and new list edit from November 2019 onwards

| Column | Description | Examples |
| --- | --- | --- |
| `dimension_1` | The list's Globally Unique ID, namespaced by the tenancy short code | `broadminster:DE53F159-8AE9-F8D4-6518-263DED7D56E9` | 
| `dimension_2` | The user's entry point to the list - could be a item, section or the whole list. The ID of the entry point is namespaced with `item`, `section` or `list` |  `list:DE53F159-8AE9-F8D4-6518-263DED7D56E9`<br/> or <br/>`item:FA53F159-1DG9-G2D4-7812-163AED7D56R9`<br/> or <br/>`section:AA93F159-1AG9-A2D8-7812-163AED7A58A1` |
| `dimension_3` | The user's mode (either `view`, `view_draft`, `edit` or `view_as_student`, the latter being an editor viewing the list as a student) combined with the launch method (either `direct` or `lti`) | `view:lti` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-view"></a>

### Events with class `list.view`

<span class="deprecated">DEPRECATED</span> instead, see `list.entry_point`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_3` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-item-click"></a>

### Events with class `list.item.click`

Only available when using new list view and new list edit from November 2019 onwards

| Column | Description | Examples |
| --- | --- | --- |
| `dimension_1` | The list's Globally Unique ID, namespaced by the tenancy short code | `broadminster:DE53F159-8AE9-F8D4-6518-263DED7D56E9` | 
| `dimension_2` | The item's Globally Unique ID | `FA53F159-1DG9-G2D4-7812-163AED7D56A9` |
| `dimension_3` | The nature of the interaction, made up of three components - the user's mode, the action type and optionally, an action subtype. Mode is either `view`, `view_draft`, `edit` or `view_as_student`. Action types are one of `add_to_bookmarks`, `export_citation`, `show_share_item`, `personal_note`, `external_link`, `reading_intention` or `toggle_detail`. Sub types are relevant for `external_link` (`view_online_button`, `bookstore `, `content`, `library_catalogue`, `preview`, `resolver`), `reading_intention` (`undecided`, `plan_to_consume`, `currently_consuming`, `have_consumed`, `decided_not_to_consume`) and `toggle_detail` (`expand` and `collapse`) | `view:add_to_bookmarks`<br> or <br>`view:toggle_detail:expand`<br> or <br>`view_draft:external_link:preview` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-item-view"></a>

### Events with class `list.item.view`

<span class="deprecated">DEPRECATED</span> instead, see `list.item.click`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_3` | List item's Globally Unique ID, can be joined to [`public.f_rl_items.item_guid`]({{ site.baseurl }}/topics/items.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="list-item-external_link-click"></a>

### Events with class `list.item.external_link.click`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | List item's Globally Unique ID, can be joined to [`public.f_rl_items.item_guid`]({{ site.baseurl }}/topics/items.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `dimension_3` | A string categorising the destination category, possible values are the name of the campus bookstore vendor (e.g. `Blackwell's`), `digitisation`, `doi`, `ebook`, `google_books`, `lcn_lookup`, `library_search`, `open_url`, `other` | `ebook` |
| `dimension_4` | The external link's domain name | `www.dawsonera.com` |

<br/>
<a name="lti-link-followed"></a>

### Events with class `lti.link.followed`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | An identifier matching the course context the LTI launch was made from. Where available, is one of `custom_canvas_course_id`, `custom_knowledge_grouping_code`, `lis_course_offering_sourcedid`, `context_id` from the LTI launch payload, in that order of preference.  | `ABF201` |
| `dimension_3` | The user ID from the LTI payload, either from `lis_person_sourcedid` or `user_id` in that order of preference   | `3` |

<br/>
<a name="reviews-actions-status-1"></a>

### Events with class `reviews.actions.status.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | Status the review was set to |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="reviews-actions-setOutcome-1"></a>

### Events with class `reviews.actions.setOutcome.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | Outcome the review was set to |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="reviews-actions-assignUser-1"></a>

### Events with class `reviews.actions.assignUser.1`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The Globally Unique ID of the user whom the review was assigned to, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |
| `dimension_3` | Globally Unique ID of the review | `myoVK7wfosXXWlw` |
| `dimension_4` | The Globally Unique ID of the user assigning the review, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). | `myoVK7wfosXXWlw` |

<br/>
<a name="user-identified"></a>

### Events with class `user.identified`

| Column | Description | Example |
| --- | --- | --- |
| `dimension_1` | The tenancy short code | `broadminster` |
| `dimension_2` | The `talis_guid`. Can be joined to `rl_users.talis_guid`  | `myoVK7wfosXXWlw` |
| `dimension_3` | An identifier supplied at sign in by your IDP in the SAML attributes, either from `principal_name`, `email` or `persistent_id` in that order of preference   | `user123@myinst.ac.uk` |

<br/>

