---
layout:  story
title:   Items
---

Items
-----

<ul>
{% for item in site.pages %}
  {% if item.layout == 'item' %}
  	<li><a href="{{site.baseurl}}{{site.trailurl}}{{ item.url }}">{{ item.title }}</a></li>
  {% endif %}
{% endfor %}
</ul>



Purple Root
Personal Radio
Medallion
Mask
The Journal
Tablet
Doll
Personal Radio




