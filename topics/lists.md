---
layout: site
title: "Data dictionary: Lists"
body_class: lists
---

<dl>
  <dt>Entity</dt>
  <dd>Lists</dd>

  <dt>Description</dt>
  <dd>Reading list data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_lists</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description | Example
| --- | --- | --- | --- | --- |
| `url` | `VARCHAR(4096)` | Canonical URL of the reading list |
| `title` | `VARCHAR(4096)` | Reading list title |
| `status` | `VARCHAR(255)` | Permitted values `Draft`, `Published`, `Puiblished with Unpublished Changes` |
| `created_by` | `VARCHAR(4096)` | Name of creator in format `lastname, firstname` |
| `hierarchy_url` | `VARCHAR(4096)` | Canonical URL of hierarchy record, can be used to link to [hierarchy]({{ site.baseurl }}/topics/hierarchy.html) |
| `time_period` | `VARCHAR(4096)` | Textual name of time period |
| `section_count` | `INTEGER` | Number of sections in this list |
| `item_count` | `INTEGER` | Number of items in this list |
| `owner` | `VARCHAR(4096)` | Timestamp of when the list was created |
| `year_created` | `INTEGER` | Year of when the list was created | `2018`
| `month_created` | `INTEGER` | Month of when the list was created, values `1-12` | `12`
| `week_created` | `INTEGER` | ISO 8601 week of when the list was created, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_created` | `INTEGER` | Day of week of when the list was created, values `0-6`, Sunday is `0` | 5
| `year_last_published` | `INTEGER` | Year of when the list was last published | `2018`
| `month_last_published` | `INTEGER` | Month of when the list was last published, values `1-12` | `12`
| `week_last_published` | `INTEGER` | ISO 8601 week of when the list was last published, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_last_published` | `INTEGER` | Day of week of when the list was last published, values `0-6`, Sunday is `0` | 5
| `year_archived` | `INTEGER` | Year of when the list was archived | `2018`
| `month_archived` | `INTEGER` | Month of when the list was archived, values `1-12` | `12`
| `week_archived` | `INTEGER` | ISO 8601 week of when the list was archived, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_archived` | `INTEGER` | Day of week of when the list was archived, values `0-6`, Sunday is `0` | 5
| `year_last_reviewed` | `INTEGER` | Year of when the list was last reviewed | `2018`
| `month_last_reviewed` | `INTEGER` | Month of when the list was last reviewed, values `1-12` | `12`
| `week_last_reviewed` | `INTEGER` | ISO 8601 week of when the list was last reviewed, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_last_reviewed` | `INTEGER` | Day of week of when the list was last reviewed, values `0-6`, Sunday is `0` | 5
| `privacy_control` | `VARCHAR(255)`` | `Private` or `Public` |
| `student_numbers` | `INTEGER` | Numbers of students |