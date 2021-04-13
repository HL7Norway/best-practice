# Prinsipper for utvikling og bruk av nasjonale områdeprofiler

## Definisjon områdeprofil

En nasjonal områdeprofil:

* tilpasser internasjonale FHIR-ressurser for samhandling i en definert anvendelse  
* representere informasjonsstrukturer som kan gjenbrukes på tvers av implementasjoner for det definerte anvendelsesområdet  
* kan benyttes direkte i en implementasjon eller profileres ytterligere  

## Prinsipper

Følgende prinsipper gjelder for utvikling av områdeprofiler:

**Prinsipp 1: Anvendelsen er tydelig definert**  
Den konkrete anvendelsen for områdeprofilen må være tydelig definert og knyttet til samhandling. Anvendelsen kan være spesifikk eller mer generell.

**Prinsipp 2: Områdeprofiler er basert på basisprofiler der det finnes**  
Områdeprofiler skal gjenbruke tilpasninger gjort i nasjonal basisprofil for ressursen dersom disse finnes.

**Prinsipp 3: Profilene defineres ut fra anvendelsen**  
Detaljnivå er avhengig av behovene for gjenbruk i implementerte profiler. Detaljnivå er også avhengig av felles samhandlingsbehov for anvendelsen.

**Prinsipp 4: Områdeprofiler er utarbeidet basert på metode for områdeprofiler**  
Områdeprofiler skal følge prosess for utvikling og forvaltning av områdeprofiler med de innspillsrunder og forankringsprosesser som er beskrevet.

**Prinsipp 5: Områdeprofiler er uavhengige av samhandlingsmodell**  
Områdeprofiler representerer standardisering av innhold og skal som hovedregel kunne benyttes uavhengig av samhandlingsmodell (datadeling, meldingsutveksling, dokumentdeling, notifikasjon etc).

**Prinsipp 6: Områdeprofiler er basert på relevante internasjonale spesifikasjoner**  
Dersom det finnes relevante internasjonale spesifikasjoner for det aktuelle anvendelsesområdet skal disse vurderes brukt. Dersom det finnes flere internasjonale spesifikasjoner som kan benyttes for det relevante området, bør det blant annet gjøres en vurdering av relevans, bruk i markedet og bruk av kodeverk, for å bestemme hvilken spesifikasjon som er mest egnet som utgangspunkt for bruk i Norge.

**Prinsipp 7: En områdeprofil skal benytte *must-support* for elementer**  
Must-support betyr at fagsystemer skal støtte og kunne behandle informasjon for disse elementene. Den enkelte implementasjonsguide bør beskrive spesifikt hvilke krav som følger av must-support. Ulike anvendelser kan ha ulike krav til *must-support*-elementer.

**Prinsipp 8: Områdeprofiler kan beskrive valgfrie utvidelser (extensions)**  
En områdeprofil kan angi valgfrie utvidelser som er aktuelle for gjenbruk for den gitte anvendelsen selv om den ikke er aktuell for alle implementasjoner. Dette bidrar til gjenbruk og konsistent bruk av utvidelser for det aktuelle anvendelsesområdet.

**Prinsipp 9: Områdeprofiler navngis alltid med prefix no-domain**  
Områdeprofiler skal navngis etter følgende struktur `no-domain-<område>-<ressurs>-<kvalifikator>`. Et eksempel på navn på en områdeprofil er no-domain-VitalSigns-Observation-bloodpressure.

**Prinsipp 10: Områdeprofiler skal publiseres som en implementasjonsguide**  
Implementasjonsguiden beskriver hvordan områdeprofilene for et gitt anvendelsesområde skal brukes. Områdeprofiler dokumenteres i henhold til beste praksis for implementasjonsguide.

**Prinsipp 11: Områdeprofiler skal utvikles og vedlikeholdes åpent**  
Nasjonale områdeprofiler og implementasjonsguider er leverandør- og løsningsnøytrale. Kildekoden skal utvikles og forvaltes på en åpent tilgjengelig plattform som gjør det mulig for alle interesserte å delta.
