---
layout: story
title: Story Outline
---


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








