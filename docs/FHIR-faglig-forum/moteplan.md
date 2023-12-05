---
layout: default
title: Møter i FHIR fagforum
---

## Møteplan

{% for mote in site.agenda %}
  <p>{{ mote.dato }} - {{ mote.title }} - <a href="{{ mote.url }}">{{ mote.tema }}</a></p>
{% endfor %}