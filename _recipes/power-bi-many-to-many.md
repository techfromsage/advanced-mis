---
title: One to Many Relationships
layout: site
body_class: recipe
keywords: reading lists, Power BI, How to
description: How to handle many to many relationships in Power BI.
---

## Background

In Talis Aspire we often have fields in the exported data which contain multiple values.
These values are separated using a '`; `' (Semicolon and space).  

Common fields where this might apply are:

- `f_rl_items.web_address`
- `f_rl_items.isbn10` and `f_rl_items.isbn13`
- `f_rl_lists.hierarchy_url`

This happens because we are compressing a field which has a one-to-many relationship with the list or item into a single column of the report.

## Solution

To work with this data in a Business Intelligence data processing tool, you would want to restore the one-to-many nature of the relationship by creating a lookup table.  We want to have a key on one side and a value to lookup in a 2 column table. We won't mind if the key repeats multiple times.

The steps described in this video example using Power BI are broadly as follows:

- Select only the columns that we are interested in from the source data.
- Split the column with multiple values into as many columns as needed. This is sometimes called 'unflattening' a row.
- Unpivot the split columns and leave the key column alone.
- Update the relationships in the data model.

## Power BI Video Example

<script src="https://fast.wistia.com/embed/medias/xiwdnqinzg.jsonp" async></script><script src="https://fast.wistia.com/assets/external/E-v1.js" async></script><div class="wistia_responsive_padding" style="padding:42.29% 0 0 0;position:relative;"><div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;"><div class="wistia_embed wistia_async_xiwdnqinzg videoFoam=true" style="height:100%;position:relative;width:100%"><div class="wistia_swatch" style="height:100%;left:0;opacity:0;overflow:hidden;position:absolute;top:0;transition:opacity 200ms;width:100%;"><img src="https://fast.wistia.com/embed/medias/xiwdnqinzg/swatch" style="filter:blur(5px);height:100%;object-fit:contain;width:100%;" alt="" aria-hidden="true" onload="this.parentNode.style.opacity=1;" /></div></div></div></div>
