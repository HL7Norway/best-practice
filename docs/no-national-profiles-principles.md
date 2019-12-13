Prinsipper for utvikling og bruk av nasjonale profiler. Nasjonale profiler bestemmer praktiske krav til spesifiserte anvendelser. De nasjonale profilene må samles i ett eller flere implementasjonsguider. Prinsippene er ikke vedtatte og er under utvikling. 

<img src="https://github.com/HL7Norway/basisprofiler-r3/blob/master/Images/profilering-hierarki.PNG" alt="Hierarki FHIR-profiler i Norge" width="50%" />

_Figur: Nasjonale profiler (i grønt, eksempel std-Patient) arver fra basisprofiler. Navngivning er ikke bestemt ennå._

Eksempler på anvendelser knyttet til informasjon om en pasient:
* Demografisk informasjon
* Røykestatus
* Legemidler i bruk
* Allergier
* Vaksiner
* Labresultater/tester

Se for eksempel [Argonaut Data Query Implementation Guide](http://www.fhir.org/guides/argonaut/r2/) og [andre under Argonaut](http://argonautwiki.hl7.org/index.php?title=Main_Page) og [InterOpen CareConnect / NHS UK](https://nhsconnect.github.io/CareConnectAPI/).

## Design

* Baserer seg på basisprofiler der dette finnes
* Delvis åpen, for å dekke generelle eller helt spesifikke behov avhengig av anvendelsen
* Bottom up
  * Obligatoriske attributter ([must support](https://www.hl7.org/fhir/conformance-rules.html#mustSupport))
  * Obligatoriske identifikatorer
  * Obligatoriske kodeverk
  * Obligatoriske extensions
* Engelsk skal brukespå tekniske elementer som attributter, extensions etc. Engelsk skal også benyttes for særnorske begreper hvis det finnes offisielle oversettelser, hvis ikke kan norsk benyttes. 

## Bruk

* Nasjonale profiler bør brukes så langt det er mulig for å sikre semantisk samhandlingsevne mellom systemer og virksomheter
* Hvis de finnes, bør nasjonale profiler benyttes som basis for ytterligere spesifiserte profiler. 

## Prosjekter

Noen prosjekter som har (kan ha) behov for nasjonale profiler der det er nødvendig med samarbeid/samkjøring:
* Pasientens legemiddelliste (PLL)
* Sentral forskrivningsmodul (SFM), eResept
* Kjernejournal
* Norsk SMART on FHIR, for eksempel Førerrett-prosjektet
* Internasjonale prosjekt:
  * International Patient Summary

## Navngivning
TODO

{% include analytics.html %}
