---
title: Analyse Items Grouped by Hierarchy
layout: site
body_class: recipe
keywords: reading lists, item analysis, hierarchy
description: Get views of item features grouped by School, Department or Faculty 
---

## Background

Sometimes you want to be able to analyse features of items on lists and have counts that are grouped at the hierarchy level.

The Hierarchy in Talis Aspire is customised by each University and you may use any of a range of types to describe departments, modules, schools, facult, courses, units etc. In this Article we will just talk about departments and modules for consistency, but the principles outlined here will also work for your university terminology.

Here are some of the sorts of questions you might be trying to answer.

* Which departments set item importances?
* What sort of resources do different departments reccomend?
* Do departments prefer electronic or print resources?

## The Query

```redshift
SELECT
	something
FROM
	somewhere
WHERE
	something
```

## Assumptions and Limitations

## Things to try