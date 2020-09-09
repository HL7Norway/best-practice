#FHIR-modell og tjenesteversjon

Ved utviklingen av et FHIR RESTful API vil definisjonen og profileringen av FHIR standarden påvirke hvordan tjenesten som tilbys oppfører seg og hvordan informasjonen man henter ut eller legger inn i tjenesten skal struktureres og kodes. derfor henger FHIR modellen man definerer ved hjelp av profilering henge sammen med REST tjenesten funksjonalitet. Det er derfor viktig å dokumentere overfor konsumenter av tjenester hvordan dette fungerer og ha tydelig versjonering av tjenesten som henger sammen med FHIR modellen som ligger til grunn. Denne siden oppsummererer noen forslag til retningslinjer for dokumentasjon og versjonering av FHIR modellen.

## Dokumentasjon av tjenestene

1. Det skal dokumenteres hvordan den enkelte aktør kobler seg til, tester og bruker tjenesten (selvbetjeningsløsning, bruk av testinstanser, brukervilkår og krav til avtaler)
2. Det skal dokumenteres hvordan den enkelte aktør oppnår sikker kommunikasjon med tjenestene (formen på denne dokumentasjonen?)
3. Det skal dokumenteres hvordan informasjonen fra FREG og andre kilder eksponeres fra tjenesten (i form av HL7 FHIR datamodell/Implementation Guide)
4. Det skal dokumenteres hvilke funksjoner som eksisterer i API'et til tjenesten (i form av API dokumentasjon og CapabilityStatement)
5. All dokumentasjon skal inneholde endringslogg som gjør det mulig å finne ut nøyaktig hva som er endret mellom versjoner

## Om utviklingen av tjenester

1. Starte med enkle tjenester, som kan bygges ut, dvs. levere ut tjeneste slik de støttes i Serveren (dvs. minst mulig ekstra utviklingsarbeid)
2. Når tjenesten videreutvikles så skal nye versjoner være bakoverkompatibel i så stor grad som mulig
3. Tjenestene skal være så generelle som mulig slik at de dekker mange behov
4. API'ene skal etterleve krav spesifisert i [HL7 FHIR standarden](https://www.hl7.org/fhir/)
5. Mer spesifikt skal API'ene etterlever kravene til FHIR RESTful API, FHIR søk og FHIR operasjoner
6. Det kan gjøres begrensninger i tilgjengelig funksjonalitet i forhold til dette der det er hensiktsmessig i forhold til ytelse og vedlikehold 
   * Eventuelle begrensninger må dokumenteres i API-dokumentasjon og CapabilityStatement

## Datamiminering

1. FHIR støtter dataminimering i form av _summary og _elements, men ikke for extensions
   * (For Extensions kan det vurderes f.eks. GraphQL og det må gjøres utviklingsarbeid)
   * Dersom det er behov for kapabiliteter som ikke støttes av Serveren, så kan det vurderes å tilpasse egen funksjonalitet
2. Eksempelvis skreddersydde søkeparametere eller operasjoner (søk på mellomnavn er et eksempel på dette)
   * Skreddersydde søkeparametere skal dokumenteres i form av SearchParameter og være definert i CapabilityStatement
   * Skreddersydde operasjoner skal dokumenteres i form av OperationDefinition og være definert i CapabilityStatement
3. I de tilfellene API'ene ikke etterlever krav spesifisert i HL7 FHIR skal dette dokumenteres 
   * Et eksempel på dette er dataminimering som hovedregel hvor det meste innholdet i den returnerte Personressursen blir returnert uten innhold med mindre klienten spesifiserer hvilke elementer som skal returneres. Dette er IKKE i henhold til FHIR RESTful API og funksjonaliteten må derfor dokumenteres spesielt

## Versjonering av tjenestene

1. Versjonering skal følge prinsippene i SEMVER
2. Tjenestene som skal tilbys vil være levende og videreutvikles over tid i tråd med nye krav fra konsumenter og at nye kilder til informasjon legges til
3. Det må defineres en levetid for bestemte versjoner av tjenestene, med andre ord hvor lenge kan konsumenter av tjenestene forvente at en bestemt versjon av tjenesten er tilgjengelig etter release dato
   * Det kan også stilles krav til hvor lenge en kompatibel tjeneste skal være tilgjengelig (for eksempel en tjeneste med mindre endringer og bugfixer som kan fungere med en eksisterende versjon av konsumentens klient-løsning
   * Hvor lenge Grunndata forplikter seg til å ha tilgjengelig en versjon som bare inneholder "non-breaking changes"
   
### SEMVER for FHIR modell
* Major versjoner vil som regel benyttes til større oppdatering som innebærer "breaking changes" store mengder nye informasjonselementer, funksjonsendringer og nye FHIR versjoner
* Minor versjoner skal ikke inneholde "breaking changes", kjennetegnes med nytt innhold, funksjonstillegg i grensesnittet eller litt større endringer i dokumentasjonen av tjenesten
* Patch versjoner inneholder i hovedsak "non-breaking-changes", eller feilrettinger for å sikre at funksjonaliteten i grensesnittet er i samsvar med dokumenterte kapabiliteter
* Mindre klargjøringer av dokumentasjonen fører ikke til versjonsendringer

### non-breaking-changes

   * Begrepet "non-breaking-changes" betegner endringer i grensesnittet (API funksjonalitet) eller FHIR datamodell som kan konsumeres av en eksisterende klient uten at klienten gjør endringer på sin implementasjon
      * Oppdateringer i dokumentasjonen som klargjør funksjonaliteten i grensesnittet eller forklarer hvordan datamodellen skal tolkes
      * Det kan legges til API-funksjonalitet til grensesnittet (nye søkeparametere eller operasjoner kan implementeres) da disse er et tilbud og det ikke er et krav om at alle konsumenter skal benyttes ny funksjonalitet
      * Det kan legges informasjon i eksisterende informasjonselementer i som er nevnt i datamodellen, hvis informasjon blir tilgjengelig i tjenesten og informasjoninnholdet ikke avviker fra datamodellen
         * Dette inkluderer også at man legger til nye extensions til eksisterende informasjonselementer i modellen da det ikke er et krav om at klienten faktisk må kjenne til en extension for å lese ressursen
      * Dette inkluderer IKKE å legge til informasjon med krav om obligatorisk støtte i form av kadinalitet 1..x eller must-support

### Breaking-changes

Breaking-change betegner endringer i grensesnittets API funksjonalitet eller i FHIR datamodell som ikke er mulig å konsumere med en eksisterende FHIR konform klient
   * I kodede informasjonselementer som er obligatoriske eller markert som must-support, kan tjenesten i liten grad gjøre endringer i selve kodeverket uten at dette betraktes som en endring som ødelegger implementasjoner siden eksisterende klienter ikke kan garantere for at de kan benytte, tolke og vise nye koder korrekt
   * Det kan ikke endres API funksjonalitet på en slik måte at resultatet ikke kan leses av eksisterende klienter (endring i bruk av feilkoder, endring i sikkerhetsmekanismer, endring i søkeparametere og operasjoner)
      * bugfix er unntatt så lenge endringen endrer funksjonalitet slik at eksponert løsning er i henhold til dokumentert funksjonalitet
   * Det kan ikke endres i funksjonaliteten til eksisterende operasjoner eller søkeparametere
      * bugfix er unntatt så lenge endringen endrer funksjonalitet slik at eksponert løsning er i henhold til dokumentert funksjonalitet
   * Det kan ikke legges til informasjonselementer i modellen som har kardinalitet 1..x eller blir betegnet med must-support
      * Dette inkluderer å endre kardinalitet fra 0 til 1..x
