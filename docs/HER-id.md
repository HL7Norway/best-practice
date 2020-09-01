# HER-id og FHIR

## Problemstilling

Hvordan skal HER-id benyttes i forbindelse med FHIR
* For meldingsbasert kommunikasjon
* For REST kommunikasjon

## Beskrivelse

HER-id identifiserer en tjeneste i adresseregisteret beregnet for meldingsbasert kommunikasjon mellom kommunikasjonparter. Definisjonen fra Standarden for Tjenestebasert adressering lyder:
> Identifikator som unikt identifiserer en virksomhet eller en kommunikasjonspart som tilhører en virksomhet i Adresseregisteret

HER-id benyttes til samhandling mellom parter ved hjelp av meldinger. Da er det kommunikasjonspartene i en virksomhet som sender og mottar meldinger. HER-id på organisasjonen benyttes derfor ikke til å identifisere Organization, Practitioner, Location, HealthCareService eller Endpoint ressurser.

I no-basis dokumentasjonen har vi derfor slått fast at HER-id ikke benyttes som identifikasjon av disse ressursene, for eksempel for Organization:
> The HERid SHALL not be assigned on the Organizational level. The Organizations registered in adresseregisteret uses the HERid for message based addressing.

## Meldingsbasert kommunikasjon

Det foreligger ingen fastsatte retningslinjer for bruk av FHIR for meldingsbasert kommunikasjon på nåværende tidspunkt.

## REST kommunikasjon

Det er ikke identifisert noe behov for identifikasjon av kommunikasjonsparter i forbindelse med REST basert kommunikasjon.

