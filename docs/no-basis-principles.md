# Prinsipper for utvikling og bruk av norske basisprofiler.  

## Utvikling

HL7 Norge velger ressurser for basisprofiler basert på behov og ønsket bruk av FHIR-profiler i konkrete prosjekter. Den første workshopen ble gjennomført sommeren 2018 for de grunnleggende ressursene Patient, Organization og Practitioner, og HL7 Norge har etter det gjennomført flere workshoper som hver har gått gjennom et knippe ressurser.

Dersom ditt prosjekt har behov for å ta i bruk FHIR-ressurser hvor det enda ikke finnes basisprofiler, og det er behov for restriksjoner for å bruk i Norge, så ønsker vi at du tar kontakt med HL7 Norge. HL7 Norge vil vurdere behov for basisprofil, og eventuelt sette opp workshop for en gjennomgang med sektor for krav til profilen. Når dette er gjennomført og oppsummert, vil profilen gå ut på høring i regi av HL7 Norge og ved godkjennelse bli offisiell norsk basisprofil.


## Prinsipper for norske basisprofiler
* Grunnleggende tilpasning til bruk av FHIR i norsk helsesektor. Dette inkluderer eksisterende juridisk, organisatoriske, semantiske og tekniske krav
* Basisprofilene skal inneholde retningslinjer for identifikasjon, koding og navngivning av informasjon som er felles for de aller fleste relevante brukerhistorier
* Ekstensjoner det er behov for i de fleste relevante brukerhistoriene skal dokumenteres
* Styringen av norske basisprofiler er nasjonal og prosessen defineres av HL7 Norge
* Kravene som nedfelles i profilene skal være åpne, slik at profilene kan danne grunnlag for videre profilering

## Design

* Arver krav fra de internasjonale ressursene 
* Basisprofilene skal være åpent definert og velegnet for videre profilering. I praksis betyr det:
  * Det angis åpen "slicing" med forslag til norske kodeverk eller bruk av norske identifikatorer
	* kodeverk og identifikatorer angis med offisielle navn 
  * Det nedfelles ingen krav til kardinalitet eller must-support i basisprofilene
  * Extensions som defineres fungerer som frivillige tillegg i profilen som benyttes av implementasjoner etter behov
    * Det bør også utformes søkeparametere som gjør det mulig å søke på foreslåtte extensions
* Engelsk skal brukes på tekniske elementer som attributter, extensions etc. Engelsk skal også benyttes for særnorske begreper hvis det finnes offisielle oversettelser, hvis ikke kan norsk benyttes. 

## Bruk
* "_Hvis_ du skal bruke dette, skal det brukes på _denne_ måten"
* Kommunikasjon mellom virksomheter (REST, messaging, documents) _skal_ bruke eller basere seg på basisprofilene (mange til mange, mange til én)
* Kommunikasjon i én til én-integrasjoner _bør_ basere seg på basisprofilene

## Navngivning
`no-basis-[ressursnavn]
`
## Identifikasjon
* [Identifikasjon av Person](docs/identifier-person.md)

## Oppgaver

* Mulig flytte denne under prosjekt for Basisprofiler R4.

{% include analytics.html %}
