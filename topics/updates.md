---
layout: site
title: Product Updates for Advanced MIS
body_class: updates
---

A list of updates to the data structure in Advanced MIS.

If you notice a change in your data or reports it may be related to one of these updates.

### FIXED: [INSERT DATE] - Talis Elevate Document Formats

Before this fix, a mixture of MIME types and other generic values were used in the `f_elevate_resources.format` field. Some documents might have had an empty format value.

After this fix, document formats in the `f_elevate_resources.format` field will now be correctly displayed as formats that align with those displayed to users in the Talis Elevate application.
