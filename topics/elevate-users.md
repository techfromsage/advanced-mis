---
layout: site
title: Elevate Users
body_class: elevate-users
---

<dl>
  <dt>Entity</dt>
  <dd>Elevate Users</dd>

  <dt>Description</dt>
  <dd>Users who have logged in to Talis Elevate, and when they last did this.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_elevate_users</code></dd>
</dl>

This view contains all users who have logged in to Talis Elevate, and includes their last login date. It also includes how many times they have logged in so that you can find users who are engaging with Talis Elevate often.

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `talis_guid` | `VARCHAR(64)` | Talis user ID to link to other Talis data such as events | `myoVK7wfosXXWlw` |
| `full_name` | `VARCHAR(255)` | The user's full name | `Joe F. Bloggs` |
| `login_count` | `INTEGER` | The number of times this user has logged in | `64` |
| `last_login` | `TIMESTAMP` | Time the user last logged in. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `inst` | `VARCHAR(32)` | The tenant short code | `broadminster` |
| `created_via` | `VARCHAR(32)` | The method by which the user was created, either `colleagueInvite`, `talisInvite` or `lti`  | `colleagueInvite` |
| `role` | `VARCHAR(32)` | The role of the user, either `student` or `academic` | `academic` |
| `year_last_login` | `INTEGER` | Year of when the user last logged in | `2018` |
| `month_last_login` | `INTEGER` | Month of when the user last logged in, values 1-12 | `12` |
| `week_last_login` | `INTEGER` | ISO 8601 week of when the user last logged in, note Monday is the start of the ISO 8601 week, values 1-53 | `52` |
| `dow_last_login` | `INTEGER` | Day of week of when the user last logged in created, values 0-6, Sunday is 0 | `5` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
