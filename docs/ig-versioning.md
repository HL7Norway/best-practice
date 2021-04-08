# SEMVER for implementasjonsguide

Implementasjonsguider benytter tre nivåer for versjonsnummer MAJOR.MINOR.PATCH

* MAJOR er større endringer som ikke er tilbakekompatibel
* MINOR er utvidet funksjonalitet som er tilbakekompatibel
* PATCH er mindre tilbakekompatible endringer og retting av småfeil

## Eksempler

* MAJOR  versjoner benyttes til større oppdatering som innebærer at endringen ikke er tilbakekompatibel. Store mengder nye informasjonselementer, funksjonsendringer og nye FHIR versjoner er eksempler på MAJOR
* MINOR versjoner skal bare inneholde tilbakekompatible endringer. Eksempler på slike endringer er nytt innhold, funksjonstillegg i grensesnittet eller større endringer i dokumentasjonen av tjenesten
* PATCH versjoner inneholder tilbakekompatible endringer men kan også inneholde feilrettinger for å sikre at funksjonaliteten i grensesnittet er i samsvar med dokumenterte kapabiliteter. Eksempler på dette er feil i kodeverksnavn i en profil
* Mindre klargjøringer av dokumentasjonen trenger ikke føre til ny PATCH versjon.

### Tilbakekompatible endringer

Begrepet Tilbakekompatible endringer betegner endringer i grensesnittet (API funksjonalitet) eller FHIR datamodell som kan konsumeres av en eksisterende klient uten at klienten gjør endringer på sin implementasjon

* Oppdateringer i dokumentasjonen som klargjør funksjonaliteten i grensesnittet eller forklarer hvordan datamodellen skal tolkes
* Det kan legges til API-funksjonalitet til grensesnittet (nye søkeparametere eller operasjoner kan implementeres) da disse er et tilbud og det ikke er et krav om at alle konsumenter skal benyttes ny funksjonalitet
* Det kan legges informasjon i eksisterende informasjonselementer i som er nevnt i datamodellen, hvis informasjon blir tilgjengelig i tjenesten og informasjoninnholdet ikke avviker fra datamodellen
  * Dette inkluderer også at man legger til nye extensions til eksisterende informasjonselementer i modellen da det ikke er et krav om at klienten faktisk må kjenne til en extension for å lese ressursen
* Dette inkluderer IKKE å legge til informasjon med krav om obligatorisk støtte i form av kadinalitet 1..x eller must-support

### Ikke tilbakekompatible endringer

Ikke tilbakekompatible endringer betegner endringer i grensesnittets API funksjonalitet eller i FHIR datamodell som ikke er mulig å konsumere med en eksisterende FHIR konform klient
   * I kodede informasjonselementer som er obligatoriske eller markert som must-support, kan tjenesten i liten grad gjøre endringer i selve kodeverket uten at dette betraktes som en endring som ødelegger implementasjoner siden eksisterende klienter ikke kan garantere for at de kan benytte, tolke og vise nye koder korrekt
   * Det kan ikke endres API funksjonalitet på en slik måte at resultatet ikke kan leses av eksisterende klienter (endring i bruk av feilkoder, endring i sikkerhetsmekanismer, endring i søkeparametere og operasjoner)
      * bugfix er unntatt så lenge endringen endrer funksjonalitet slik at eksponert løsning er i henhold til dokumentert funksjonalitet
   * Det kan ikke endres i funksjonaliteten til eksisterende operasjoner eller søkeparametere
      * bugfix er unntatt så lenge endringen endrer funksjonalitet slik at eksponert løsning er i henhold til dokumentert funksjonalitet
   * Det kan ikke legges til informasjonselementer i modellen som har kardinalitet 1..x eller blir betegnet med must-support
      * Dette inkluderer å endre kardinalitet fra 0 til 1..x

Kilde: [Guide versioning - INTEROPen Care Connect API](https://nhsconnect.github.io/CareConnectAPI/overview_guide_versioning.html) / [Semantic Versioning 2.0.0](https://semver.org)