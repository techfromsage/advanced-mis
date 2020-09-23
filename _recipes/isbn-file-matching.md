---
title: ISBN File Matching
layout: site
body_class: recipe
keywords: reading lists, Item Metadata, EBA, PDA
description: Match a file of ISBNs from a supplier to your reading lists collection.
---

## Background

Sometimes a supplier gives you a list of ISBNs that you want to match against your Reading Lists to see what the coverage might be.

This article explores how you can use the `f_rl_isbn_link` view to find the items you care about.

## Queries

We have provided a pre-generated view which provides a mapping between all ISBNs and which item they appear in. It is assumed that you have already loaded the mapping data into a table within the Advanced MIS data warehouse. See the [using custom datasets recipe]({{ site.baseurl }}/recipes/using-custom-datasets.html)

At its simplest you can run a query which uses another subquery to get your list of ISBN values to compare against. We use the `upper()` function to make sure we are comparing similarly cased values.

```redshift
SELECT item_url, importance
from f_rl_isbn_link
where upper(isbn) in (
    select upper(isbn) from my_table_of_isbns
)
``` 

If you want to create a result set which includes other columns from your custom data, then something like this would allow you to create a temporary table (the with part of this query) and then join on isbn. This allows more flexible approaches to comparing data in the two datasets.  In this example we have added a custom table for a file which maps ISBNs to a URL for the ebook. Notice again, we make sure we are comparing the ISBNs with a consistent case. It doesn't actually matter whether this is `upper()` or `lower()` as long as it is consistent.

```redshift
with my_isbns as (
    select isbn, ebook_url from my_table_of_isbns
)
select 
    f_rl_isbn_link.item_url,
    f_rl_items.web_address,
    my_isbns.ebook_url,
    f_rl_isbn_link.importance, 
    f_rl_isbn_link.isbn
from 
    f_rl_isbn_link, 
    my_isbns,
    f_rl_items
where upper(f_rl_isbn_link.isbn) = upper(my_isbns.isbn)
and f_rl_items.item_url = f_rl_isbn_link.item_url
``` 

## Assumptions

We assume you know that some ISBNs may appear as both ISBN-10 or ISBN-13 variants. Talis Aspire does not enforce the use of one over another, so you should expect to check for both ISBN formats to get a true picture of which items match.

We typically see both upper and lower cased check-digits in ISBNs in different datasets. We always need to account for these possible data discrepancies when doing a comparison. 

## Taking it Further

Now you know which items associate with which ISBNs you can use this information to feed a bulk update script which uses Talis Aspire APIs to update the items with a new URL or change other metadata details. For example the first three columns of the second query returns the item id and the old and new URL which could be used with tool that has been developed in the developer community.  To learn more, see this article about [the developer community](https://support.talis.com/hc/en-us/articles/360008895498-Developer-Community)