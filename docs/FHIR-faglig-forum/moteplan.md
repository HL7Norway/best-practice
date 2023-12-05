---
layout: default
title: Møter i FHIR fagforum
---

## Møteplan

{% assign agendas = site.agenda %}
{{ agendas | reverse | join: ", " }}
{% for mote in agendas %}
  <p>{{ mote.dato }} - {{ mote.title }} - <a href="{{ mote.url }}">{{ mote.tema }}</a></p>
{% endfor %}