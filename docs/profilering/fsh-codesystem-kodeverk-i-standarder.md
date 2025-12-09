---
layout: default
title: Kodeverk i standarder (FSH)
nav_order: 5
parent: FHIR Shorthand
---

# Kodeverk i standarder (FSH)

Denne guiden forklarer hvordan man oppretter FSH-filer for CodeSystem basert på kodeverk fra Helsedirektoratets "[Kodeverk i standarder](https://finnkode.helsedirektoratet.no/adm/collections)".

## Oversikt

Helsedirektoratet publiserer offisielle kodeverk som brukes i norsk helsesektor. Disse kodeverkene har:
- Et **kodeverksnummer** (f.eks. 1101, 8261, 9151)
- Et **navn** (f.eks. "Ja, nei")
- En **OID** (Object Identifier) som er den unike identifikatoren

## Grunnleggende struktur

```fsh
CodeSystem: [NavnPåCodeSystem]
Id: no-kodeverk-[nummer].codesystem
Title: "[nummer] [Navn på kodeverk]"
Description: "[Beskrivelse av hva kodeverket inneholder]"
* ^url = "http://helsedir.no/fhir/CodeSystem/no-kodeverk-[nummer]"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:[OID]"
* ^status = #active
* ^date = "[YYYY-MM-DD]"
* ^publisher = "Helsedirektoratet"
* ^content = #complete
* #[kode] "[display]"
```

## Identifisering - kritiske elementer

### identifier.system

`identifier.system` skal **alltid** være:
```fsh
* ^identifier.system = "urn:ietf:rfc:3986"
```

Dette er et standardformat som indikerer at identifikatorverdien er en URI eller OID i henhold til RFC 3986.

### identifier.value

`identifier.value` skal inneholde OID-en til kodeverket i URN-format:
```fsh
* ^identifier.value = "urn:oid:[OID]"
```

**Format:** `urn:oid:` etterfulgt av OID-en til kodeverket.

**Eksempler:**
- Kodeverk 1101: `urn:oid:2.16.578.1.12.4.1.1.1101`
- Kodeverk 8261: `urn:oid:2.16.578.1.12.4.1.1.8261`
- Kodeverk 9151: `urn:oid:2.16.578.1.12.4.1.1.9151`

### Hvordan finne OID

