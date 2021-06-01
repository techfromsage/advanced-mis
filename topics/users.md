---
layout: site
title: Reading List Users
body_class: users
---

<dl>
  <dt>Entity</dt>
  <dd>Users</dd>

  <dt>Description</dt>
  <dd>Reading list user data. Only users who have a user profile in Talis Aspire will have an entry in this view. It is therefore possible for users in events to not have a match with users in this view. Be careful when joining event data with user data.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_users</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- |
| `first_name` | `VARCHAR(255)` | User's first name | `Abigail` |
| `surname` | `VARCHAR(255)` | User's surname | `Baker` |
| `name` | `VARCHAR(255)` | The name of the user | `Abigail Baker` |
| `profile_url` | `VARCHAR(4096)` | Canonical URL of the user's profile. Can be used to join to other tables which reference a user URL. |  |
| `email` | `VARCHAR(4096)` | User's email address | `ab@myinst.ac.uk` |
| `job_role` | `VARCHAR(255)` | User-selected job role | `An academic` |
| `profile_privacy` | `VARCHAR(255)` | Whether or not user's profile can be browsed by non-admin users, permitted values are `public`, `private` | `public` |
| `aspire_role` | `VARCHAR(255)` | Semi-colon seperated lists of Aspire roles | `List publisher; Library Acquisitions` |
| `last_login` | `TIMESTAMP` | Date and time when the user last logged in. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `year_last_logged_in` | `INTEGER` | Year of when the user last logged in | `2018` |
| `month_last_logged_in` | `INTEGER` | Month of when the user last logged in, values `1-12` | `12` |
| `week_last_logged_in` | `INTEGER` | ISO 8601 week of when the user last logged in, note Monday is the start of the ISO 8601 week, values `1-53` | `52` |
| `dow_last_logged_in` | `INTEGER` | Day of week of when the user last logged in created, values `0-6`, Sunday is `0` | `5` |
| `saml_user_id` | `VARCHAR(255)` | SAML ID (persistent ID) sent to us by the single sign on solution to uniquely identify this user. Useful for linking to other non-Talis institutional user data | `029O6lrAi14=-@myinst.ac.uk` |
| `talis_guid` | `VARCHAR(255)` | Talis user ID to link to other non-reading list Talis data | `myoVK7wfosXXWlw` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
