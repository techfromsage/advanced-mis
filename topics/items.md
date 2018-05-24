---
layout: site
title: "Data dictionary: Items"
body_class: items
---

<dl>
  <dt>Entity</dt>
  <dd>Items</dd>

  <dt>Description</dt>
  <dd>Reading list item data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_items</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | --- |
| `status` | `VARCHAR(255)` | Status of the list this item appears on. Permitted values `Draft`, `Published`, `Published with Unpublished Changes` | `Draft` |
| `time_period` | `VARCHAR(4096)` | Textual name of time period of the list this item appears on | `Autumn Term 2018` |
| `list_url` | `VARCHAR(255)` | Canonical URL of the reading list  |  |
| `item_url` | `VARCHAR(255)` | Canonical URL of the reading list item  |  |
| `list_guid` | `VARCHAR(4096)` | Globally Unique ID for the reading list | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `item_guid` | `VARCHAR(4096)` | Globally Unique ID for the reading list item. This should be used for joining to other data | `478A70D8-C627-91EC-D681-FFE617FABDD9` |
| `type` | `VARCHAR(255)` | Type of the resource, limited to the [current resource types](https://support.talis.com/hc/en-us/articles/213182945-What-resource-types-are-supported-in-Talis-Aspire-Reading-Lists-) supported by Talis Aspire | `Book` |
| `importance` | `VARCHAR(255)` | Importance level of the item, limited to the values configured in your tenancy | `Suggested for student purchase` |
| `publisher` | `VARCHAR(4096)` | Publisher of the resource | `SAGE` |
| `format` | `VARCHAR(255)` | Format of the resource | `electronic resource` |
| `year_added` | `INTEGER` | Year of when the list was created | `2018` |
| `month_added` | `INTEGER` | Month of when the list was created, values `1-12` | `12` |
| `week_added` | `INTEGER` | ISO 8601 week of when the list was created, note Monday is the start of the ISO 8601 week, values `1-53` | `52` |
| `dow_added` | `INTEGER` | Day of week of when the list was created, values `0-6`, Sunday is `0` | `5` |

**WARNING:** Because this is a beta service, the data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
