# Personidentifikator

Bruk av personidentifikatorer i *Identifier*.

## Nasjonale identifikatorserier for personer

[Kilde](https://ehelse.no/oid-identifikatorserier-i-helse-og-omsorgstjenesten#nasjonale-identifikatorserier-for-personer)

Følgende nasjonale identifikatorserier for personer er tildelt en OID:
* fødselsnummer 2.16.578.1.12.4.1.4.1 (Tildeles av Skatteetaten)
* d-nummer 2.16.578.1.12.4.1.4.2 (Tildeles av Skatteetaten)
* felles-hjelpenummer 2.16.578.1.12.4.1.4.3 (Tildeles av Norsk helsenett)
* hpr-nummer 2.16.578.1.12.4.1.4.4 (Helsepersonellnummer, tildeles av Helsedirektoratet)
* duf-nummer 2.16.578.1.12.4.1.4.5 (Tildeles av Utlendingsdirektoratet)

## Identifier
[Kilde](https://www.hl7.org/fhir/datatypes.html#identifier)

```javascript
{
  // from Element: extension
  "use" : "<code>", // usual | official | temp | secondary (If known)
  "type" : { CodeableConcept }, // Description of identifier
  "system" : "<uri>", // The namespace for the identifier value
  "value" : "<string>", // The value that is unique
  "period" : { Period }, // Time period when id is/was valid for use
  "assigner" : { Reference(Organization) } // Organization that issued id (may be just text)
}
```

### use

Valgfritt

### type

Brukes ikke. Det brukes ikke kodeverk i de tilfellene der man har en OID for selve konseptet, som beskrevet øverst. Er det behov for å bruke et kodeverk, se [Kodeverk](codesystem.md).

### system

Navnerom for identifikator-systemet. Dette er en OID og/eller navnerom definert ved hjelp av [NamingSystem](namingsystem).

**Eksempel** `urn:oid:2.16.578.1.12.4.1.4.1` (fødselsnummer)

### value

Selve identifikatoren.

**Eksempel** `131169 00216`

> ***Diskusjon***: Skal mellomrom tillates? (Espen)

### period

Valgfritt

### assigner

Valgfritt. Denne informasjonen er implisitt for _Nasjonale identifikatorserier for personer_, men kan være aktuelt for lokale hjelpenumre. 

## Eksempel JSON

```javascript
{
  "system" : "urn:oid:2.16.578.1.12.4.1.4.1", // fødselsnummer
  "value" : "13116900216"
}
```
