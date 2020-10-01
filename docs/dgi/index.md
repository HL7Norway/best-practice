# Den gode implementasjonsguide

_Placeholder - Under arbeid_

Prosjekt: [https://github.com/HL7Norway/best-practice/projects/3 ](https://github.com/HL7Norway/best-practice/projects/3)

Issues: [https://github.com/HL7Norway/best-practice/issues?q=is%3Aissue+is%3Aopen+label%3ADGI](https://github.com/HL7Norway/best-practice/issues?q=is%3Aissue+is%3Aopen+label%3ADGI) (tag = DGI)

## Om Den gode implementasjonsguide (DGI)

Denne veilederen gir krav og beste praksis for en HL7 FHIR implementasjonsguide (IG) for å sikre kvalitet, god lesbarhet og forståelse av innholdet.

IGer kan være gjenstand for normering av Direktoratet for e-helse, derfor er det brukt uttrykk som SKAL, SKAL IKKE, BØR, BØR IKKE, KAN, KAN IKKE i henhold til [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) slik at en IG kan testes for konformitet mot veilederen.

## Minstekrav til en implementasjonsguide

### Anvendelse

### Kontekst og historikk

IG'en SKAL oppgi hvem som aktivt forvalter den.

IGen BØR ha med informasjon om hvordan den ble tatt frem, for eksempel

- om initiativet bak, i hvilket prosjekt/program som utviklet den
- om den er en del av et større arbeide

### Profiler

### Utvidelser (extensions)

### Kodeverk

Alle _ValueSet_ SKAL være med i IGen.

(DISKUSJON: Eksterne ValueSet mener jeg trygt kan tas med, da de skal være versjonshåndterte og gjør mest sannsynlig IGen bedre )

Alle _CodeSystem_ og _NamingSystem_ KAN være med, hvis ikke SKAL det oppgis referanser.  

### Eksempler

IGen BØR inneholde eksempler på bruk av profilene i form av JSON og/eller XML.

### Publisering

IGen SKAL være publisert åpent og fritt tilgjengelig på internett.

(TODO: Se etter prinsipper fra OpenAPI)

### Forvaltning og kontaktinformasjon

Det SKAL oppgis kontaktinformasjon til forvalteren og hvordan man kan melde inn ønsker om endringer, feil i dokumentasjon og lignende. Slike ønsker SKAL være tilgjengelig for alle i form av en _issue tracker_, eksempelvis på GitHub eller annet egnet verktøy.

## Krav for IG som spesifiserer et API

### (Prinsipper fra Open API)
### Queries
### Operations

## Krav for IG som skal normeres av Direktoratet for e-helse

### Veileder

### Retningslinje

(TODO Spesielle krav til versjonskontroll)

IGen SKAL være aktivt forvaltet. Se punkt over om _Forvaltning og kontaktinformasjon_.

### Anbefalt standard

Som for _Retningslinje_. I tillegg:

IGen SKAL ha en formell forside i form av en PDF med oppsummering av IGen og henvisning til IGens øvrige publiserte dokumentasjon.

### Obligatorisk standard (standard i forskrift)

Samme krav som _Anbefalt standard_. I tillegg:

TODO

## Krav for IG som skal normeres av HL7 Norge

TODO
