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
   - Bruk vanlig punkt-notasjon for å navigere: `"system"`, `"coding.code"`
   - Bruk `"$this"` når discriminatoren skal gjelde selve elementet (f.eks. ved slicing av CodeableConcept eller choice-typer)

### Slicing Rules

**Slicing rules** definerer hvordan slices kan brukes:

- `open`: Man kan legge til flere slices utover de definerte (standard) - anbefalt for fleksibilitet
- `closed`: Kun de definerte slices er tillatt - bruk kun når du må garantere at ingen andre verdier finnes
- `openAtEnd`: Nye slices kan kun legges til på slutten - nyttig når de definerte slices må komme først

### Ordered

**Ordered** kontrollerer om rekkefølgen på slices har betydning:

- `ordered = false` (standard): Rekkefølgen spiller ingen rolle - bruk for identifier, category, osv.
- `ordered = true`: Rekkefølgen er viktig - bruk f.eks. for `name.given` der første navn har spesiell betydning

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

**Note om slice-navn:** Slice-navnene (FNR, DNR, osv.) brukes kun i profildefinisjon og validering. I faktiske JSON/XML-instanser vises ikke slice-navnet - FHIR validator bruker discriminator-reglene for å bestemme hvilken slice hver identifikator tilhører.

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

### Mønster 1: Slicing på CodeableConcept med pattern

For å slice et CodeableConcept basert på hvilket kodeverk som brukes. Pattern-discriminator er nyttig når du vil matche på en del av en kompleks struktur:

```fsh
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open

* category contains labCategory 1..1

// Bruk pattern for å matche både system og code
* category[labCategory] ^patternCodeableConcept.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[labCategory] ^patternCodeableConcept.coding.code = #laboratory

// Alternativt: bruk binding for enklere tilfeller
// * category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
```

**Når bruke pattern vs value:**
- **pattern**: Matcher på deler av en kompleks struktur (anbefalt for CodeableConcept)
- **value**: Krever eksakt match på hele verdien (brukes typisk for enkle felter som system eller url)

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

### 1. Vurder Must Support (MS) på slices

Must Support flagget indikerer at implementasjoner må være i stand til å håndtere denne slicen:

```fsh
* identifier contains
    FNR 0..1 MS and  // Systemer MÅ støtte FNR hvis det finnes
    DNR 0..1 MS and  // Systemer MÅ støtte DNR hvis det finnes
    HNR 0..1         // HNR er valgfritt å støtte
```

**Når bruke MS:**
- På slices som er kritiske for forretningslogikk
- På slices som andre systemer må kunne lese og behandle
- Når du lager en nasjonal eller regional standard

**Når IKKE bruke MS:**
- På slices som kun er informative
- I basisprofilering der du vil være åpen for ulike implementasjoner

### 2. Velg riktig discriminator

- **value**: Når du har en eksakt verdi å matche på (f.eks. `identifier.system`)
- **pattern**: Når du trenger mer fleksibel matching
- **type**: Når slicing baseres på datatype
- **exists**: Når tilstedeværelsen av et element er det som skiller

### 3. Sett passende kardinalitet

```fsh
* identifier contains
    FNR 0..1 and  // Maks ett FNR
    DNR 0..1 and  // Maks ett DNR
    HNR 0..*      // Kan ha flere HNR
```

### 4. Bruk `exactly` for faste verdier

```fsh
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)
```

Dette sikrer at verdien er nøyaktig den angitte, ikke bare en standardverdi.

### 5. Dokumenter slices godt

```fsh
* identifier[FNR] ^short = "Fødselsnummer (FNR)"
* identifier[FNR] ^definition = "Fødselsnummer for personer bosatt i Norge..."
* identifier[FNR] ^comment = "FNR består av 11 siffer..."
```

### 6. Vurder slicing rules nøye

- **open** (standard): Tillater flere identifikatorer utover de definerte
- **closed**: Kun de definerte slices er tillatt - bruk med forsiktighet
- **openAtEnd**: Balanser mellom struktur og fleksibilitet

## Feilsøking

### Problem: "No matching slice found" eller "This element does not match any known slice"

**Validator-melding:** `"Slice 'X': a matching slice is required, but not found"`

Vanlige årsaker:
1. Verdien i discriminator-path matcher ikke slice-definisjonen
2. Feil system-URL (sjekk for skrivefeil eller feil protokoll http vs https)
3. Manglende obligatoriske felt i slicen
4. Feil bruk av pattern når value skulle brukes (eller omvendt)

**Løsning:**
```fsh
// Sørg for at system-verdien matcher nøyaktig
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)

// For pattern-based slicing, sjekk at alle pattern-elementer er satt
* category[labCategory] ^patternCodeableConcept.coding.system = "http://..."
* category[labCategory] ^patternCodeableConcept.coding.code = #laboratory
```

### Problem: "Element does not match any slice" med closed slicing

**Validator-melding:** `"The slice definition does not match any elements"`

Dette skjer når:
- Slicing rules er satt til `closed` og det finnes data som ikke matcher noen definert slice
- Du har glemt å definere en nødvendig slice

