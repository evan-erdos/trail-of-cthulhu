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


A group of students embark on an expedition to Northern Africa,
at the behest of their revered research professor, Professor Cameron Trenton Birchwell.
Having gathered a team of researchers and students to travel with him,
and despite his reputation of being more like an academic than a doctor,
Birchwell has set out to diagnose and cure a strange disease,
reported by tribes and villages all across the Northern coast.

Not long into their expedition, a fire breaks out at the lab, and the Professor goes missing.
The students are left to fend for themselves, and as they struggle to get home,
they learn a horrible secret about the Soviet presence in North Africa.

---

An outline of the story can be found on the [Story](story/) page.
The [Characters](characters/) page lists all the significant characters,
including pregenerated PC character sheets, each character's background,
and their stats, if applicable.
The [Locations](locations/) page describes all the settings the PCs visit in their adventure,
and the [Items](items/) page has information about the things they find along the way.



