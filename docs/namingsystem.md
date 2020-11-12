# NamingSystem

Er et kurert namespace som utsteder unike identifikatorer for identifikasjon av konsepter, personer, devicer etc. Disse vil opprettes etter behov i profileringsarbeidet. 

## Følgende NamingSystem er opprettet i arbeidet med nasjonale basisprofiler:

* Fødselsnummer
* D-nummer
* DUF-nummer
* Felles hjelpenummer
* Helsepersonellnummer (HPR)
* Kommunenummer
* Bydelsnummer



## Eksempel
Eksempel på forslag til NamingSystem for [fødselsnummer](https://git.sarepta.ehelse.no/utvikling/FHIR/raw/master/norway/NamingSystem/no-fodselsnummer.namingsystem.xml)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<NamingSystem xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../STU3/fhir-all-xsd/fhir-single.xsd">
    <meta>
        <versionId value="0.1" />
    </meta>
    <name value="Norsk Fødselsnummer" />
    <status value="draft" />
    <kind value="identifier" />
    <date value="2018-02-08"/>
    <publisher value="e-helse" />
    <responsible value="Skatteetaten"/>
    <description value="Et fødselsnummer er et ellevesifret identifikasjonsnummer. Alle som er folkeregistrert i Norge har et fødselsnummer." />
    <uniqueId>
        <type value="uri" />
        <value value="http://ehelse.no/fhir/NamingSystem/FNR" />
        <preferred value="false" />
    </uniqueId>
    <uniqueId>
        <type value="oid" />
        <value value="2.16.578.1.12.4.1.4.1" />
        <preferred value="true" />
    </uniqueId>
</NamingSystem>
```

## Definisjon

> A curated namespace that issues unique symbols within that namespace for the identification of concepts, people, devices, etc. Represents a "System" used within the Identifier and Coding data types.

* https://www.hl7.org/fhir/namingsystem.html
