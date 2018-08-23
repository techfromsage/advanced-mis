---
layout: site
title: Hierarchy
body_class: hierarchy
---

<dl>
  <dt>Entity</dt>
  <dd>Hierarchy</dd>

  <dt>Description</dt>
  <dd>Reading list hierarchy data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_hierarchy</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | --- |
| `code` | `VARCHAR(255)` | Code of the hierarchy node. Note only unique when combined with type | `ABF203` |
| `url` | `VARCHAR(4096)` |  Canonical URL of the hierarchy node | |
| `type` | `VARCHAR(64)` | Type of the hierarchy node | `Course` |
| `name` | `VARCHAR(4096)` | Name of the heirarchy node  | `Introduction to Financial Accounting and Reporting` |
| `jacs_code` | `VARCHAR(255)` | If present, the mapping JACS code for the node | `N300` |
| `parent_code` | `VARCHAR(255)` | The code of any immediate parent node | `BUSMAN` |
| `parent_url` | `VARCHAR(4096)` | Canonical URL of the immediate parent node | |
| `total_list_count` | `INTEGER` | Sum of any published or draft lists attached to this hierarchy node | `3` |
| `published_list_count` | `INTEGER` | Number of any published (or published with unpublished changes) lists attached to this hierarchy node | `2` |
| `draft_list_count` | `INTEGER` | Number of any draft only lists attached to this hierarchy node | `1` |

**WARNING:** Because this is a beta service, the data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