1. Gå til [Helsedirektoratets Kodeverk i standarder](https://finnkode.helsedirektoratet.no/adm/collections)
2. Finn ditt kodeverk i listen
3. OID-en er oppgitt i kolonnen "OID" eller i detaljvisningen
4. Standard mønster: `2.16.578.1.12.4.1.1.[kodeverksnummer]`

### URL vs Identifier

**Viktig distinksjon:**

- **`^url`**: Den canonical URL-en som brukes for å referere til kodeverket i FHIR-kontekst
  - Format: `http://helsedir.no/fhir/CodeSystem/no-kodeverk-[nummer]`
  - Brukes i ValueSet-referanser og andre FHIR-ressurser
  
- **`^identifier`**: Den offisielle OID-identifikatoren fra Helsedirektoratet
  - Format: `urn:oid:2.16.578.1.12.4.1.1.[nummer]`
  - Brukes for interoperabilitet med eldre systemer og meldingsformat

Begge er nødvendige for å sikre korrekt identifisering på tvers av ulike systemer.

## Komplett eksempel: Kodeverk 1101 "Ja, nei"

```fsh
CodeSystem: NoKodeverk1101
Id: no-kodeverk-1101.codesystem
Title: "1101 Ja, nei"
Description: "Dette kodeverket inneholder koder for å angi svar Ja eller Nei."
* ^url = "http://helsedir.no/fhir/CodeSystem/no-kodeverk-1101"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.578.1.12.4.1.1.1101"
* ^status = #active
* ^date = "2020-12-04"
* ^publisher = "Helsedirektoratet"
* ^content = #complete
* #1 "Ja"
* #2 "Nei"
```

## Navnekonvensjoner

### CodeSystem navn (FSH-navn)
- **Format:** `NoKodeverk[nummer]`
- **Eksempel:** `NoKodeverk1101`, `NoKodeverk8261`
- **PascalCase** uten bindestreker

### Id
- **Format:** `no-kodeverk-[nummer].codesystem`
- **Eksempel:** `no-kodeverk-1101.codesystem`
- **Små bokstaver** med bindestreker

### Title
- **Format:** `"[nummer] [Navn]"`
- **Eksempel:** `"1101 Ja, nei"`
- Bruk eksakt navn fra Helsedirektoratet

## Metadata-elementer

### Obligatoriske elementer

```fsh
* ^url = "http://helsedir.no/fhir/CodeSystem/no-kodeverk-[nummer]"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:[OID]"
* ^status = #active
* ^publisher = "Helsedirektoratet"
* ^content = #complete
```

### Anbefalte tilleggselementer

```fsh
* ^version = "1.0.0"
* ^date = "YYYY-MM-DD"
* ^experimental = false
* ^copyright = "Helsedirektoratet"
* ^caseSensitive = false
* ^contact.name = "Helsedirektoratet"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.helsedirektoratet.no"
```

## Definere koder

Kodeverk-koder defineres med følgende syntaks:

```fsh
* #[kode] "[display-tekst]"
```

**Eksempel:**
```fsh
* #1 "Ja"
* #2 "Nei"
* #3 "Ukjent"
```

### Koder med hierarki

For kodeverk med hierarkiske strukturer:

```fsh
* #A "Hovedkategori A"
* #A.1 "Underkategori A.1"
* #A.2 "Underkategori A.2"
* #B "Hovedkategori B"
```

### Koder med definisjoner

Legg til definisjoner for å gi mer kontekst:

```fsh
* #1 "Ja"
  * ^definition = "Positivt svar - bekreftelse"
* #2 "Nei"
  * ^definition = "Negativt svar - avkreftelse"
```

## Bruk i ValueSets

For å referere til kodeverket i et ValueSet:

```fsh
ValueSet: JaNeiValueSet
Id: ja-nei-valueset
Title: "Ja/Nei ValueSet"
Description: "ValueSet for ja/nei svar"
* ^url = "http://hl7.no/fhir/ig/bpe/ValueSet/ja-nei-valueset"
* include codes from system http://helsedir.no/fhir/CodeSystem/no-kodeverk-1101
```

Eller for å inkludere spesifikke koder:

```fsh
* http://helsedir.no/fhir/CodeSystem/no-kodeverk-1101#1 "Ja"
* http://helsedir.no/fhir/CodeSystem/no-kodeverk-1101#2 "Nei"
```

## Referanser

- [Helsedirektoratet - Kodeverk i standarder](https://www.helsedirektoratet.no/standarder/kodeverk-i-standarder)
- [FHIR CodeSystem dokumentasjon](https://www.hl7.org/fhir/codesystem.html)
- [OID Registry for Norge](https://volven.no)
- [FSH School - CodeSystem](https://fshschool.org/docs/sushi/codeSystem/)

## Eksempler på andre kodeverk

### Kodeverk 8261 - Type kontaktinformasjon

```fsh
CodeSystem: NoKodeverk8261
Id: no-kodeverk-8261.codesystem
Title: "8261 Type kontaktinformasjon"
Description: "Kodeverk for å angi type kontaktinformasjon"
* ^url = "http://helsedir.no/fhir/CodeSystem/no-kodeverk-8261"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.578.1.12.4.1.1.8261"
* ^status = #active
* ^publisher = "Helsedirektoratet"
* ^content = #complete
* #HP "Hjemmetelefon"
* #WP "Arbeidstelefon"
* #MC "Mobiltelefon"
* #EM "E-post"
```

### Kodeverk 9151 - Ja, nei, ukjent

```yaml
CodeSystem: NoKodeverk9151
Id: no-kodeverk-9151.codesystem
Title: "9151 Ja, nei, ukjent"
Description: "Kodeverk for å angi svar Ja, Nei eller Ukjent"
* ^url = "http://helsedir.no/fhir/CodeSystem/no-kodeverk-9151"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.578.1.12.4.1.1.9151"
* ^status = #active
* ^publisher = "Helsedirektoratet"
* ^content = #complete
* #1 "Ja"
* #2 "Nei"
* #3 "Ukjent"
```