**Løsning:**
```fsh
// Endre fra closed til open hvis du vil tillate andre identifikatorer
* identifier ^slicing.rules = #open

// Eller definer manglende slice
* identifier contains localId 0..*
* identifier[localId].system = "http://example.org/local-id" (exactly)
```

### Problem: Slicing på ikke-repeterende element (0..1 eller 1..1)

**Validator-melding:** `"Cannot slice element with max cardinality = 1"`

I tidlige versjoner av no-basis var det feil der man forsøkte å slice elementer som ikke var repeterende. Dette ble fikset i versjon 2.0.17.

**Løsning:** Sørg for at elementet du slicer har kardinalitet som tillater repetisjon (`0..*` eller `1..*`).

### Problem: "Minimum cardinality in slice is greater than cardinality in base"

**Validator-melding:** `"Slice 'X': minimum required = 1, but the minimum cardinality of the base is 0"`

Dette skjer når du prøver å gjøre en valgfri slice obligatorisk på en måte som bryter med base-profilen.

**Løsning:**
```fsh
// FEIL: Kan ikke kreve FNR når identifier selv er 0..*
* identifier contains FNR 1..1  // Dette vil feile

// RIKTIG: Bruk 0..1 og legg til constraint hvis nødvendig
* identifier contains FNR 0..1
* obeys fnr-required  // Bruk invariant for forretningsregler
```

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

## Slicing vs Constraints (Invariants)

Det er viktig å forstå når man skal bruke slicing og når man skal bruke constraints (invariants).

### Bruk slicing når:

- Du vil definere forskjellige regler for forskjellige typer av samme element
- Du vil sikre at spesifikke verdier er til stede (f.eks. at FNR-identifier finnes)
- Du vil dokumentere de ulike typene som kan forekomme
- Validering skal skje automatisk basert på innholdet

**Eksempel:**
```fsh
// Bruk slicing for å kreve at FNR-identifier finnes
* identifier contains FNR 1..1
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR" (exactly)
```

### Bruk constraints når:

- Du har komplekse forretningsregler som ikke kan uttrykkes med slicing
- Regelen gjelder på tvers av flere elementer
- Du vil sjekke relasjoner mellom verdier

**Eksempel:**
```fsh
// Bruk constraint for komplekse regler
Invariant: fnr-or-dnr-required
Description: "Pasienten må ha enten FNR eller DNR"
Severity: #error
Expression: "identifier.where(system='http://hl7.no/fhir/NamingSystem/FNR').exists() or identifier.where(system='http://hl7.no/fhir/NamingSystem/DNR').exists()"

* obeys fnr-or-dnr-required
```

**Tommelfingerregel:** Start med slicing for strukturell validering, bruk constraints for forretningslogikk.

## Testing av slices

Det er viktig å teste at slicing fungerer som forventet:

### 1. Positive tester

Opprett eksempler som SKAL validere OK:

```fsh
Instance: ValidPatientWithFNR
InstanceOf: NoBasisPatient
Description: "Gyldig pasient med FNR - skal validere OK"
* identifier[FNR].system = "http://hl7.no/fhir/NamingSystem/FNR"
* identifier[FNR].value = "12345678901"
* name.family = "Nordmann"
```

### 2. Negative tester

Opprett eksempler som SKAL feile validering:

```fsh
Instance: InvalidPatientWrongSystem
InstanceOf: NoBasisPatient
Description: "Ugyldig pasient med feil system - skal feile validering"
* identifier[FNR].system = "http://wrong-system.example.org"  // Feil system
* identifier[FNR].value = "12345678901"
* name.family = "Nordmann"
```

### 3. Valider med SUSHI og HL7 Validator

```bash
# Generer StructureDefinition med SUSHI
sushi .

# Valider eksempel-instanser
java -jar validator_cli.jar examples/ValidPatientWithFNR.json -ig output/
```

### 4. Inspiser snapshot

Åpne den genererte StructureDefinition og sjekk snapshot-seksjonen for å se at:
- Slicing er definert på riktig element
- Alle slices har riktige discriminatorer
- Kardinalitet er korrekt for hver slice

### Tips for testing:

- Test alle definerte slices individuelt
- Test kombinasjoner av slices
- Test med verdier som IKKE skal matche noen slice (når rules = open)
- Test kardinalitets-grenser (min og max)
- Test med manglende obligatoriske felt

## Navnekonvensjoner for slices

**Internasjonale anbefalinger (HL7 International):**
- Bruk camelCase: `fnr`, `dNumber`, `helperNumber`
- Første bokstav liten
- Beskrivende navn som indikerer innhold

**Norsk praksis (no-basis):**
- Bruker ofte UPPERCASE for kjente forkortelser: `FNR`, `DNR`, `HNR`
- Dette er et akseptert nasjonalt valg for gjenkjennelighet

**Anbefaling:** Vær konsistent innenfor ditt prosjekt. For nasjonale profiler kan UPPERCASE være OK for etablerte forkortelser, mens camelCase kan være bedre for beskrivende navn.

```fsh
// Begge er OK, men vær konsistent:

// Stil 1: UPPERCASE for forkortelser
* identifier contains FNR 0..1 and DNR 0..1

// Stil 2: camelCase (mer internasjonalt)
* identifier contains fnr 0..1 and dnr 0..1 and localIdentifier 0..1
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

