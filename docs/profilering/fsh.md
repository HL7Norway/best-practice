---
layout: default
title: FHIR Shorthand
nav_order: 4
parent: IG og Dokumentasjon
---

# FHIR Shorthand

PLACEHOLDER UNDER ARBEID - DISPOSISJON

FHIR Shorthand forkortes FSH, og uttales som engelsk "fish". 

Eksempel FSH:

~~~fsh
Profile:     MalPatient
Id:          mal-patient
Parent:      NoBasisPatient
Title:       "Pasient"
Description: "Informasjon om pasienten, basert på no-basis."
* ^status = #draft
* ^date = "2025-01-22"
* ^publisher = "HL7 Norge"

* identifier MS
* name.family MS
~~~

## Oppbygging av en profil

Tekst og eksempler

## Kodeverk

### CodeSystem

- [Kodeverk i standarder](fsh-codesystem-kodeverk-i-standarder.md)

### ValueSet

### Kodeverk i e-helsestandarder

(Tidligere Volven)

https://www.helsedirektoratet.no/digitalisering-og-e-helse/helsefaglige-kodeverk/kodeverk-i-e-helsestandarder

https://finnkode.helsedirektoratet.no/adm/collections

https://github.com/HL7Norway/kodeverk 

