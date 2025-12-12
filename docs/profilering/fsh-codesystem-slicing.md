---
layout: default
title: Slicing av kodeverk i profiler (FSH)
nav_order: 5
parent: FHIR Shorthand
---

# Slicing av kodeverk i profiler

Slicing er en teknikk i FHIR som lar deg dele opp et repeterende element (array) i en profil i navngitte "skiver" (slices), hvor hver skive kan ha egne regler og begrensninger. Dette er spesielt nyttig når du skal profilere elementer som `identifier`, som kan inneholde forskjellige typer identifikatorer med ulike regler.

## Hva er slicing?

Slicing lar deg:
- Dele opp repeterende elementer i spesifikke, navngitte deler
- Sette forskjellige regler for hver del
- Sikre at spesifikke typer data er til stede
- Gjøre det enklere å validere og forstå profiler

## Grunnleggende konsepter

### Discriminator

En **discriminator** er regelen som bestemmer hvordan FHIR skal skille mellom de ulike slices. Den består av to deler:

1. **type**: Hvilken metode som brukes for å skille slices
   - `value`: Sjekker en fast verdi i et spesifikt felt
   - `pattern`: Matcher mot et mønster
   - `type`: Basert på datatype
   - `profile`: Basert på profil
   - `exists`: Om et element eksisterer eller ikke

2. **path**: Hvilken sti i datastrukturen som skal sjekkes

### Slicing Rules

**Slicing rules** definerer hvordan slices kan brukes:
- `open`: Man kan legge til flere slices utover de definerte (standard)
- `closed`: Kun de definerte slices er tillatt
- `openAtEnd`: Nye slices kan kun legges til på slutten

## Praktisk eksempel: no-basis-Patient

La oss se på hvordan `identifier` er slic et i no-basis-Patient profilen. Her skal vi definere spesifikke slices for norske identifikatorer som fødselsnummer (FNR), D-nummer (DNR) og hjelpenummer (HNR).

### Steg 1: Definere slicing på hovedelementet

Først definerer vi slicing-reglene på `identifier` elementet:

```fsh
Profile: NoBasisPatient
Parent: Patient
Id: no-basis-Patient
Title: "no-basis-Patient"
Description: "Basisprofil for norsk pasientinformasjon"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Ulike typer identifikatorer for personer i Norge"
* identifier ^slicing.ordered = false
```

**Forklaring:**
- `discriminator.type = #value`: Vi skal matche på en eksakt verdi
- `discriminator.path = "system"`: Vi skiller slices basert på `identifier.system` feltet
- `rules = #open`: Man kan legge til flere identifikatorer utover de vi definerer
- `ordered = false`: Rekkefølgen på identifikatorene spiller ingen rolle

### Steg 2: Definere individuelle slices

Nå definerer vi hver slice med sine spesifikke regler:

```fsh
* identifier contains
    FNR 0..1 and
    DNR 0..1 and
    HNR 0..1 and
    DUF 0..1

* identifier[FNR] ^short = "Fødselsnummer (FNR)"
* identifier[FNR] ^definition = "Fødselsnummer for personer bosatt i Norge, utstedt av Folkeregisteret"
* identifier[FNR].system 1..1
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)
* identifier[FNR].value 1..1

* identifier[DNR] ^short = "D-nummer (DNR)"
* identifier[DNR] ^definition = "D-nummer for personer uten fødselsnummer, midlertidig identifikator"
* identifier[DNR].system 1..1
* identifier[DNR].system = "http://hl7.no/fhir/NamingSystem/DNR" (exactly)
* identifier[DNR].value 1..1

* identifier[HNR] ^short = "Hjelpenummer (HNR)"
* identifier[HNR] ^definition = "Midlertidig hjelpenummer for person uten FNR eller DNR"
* identifier[HNR].system 1..1
* identifier[HNR].system = "http://hl7.no/fhir/NamingSystem/HNR" (exactly)
* identifier[HNR].value 1..1

* identifier[DUF] ^short = "DUF-nummer"
* identifier[DUF] ^definition = "DUF-nummer (Database for utlendingsforvaltning)"
* identifier[DUF].system 1..1
* identifier[DUF].system = "http://hl7.no/fhir/NamingSystem/DUF" (exactly)
* identifier[DUF].value 1..1
```

**Forklaring:**
- `contains`: Definerer hvilke slices som eksisterer og deres kardinalitet
- `[SliceName]`: Setter regler for en spesifikk slice
- `system 1..1`: System er obligatorisk for hver slice
- `system = "url" (exactly)`: Systemet MÅ være denne eksakte verdien
- `value 1..1`: Verdien er obligatorisk når slicen brukes

## Eksempel: Instans som bruker slices

Slik ser en pasient-instans ut som bruker disse slices:

```fsh
Instance: EksempelPasient
InstanceOf: NoBasisPatient
Description: "Eksempel på pasient med FNR og HNR"

* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR"
* identifier[FNR].value = "12345678901"

* identifier[HNR].system = "http://hl7.no/fhir/NamingSystem/HNR"
* identifier[HNR].value = "HPR12345"

* name.family = "Eksempel"
* name.given = "Ola"
```

