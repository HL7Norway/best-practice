# Den gode implementasjonsguide

_Placeholder - Under arbeid_

Prosjekt: [https://github.com/HL7Norway/best-practice/projects/3 ](https://github.com/HL7Norway/best-practice/projects/3)

Issues: [https://github.com/HL7Norway/best-practice/issues?q=is%3Aissue+is%3Aopen+label%3ADGI](https://github.com/HL7Norway/best-practice/issues?q=is%3Aissue+is%3Aopen+label%3ADGI) (tag = DGI)

## Om Den gode implementasjonsguide (DGI)

Denne veilederen gir krav og beste praksis for en HL7 FHIR implementasjonsguide (IG) for å sikre kvalitet, god lesbarhet og forståelse av innholdet.

IGer kan være gjenstand for normering av Direktoratet for e-helse, derfor er det brukt uttrykk som SKAL, SKAL IKKE, BØR, BØR IKKE, KAN, KAN IKKE i henhold til [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) slik at en IG kan testes for konformitet mot veilederen.

Det oppfordres om å komme med tilbakemeldinger og forslag om innhold og utforming av denne veilederen - bruk [issues](https://github.com/HL7Norway/best-practice/issues) med label _DGI_.

Kravene er minstekrav.

# Minstekrav til en implementasjonsguide

## Anvendelse

(TODO Tekst fra områdeprofiler som utkast)

Implementasjonsguiden må være klar på hvilke anvendelser den er ment å løse. Den må fortelle om den er basis for videre profilering, eller skal brukes som den er.

## Kontekst og historikk

IG'en SKAL oppgi hvem som aktivt forvalter den.

IGen BØR ha med informasjon om hvordan den ble tatt frem, for eksempel

- om initiativet bak, i hvilket prosjekt/program som utviklet den
- om den er en del av et større arbeide

## Profiler

Alle profiler SKAL være med som _StructureDefinition_.

## Utvidelser (extensions)

Alle utvidelser SKAL være med som _StructureDefinition_.

## Kodeverk

Alle _ValueSet_ SKAL være med i IGen.

(DISKUSJON: Eksterne ValueSet mener jeg trygt kan tas med, da de skal være versjonshåndterte og gjør mest sannsynlig IGen bedre )

Alle _CodeSystem_ og _NamingSystem_ KAN være med, hvis ikke SKAL det oppgis referanser.  

## Eksempler

IGen BØR inneholde eksempler på bruk av profilene i form av JSON og/eller XML.

## Versjonering

* [Versjonering implementasjonsguide](../../docs/versioning.md)

## Publisering

IGen SKAL være publisert åpent og fritt tilgjengelig på internett.

(TODO: Se etter evt gode prinsipper fra OpenAPI)
(TODO: INFORMATIVT: Lenke til publiseringsverktøy)

## Forvaltning og kontaktinformasjon

Det SKAL oppgis kontaktinformasjon til forvalteren og hvordan man kan melde inn ønsker om endringer, feil i dokumentasjon og lignende. Slike ønsker SKAL være tilgjengelig for alle i form av en _issue tracker_, eksempelvis på GitHub eller annet egnet verktøy.

# Krav for IG som spesifiserer et API

## (Prinsipper fra Open API)
## Queries
## Operations

## Publisering

(Evt spesielle krav for publisering av API-IG)

### Pakkettering

(Publisering som pakke - eller bør dette være krav til ALLE IGer?)

IGer som benyttes for API BØR publiseres som en pakke.

* [NPM Package Specification](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification)

# Krav for IG som skal normeres av Direktoratet for e-helse

## Veileder

## Retningslinje

(TODO Spesielle krav til versjonskontroll)

IGen SKAL være aktivt forvaltet. Se punkt over om _Forvaltning og kontaktinformasjon_.

## Anbefalt standard

Som for _Retningslinje_. I tillegg:

IGen SKAL ha en formell forside i form av en PDF med oppsummering av IGen og henvisning til IGens øvrige publiserte dokumentasjon.

## Obligatorisk standard (standard i forskrift)

Samme krav som _Anbefalt standard_. I tillegg:

TODO

# Krav for IG som skal normeres av HL7 Norge

TODO
