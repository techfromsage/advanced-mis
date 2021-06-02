---
layout: site
title: Pushing content from Aspire
body_class: pushing
---

### Event Data
[Event Data]({{ site.baseurl }}/topics/event-data.html) is aggregated either hourly or daily depending on which `f_event_timeseries...` table it is going into.

### Application Data
[Application Data]({{ site.baseurl }}/topics/app-data.html) is updated automatically for you and pushed into Advanced MIS, once per week.

#### Reading Lists
Data from Reading Lists is pushed to Advanced MIS in the early hours (GMT) of Sunday morning.

To update application data for Reading Lists you can push it from Aspire manually. Log into Aspire as a System Administrator, and in the "Admin" menu choose "Advanced MIS". From here you will be able to invoke the "Push data now" option.

![Aspire Advanced MIS menu screenshot]({{ site.baseurl }}/images/topics/pushing/aspire-menu.jpg)

#### Digitised Content
Data from Talis Aspire Digitised Content (digitisation requests) are updated once a week in the early hours (GMT) of Sunday morning

#### Talis Elevate
Data from Talis Elevate is pushed to Advanced MIS daily in the early hours (GMT) of the morning.
