# FHIR-modell og tjenesteversjon

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
