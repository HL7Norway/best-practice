# Kodeverk

I norsk helsesektor har vi definert alle relevante kodeverk som benyttes i elektronisk samhandling på volven.no. På Volven er alle kodeverk identifisert med OID og kodeverdiene i alle kodeverk som forvaltes av Direktoratet for e-helse er listet opp, med unntak av store kodeverk som har sine egne datakilder. I FHIR sammenheng er dette problematisk siden FHIR servere og klienter ikke har noe brukbart grensesnitt for å hente ut kodeverk i form av CodeSystem eller valueset

# CodeSystem

CodeSystem ressursen benyttes til å definere kodene som hører sammen i ett kodeverk i FHIR. En stor fordel med å definere opp kodeverken sine ved hjelp av CodeSystem er at det gjør det mulig å validere FHIR ressurser basert på kodene i kodeverket. 

[Kilde](https://www.hl7.org/fhir/codesystem.html)

> Defines a set of codes with meanings (also known as enumeration, terminology, classification, and/or ontology)

Eksempler på CodeSystem definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-emergency-level-v05.codesystem.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/CodeSystem/vkp-medicationdispense-events-v06.codesystem.xml)

# ValueSet

ValueSets ressursen benyttes til å definere opp subsett eller samensetning av koder i et kodeverk (CodeSystem) som skal benyttes i en profil eller ressurs. ValueSets benyttes foreksempel i forbindelse med profilering for å angi hvilke koder fra hvilke kodeverk som skal benyttes i profilen.

# Bruk

Se [bruk av koder](use.md)

[Kilde](https://www.hl7.org/fhir/valueset.html)

> Selects a set of codes from those defined by one or more code systems

Eksempler på ValueSets definert opp i forbindelse med velferdsteknologisk knutepunkt:
* [vkp-emergency-level](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-emergency-level-v05.valueset.xml)
* [vkp-medicationdispense-events](https://git.sarepta.ehelse.no/utvikling/FHIR/blob/master/vkp/ValueSet/vkp-medicationdispense-events-v06.valueset.xml)
