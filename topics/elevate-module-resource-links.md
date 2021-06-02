---
layout: site
title: Elevate Module Resource Links
body_class: elevate-module-resource-links
---

<dl>
  <dt>Entity</dt>
  <dd>Elevate Module Resource Links</dd>

  <dt>Description</dt>
  <dd>A Linking table used to link resources to the module they are being used in.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_elevate_module_resource_links</code></dd>
</dl>

**Note:** The Talis Elevate resource concept should not be confused with the concept of a resource in Reading Lists. They are entirely different things!

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- | 
| `module_id` | `VARCHAR(64)` | The Talis ID of the module. Can be used to find resources associated with a particular module. | `fhf7jfohifnfwwoif` |
| `resource_id` | `VARCHAR(64)` | The Talis ID of the resource. Can be used to find modules that this resource is being used in. | `fhf7jfohifnfwwoif` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
