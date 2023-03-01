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

Essentially the method boils down to agreeing what you know about a user, and what Talis know about a user, and identifying which fields you have that can be used to 'JOIN' your data to our data.

## Users in Talis Aspire

Talis assign a unique identifier to every user who logs into talis.  This is assigned at a stage _prior_ to their actual use of any of the Talis products. No one can access any of our products without having logged in.

When a user logs in we 'defer' authentication to the university Identity Provider. During this SAML conversation some attributes are sent to us which will include an 'opaque ID', as well as some other optional information - more on that in a bit.

Talis products have various data requirements around users and they each make many of the requirements optional. This means that we don't _always_ get or store personally identifiable information.

### Identifiers - or "what we know about users"

* Talis Aspire
  * eduPersonTargetedID
  * talis guid (our internal identifier)
* Talis Elevate
  * talis guid

### The Opaque ID

typically a university will send a SAML payload that includes the eduPersonTargettedID value. This is a persistent opaque identifier. this means that it is the same every time a user logs in but it is not actually an identifier that you will see in any of your other systems.

If you use shibboleth, this identifier is usually constructed as a hash of the following values.

* The University Entity ID (identifying your identity provider SAML metadata)
* Talis's Entity ID (identifying our service provider SAML metadata)
* The user's id in your systems
* A salt value known only to the university.

This mechanism ensures that the value Talis sees is never the same as the value another third party system might see for the same user. It was designed to stop third parties from colluding and trading in data about users (something we'd never do anyway because we follow good data governance practices!)

This also means that if you know what those 4 values are, you can pre-compute the opaque ID and store this in your own data store for linking your users back to Talis users.

If you use a Microsoft ADFS or Azure type service, there will be an opaque identifier store which is used to generate the Opaque IDs. We have no knowledge of the algorithm used to create this value and assume it cannot be precomputed for a user.

## Assumptions and limitations

* ??

## Things to try

??