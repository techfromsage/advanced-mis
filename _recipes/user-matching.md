---
title: User Matching
layout: site
body_class: recipe
keywords: users, identity, reading lists, elevate
description: A look at methods of linking data in Advanced MIS with external systems
---

## Background

You would like to bring Talis Aspire or Talis Elevate data from Advanced MIS into your institutional datastore and ensure that student and academic activity are linked to the user in your own data.

You might be doing this to build out a learning or learner analytics system that can report on unique user usage across all the systems in your university.

## Method

Essentially the method boils down to agreeing what you know about a user, and what Talis data knows about a user, and identifying which fields you have that can be used to 'JOIN' your data to our data.

## Users in Talis Aspire

Talis assign a unique identifier to every user who logs into talis.  This is assigned at a stage _prior_ to their actual use of any of the Talis products.

When a user logs in we 'defer' authentication to the university Identity Provider (IDP). During this SAML conversation some attributes are sent to us which will include an 'opaque ID', as well as some other optional information - more on that below.

Talis products have various data requirements around users and they each make many of the requirements optional. This means that we don't _always_ get or store personally identifiable information.

### Identifiers - or "what we know about users"

* Talis Aspire
  * `eduPersonTargetedID` often defined as `urn:oid:1.3.6.1.4.1.5923.1.1.1.10` in SAML attributes and referred to as `persistent_id` by Talis documentation
  * `talis_guid` (our unique user internal identifier this will be the same as that used for the user in Talis Elevate)
  * `email`
  * Other identifiers may be recognized if configured as the `persistent_id` by Talis for your unique setup.
* Talis Elevate
  * `talis_guid` (our unique user internal identifier this will be the same as that used for the user in Talis Aspire)
* Our user authentication system
  * `eduPersonPrincipalName` often defined as `urn:oid:1.3.6.1.4.1.5923.1.1.1.6` in SAML attributes and referred to as `persistent_id` by Talis documentation
  * `email`
  * `eduPersonTargetedID` often defined as `urn:oid:1.3.6.1.4.1.5923.1.1.1.10` in SAML attributes and referred to as `persistent_id` by Talis documentation
  * Other identifiers may be recognized if configured as the `persistent_id` by Talis for your unique setup.

### The Opaque ID

typically a university will send a SAML payload that includes the `eduPersonTargettedID` value. This is a persistent opaque identifier. this means that it is the same every time a user logs in but it is not actually an identifier that you will see in any of your other systems. i.e. it is unique for that user in the context of logging in to Talis Aspire from your Identity Provider.

__If you use shibboleth__, this identifier is usually constructed as a hash of the following values.

* The University Entity ID (this identifies your identity provider in SAML metadata)
* Talis' Entity ID (this identifies our service provider in SAML metadata)
* The user's id in your systems
* A salt value known only to the university. Should be present in your configuration files.

This mechanism ensures that the value Talis sees is never the same as the value another third party system might see for the same user. It was designed to stop third parties from colluding and trading in data about users (something we'd never do anyway because we follow responsible data governance practices!)

This also means that if you know what those 4 values are, you can pre-compute the opaque ID and store this in your own data store for linking your users back to Talis users.

__If you use a Microsoft ADFS or Azure type service__, there will be an opaque identifier store which is used to generate the Opaque IDs. We have no knowledge of the algorithm used to create this value and assume it cannot be precomputed for a user. You would need to seek assistance from a Microsoft specialist in this instance.

### Where to find the identifiers

#### Talis Aspire

When a user logs in to Talis Aspire for the first time, their persistent id from the SAML conversation is stored in the user profile. Typically the `eduPersonTargettedID`, but this is not always the case and your connection with Talis Aspire may have been configured to use a different identifier location. You will need to ask Talis Support to find out what is configured, or you can look at the data and you may recognize the pattern of the identifier being used. 

* `persistent_id` In Advanced MIS, this type of identifier is stored in the `f_rl_users.saml_user_id` field.
* `talis_guid` In Advanced MIS, this type of identifier is stored in the `f_rl_users.talis_guid` field. You will also see it in events where there is a dimension column that is identifying which user caused the event.
* `email` In Advanced MIS, this identifier is stored in the `f_rl_users.email` field.

#### Talis Elevate

* `talis_guid` In Advanced MIS, this identifier is stored in the `f_elevate_users.talis_guid` field.

### Our user authentication system

Every time the user logs in to a Talis product through our authentication system, and where we have seen that user before, we will emit an event called `user.identified`. This will contain their `talis_guid`, and an identifier that will be one of `eduPersonPrincipalName`, `email` or whichever attribute is configured as the `persistent_id`, in that order of preference. 

You can use this event to build a mapping of `talis_guids` to one of the identifiers that you can use in your own system to identify users. This example SQL extracts this and builds a map of all users identified in up to the last three years (`f_event_timeseries_24hr` ages out after three years).

```redshift
select distinct
    dimension_2 as talis_guid, 
    dimension_3 as id_via_saml
from f_event_timeseries_24hr
where event_class = 'user.identified';
```


### A note on using email to map users

Talis Aspire and Elevate profiles include a user email address. If the feature to automatically populate the user profile is enabled, this will be a value that is controlled by the university and so could be trusted as a stable identifier. If auto profile is not enabled, this value is entered by the user and could be any valid email address. In this case it would not be a stable way to identify users.

If you have any questions about your specific authentication configuration, please email [mailto:support@talis.com](support@talis.com)