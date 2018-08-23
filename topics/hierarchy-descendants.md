---
layout: site
title: Hierarchy Descendants
body_class: hierarchy-descendants
---

<dl>
  <dt>Entity</dt>
  <dd>Hierarchy</dd>

  <dt>Description</dt>
  <dd>A mapping between a hierarchy node and it's eventual descendants</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_hierarchy</code></dd>
</dl>

This view is useful for comprising rollups of hierarchy data between levels. For a given starting
node, you can query back all the eventual descendants within the hierarchy tree.

For example, let's consider a three level hierarchy, structured `departments -> courses -> modules`.
This view would allow you to discover all modules for a given department, and then link onto other
views such as `f_rl_lists` or even onward to `f_rl_items` in order to say find a resource type count
by department.

Note that the top level of every hierarchy is the institution (of which every node is a descendant)
and that this view only supports up to five levels of depth:

1. Children
1. Grand children
1. Great grand children
1. Great great grand children
1. Great great great grand children

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | --- |
| `url` | `VARCHAR(4096)` | Canonical URL of the hierarchy node |  |
| `descendant_url` | `VARCHAR(4096)` | Canonical URL of the descendant node  |  |

**WARNING:** Because this is a beta service, the data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
