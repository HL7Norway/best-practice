## Practitioner vs PractitionerRole ressurser

I mange sammenhenger er det behov for informasjon både om organisasjon og helsepesonell i forbindelse med samhandling om en pasient. I HL7 FHIR eksisterer det minst tre muligheter for å få til dette 
(QR kan ikke både ha organisasjon og Practitioner i author, dette gjelder også endel andre ressurser).
* legge organisasjon som en del av spørreskjema og benytte Practitioner
* legge organisasjon som en del av PractitionerRole
* legge organisasjon som selvstendig organisasjonsinformasjon i en Organization
* For QuestionnaireResponse kan det også vurderes om organisasjonsinformasjon kan legges som svar på spørsmål (altså QR.answer) der organisasjonsinformasjonen kun er tilleggsinformasjon og ikke en sentral del av ansvarsforholdet i rapporteringen.

Organisasjonsinformasjon i tillegg til Helseperson/lege informasjon skaper ofte utfordringer når vi skal ta i bruk FHIR. Det finnes flere måter å løse dette på avhengig av hvilken type rolle/organisasjonsinformasjon løsningen trenger.
* Når helsepersonen er juridisk ansvarlig for innholdet i rapporteringen og denne skal identifiseres med en kjent identifikator (for eksempel der du vet at det finnes en HPR identifikator) kan Practitioner benyttes
* Når helsepersonen rapporterer i form av sin rolle for en organisasjon er PractitionerRole riktig ressurs 
* Det finnes randsoner mellom disse hvor det kan være nyttig å knytte organisasjonstilhørighet til Helsepersonen for en bestemt rapportering fordi det er bestemte behov i løsningen som gjør det ønskelig å ha tilgang til hvilke roller en helseperson har inntatt tidligere når løsningen er benyttet