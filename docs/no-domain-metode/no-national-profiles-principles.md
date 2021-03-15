# Prinsipper for utvikling og bruk av nasjonale områdeprofiler

Formålet med nasjonale områdeprofilerer å sikre langsiktig semantisk samhandlingsevne ved at ibruktakelse av FHIR koordinering av profilering av ressurser på nasjonalt nivå.
Vi ser for oss dette som starten på et iterativt arbeid hvor prinsippene - og ikke minst mer spesifikk beste praksis basert på prinsippene - vil videreutvikles og foredles etter hvert som vi gjør egne praktiske erfaringer med bruk av områdeprofiler.

<img src="https://raw.githubusercontent.com/HL7Norway/basisprofiler-r4/master/Images/profilering-hierarki.PNG" alt="Hierarki FHIR-profiler i Norge" width="50%" />

## Definisjon områdeprofil

En nasjonal områdeprofil tilpasser internasjonale FHIR-ressurser for samhandling i en definert anvendelse.

En områdeprofil skal representere informasjonsstrukturer som kan gjenbrukes på tvers av implementasjoner for det definerte anvendelsesområdet.

En områdeprofil kan benyttes direkte i en implementasjon eller profileres ytterligere.

## Prinsipper

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
Dersom det finnes relevante internasjonale spesifikasjoner for det aktuelle anvendelsesområdet skal disse vurderes brukt. Dersom det finnes flere internasjonale spesifikasjoner som kan benyttes for det relevante området, bør det gjøres en vurdering av relevans, marked, bruk av kodeverk etc for å bestemme hvilken spesifikasjon som er mest egnet som utgangspunkt for bruk i Norge.

**Prinsipp 7: Bruk av "must-support" i områdeprofiler**
En områdeprofil skal benytte "must-support" for informasjonselementer det er et krav at kliniske fagsystemer skal kunne registrere informasjon for disse elementene, uten at det nødvendigvis er krav til at instansdata for informasjonselementet skal være sendt med i den enkelte utveksling (som beskrives ved hjelp av kardinalitet). Det er viktig at den enkelte implementasjonsguide dokumenterer mer spesifikt hvilke konkrete krav som ligger i bruk hva must-support betyr/ legges i den enkelte implementasjonsguide. Ulike use-case kan ha ulike krav til støtte av "must-support"-elementer.

**Prinsipp 8: Områdeprofiler kan beskrive valgfrie utvidelser (extensions)**
En områdeprofil kan angi valgfrie utvidelser som er aktuelle for gjenbruk for den gitte anvendelsen selv om den ikke er aktuell for alle implementasjoner. Dette bidrar til gjenbruk og konsistent bruk av utvidelser for det aktuelle anvendelsesområdet.

**Prinsipp 9: Områdeprofiler navngis alltid med prefix no-domain**
Områdeprofiler skal navngis etter følgende struktur `no-domain-<område>-<ressurs>-<kvalifikator>`. Et eksempel på navn på en områdeprofil er no-domain-VitalSigns-Observation-bloodpressure.

**Prinsipp 10: Områdeprofiler skal publiseres som en implementasjonsguide**
Implementasjonsguiden beskriver hvordan områdeprofilene for et gitt anvendelsesområde skal brukes. Områdeprofiler dokumenteres i henhold til beste praksis for implementasjonsguide.

>Forslag **Prinsipp 11: Områdeprofiler skal utvikles og vedlikeholdes åpent**
Nasjonale områdeprofiler og implementasjonsguider er leverandør- og løsningsnøytrale. Kildekoden skal utvikles og forvaltes på en åpent tilgjengelig plattform som gjør det mulig for alle interesserte å delta.
