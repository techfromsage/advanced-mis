---
layout: site
title: Elevate Resources
body_class: elevate-resources
---

<dl>
  <dt>Entity</dt>
  <dd>Elevate Resources</dd>

  <dt>Description</dt>
  <dd>Elevate resources used for teaching. This table can be used to add context to events happening on Talis Elevate resources.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_elevate_resources</code></dd>
</dl>

**Note:** The Talis Elevate resource concept should not be confused with the concept of a resource in Reading Lists. They are entirely different things!

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `resource_id` | `VARCHAR(64)` | The Talis ID of the resource. Can be used to link this view with events. | `fhf7jfohifnfwwoif` |
| `title` | `VARCHAR(255)` | The title of the resource| `A Diagram of the spleen` |
| `format` | `VARCHAR(64)` | The format of the resource | `video` |
| `source` | `VARCHAR(64)` | The source of the resource | `ingested` |
| `uploaded_by` | `VARCHAR(64)` | Talis user ID of the person uploading the resource | `myoVK7wfosXXWlw` |
| `inst`|`VARCHAR(255)` | The tenant short code | `broadminster` |
| `date_created` | `TIMESTAMP` | Date created. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `year_date_created` | `INTEGER` | Year of date created | `2018` |
| `month_date_created` | `INTEGER` | Month of date created | `12` |
| `week_date_created` | `INTEGER` | ISO 8601 week, note Monday is the start of the ISO 8601 week, values 1-53 | `52` |
| `dow_date_created` | `INTEGER` | Day of week, values 0-6, Sunday is 0 | `5` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
