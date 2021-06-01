---
layout: site
title: Hierarchy Parents
body_class: hierarchy-parents
---

<dl>
  <dt>Entity</dt>
  <dd>Hierarchy Parents</dd>

  <dt>Description</dt>
  <dd>A mapping between a hierarchy node and its immediate parents</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_hierarchy_parents</code></dd>
</dl>

This view contains a mapping from a node to one or more parent nodes.  It is an expansion of the semi-colon delimited string in the `f_rl_hierarchy.parent_url` column.

The maximum number of __parents__ that this view will show is 100, though there is no enforced limit in Talis Aspire itself. The number of __children__ a node can have is unlimited. If this reasonable default causes you any issues in querying the table, do let us know through our support channels.

A parent in this view is the immediate parent of the node in the `url` column, and not its grandparents. Use the `f_rl_hierarchy_descendents` view if you need all nodes below a parent.

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `url` | `VARCHAR(4096)` | Canonical URL of the hierarchy node |  |
| `parent_url` | `VARCHAR(4096)` | Canonical URL of the parent node  |  |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
