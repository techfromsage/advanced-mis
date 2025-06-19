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
| --- | --- | --- | --- |
| `url` | `VARCHAR(4096)` | Canonical URL of the reading list |
| `list_guid` | `VARCHAR(4096)` | Globally Unique ID for the reading list. This should be used for joining to other data. | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `title` | `VARCHAR(4096)` | Reading list title |
| `status` | `VARCHAR(255)` | Permitted values `Draft`, `Published`, `Published with Unpublished Changes` | `Draft`
| `hierarchy_url` | `VARCHAR(4096)` | Canonical URL of hierarchy record, can be used to link to [hierarchy]({{ site.baseurl }}/topics/hierarchy.html) |
| `time_period` | `VARCHAR(4096)` | Textual name of time period | `Autumn Term 18`
| `section_count` | `INTEGER` | Number of sections in this list | `23`
| `item_count` | `INTEGER` | Number of items in this list | `170`
| `owner` | `VARCHAR(4096)` | Name of the list owner |
| `owner_url` | `VARCHAR(4096)` | URL of the user who owns the list. Can be joined with public.f_rl_users.profile_url |
| `created_by` | `VARCHAR(4096)` | Name of the user who created this list |
| `published_by` | `VARCHAR(4096)` | Name of the user who published this list |
| `archived_by` | `VARCHAR(4096)` | Name of the user who archived this list |
| `review_completed_by` | `VARCHAR(4096)` | Name of the user who completed the last review of this list |
| `date_created` | `TIMESTAMP` | Date the list was created | `2016-01-12 00:00:00.0`
| `year_created` | `INTEGER` | Year of when the list was created | `2018`
| `month_created` | `INTEGER` | Month of when the list was created, values `1-12` | `12`
| `week_created` | `INTEGER` | ISO 8601 week of when the list was created, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_created` | `INTEGER` | Day of week of when the list was created, values `0-6`, Sunday is `0` | 5
| `last_updated` | `TIMESTAMP` | Date the list was last updated | `2016-01-12 00:00:00.0`
| `year_last_updated` | `INTEGER` | Year of when the list was last updated | `2018`
| `month_last_updated` | `INTEGER` | Month of when the list was last updated, values `1-12` | `12`
| `week_last_updated` | `INTEGER` | ISO 8601 week of when the list was last updated, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_last_updated` | `INTEGER` | Day of week of when the list was last updated, values `0-6`, Sunday is `0` | 5
| `last_published` | `TIMESTAMP` | Date the list was last published | `2016-01-12 00:00:00.0`
| `year_last_published` | `INTEGER` | Year of when the list was last published | `2018`
| `month_last_published` | `INTEGER` | Month of when the list was last published, values `1-12` | `12`
| `week_last_published` | `INTEGER` | ISO 8601 week of when the list was last published, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_last_published` | `INTEGER` | Day of week of when the list was last published, values `0-6`, Sunday is `0` | 5
| `date_archived` | `TIMESTAMP` | Date the list was archived | `2016-01-12 00:00:00.0`
| `year_archived` | `INTEGER` | Year of when the list was archived | `2018`
| `month_archived` | `INTEGER` | Month of when the list was archived, values `1-12` | `12`
| `week_archived` | `INTEGER` | ISO 8601 week of when the list was archived, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_archived` | `INTEGER` | Day of week of when the list was archived, values `0-6`, Sunday is `0` | 5
| `last_reviewed` | `TIMESTAMP` | Date the list was last reviewed | `2016-01-12 00:00:00.0`
| `year_last_reviewed` | `INTEGER` | Year of when the list was last reviewed | `2018`
| `month_last_reviewed` | `INTEGER` | Month of when the list was last reviewed, values `1-12` | `12`
| `week_last_reviewed` | `INTEGER` | ISO 8601 week of when the list was last reviewed, note Monday is the start of the ISO 8601 week, values `1-53` | `52`
| `dow_last_reviewed` | `INTEGER` | Day of week of when the list was last reviewed, values `0-6`, Sunday is `0` | 5
| `privacy_control` | `VARCHAR(255)` | `Private` or `Public` | `Public`
| `student_numbers` | `INTEGER` | Numbers of students | `84`
| `default_list_view` | `VARCHAR(255)` | whether the list is using the new list view. 'Beta' refers to the new list view. 'Classic' refers to the old list view. | `Beta is default`
| `internal_note` | `VARCHAR(4096)` | Textual information about the list that is only visible to staff. The note will be truncated if it is longer than 4096 characters. | `example note for staff` |
| `description` | `VARCHAR(4096)` | Textual information about the list visible to all users. The note will be truncated if it is longer than 4096 characters. | `example note` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
