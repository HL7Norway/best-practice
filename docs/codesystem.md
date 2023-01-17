# Kodeverk
## Introduksjon
En informasjonsmodell i FHIR vil ha både kodede og ikke-kodede informasjonselementer. Et kodet informasjonselement krever en kodet verdi hvor verdien må være et av et sett av forhåndsdefinerte koder fra et kodeverk. Det kan for eksempel være en kode for en diagnose, en kode for et legemiddel i en forskrivning, pasientens kjønn eller observerte symptomer ved en allergisk reaksjon. 
I FHIR kalles dette settet av lovlige koder for et kodet informasjonselement for et verdisett (ValueSet). Kodene i et verdisett hentes fra et kodeverk eller en terminologi (CodeSystem). Terminologibinding definerer nettopp hvilke koder som er tillatt å bruke i et kodede informasjonselementet i en informasonsmodell. 
FHIR har en terminlogimodul som definerer forholdet mellom de sentrale ressursene anvendt for terminologibinding.

[FHIR terminology-module](https://www.hl7.org/fhir/codesystem.html)


I norsk helsesektor har vi definert alle relevante kodeverk som benyttes i elektronisk samhandling på volven.no. På Volven er alle kodeverk identifisert med OID og kodeverdiene i alle kodeverk som forvaltes av Direktoratet for e-helse er listet opp, med unntak av store kodeverk som har sine egne datakilder. I FHIR sammenheng er dette problematisk siden FHIR servere og klienter ikke har noe brukbart grensesnitt for å hente ut kodeverk i form av CodeSystem eller valueset

## CodeSystem

CodeSystem ressursen benyttes til å definere kodene som hører sammen i ett kodeverk i FHIR. En stor fordel med å definere opp kodeverken sine ved hjelp av CodeSystem er at det gjør det mulig å validere FHIR ressurser basert på kodene i kodeverket. 

[Codesystem i spesifikasjonen](https://www.hl7.org/fhir/codesystem.html)

> Defines a set of codes with meanings (also known as enumeration, terminology, classification, and/or ontology)

Eksempler på CodeSystem definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-emergency-level-v05.codesystem.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-medicationdispense-events-v06.codesystem.xml)

## ValueSet (aka verdisett)

ValueSets ressursen benyttes til å definere opp subsett eller samensetning av koder i et kodeverk (CodeSystem) som skal benyttes i en profil eller ressurs. ValueSets benyttes foreksempel i forbindelse med profilering for å angi hvilke koder fra hvilke kodeverk som skal benyttes i profilen. Ved bruk av ValueSet kan et informasjonselement bindes mot alle kodene i et kodeverk for fra Volven, eller mot et større kodeverk som ICD-10 (diagnoser) eller NCMP (prosedyrer). 

Et verdisett kan også inneholde kun et subsett av koder som finnes i et kodeverk – det er spesielt aktuelt ved bruk av terminologien SNOMED CT som inneholder ca 450 000 begreper og inkluderer alt fra anatomiske lokasjoner, prosedyrer, diagnoser til administrative koder og landkoder. Da er det en funksjonell/ klinisk oppgave å identifisere nøyaktig hvilke koder som skal være med i et slikt verdisett.
Et verdisett kan også kombinere kodeverdier fra ulike kodeverk og terminologier som lovlige verdier i bindingen mot et informasjonselement.

[ValueSet i spesifikasjonen](https://www.hl7.org/fhir/valueset.html)

> Selects a set of codes from those defined by one or more code systems

Eksempler på ValueSets definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-emergency-level-v05.valueset.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-medicationdispense-events-v06.valueset.xml)

# Bruk av kodeverk 

Kodeverk kan brukes i flere elementer i FHIR. Typisk eksempel er i Idenfifier, CodeableConcept og alle ressurser som benytter disse element-typene. Kodeverk benyttes i utgangspunktet likt i disse elementene, men angivelsen av kodeverk kan benytte flere forskjellige metoder som vi skal gå igjennom her.

## Kodeverk fra [Volven.no](https://www.volven.no)

Alle kodeverk på Volven.no er identifisert ved en [OID](https://en.wikipedia.org/wiki/Object_identifier). 

Se [Bruk av identifikatorer i helsesektoren](https://volven.no/Om%20kodeverks-id%20og%20OID.pdf) og [OID identifikatorserier i helse- og omsorgstjenesten](https://www.ehelse.no/teknisk-dokumentasjon/oid-identifikatorserier-i-helse-og-omsorgstjenesten).

**Eksempel** OID'en for det helsefaglige kodeverket _ICD-10_ er _2.16.578.1.12.4.1.1.7110_.

**Eksempel** OID'en for det administrative kodeverket _Pristype for medisinsk utstyr og næringsmidler_ er _2.16.578.1.12.4.1.1.7423_.

## Datatyper for kodede elementer
I FHIR benyttes datatypene CodeableConcept, Coding og code for å angi kodede verdier i dataelementer. Coding-datatypen er den sentrale ressursen for unikt å definere anvendt kode ved hjelp av attributter som system (kodeverk) og versjon. CodeableConcept har en 0..* - relasjon til Coding og gir dermed muligheten for å definere et begrep ved hjelp av koder fra ulike kodeverk, eller eventuelt kun representere begrepet ved hjelp av en tekst-string.  
Mer om datatypene her:  
[Datatypes - FHIR (hl7.org)](http://www.hl7.org/fhir/datatypes.html)

### Coding
Mer om datatypen Coding:  
[Coding](https://www.hl7.org/fhir/datatypes.html#Coding)

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

Identifiserer kodesystemet på volven ved hjelp av OID'en på URN-format. 

**Eksempel** `urn:oid:2.16.578.1.12.4.1.1.7423`

### version

Brukes ikke før vi får versjoner av kodeverk på Volven.

### code

Selve koden. 

**Eksempel** `E`

### display

Visningsnavn.  

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

## Binding strength
FHIR standarden har en del anbefalinger for bruk av kodeverk og terminologi definert opp som en del av standarden. Anbefalingene av kodeverk og terminologi kommer på fire nivåer (binding strengths)  - required, extensible, preferred og example. For required er det obligatorisk å benytte kodeverk definert av FHIR for å være kompatible med FHIR, mens eksempel-bindinger uten noen form for anbefaling. Merk at for eksempel SNOMED CT-koder aldri vil være mer enn et eksempel i internasjonale FHIR-bruk fordi land uten medlemskap i SNOMED International ikke har rettigheter til å bruke de.  

Mer om binding strength fra spesifikasjonen [her](http://hl7.org/fhir/R4B/valueset-binding-strength.html)

## Angivelse av kodeverk med URL

Ulempe med bruk av OID er at FHIR servere ikke kan finne kodeverkene og benytte disse for å validere kodene. Det kan derfor være gode grunner til å definere kodeverkene med FHIR resursene ValueSet og CodeSystem og benytte disse direkte i profilene. Man bruker da en URL for å identifisere [ValueSet og CodeSystem](codesystem.md).

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
Se også side for [informasjon om eksterne terminologier](https://confluence.hl7.org/display/TA/External+Terminologies+-+Information). 

## Utvalg

* [Using ICD-[X] Codes with FHIR ](https://www.hl7.org/fhir/icd.html)
* [Using ISO 3166 Country Codes with FHIR](https://www.hl7.org/fhir/iso3166.html)

## Eksempler
```
SNOMED CT = http://snomed.info/sct
ISO Country & Regional Codes = urn:iso:std:iso:3166	
```

## Se også

* [NamingSystem](namingsystem.md)
* [Måleenhet](ucum.md)
* [SNOMED CT](snomed-ct.md)
