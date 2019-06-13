---
layout: site
title: Recipes
body_class: recipe
---

### What can the data available in Advanced MIS tell me?

Below are a whole bunch of things you could try. Each recipe gives you: 

* An example query to run
* An explanation of how the query works
* A sample of the sort of data you might see
* Some insight into what the data might be telling you
* Some suggestions about how you could evolve the query to suit your needs

### Recipes
<dl>
{% for recipe in site.recipes %}
<dt>
<h4>
    <i class="fas fa-angle-right"></i> <a href="{{ recipe.url | prepend:site.baseurl  }}">{{ recipe.title }}</a> 
    <small>{{recipe.keywords}}</small></h4> 
</dt>
<dd>
<p>
{{recipe.description}}
</p>
</dd>
{% endfor %}
</dl>