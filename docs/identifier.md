# Identifikatorer i FHIR

HL7 FHIR skiller strengt mellom forretningsidentifikator som skal være en global unik forretningsidentifikator og en id som er en identifikator på en instans av ressursen i ett system [Logiske id og identifikator](https://www.hl7.org/fhir/resource.html#id).

I hovedsak identifiserer identifikatorer en ressurs gloalt og sammenstillingen av system og value må være unik. For ressurser som skal utveksles vil det være en fordel om disse er globalt unike. 

## Nasjonale unike identifikatorer eksisterer 
I mange tilfeller så vli det finnes offisielle nasjonale identifikatorer som vil være preferert å benytte for samhandling. Eksempler på dette er FNR, HNR og DNR for pasient, HPR-nummmer for helsepersonell, RESH og Enhetsidentifikator fra Brønnøysundregisterne for organisasjon etc. Da benyttes en OID (som forhåpentligvis snart kan representeres i form av en URL) i system og med tilhørende verdi i value. 

Eksempel RESH:
~~~
<system value="urn:oid:2.16.578.1.12.4.1.4.1026" /> (OID for identifikasjon av RESH)
<value value="45879" />
~~~

## Nasjonale identifikatorer eksisterer ikke
Dersom nasjonale identifikatorer ikke eksisterer må kan system/ value benyttes på to ulike måter for å sikre global identifikasjon. 

### Bruk av OID + lokal verdi
Dersom OID-benyttes som identikator for produsent av ressurs kan denne benyttes sammen med lokal ID for å etablere en global unik identifikator. Eksempeler på dette er Appoinment og Encounter som kan registreres med en global OID (som forhåpentligvis snart kan representeres i form av en URL) 

Eksempel Appointment :
~~~
<system value="urn:oid:2.16.578.1.12.4.1.4.1026" /> (OID for DIPS OUS)
<value value="1234567" />
~~~

### Bruk av UUID
I andre tilfeller vil det ikke være hensiktsmessig 

 for eksempel i form av en UUID. I tilfeller hvor UUID benyttes vil system være **urn:ietf:rfc:3986**.

Eksempel: 
~~~
<system value="urn:ietf:rfc:3986" />
<value value="urn:uuid:791ecfdd-7851-4a66-b51a-8b5b484daffb" />
~~~
