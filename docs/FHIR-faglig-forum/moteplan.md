---
layout: default
title: Møter i FHIR fagforum
---

Møtene arrangeres klokken 1300-1500.

 <div class="license-details">
      <table class="license-rules">
        <tr>
          <th class="label">Dato</th>
          <th class="label">Tema</th>
          <th class="label">Agenda</th>
          <th class="label">Referat</th>
        </tr>
{% assign agendas = site.agenda %}
{% assign agenda_revers = agendas | reverse %}
{% for mote in agenda_revers %}
<tr>
  <td>{{ mote.dato }}</td>
  <td>{{ mote.title }}</td>
  <td><a href="/best-practice-material/{{ mote.url }}">{{ mote.tema }}</td>
  <td>Referat</td>
</tr>
{% endfor %}