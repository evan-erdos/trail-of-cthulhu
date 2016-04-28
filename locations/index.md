---
layout: story
title: Locations
---

Locations
---------

<ul>
{% for location in site.pages %}
  {% if location.layout == 'location' %}
  	<li>
      <a href="{{ site.baseurl }}{{ location.url }}">{{ location.title }}</a>
  	</li>
  {% endif %}
{% endfor %}
</ul>