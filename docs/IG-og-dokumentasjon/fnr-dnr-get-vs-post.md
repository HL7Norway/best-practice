# REST tjenester og søk etter person 

## Problemstilling

Når en tjeneste utfører et søk etter en person ved hjelp av unike nasjonale identifikatorer (i norge betyr dette fødselsnummer eller d-nummer), kan dette føre til at sensitiv informasjon havner i logger hos klient eller tjener. Dette skjer fordi søkeparametere ved den vanligste formen for søk ved hjelp av HTTP operasjonen GET, legges med som en del av HTTP header som i mange systemer legges i tekniske logger på systemet

I FHIR sammenheng gjelder dette søk på Reference.identifier eller Person/Patient/RelatedPerson.identifier, i de tilfellene identifikatoren er et fødselsnummer eller d-nummer. For eksempel:
~~~
GET [base]/Person?identifier=urn:oid:2.16.578.1.12.4.1.4.1|04021950128
~~~

## Løsning

For å unngå at identifikatorer havner i tekniske logger kan klienter benytte POST ved slike søk og tjenere kan stille krav om at POST operasjon benyttes ved søk etter identifikator.

### Krav i CapabilityStatement

Tjenere som tilbyr søk på person i form av identifikator BØR stille krav om at POST operasjon benyttes ved slike søk, kravene SKAL isåfall nedfelles i tjenesten CapabilityStatement. 

### Implementation Guide text

Kravet om bruk av POST BØR også beskrives i Implementasjonsguiden til tjenesten. Nedenfor er et eksempel på hvordan et slikt krav kan uttykkes i en implementasjonsguide.

### Eksempel

Get person information based on Identifier

You can search for person information based on the identifier of the person (FNR or DNR). The search interaction on Identifiers SHALL only use the POST operation to prevent the identifier from being recorded in HTTP logs. The search parameters SHALL be provided in the body of the message.

~~~
POST [base]/Person/_search

parameters in HTTP body: 
identifier=urn:oid:2.16.578.1.12.4.1.4.1|04021950128
~~~

cURL code for this transaction:

~~~
curl -X POST -d identifier=urn%3Aoid%3A2.16.578.1.12.4.1.4.1%7C04021950128 
[base]/Person/_search
~~~