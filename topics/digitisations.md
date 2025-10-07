---
layout: site
title: "Data dictionary: Digitisations"
body_class: digitisations
---

<dl>
  <dt>Entity</dt>
  <dd>Digitisations</dd>

  <dt>Description</dt>
  <dd>Copyright cleared digitisation request data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_dc_requests</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- |
| `request_id` | `INTEGER` | Request identifier, should be used for joining to other data | `2` |
| `request_date` | `TIMESTAMP` | Date the request was made | `2017-08-24 00:00:00` |
| `course_code` | `VARCHAR(128)` | Course code the request was made for | `LAW101` |
| `course_title` | `VARCHAR(255)` | Course title the request was made for  | `Intro to Law` |
| `start_date` | `TIMESTAMP` | When the course starts | `2017-08-24 00:00:00` |
| `end_date` | `TIMESTAMP` | When the course ends | `2017-11-14 00:00:00` |
| `student_numbers` | `INTEGER` | Amount of students who should have access to the digitisation | `51` |
| `isnx` | `VARCHAR(16)` | Either the ISBN, or ISSN of the resource | `0021-9460` |
| `publisher` | `VARCHAR(255)` | Publisher of the resource | `SAGE` |
| `original_source` | `VARCHAR(128)` | The source of the original that was digitised | `BL_FEE_PAY` |
| `copy_source` | `VARCHAR(128)` |  |  |
| `status` | `VARCHAR(64)` | Request status | `LIVE` |
| `rolled_over_from` | `INTEGER` | If this request was created as part of a roll over, the identifier of the original request | `1` |
| `rolled_over_to` | `INTEGER` | If this request was itself rolled over, the identifier of the newly created rolled over request | `3` |
| `date_copied` | `TIMESTAMP` | Date that the copy was added to the request | `2017-08-24 00:00:00` |
| `date_released` | `TIMESTAMP` | Course start date or the date the request was made available to students, if after the course start date | `2017-08-24 00:00:00` |
| `original_format` | `VARCHAR(64)` | Format of the original item, permitted values `print`, `digital` | `print` |
| `requester_name` | `VARCHAR(255)` | Name of the person making the request |  |
| `requester_email` | `VARCHAR(255)` | Email of the person making the request | `52` |
| `rl_item_url` | `VARCHAR(255)` | If the item is linked to a reading list item, the canonical URL of that item |  |
| `item_guid` | `VARCHAR(255)` | The guid of the reading list item, to be used for joining data | `478A70D8-C627-91EC-D681-FFE617FABDD9` |
| `request_type` | `VARCHAR(32)` | The request's type. Permitted values: `digitisations`, `coursereserves`, and `fileupload` | `digitisations` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
