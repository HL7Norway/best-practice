# Prinsipper for utvikling og bruk av norske basisprofiler.  

## Utvikling

HL7 Norge velger ressurser for basisprofiler basert på behov og ønsket bruk av FHIR-profiler i konkrete prosjekter. Den første workshopen ble gjennomført sommeren 2018 for de grunnleggende ressursene Patient, Organization og Practitioner, og HL7 Norge har etter det gjennomført flere workshoper som hver har gått gjennom et knippe ressurser.

Dersom ditt prosjekt har behov for å ta i bruk FHIR-ressurser hvor det enda ikke finnes basisprofiler, og det er behov for restriksjoner for å bruk i Norge, så ønske vi at du tar kontakt med HL7 Norge. HL7 Norge vil vurdere behov for basisprofil, og eventuelt sette opp workshop for en gjennomgang med sektor for krav til profilen. Når dette er gjennomført og oppsummert, vil profilen gå ut på høring i regi av HL7 Norge og ved godkjennelse bli offisiell norsk basisprofil.

## Design

* Åpen, minimum for å dekke alle behov
* Typiske tilpasninger
  * Identifikatorer
  * Kodeverk
  * Nasjonale ekstensjoner
* Engelsk skal brukes på tekniske elementer som attributter, extensions etc. Engelsk skal også benyttes for særnorske begreper hvis det finnes offisielle oversettelser, hvis ikke kan norsk benyttes. 

## Bruk
* "_Hvis_ du skal bruke dette, skal det brukes på _denne_ måten"
* Kommunikasjon mellom virksomheter (REST, messaging, documents) _skal_ bruke eller basere seg på basisprofilene (mange til mange, mange til én)
* Kommunikasjon i én til én-integrasjoner _bør_ basere seg på basisprofilene

## Navngivning

`no-basis-[ressursnavn]`

## Oppgaver

* Mulig flytte denne under prosjekt for Basisprofiler R4.

{% include analytics.html %}