## Vanlige mønstre for slicing

### Mønster 1: Slicing på Coding.system

For å slice et element med kodeverk basert på hvilket kodeverk som brukes:

```fsh
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open

* category contains 
    labCategory 1..1

* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
```

### Mønster 2: Slicing på Extension URL

For å definere spesifikke extensions:

```fsh
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

* extension contains
    middlename 0..1 and
    citizenship 0..*

* extension[middlename] ^short = "Mellomnavn"
* extension[middlename].url = "http://hl7.no/fhir/StructureDefinition/no-basis-middlename"
* extension[middlename].value[x] only string

* extension[citizenship] ^short = "Statsborgerskap"
* extension[citizenship].url = "http://hl7.no/fhir/StructureDefinition/no-basis-citizenship"
* extension[citizenship].value[x] only CodeableConcept
```

### Mønster 3: Slicing på type

For elementer som kan ha forskjellige datatyper:

```fsh
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #closed

* value[x] contains
    valueString 0..1 and
    valueInteger 0..1

* valueString only string
* valueInteger only integer
```

## Beste praksis

### 1. Velg riktig discriminator

- **value**: Når du har en eksakt verdi å matche på (f.eks. `identifier.system`)
- **pattern**: Når du trenger mer fleksibel matching
- **type**: Når slicing baseres på datatype
- **exists**: Når tilstedeværelsen av et element er det som skiller

### 2. Sett passende kardinalitet

```fsh
* identifier contains
    FNR 0..1 and  // Maks én FNR
    DNR 0..1 and  // Maks ett DNR
    HNR 0..*      // Kan ha flere HNR
```

### 3. Bruk `exactly` for faste verdier

```fsh
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)
```

Dette sikrer at verdien er nøyaktig den angitte, ikke bare en standardverdi.

### 4. Dokumenter slices godt

```fsh
* identifier[FNR] ^short = "Fødselsnummer (FNR)"
* identifier[FNR] ^definition = "Fødselsnummer for personer bosatt i Norge..."
* identifier[FNR] ^comment = "FNR består av 11 siffer..."
```

### 5. Vurder slicing rules nøye

- **open** (standard): Tillater flere identifikatorer utover de definerte
- **closed**: Kun de definerte slices er tillatt - bruk med forsiktighet
- **openAtEnd**: Balanser mellom struktur og fleksibilitet

## Feilsøking

### Problem: "No matching slice found"

Vanlige årsaker:
1. Verdien i discriminator-path matcher ikke slice-definisjonen
2. Feil system-URL
3. Manglende obligatoriske felt

**Løsning:**
```fsh
// Sørg for at system-verdien matcher nøyaktig
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)
```

### Problem: "Element does not match any slice"

Dette skjer når:
- Slicing rules er satt til `closed`
- Ingen slice matcher dataene

**Løsning:**
```fsh
// Bruk open rules hvis du vil tillate andre identifikatorer
* identifier ^slicing.rules = #open
```

### Problem: Slicing på repetering element (0..1 eller 1..1)

I tidlige versjoner av no-basis var det feil der man forsøkte å slice elementer som ikke var repeterende. Dette ble fikset i versjon 2.0.17.

**Løsning:** Sørg for at elementet du slicer har kardinalitet som tillater repetisjon (`0..*` eller `1..*`).

## Avanserte teknikker

### Reslicing

Reslicing lar deg dele opp en eksisterende slice ytterligere:

```fsh
* identifier contains FNR 0..*
* identifier[FNR] ^slicing.discriminator.type = #value
* identifier[FNR] ^slicing.discriminator.path = "use"
* identifier[FNR] ^slicing.rules = #open

* identifier[FNR] contains
    official 0..1 and
    temp 0..*

* identifier[FNR][official].use = #official
* identifier[FNR][temp].use = #temp
```

### Multiple discriminators

Du kan bruke flere discriminators for å skille slices:

```fsh
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.discriminator[1].type = #value
* identifier ^slicing.discriminator[1].path = "type.coding.code"
* identifier ^slicing.rules = #open
```

## Ressurser

- [FHIR Slicing dokumentasjon](http://hl7.org/fhir/profiling.html#slicing)
- [FSH School - Slicing](https://fshschool.org/docs/sushi/slicing/)
- [no-basis-Patient profil](https://simplifier.net/hl7norwayno-basis/nobasispatient)
- [HL7 Norge GitHub](https://github.com/HL7Norway/basisprofiler-r4)

## Oppsummering

Slicing er et kraftig verktøy for å:
1. Strukturere repeterende elementer
2. Sette spesifikke regler for ulike typer data
3. Gjøre profiler mer presise og enklere å validere

**Husk:**
- Definer slicing på hovedelementet først
- Bruk riktig discriminator-type for ditt behov
- Sett passende kardinalitet og regler
- Dokumenter godt hva hver slice representerer
- Test profilen med representative eksempler

