---
layout: default
title: Møter i FHIR fagforum
---

Møtene arrangeres klokken 1300-1500.

Dato|Tema|Agenda|Referat
-|-|-|-
{% assign agendas = site.agenda %}
{% assign agenda_revers = agendas | reverse %}

{% for mote in agenda_revers %}
{{ mote.dato }} | {{ mote.title }} | <a href="/best-practice-material/{{ mote.url }}">{{ mote.tema }}</a> |
{% endfor %}