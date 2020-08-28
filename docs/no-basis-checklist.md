# Sjekkliste for no-basis endringer og tillegg

Ved endringer på no-basis conformance ressurser så må sjekklisten gjennomgås.

## Arbeidsflyt

* Tillegg til no-basis utformes i egen branch på GitHub
* HL7 Norge vurderer om forslag kan merges til master for review på worshops og høringer
   * Alle conformance ressurser som skal til review må ha status = draft og skal ikke ha versjonsnummer

## Sjekksliste ved merge til master
* Sjekk navngivning av conformanceressurser, det er retningslinjer både for navn, tittel, url og id elementene
* Det skal eksistere en forklarende description på alle Conformance ressurser som forklarer hvorfor ressursen skal brukes og hvilket problem den løser
* Alle endringer i elementer må forklares med et rasjonale om hvorfor endringen er gjort 
  * Alle elementer må ha en forklaring på hvordan bruken er forskjellig fra vanilla FHIR 
* Conformance ressurser må valideres maskinelt både mot .NET validator og offisiell java validator

## Implementation Guide

* Vurdere om det er behov for tillegg eller endringer i implementasjonsguide
  * Det SKAL som et minimum eksistere egne kapitler i en no-basis implementasjonsguide for profiler og extensions
