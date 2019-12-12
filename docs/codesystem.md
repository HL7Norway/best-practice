# Kodeverk

I norsk helsesektor har vi definert alle relevante kodeverk som benyttes i elektronisk samhandling på volven.no. På Volven er alle kodeverk identifisert med OID og kodeverdiene i alle kodeverk som forvaltes av Direktoratet for e-helse er listet opp, med unntak av store kodeverk som har sine egne datakilder. I FHIR sammenheng er dette problematisk siden FHIR servere og klienter ikke har noe brukbart grensesnitt for å hente ut kodeverk i form av CodeSystem eller valueset

## CodeSystem

CodeSystem ressursen benyttes til å definere kodene som hører sammen i ett kodeverk i FHIR. En stor fordel med å definere opp kodeverken sine ved hjelp av CodeSystem er at det gjør det mulig å validere FHIR ressurser basert på kodene i kodeverket. 

[Kilde](https://www.hl7.org/fhir/codesystem.html)

> Defines a set of codes with meanings (also known as enumeration, terminology, classification, and/or ontology)

Eksempler på CodeSystem definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-emergency-level-v05.codesystem.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-medicationdispense-events-v06.codesystem.xml)

## ValueSet

ValueSets ressursen benyttes til å definere opp subsett eller samensetning av koder i et kodeverk (CodeSystem) som skal benyttes i en profil eller ressurs. ValueSets benyttes foreksempel i forbindelse med profilering for å angi hvilke koder fra hvilke kodeverk som skal benyttes i profilen.

[Kilde](https://www.hl7.org/fhir/valueset.html)

> Selects a set of codes from those defined by one or more code systems

Eksempler på ValueSets definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-emergency-level-v05.valueset.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-medicationdispense-events-v06.valueset.xml)

# Bruk av kodeverk 

Kodeverk kan brukes i flere elementer i FHIR. Typisk eksempel er i Idenfifier, CodeableConcept og alle ressurser som benytter disse element-typene. Kodeverk benyttes i utgangspunktet likt i disse elementene, men angivelsen av kodeverk kan benytte flere forskjellige metoder som vi skal gå igjennom her.

## Kodeverk fra [Volven.no](https://www.volven.no)

Alle kodeverk på Volven.no er identifisert ved en [OID](https://en.wikipedia.org/wiki/Object_identifier). 

Se [Bruk av identifikatorer i helsesektoren](https://volven.no/Om%20kodeverks-id%20og%20OID.pdf) og [OID identifikatorserier i helse- og omsorgstjenesten](https://ehelse.no/oid-identifikatorserier-i-helse-og-omsorgstjenesten).

**Eksempel** OID'en for det helsefaglige kodeverket _ICD-10_ er _2.16.578.1.12.4.1.1.7110_.

**Eksempel** OID'en for det administrative kodeverket _Pristype for medisinsk utstyr og næringsmidler_ er _2.16.578.1.12.4.1.1.7423_.

## Datatype Coding
[Kilde](https://www.hl7.org/fhir/datatypes.html#Coding)

```javascript
{
  // from Element: extension
  "system" : "<uri>", // Identity of the terminology system
  "version" : "<string>", // Version of the system - if relevant
  "code" : "<code>", // Symbol in syntax defined by the system
  "display" : "<string>", // Representation defined by the system
  "userSelected" : <boolean> // If this coding was chosen directly by the user
}
```

### system

Identifiserer kodesystemet på volven ved hjelp av OID'en på URN-format. Mapper mot _S_ i datatypen _CV_ brukt i andre innholdsstandarder.

**Eksempel** `urn:oid:2.16.578.1.12.4.1.1.7423`

### version

Brukes ikke før vi får versjoner av kodeverk på Volven.

### code

Selve koden. Mapper mot _V_ i datatypen _CV_.

**Eksempel** `E`

### display

Visningsnavn. Mapper mot _DN_ i datatypen _CV_. NB: Det finnes unntak fra praksis ved noen kodeverk. 

**Eksempel** `Maksimal refusjonspris per enhet`

### userSelected

Valgfritt.

## Eksempel JSON

```javascript
{
  "system" : "urn:oid:2.16.578.1.12.4.1.1.7110", // ICD-10
  "code" : "J10",
  "display" : "Influensa som skyldes identifisert sesongvariabelt influensavirus"
}
```

```javascript
{
  "system" : "urn:oid:2.16.578.1.12.4.1.1.7423",
  "code" : "E",
  "display" : "Maksimal refusjonspris per enhet"
}
```

## Angivelse av kodeverk med URL

Ulempe med bruk av OID er at FHIR servere ikke kan finne kodeverkene og benytte disse for å validere kodene. Det kan derfor være gode grunner til å definere kodeverkene med FHIR resursene ValueSet og CodeSystem og benytte disse direkte i profilene. Man bruker da en URL for å identifisere [ValueSet og CodeSystem](https://git.sarepta.ehelse.no/utvikling/FHIR/wikis/codesystem-og-valueset).

```xml
<event>
    <system value="http://ehelse.no/fhir/CodeSystem/vkp-message-event-v05" />
    <code value="MedicationDispense" />
</event>
```

```javascript
"valueCodeableConcept":{
  "coding": [
  {
     "system":"http://ehelse.no/fhir/CodeSystem/vkp-emergency-level-v05",
     "code":"V",
     "display":"Vanlig (grønn)"
  }
 ]
}
```
# Internasjonale terminologier og kodeverk

Flere kodeverk har gitte namespace, se et [utvalg på HL7 sine sider](https://www.hl7.org/fhir/terminologies-systems.html).

## Eksempler
```
SNOMED CT = http://snomed.info/sct
ISO Country & Regional Codes = urn:iso:std:iso:3166	
```

## Se også

* [NamingSystem](namingsystem.md)
* [Måleenhet](docs/ucum.md)
* [SNOMED CT](docs/snomed-ct.md)


