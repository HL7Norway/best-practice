# Nasjonalt rammeverk for FHIR-profilering
Direktoratet for e-helse har sammen med HL7 Norge utarbeidet et nasjonalt rammeverk for FHIR-profilering inndelt i fire nivåer. Det øverste nivået representerer den 
internasjonale ressursen, mens det nederste nivået representerer beskrivelse av faktisk implementert grensesnitt i et klinisk fagsystem. Mellom disse er det to nivåer av 
nasjonal profilering som har som formål å sikre en samordnet implementering av de internasjonale ressursene på nasjonalt nivå, slik at samme informasjon er representert 
på samme måte på tvers av implementasjoner i kliniske fagsystemer. De to nivåene av nasjonal profilering er nasjonale basisprofiler og nasjonale områdeprofiler. 

<img src="https://raw.githubusercontent.com/HL7Norway/basisprofiler-r4/master/Images/profilering-hierarki.PNG" alt="Hierarki FHIR-profiler i Norge" width="50%" />

## Nasjonale basisprofiler
Nasjonale basisprofiler representerer tilpasning til særnorske krav og beskriver et minimum av tilpasninger som er nødvendig for å anvende en internasjonal ressurs i 
norsk helsesektor. Dette vil for eksempel si å knytte de internasjonale ressursene til nasjonale norske identifikatorer, påkrevde nasjonale kodeverk samt å legge til 
grunnleggende utvidelser (extensions) av de internasjonale ressursene for nasjonale informasjonsbehov (for eksempel "Mellomnavn" for pasient). 
Basisprofilene er åpne og generelle, og ment å være basis for all anvendelse, uavhengig av use-case, av den gitte internasjonale ressursen i norsk helsesektor. 

## Nasjonale områdeprofiler
Nasjonale områdeprofiler baserer seg på de nasjonale basisprofilene, og representerer all standardisering utover de helt generelle særnorske tilpasningene i basisprofilene. De internasjonale FHIR-ressursene er åpne og generiske, og det vil være behov for å standardisere struktur og innhold for mer spissede anvendelsesområder.  

Mens nasjonale basisprofiler handler om å gjøre nødvendige særnorske tilpasninger til de internasjonale ressursene, vil det være en fordel om videre tilpasninger i nasjonale områdeprofiler er i tråd med ledende internasjonale implementasjonsguider for de respektive områdene. Dette på grunn av: 
* Ressursutnyttelse (gjenbruke internasjonal innsats, erfaringer og ekspertise på anvendelsesområder som er direkte overførbare) 
* Bedre samhandlingsevne med internasjonalt leverandørmarked
* Forenkle samhandlingsevne på tvers av landegrenser.

## Presentasjon av nasjonalt profileringshierarki
* [Presentasjon Devdays](https://www.youtube.com/watch?v=8pv-Zztibyg)

