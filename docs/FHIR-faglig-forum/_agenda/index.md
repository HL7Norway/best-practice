---
layout: default
title: Møter i FHIR fagforum
---

## Møteplan

{% for mote in site.agenda %}
  <p>{{ mote.date }} - {{ mote.title }} - {{ mote.tema}} </p>
{% endfor %}