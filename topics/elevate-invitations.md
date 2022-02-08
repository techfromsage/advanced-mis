---
layout: site
title: Elevate Invitations
body_class: elevate-invitations
---

<dl>
  <dt>Entity</dt>
  <dd>Elevate Invitations</dd>

  <dt>Description</dt>
  <dd>Elevate invitations will contain invitations created either by Talis or by academics inviting other academics.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_elevate_invitations</code></dd>
</dl>


### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `invitation_id` | `VARCHAR(64)` | The Talis ID of the invitation. | `6200eae0790c89002bac4bd3` |
| `first_name`|`VARCHAR(255)` | The first name of the person who was invited, only populated for invitations created by Talis staff | `Anne` | 
| `surname`|`VARCHAR(255)` | The surname of the person who was invited, only populated for invitations created by Talis staff | `Example` | 
| `date_created` | `TIMESTAMP` | Date created. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `created_by` | `VARCHAR(64)` | Talis user ID of the user who created the invitation | `myoVK7wfosXXWlw` |
| `consumed_by` | `VARCHAR(64)` | Talis user ID of the user who accepted the invitation | `fhf7jfohifnfwwoif` |
| `inst` | `VARCHAR(32)` | The tenant short code | `broadminster` |
| `invite_type` | `VARCHAR(32)` | Set to either "talis" (for invitations created by Talis staff) or "colleague" for invitations created by a user inviting a colleage from the same institution | `talis` |


**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
