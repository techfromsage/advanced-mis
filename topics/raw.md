---
layout: site
title: "Data dictionary: Raw events"
body_class: raw
---

Raw events are stored in the table `f_event_raw_daily` and will be available for a period according
to the [limits]({{ site.baseurl }}/topics/limits.html) before being dropped.

Each row shares common columns, with up to 6 extended columns (`property_1` through `property_6`) having
a variable definition based on the class of event.

### All rows

| Column | Datatype | Description | Example |
| --- | --- | --- | --- |
| `uuid` | `VARCHAR(64)` | Unique identifier for this event | |
| `event_class` | `VARCHAR(128` | Class of event - see below for `property_*` field mappings | `list.view` |
| `event_timestamp` | `TIMESTAMP` | Time event occurred | `2018-05-23 00:52:43.0` |
| `performed_by` | `VARCHAR(128)` | User's Globally Unique ID, can be joined to [`public.f_rl_users.talis_guid`]({{ site.baseurl }}/topics/users.html). May be set to `anon` or null if user unidentified | `myoVK7wfosXXWlw` |
| `property_*` | `VARCHAR(128)` | Where `*` is value from `1` through `6`, definitions vary by `event_class` | |
| `full_data_base64` | `VARCHAR(2048)` | Base 64 encoding of full event properties, in JSON format | |


<br/>
<a name="list-view"></a>

### Events with class `list.view`

| Column | Description | Example |
| --- | --- | --- |
| `property_1` | Tenant code | `broadminster` |
| `property_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |


<br/>
<a name="list-item-view"></a>

### Events with class `list.item.view`

| Column | Description | Example |
| --- | --- | --- |
| `property_1` | Tenant code | `broadminster` |
| `property_2` | List's Globally Unique ID, can be joined to [`public.f_rl_lists.guid`]({{ site.baseurl }}/topics/lists.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `property_3` | List item's Globally Unique ID, can be joined to [`public.f_rl_items.item_guid`]({{ site.baseurl }}/topics/items.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |


<br/>
<a name="list-item-external_link-click"></a>

### Events with class `list.item.external_link.click`

| Column | Description | Example |
| --- | --- | --- |
| `property_1` | The tenancy short code | `broadminster` |
| `property_2` | List item's Globally Unique ID, can be joined to [`public.f_rl_items.item_guid`]({{ site.baseurl }}/topics/items.html)   | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `property_3` | A string categorising the destination category, possible values are the name of the campus bookstore vendor (e.g. `Blackwell's`), `digitisation`, `doi`, `ebook`, `google_books`, `lcn_lookup`, `library_search`, `open_url`, `other` | `ebook` |
| `property_4` | The external link's domain name | `www.dawsonera.com` |


<br/>
<a name="lti-link-followed"></a>

### Events with class `lti.link.followed`

| Column | Description | Example |
| --- | --- | --- |
| `property_1` | Tenant code | `broadminster` |
| `property_2` | An identifier matching the course context the LTI launch was made from. Where available, is one of `custom_canvas_course_id`, `custom_knowledge_grouping_code`, `lis_course_offering_sourcedid`, `context_id` from the LTI launch payload, in that order of preference.  | `ABF201` |
| `property_3` | The user ID from the LTI payload, either from `lis_person_sourcedid` or `user_id` in that order of preference   | `3` |


<br/>
<a name="user-identified"></a>

### Events with class `user.identified`

| Column | Description | Example |
| --- | --- | --- |
| `property_1` | Tenant code | `broadminster` |
| `property_2` | The `talis_guid`. Can be joined to `rl_users.talis_guid`  | `myoVK7wfosXXWlw` |
| `property_3` | An identifier supplied at sign in by your IDP in the SAML attributes, either from `princiapl_name`, `email` or `persistent_id` in that order of preference   | `user123@myinst.ac.uk` |
