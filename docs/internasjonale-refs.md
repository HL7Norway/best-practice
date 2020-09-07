# Områdeprofiler – viktigste internasjonale referanser

Dette dokumentet gir en kort oversikt over noen sentrale internasjonale referanser for utforming av områdeprofiler.
HL7 International har fra 2019 utvidet fokuset fra primært å handle om utvikling av FHIR-standarden og ressursene, til å legge mer vekt på samordnet implementering.  Samordnet implementering legger til rette for at ulike aktører tar i bruk (profilerer) FHIR på samme måte på like problemstillinger for å oppnå semantisk samhandlingsevne også på tvers av landegrenser. Dette er i stor grad tenkt gjennomført ved å utarbeide internasjonale implementasjonsguider som kan brukes som utgangspunkt for lokal bruk i bredest mulig skala. De såkalte akseleratorprogrammene er en satsning som understøtter dette. FHIR som standard har åpnet for mer fleksibel og agil bruk, noe som har vært vektlagt for å adopsjon i en tidlig fase, men for mye fleksibilitet vil redusere graden av semantisk samhandlingsevne i større skala. Områdeprofilene har til hensikt å uttrykke en riktig balanse mellom behov for fleksibilitet og standardisering på nasjonalt nivå, samt å sikre at nasjonal standardisering er basert på de mest relevante internasjonale implementasjonsguidene for områdene de dekker. 
Prinsippene for områdeprofiler beskriver at nasjonale områdeprofiler bør baseres på internasjonalt arbeid som adresserer de respektive områdene dersom det finnes. Dette også på grunn av:

* Ressursutnyttelse (gjenbruke internasjonal innsats, erfaringer og ekspertise på anvendelsesområder som ofte er direkte overførbare) 
* Bedre samhandlingsevne med internasjonalt leverandørmarked. Implementasjonsguider som de har implementert ut-av-boksen, vil være raskere å mer kostnadseffektivt å ta i bruk også på nasjonalt nivå. 
* Forenkle samhandlingsevne på tvers av landegrenser.

I mange tilfeller kan det være flere internasjonale implementasjonsguider som kan være aktuelt for et område. Da bør det gjøres en vurdering av hvilke(n) referanse som gir størst verdi for prosjektet ut fra hvor sentrale de ulike implementasjonsguidene er, hvor stor adopsjon de har fått i marked og blant leverandører etc. 
FHIR-spesifikasjon
FHIR-spesifikasjonen er den sentrale referansen for all FHIR-utvikling. Spesifikasjonen i seg selv inneholder ikke så mange fullt implementasjonsguider og profiler, men det finnes noen eksempler. Implementasjonsguider/ profiler beskrevet direkte i FHIR-spesifikasjonen bør være førstevalg hvis det finnes flere alternativer. Vital Signs er et eksempel på profiler som en del av spesifikasjonen:  kan du finne her: https://www.hl7.org/fhir/observation-vitalsigns.html

 Merk også at FHIR spesifikasjonen har et ["extension-registry"](https://www.hl7.org/fhir/extensibility-registry.html) med hyppig brukte internasjonale ekstensjoner. Man bør gjenbruke disse hvis de kan brukes i stedet for å lage særnorske ekstensjoner. Eksempler på bruk av offisielle extensions er for eksempel ADXP extension som er tatt i bruk i no-basis-Address profilen.

## Argonaut
Argonaut er en organisasjon som er drevet og finansiert av en sammenslutning av stort sett amerikanske leverandører inkl Epic, Cerner, Accenture, Apple. Hensikten med Argonaut er stimulere bruk av FHIR og OAuth for informasjonsutvekslling i helsesektoren ved å utvikle internasjonale implementasjonsguider for prioriterte områder. Argonaut har jobbet tett med arbeidsgruppene i HL7 International, og samarbeidsmodellen mellom industri og HL7 ble utgangspunktet for Akseleratorprogram-modellen som HL7 International nå også har overført til andre områder. 
En av de mest kjente IG-ene fra Argonaut er Data Query implementation guide. US Core er et sett av grunnprofiler for "US realm" basert på krav og spesifikasjoner fra Argonaut Data Query og ONCs US Core Data for Interoperability (USCDI). Argonaut har også utviklet et sett av andre implmentasjonsguider som for eksempel Clinical Notes og bruk av FHIR Questionnaire/ QuestionnaireRespons, og fortsetter kontinuerlig å etablere flere.   
http://fhir.org/guides/argonaut/

## International Patient Summary (IPS)
IPS er en implementasjonsguide opprinnelig utviklet av CEN for tilgjengeliggjøring av en "pasientoppsummering" – tilgjengeliggjøring av et minimumsett av informasjon uavhengig av spesialitet og diagnose – for helsepersonell som har behov for dette for akuttbehandling.  
I etterkant har man sett at denne informasjonen også kan være nyttig for tilgjengeliggjøring av informasjon i planlagte forløp.  
IPS har også tilhørende implementasjonsguider for CDA og HL7 FHIR som beskriver hvordan oppsummeringen kan deles som et dokument. Det er en prosess for å gjøre IPS til en ISO-standard. 

## mCode/ CodeX
mCODE (minimalCommonOncologyDataElements) var et initiative for å beskrive et grunnsett av strukturerte dataelementer for utveksling av onkologidata. En av målsettingene med mCODE var å tilgjengeliggjøre relevante behandlingsdata for bruk i forskning. Common Oncology Data Elements eXtensions (CodeX) er en fortsettelse av mCODE og vil fortsette å utvikle støtte for flere prioriterte use-case for onkologi. CodeX ble en offisiell FHIR Accelerator i slutten av 2019. 

## Vulcan
Vulcan ble etablert som en HL7 Acceleator i juli 2020, og har som formål å samle initiativer knyttet til å integrere databehov translasjonsforskning og klinisk forskning 

## Andre implementasjonsguider 
I UK arbeider NHS digital aktivt med tilpasninger av HL7 FHIR til deres bruk. De har foreløpig fokusert på bruksområder som de kaller CareConnect (medikasjon, allergier, diagnoser, observasjoner og prosedyrer) og Transfer of Care som tilsvarer henvisning og epikrise.
Nederland har i en årrekke utarbeidet informasjonsmodeller for en rekke brukerhistorier (HCIM) og har i de senere år også profilert HL7 FHIR for å støtte bruk av disse informasjonsmodellene.
 
Det er forventet at Integrating the Health Enterprise (IHE) vil satse på profilering av FHIR-profiler og implementasjonsguider fremover, og de er blant annet valgt som samarbeidspartner for ONC i USA. I forhold til områdeprofiler bør vi derfor følge med på hva som skjer i fremover i IHE.
HL7 International har ellers etablert et register hvor alle som har en implementasjonsguide som de mener kan ha interesse for et bredere publikum kan publisere  disse.  Dette registeret finnes her:
https://registry.fhir.org/guides

## openEHR
openEHR arketyper er utviklet for standardisert lagring i EPJ-løsninger, og ikke for utveksling. Når informasjon i arketypene skal utveksles er det imidlertid aktuelt å bruke FHIR. Arketypene er har mye rikere modeller, samt at de har definert verdisett (tillatte koder) for kodede informasjonselementer, og kan derfor være grunnlag for å beskrive kliniske modeller som ikke er definert i FHIR (ekstensjoner ).
