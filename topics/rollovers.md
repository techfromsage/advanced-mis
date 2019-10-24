---
layout: site
title: List Rollovers
body_class: rollovers
---

<dl>
  <dt>Entity</dt>
  <dd>Rollovers</dd>

  <dt>Description</dt>
  <dd>Describes the relationship between a list and its rollover copies</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_list_rollover_relationships</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | --- |
| `source_url` | `VARCHAR(4096)` | Canonical URL of source list (the one being rolled over) |
| `destination_url` | `VARCHAR(4096)` | Canonical URL of the destination list (the newly created list)  |
| `source_time_period` | `VARCHAR(4096)` | Time period of the source list  | `Autumn Term 2017` |
| `destination_time_period` | `VARCHAR(4096)` | Time period of the destination list  | `Autumn Term 2018`
| `date_of_rollover` | `TIMESTAMP` | Date the rollover occurred | `2016-01-12 00:00:00.0`
| `year_of_rollover` | `INTEGER` | Year of when the list was rolled over | `2018`
| `month_of_rollover` | `INTEGER` | Month of when the list was rolled over, values `1-12` | `12`
| `week_of_rollover` | `INTEGER` | ISO 8601 week of when the list was rolled over, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_of_rollover` | `INTEGER` | Day of week of when the list was rolled over, values `0-6`, Sunday is `0` | 5

**WARNING:** Because this is a beta service, the data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
