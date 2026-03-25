---
layout: default
title: SNOMED CT
nav_exclude: true
---

# SNOMED CT

* [Using SNOMED CT with FHIR](https://www.hl7.org/fhir/snomedct.html)

## Utvikling av metode

* Prosjekt: [SNOMED on FHIR](https://confluence.ihtsdotools.org/display/FHIR/SNOMED+on+FHIR)
* [Implementation Guide for using SNOMED CT with FHIR](https://confluence.ihtsdotools.org/display/FHIR/Implementation+Guide+for+using+SNOMED+CT+with+FHIR)
* [Diskusjon om binding patterns](https://confluence.ihtsdotools.org/display/FHIR/Binding+patterns), se også [Terminology Bindings](https://confluence.ihtsdotools.org/display/FHIR/Terminology+Binding)


## System

```
http://snomed.info/sct
```

## Eksempel

### Condition med SNOMED CT-kode

```fsh
Instance: KroniskHosteCondition
InstanceOf: Condition
Usage: #example
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"
* code.coding = http://snomed.info/sct#68154008 "Chronic cough"
* code.text = "Kronisk hoste"
* subject = Reference(Patient/example)
* onsetDateTime = "2025-11-01"
* recordedDate = "2025-12-12"
```

**SNOMED CT best practices:**

* Bruk `CodeableConcept` med `.coding` og `.text` for å støtte både strukturert kode og lesbar tekst
* Inkluder alltid `category` for å klassifisere typen
* For norske implementasjoner: Vurder å inkludere både SNOMED CT og eventuelle nasjonale koder i samme `CodeableConcept`

