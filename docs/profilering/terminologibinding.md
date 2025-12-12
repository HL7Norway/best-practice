---
layout: default
title: Terminologibinding i FHIR
nav_order: 4
parent: Nasjonalt profileringshierarki
---

## Terminologibinding i FHIR

En informasjonsmodell vil ha både kodede og ikke-kodede informasjonselementer. Et ikke-kodet informasjonselement kan ha tekst-, tall- eller datobaserte verdier. Et kodet informasjonselement krever en kodet verdi hvor verdien må være et av et sett av forhåndsdefinerte koder. I FHIR kaller vi dette settet av lovlige koder for et verdisett. Kodene i et verdisett hentes fra et kodeverk eller en terminologi. Terminologibinding definerer nettopp hvilke koder som er tillatt å bruke i et kodede informasjonselementet i en informasonsmodell.  

### Bruk av verdisett (valueset)  

Vanligvis er lovlige koder for et administrativt informasjonselement bundet til kodene i Volven-kodeverk eller et informasjonselement for prosedyrer bundet til alle kodene i NCSP, NCMP eller NCRP. Et verdisett vil imidlertid ikke alltid inneholde alle kodene i et kodeverk. Et verdisett kan også inneholde et subsett av koder fra et kodeverk og også en kombinasjon av koder fra ulike kodeverk. Et verdisett vil typisk implementeres i et klinisk fagsystem i form av en drop-down box med gyldige koder for den gitte konteksten.

### FHIR terminologimodul

FHIR har en terminlogimodul som definerer forholdet mellom de sentrale ressursene anvendt for terminologibinding.

Les mer om FHIR terminologimodul her: [Terminology-module - FHIR v4.3.0](http://www.hl7.org/fhir/terminology-module.html)

### Terminologibinding

Når vi angir hvilke koder som kan benyttes i et informasjonselement i FHIR, kaller vi dette for *terminologibinding*. Et informasjonselement i FHIR kan bindes mot alle kodene i et kodeverk for fra Volven, eller mot et større kodeverk som ICD-10 (diagnoser) eller NCMP (prosedyrer). Et verdisett kan også inneholde kun et subsett av koder som finnes i et kodeverk – det er spesielt aktuelt ved bruk av terminologien SNOMED CT som inneholder ca 450 000 begreper og inkluderer alt fra anatomiske lokasjoner, prosedyrer, diagnoser til administrative koder og landkoder. Da er det en funksjonell/ klinisk oppgave å identifisere nøyaktig hvilke koder som skal være med i et slikt verdisett. Et verdisett kan også kombinere kodeverdier fra ulike kodeverk og terminologier som lovlige verdier i bindingen mot et informasjonselement. 

Bindingen mellom informasjonselement skjer via FHIR datatypene CodeableReference (R5), CodeableConcept, Coding og Code. Coding-datatypen er den sentrale ressursen for unikt å definere anvendt kode ved hjelp av attributter som system (kodeverk), version, code og displaytekst). CodeableConcept har en 0..* - relasjon til Coding og gir dermed muligheten for å definere et begrep ved hjelp av koder fra ulike kodeverk, eller eventuelt kun representere begrepet ved hjelp av en tekst-string.

