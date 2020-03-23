---
layout: site
title: Event classes
body_class: event-classes
---

Each event has a `class` which defines the type and characteristics of the event. The current classes
of event supported by Advanced MIS, and whether they are available in raw or timeseries form, are listed
below.

This page is broken up into sections for different areas of Talis Aspire.

- [Login Activity](#login-activity)
- [Reading Lists](#reading-lists)
- [Copyright Clearance](#copyright-clearance)
- [Reviews](#reviews)
- [Talis Elevate](#talis-elevate)

## Login Activity

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `login.success` | A user signed into Talis via SSO |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#login-success)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `user.identified` &#10033; | Following sign in (`login.success`) this event is fired and matches up the institution's identity with the talis user's profile |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#user-identified)  | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#user-identified)  |

## Reading Lists

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `annotations.readingIntention` | A user made, or updated, a reading intention |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#reading_intention)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `bookmarkCreated` | A bookmark was created |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#bookmark-created)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `addToList` | An item was added to a list |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#addToList)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.publish` | A list was published |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-publish)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.entry_point` &#10033; | A list was accessed either directly or by LTI, includes precise entry point (top of list, specific item or section) |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-entry_point)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#list-entry_point)  |
| `list.view` &#10033; <span class="deprecated">DEPRECATED</span> | A list was viewed |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-view)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#list-view)  |
| `list.item.click` &#10033; | An item in a list interacted with in some way  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-item-click)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.item.view` &#10033; <span class="deprecated">DEPRECATED</span> | An item in a list was expanded/navigated to  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-item-view)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#list-item-view)  |
| `list.item.external_link.click` &#10033; | The user exited the list to an external content location  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#list-item-external_link-click)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#list-item-external_link-click)  |
| `lti.link.followed` | An LTI launch to a reading list was invoked |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#lti-link-followed)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](raw.html#lti-link-followed)  |
| `resource.edit` | A resource was updated by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#resource-edit)  | <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i> |

&#10033; These events are only available when using [New List View](https://support.talis.com/hc/en-us/articles/360000008189).

## Copyright Clearance

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
|`digitisation.view`| A digitisation was viewed | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#digitisation-view)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.print.showModal`| A digitisation print modal was opened | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#digitisation-print-showmodal)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.print`| A digitisation was downloaded for printing | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#digitisation-print)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.download`| A digitisation was downloaded | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#digitisation-download)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

## Reviews

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `reviews.actions.status.1` | An acquisitions review's status changed |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#reviews-actions-status-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `reviews.actions.setOutcome.1` | An acquisitions review outcome was set |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#reviews-actions-setOutcome-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `reviews.actions.assignUser.1` | An acquisitions review was assigned to a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#reviews-actions-assignUser-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

## Talis Elevate

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `player.timer.2` | A resource was viewed by a student in the player for an amount of time |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-timer-2)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.timer.2.contributors` | A resource was viewed by a contributor (academic, teaching assistant) in the player for an amount of time |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-timer-2-contributors)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.view` | A resource was opened in the player by a student |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-view)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.view.contributors` | A resource was opened in the player by a contributor (academic, teaching assistant) |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-view-contributors)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation` | A new annotation (comment thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createreply` | A new replay (to an existing thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-annotate-createreply)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.download` | The player resource was downloaded by a user | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i>](timeseries.html#player-download)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

