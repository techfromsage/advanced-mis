---
layout: site
title: Pushing content from Aspire
body_class: pushing
mermaid: true
---

{% capture time_now %}{{ 'now' | date: "%s" }}{% endcapture %}
{% capture next_sunday %}{{ time_now | date: "%w" | minus : 7 | times: -86400 | plus: time_now }}{% endcapture %}

<div class=mermaid>
gantt
    title Automatic data push to Advanced MIS next 7 days
    dateFormat DD-MM-YYYY
    axisFormat %a

    %% dates for this gantt are calculated to be relative to today. for example the RL/DC dates are the date of the next sunday coming.
    %% The calculation happens in those liquid tags just outside this div, and are injected into the gantt content using more liquid tags.

    section Application Data
    Reading Lists weekly data push :a1, {{ next_sunday | date: "%d-%m-%Y" }}, 1d

    Digitised Content weekly data push :a2, {{ next_sunday | date: "%d-%m-%Y" }}, 1d

    Talis Elevate daily data push :e1, {{ time_now | date: "%d-%m-%Y" }}, 8d

    section Event Data
    Hourly event data push :events1, {{ time_now | date: "%d-%m-%Y" }}, 8d
    Daily event data push :events1, {{ time_now | date: "%d-%m-%Y" }}, 8d
</div>

### Event Data
[Event Data]({{ site.baseurl }}/topics/event-data.html) is aggregated either hourly or daily depending on which `f_event_timeseries...` table it is going into.

### Application Data
[Application Data]({{ site.baseurl }}/topics/app-data.html) is updated automatically for you and pushed into Advanced MIS. Different products may have slightly different push schedules.

#### Reading Lists
Data from Reading Lists is pushed to Advanced MIS in the early hours (GMT) of Sunday morning.

To update application data for Reading Lists you can push it from Aspire manually. Log into Aspire as a System Administrator, and in the "Admin" menu choose "Advanced MIS". From here you will be able to invoke the "Push data now" option.

![Aspire Advanced MIS menu screenshot]({{ site.baseurl }}/images/topics/pushing/aspire-menu.jpg)

#### Digitised Content
Data from Talis Aspire Digitised Content (digitisation requests) are updated once a week in the early hours (GMT) of Sunday morning

#### Talis Elevate
Data from Talis Elevate is pushed to Advanced MIS daily in the early hours (GMT) of the morning.