Les mer om datatypene her:
[Datatypes - FHIR v4.3.0](http://www.hl7.org/fhir/datatypes.html) 

#### Binding strength

FHIR standarden har en del anbefalinger for bruk av kodeverk og terminologi definert opp som en del av standarden. Anbefalingene av kodeverk og terminologi kommer på fire nivåer (binding strengths)  - required, extensible, preferred og example. For required er det obligatorisk å benytte kodeverk definert av FHIR for å være kompatible med FHIR, mens eksempel-bindinger uten noen form for anbefaling. Merk at for eksempel SNOMED CT-koder aldri vil være mer enn et eksempel i internasjonale FHIR-bruk fordi land uten medlemskap i SNOMED International ikke har rettigheter til å bruke de.  

Les mer om binding strength her:
[Valueset-binding-strength](http://hl7.org/fhir/R4B/valueset-binding-strength.html)

##### Beslutningsveiledning for binding strength

Valg av riktig binding strength er viktig for å sikre interoperabilitet samtidig som man tillater nødvendig fleksibilitet. Her er en praktisk veiledning:

###### Required (påkrevd)

- **Når brukes:** Kun for verdier som ALDRI skal utvides eller endres
- **Validering:** Verdien MÅ komme fra det angitte verdisettet, ellers feiler validering
- **Typiske bruksområder:**
  - FHIR infrastrukturkoder (f.eks. `Patient.gender`, `Observation.status`)
  - Administrative verdier definert i FHIR-standarden
  - Verdier som alle implementasjoner må forstå for å fungere korrekt
- **FSH-eksempel:**

```fsh
* gender from http://hl7.org/fhir/ValueSet/administrative-gender (required)
```

###### Extensible (utvidbar)

- **Når brukes:** For nasjonale eller domenespesifikke standarder som bør følges, men hvor lokale tilpasninger kan være nødvendige
- **Validering:** Hvis en passende kode finnes i verdisettet MÅ den brukes. Lokale koder kan kun brukes hvis ingen passende kode finnes
- **Typiske bruksområder:**
  - Nasjonale kodeverk (f.eks. Volven-kodeverk)
  - Diagnosekoder (ICD-10, ICPC-2)
  - Prosedyrekoder (NCMP, NCSP, NCRP)
- **FSH-eksempel:**

```fsh
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status (extensible)
* code from http://ehelse.no/fhir/ValueSet/volven-9151 (extensible)
```

###### Preferred (foretrukket)

- **Når brukes:** For anbefalinger og veiledning uten validering
- **Validering:** Ingen - verdiene valideres ikke, men verdisettet viser hva som anbefales
- **Typiske bruksområder:**
  - Språkkoder (ISO 639)
  - Veiledende kodeverk
  - Situasjoner hvor man ønsker å foreslå verdier uten å tvinge dem
- **FSH-eksempel:**

```fsh
* communication.language from http://hl7.org/fhir/ValueSet/languages (preferred)
```

###### Example (eksempel)

- **Når brukes:** Kun for illustrasjon og dokumentasjon
- **Validering:** Ingen - verdiene valideres ikke
- **Typiske bruksområder:**
  - Demonstrasjon av mulige verdier
  - Når det ikke finnes standardiserte kodeverk ennå
  - Dokumentasjon av potensielle verdier
- **FSH-eksempel:**

```fsh
* category from http://hl7.org/fhir/ValueSet/observation-category (example)
```

##### Beslutningstre for valg av binding strength

Følg disse spørsmålene i rekkefølge:

1. **Er dette en FHIR infrastrukturkode eller status-verdi?**
   - → Ja: Bruk **required**

2. **Må alle implementasjoner forstå og håndtere koden for at systemet skal fungere?**
   - → Ja: Bruk **required**

3. **Finnes det en nasjonal standard eller et kodeverk som alle implementasjoner bør følge?**
   - → Ja: Bruk **extensible**

4. **Er dette kun en anbefaling uten behov for validering?**
   - → Ja: Bruk **preferred**

5. **Er dette kun ment som eksempler eller illustrasjon?**
   - → Ja: Bruk **example**

##### Praktiske råd

- **Unngå overbruk av required:** Required-bindinger gjør profiler rigide og kan hindre fremtidig utvidelse
- **Extensible er vanligst for nasjonale profiler:** Dette balanserer standardisering med lokal fleksibilitet
- **Dokumenter lokale utvidelser:** Hvis extensible brukes, dokumenter hvordan lokale koder skal håndteres
- **Vurder fremtidig utvikling:** Velg binding strength som tillater fremtidig evolusjon av kodeverket

### Kilder og prinsipper

Administrative og helsefaglige kodeverk som er i bruk i sektoren i dag Norge er listet på [Volven.no](www.volven.no)

Dersom det ikke finnes nasjonalt standardiserte koder for informasjonen man ønsker å utveksle skal det etableres dialog med Direktoratet for e-helse Avdeling kodeverk og terminologi – for å sikre utvikling av standardiserte kodeverk.

Det er utarbeidet noen generelle prinsipper som ser på forholdet mellom FHIR og kodeverk og terminologi, da med spesielt fokus på ontologibaserte terminologier som SNOMED CT. Les mer om prinsippene ved å følge linken her:

[Les mer om prinsipper for bruk av FHIR og terminologi](prinsipper_kodeverk.md)


[Les mer om implementering av CodeSystem-ressurs, ValueSet og OID-er her](codesystem.md)

- [Volven](codesystem.md#kodeverk-fra-volvenno)
- [Måleenhet](ucum.md)
- [SNOMED CT](snomed-ct.md)

