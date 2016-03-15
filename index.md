---
layout: story
title: Red Tide Rising
---

<img src="{{site.baseurl}}/assets/logo.png" style="margin-left:auto; margin-right:auto; display:block;">


A Lovecraftian horror story, written for the Trail of Cthulhu Game System.

<div style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">

{% assign acts = (site.pages | sort:'url') %}
{% for act in acts %}
  {% if act.layout == 'act' %}
    <section style="column-break-inside: avoid;">
    <h2><a href="{{ site.baseurl }}{{ act.url }}"><strong>{{ act.title }}</strong></a></h2>
    {% for sequence in acts %}
      {% if sequence.layout == 'sequence' and sequence.url contains act.url %}
        <h3><a href="{{ site.baseurl }}{{ sequence.url }}">{{ sequence.title }}</a></h3>
        <ul class="fa-ul">
        {% for scene in acts %}
          {% if scene.layout == 'scene' and scene.url contains sequence.url %}
            <li><a href="{{ site.baseurl }}{{ scene.url }}">
            <span class="beat">
            {% if scene.beat %}{% include beat/{{ scene.beat }}.html %}{% endif %}
            </span>
            <i>{{ scene.title }}</i></a></li>
          {% endif %}
          {% endfor %}
        </ul>
      {% endif %}
      {% endfor %}
      </section>
      <br>
      <br>
  {% endif %}
{% endfor %}


</div>


<!--

For #s

{% if act.act %}Act {{act.act |plus:1 }} : {% endif %}

{% if sequence.seq %}Sequence {{ sequence.seq | plus:1 }} : {% endif %}

{% if scene.scene %}Scene {{ scene.scene | plus:1 }} : {% endif %}


-->



