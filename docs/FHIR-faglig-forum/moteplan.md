---
layout: default
title: Møter i FHIR fagforum
---

## Møteplan

{% assign agendas = site.agenda %}
{% assign agenda_revers = agendas | reverse %}

{% for mote in agenda_revers %}
  <p>{{ mote.dato }} - {{ mote.title }} - <a href="{{ mote.url }}">{{ mote.tema }}</a></p>
{% endfor %}