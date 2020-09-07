# Formål

Formålet med disse sidene er å bidra til at vi kan **utvikle** og dokumentere "best practice" for bruk av HL7 FHIR i Norge, herunder profilering, utviling av implementasjonsguider samt praktisk bruk. 

Det er ønskelig at alle som jobber med FHIR-profilering deler sitt arbeide og erfaringer med andre. Arbeidet er dugnadsdrevet og alle som jobber med HL7 FHIR i Norge oppfordres til å delta. Mye av utviklingen skjer i prosjekter og programmer i sektoren. 

[Denne dokumentasjonen på GitHub Pages](https://hl7norway.github.io/best-practice/) - [Kildekode på GitHub](https://github.com/HL7Norway/best-practice) - bli med! 

**Innholdet på disse sidene kan og vil endres uten varsel**: Det er et verktøy av og for sektoren, og blir løpende oppdatert. 

**Innholdet er ikke normativt** og kan ikke ses på som en helseinformatikk-standard publisert av HL7 Norge eller Direktoratet for e-helse. Deler av innholdet kan dog på sikt bli gjenstand for normering.

Sidene er stadig under utvikling - er det noe du ønsker burde være omtalt, legg helst inn en [issue](https://github.com/HL7Norway/best-practice/issues) eller [ta kontakt](docs/contact.md) på gamlemåten (nei, ikke fax). 

## Profilering
* [Nasjonalt profileringshierarki](docs/no-profileringshierarki.md)
* [Prinsipper for nasjonale basisprofiler](docs/no-basis-principles.md) 
  * [Sjekkliste for basisprofiler](docs/no-basis-checklist.md)
* [Prinsipper for nasjonale områdeprofiler](docs/no-national-profiles-principles.md)
  * [Internasjonale referanser for områdeprofiler](docs/internasjonale-referanser.md)
  * [Sjekkliste for publisering av områdeprofiler](docs/no-national-checklist.md)
* [Kodeverk - CodeSystem og ValueSet](docs/codesystem.md)
  * [Volven](docs/codesystem.md#kodeverk-fra-volvenno)
  * [Måleenhet](docs/ucum.md)
  * [SNOMED CT](docs/snomed-ct.md)
* [NamingSystem](docs/namingsystem.md)


### Publisering

* [Implementasjonsguide](docs/implementationguide.md)
* [Versjoner av modell](docs/FHIR-model-versioning.md)
* [Versjoner av API](docs/FHIR-api-versions.md)

### Arkitektur

* [SMART on FHIR](docs/smart.md)
* [Dokumenter](docs/documents.md)
* [Meldinger](docs/messaging.md)
* [Identifikator søk i REST operasjoner](docs/fnr-dnr-get-vs-post.md)
* [HER-id og FHIR](docs/HER-id.md)

### Spesifikke råd om bruk av enkeltressurser

* [QuestionnaireResponse](docs/QuestionnaireResponse.md) - når er det riktig å bruke QuestionnaireResponse
* [Practitioner vs PractitionerRole](docs/Practitioner-PractitionerRole.md) - når er det riktig å benytte Practitioner eller PractitionerRole

## Prosjekter og aktiviteter

* [Aktiviteter i Norge](docs/activities-norway.md)


## Lær mer om FHIR

* [Ressurser](docs/resources.md) - nyttige lenker til verktøy, informasjon etc.

## Samarbeid

Sidene drives i samarbeid mellom [Direktoratet for e-helse](https://www.ehelse.no/) og [HL7 Norge](https://www.hl7.no/). 

Spørsmål? Lyst til å bidra? [Ta kontakt!](docs/contact.md)

{% include analytics.html %}
