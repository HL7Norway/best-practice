---
layout: default
title: Måleenhet (UCUM)
nav_order: 7
parent: Nasjonalt profileringshierarki
---

# Måleenhet (UCUM)

## Introduksjon

UCUM (Unified Code for Units of Measure) er et standardisert kodeverk for måleenheter som brukes i FHIR for å sikre entydig representasjon av enheter på tvers av systemer. UCUM dekker alle enheter som brukes i helsevesenet, fra enkle enheter som kilogram og liter til komplekse sammensatte enheter.

* [UCUM hjemmeside](https://ucum.org/)
* [FHIR UCUM dokumentasjon](https://www.hl7.org/fhir/valueset-ucum-units.html)

## System URI

```text
http://unitsofmeasure.org
```

## Vanlige måleenheter

### Lengde og høyde

* `cm` - centimeter
* `m` - meter
* `[in_i]` - tommer (inches)

### Vekt

* `kg` - kilogram
* `g` - gram
* `mg` - milligram
* `[lb_av]` - pund (pounds)

### Volum

* `L` - liter
* `mL` - milliliter
* `dL` - desiliter

### Temperatur

* `Cel` - Celsius
* `[degF]` - Fahrenheit

### Tid

* `s` - sekunder
* `min` - minutter
* `h` - timer
* `d` - dager
* `wk` - uker
* `mo` - måneder
* `a` - år

### Blodtrykk

* `mm[Hg]` - millimeter kvikksølv

### Prosent

* `%` - prosent

### Tellinger

* `{count}` - antall/telling
* `1` - enhetsfri (ratio, skårer)

## Spesialtegn og syntaks

UCUM bruker spesielle konvensjoner:

* **Firkantparenteser `[]`**: Brukes for spesielle enheter (f.eks. `[in_i]`, `[lb_av]`)
* **Krøllparenteser `{}`**: Brukes for annotasjoner (f.eks. `{beats}`, `{breaths}`)
* **Store/små bokstaver**: UCUM er case-sensitive (`L` for liter, `l` brukes ikke)
* **Multiplikasjon**: Punktum `.` (f.eks. `kg.m`)
* **Divisjon**: Skråstrek `/` (f.eks. `mg/dL`)
* **Potens**: Tall etter enhet (f.eks. `m2` for kvadratmeter)

## Eksempler i FSH

### Enkel måling med enkelt verdi

```fsh
Instance: KroppsvektMåling
InstanceOf: Observation
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(Patient/example)
* effectiveDateTime = "2025-12-12T10:30:00+01:00"
* valueQuantity = 75 'kg' "kg"
```

### Måling med desimal

```fsh
Instance: KroppstemperaturMåling
InstanceOf: Observation
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#8310-5 "Body temperature"
* subject = Reference(Patient/example)
* effectiveDateTime = "2025-12-12T10:30:00+01:00"
* valueQuantity = 37.2 'Cel' "°C"
```

### Laboratorieverdier

```fsh
Instance: GlukoseMåling
InstanceOf: Observation
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = http://loinc.org#15074-8 "Glucose [Moles/volume] in Blood"
* subject = Reference(Patient/example)
* effectiveDateTime = "2025-12-12T08:00:00+01:00"
* valueQuantity = 5.5 'mmol/L' "mmol/L"
```

### Prosent-verdi

```fsh
Instance: OksygenmetningMåling
InstanceOf: Observation
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"
* subject = Reference(Patient/example)
* effectiveDateTime = "2025-12-12T10:30:00+01:00"
* valueQuantity = 98 '%' "%"
```

### Enhetsfri verdi (skår)

```fsh
Instance: SmerteSkår
InstanceOf: Observation
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey "Survey"
* code = http://loinc.org#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* subject = Reference(Patient/example)
* effectiveDateTime = "2025-12-12T10:30:00+01:00"
* valueQuantity = 3 '1' "poeng"
```

## Quantity datatype i FSH

Når man angir en måling med enhet i FSH, brukes følgende syntaks:

```fsh
* valueQuantity = [verdi] '[UCUM-kode]' "[display-tekst]"
```

**Viktig:**

* UCUM-koden må være i **enkle anførselstegn** `'...'`
* Display-teksten er valgfri og kan være på norsk for lesbarhet
* Verdien kan være heltall eller desimaltall (bruk punktum `.` som desimalskilletegn)

## Validering og verktøy

* **UCUM validator**: [https://ucum.nlm.nih.gov/ucum-lhc/demo.html](https://ucum.nlm.nih.gov/ucum-lhc/demo.html)
* **FHIR Validator**: Validerer automatisk UCUM-koder i Quantity-elementer
* **SUSHI**: FSH-kompilator som sjekker UCUM-syntaks

## Beste praksis

1. **Bruk alltid UCUM for måleenheter**: Ikke bruk fritekst eller lokale koder
2. **Vær nøyaktig**: Bruk korrekt UCUM-syntaks (case-sensitive)
3. **Inkluder display-tekst**: Gjør det lettere å lese for mennesker
4. **Konsistent desimalskilletegn**: Bruk punktum `.` (ikke komma)
5. **Valider koder**: Bruk UCUM validator for å sjekke at koden er gyldig

## Se også

* [Kodeverk](codesystem.md)
* [SNOMED CT](snomed-ct.md)
* [Terminologibinding i FHIR](terminologibinding.md)

