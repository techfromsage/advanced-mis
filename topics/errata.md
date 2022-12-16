---
layout: site
title: Errata
body_class: errata
---

A list of known issues with data in Advanced MIS with a short explanation of the circumstances.

### Reading List Events from 18th November to 30th November 2022

List view and interaction events were not captured for a period of 12 days between 18th and 30th November 2022 inclusive. This will apply to events like `list.entry_point` and `list.item.click`. This means that student and staff clicks on a list and edit actions will not have been counted. An investigation has concluded that it is not possible to recreate events for this period.

The list of affected events are as follows:

* `list.entry_point`
* `list.item.click`
* `list.item.external_link.click`
* `list.edit`
* `list.item.report_broken_link`
* `list.item.cancel_report_broken_link`

All other list functions continued to work as normal and all edits to lists will have completed as expected.
