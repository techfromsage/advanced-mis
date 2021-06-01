---
layout: site
title: Elevate Modules
body_class: elevate-modules
---

<dl>
  <dt>Entity</dt>
  <dd>Elevate Modules</dd>

  <dt>Description</dt>
  <dd>Elevate modules will contain groups of resources used for teaching under a specific module code. This table can be used to add context to events happening on Talis Elevate resources.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_elevate_modules</code></dd>
</dl>


### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `module_id` | `VARCHAR(64)` | The Talis ID of the module. Can be used to link this view with events. | `fhf7jfohifnfwwoif` |
| `inst`|`VARCHAR(255)` | The tenant short code | `broadminster` | 
| `title` | `VARCHAR(255)` | The title of the module | `World History` |
| `code` | `VARCHAR(255)` | The module code | `HIST101` |
| `created_by` | `VARCHAR(64)` | Talis user ID to link to other Talis data such as events | `myoVK7wfosXXWlw` |
| `date_created` | `TIMESTAMP` | Date created. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `year_date_created` | `INTEGER` | Year of date created | `2018` |
| `month_date_created` | `INTEGER` | Month of date created | `12` |
| `week_date_created` | `INTEGER` | ISO 8601 week, note Monday is the start of the ISO 8601 week, values 1-53 | `52` |
| `dow_date_created` | `INTEGER` | Day of week, values 0-6, Sunday is 0 | `5` |
| `start_date` | `TIMESTAMP` | Date module starts. Timezone is UTC| `2016-01-12 00:00:00.0` |
| `year_start_date` | `INTEGER` | Year of start date | `2018` |
| `month_start_date` | `INTEGER` | Month of start date | `12` |
| `week_start_date` | `INTEGER` | ISO 8601 week, note Monday is the start of the ISO 8601 week, values 1-53 | `52` |
| `dow_start_date` | `INTEGER` | Day of week, values 0-6, Sunday is 0 | `5` |
| `end_date` | `TIMESTAMP` | Date Module ends. Timezone is UTC | `2016-01-12 00:00:00.0` |
| `year_end_date` | `INTEGER` | Year of end date | `2018` |
| `month_end_date` | `INTEGER` | Month of end date | `12` |
| `week_end_date` | `INTEGER` | ISO 8601 week, note Monday is the start of the ISO 8601 week, values 1-53 | `52` |
| `dow_end_date` | `INTEGER` | Day of week, values 0-6, Sunday is 0 | `5` |
| `student_numbers` | `INTEGER` | Number of students on module | `100` |
| `resource_count` | `INTEGER` | Number of resources on module | `15` |
| `active_student_count` | `INTEGER` | Number of active students | `85` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
