---
layout: site
title: ISBN Link
body_class: isbn-link
---

<dl>
  <dt>Entity</dt>
  <dd>ISBN Link</dd>

  <dt>Description</dt>
  <dd>A mapping between an ISBN like identifier and the items the identifier appears on. Also provides some extra filter columns for list status, digitisation presence and item importance.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_isbn_link</code></dd>
</dl>

This view contains a mapping from an ISBN to the Item it relates to, and includes some additional convenience columns with details of the item in question.

You can use this view as a lookup table to find all items with some given ISBN. So if you have a set of data from a EBA or PDA supplier, you can lookup each of those in this table and find out which items might need some metadata changes. 

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `isbn` | `VARCHAR(255)` | an ISBN10, ISBN13, ISSN or eISSN | `012345678X` |
| `item_url` | `VARCHAR(4096)` | Canonical URL of the item  |  |
| `importance` | `VARCHAR(255)` | The importance of the item | `Essential` |
| `digitisation_id` | `VARCHAR(255)` | The request id of the digitisation | `54321` |
| `digitisation_status` | `VARCHAR(32)` | Whether the digitisation is `LIVE` or `EXPIRED` etc. | `LIVE` |
| `list_url` | `VARCHAR(4096)` | Canonical URL of the item | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `list_status` | `VARCHAR(255)` | The status of the list, `Published`, `Archived`, etc | `Draft` |
| `tenant` | `VARCHAR(255)` | The thenant short code | `broadminster` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
