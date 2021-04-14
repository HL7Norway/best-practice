# Prinsipper for utvikling og bruk av norske basisprofiler

Formålet med nasjonale basisprofiler er å sikre langsiktig semantisk samhandlingsevne ved at ibruktakelse av HL7 FHIR ved å koordinere av profilering av ressurser på nasjonalt nivå.  
Basisprofilene skal nedfelle en felles måte å ta i bruk HL7 FHIR i Norge og kan brukes ved videre profilering av områdeprofiler eller i implementasjoner.

## Utvikling

HL7 Norge velger ressurser for basisprofiler basert på behov og ønsket bruk av FHIR-profiler i konkrete prosjekter. Den første workshopen ble gjennomført sommeren 2018 for de grunnleggende ressursene Patient, Organization og Practitioner, og HL7 Norge har etter det gjennomført flere workshoper som hver har gått gjennom et knippe ressurser.

Dersom ditt prosjekt har behov for å ta i bruk FHIR-ressurser hvor det enda ikke finnes basisprofiler, og det er behov for restriksjoner for å bruk i Norge, så ønsker vi at du tar kontakt med HL7 Norge. HL7 Norge vil vurdere behov for basisprofil, og eventuelt sette opp workshop for en gjennomgang med sektor for krav til profilen. Når dette er gjennomført og oppsummert, vil profilen gå ut på høring i regi av HL7 Norge og ved godkjennelse bli offisiell norsk basisprofil.

<img src="https://raw.githubusercontent.com/HL7Norway/basisprofiler-r4/master/Images/profilering-hierarki.PNG" alt="Hierarki FHIR-profiler i Norge" width="50%" />

_Figur: Norske basisprofiler arver direkte fra HL7 FHIR standarden._

## Definisjon av basisprofiler

En nasjonal basisprofil beskriver grunnleggende tilpasning av internasjonale FHIR-ressurser for samhandling i norsk helsesektor.  
En basisprofil skal representere informasjonsstrukturer som kan gjenbrukes på tvers av implementasjoner for de fleste anvendelsesområdet i Norge.  
En basisprofil kan benyttes direkte i en implementasjon eller profileres ytterligere.  

## Prinsipper

**Prinsipp 1: Basisprofiler skal inneholde grunnleggende tilpasninger**  
Basisprofilene skal inneholde retningslinjer for identifikasjon, koding og navngivning av informasjon som er felles for de fleste anvendelser i Norge.

~~**Prinsipp 2: Anvendelsen for basisprofilen er tydelig definert**  
Den konkrete anvendelsen for basisprofilen må være tydelig definert og knyttet til samhandling. Anvendelsen må beskrives på et generelt nivå, som gjør det mulig å relatere anvendelsen til de fleste samhandlingsbehov i Norsk helsesektor.~~

**Prinsipp 2: Profilene defineres ut fra anvendelse i en norsk kontekst**  
Profilene skal inneholde krav baserert på felles norske juridisk, organisatorisk, semantisk eller tekniske egenskaper. Detaljnivå er avhengig av behovene knyttet til gjenbruk i områdeprofiler og implementerte profiler. Den norske konteksten skal dokumenteres i profilen.

**Prinsipp 3: Basisprofiler er utarbeidet basert på metode for basisprofiler**  
Basisprofilene skal følge prosess for utvikling og forvaltning av basisprofiler med de  innspillsrunder og forankringsprosesser som er beskrevet av HL7 Norge.  

**Prinsipp 4: Basisprofiler er uavhengige av samhandlingsmodell**  
Basisprofiler representerer standardisering av innhold og skal som hovedregel kunne benyttes uavhengig av samhandlingsmodell  (datadeling, meldingsutveksling, dokumentdeling, notifikasjon etc).

**Prinsipp 5: Kravene i profilene skal være åpne**  
Kravene som nedfelles i profilene skal være åpne, slik at profilene kan danne grunnlag for videre profilering og tilpasningen benyttes der det er behov.

**Prinsipp 6: Basisprofiler kan beskrive valgfrie utvidelser (extensions)**  
Utvidelser (extension) det er behov for i de fleste anvendelser skal dokumenteres.

**Prinsipp 7: Basisprofiler angir ikke "must-support" for informasjonselementer**  
Forskjellige anvendelser kan ha stor variasjon i behov for must-support. Det er derfor ikke naturlig at basisprofiler nedfeller at elementer skal angis med must-support.

**Prinsipp 8: Basisprofiler navngis alltid med prefix no-basis**  
Basisprofiler skal navngis etter følgende struktur no-basis-<ressurs>. Et eksempel på navn på en områdeprofil er *no-basis-Address*.  

**Prinsipp 9: Basisprofiler skal publiseres som en implementasjonsguide**  
Implementasjonsguiden beskriver hvordan basisprofilene er tenkt brukt i Norge. Basisprofiler dokumenteres i henhold til beste praksis for implementasjonsguide

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
