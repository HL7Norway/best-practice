# Identifikatorer i FHIR

HL7 FHIR skiller strengt mellom forretningsidentifikator som skal være en global unik forretningsidentifikator og en id som er en identifikator på en instans av ressursen i ett system [Logiske id og identifikator](https://www.hl7.org/fhir/resource.html#id).

Identifier-elementet identfifiserer en ressurs globalt ved bruk av system og value-attributtene. System kan enten inneholde en OID eller en URL som er globalt unik.

Overordnet har vi to overordnede use-case - enten finnes det nasjonalt unike idenfikatorer eller så gjør det ikke det.

## Nasjonalt unike navnerom eksisterer 

I mange tilfeller finnes det offisielle nasjonale identifikatorer som vil være preferert å benytte for samhandling. Eksempler på dette er FNR og DNR for pasient, HPR-nummmer for helsepersonell, RESH og Enhetsidentifikator fra Brønnøysundregisterne for organisasjon etc. Da benyttes en OID (som forhåpentligvis snart kan representeres i form av en URL) i system-attributtet med tilhørende verdi i value-attributtet. 

Eksempel RESH:
~~~
<system value="urn:oid:2.16.578.1.12.4.1.4.1026" /> (OID for identifikasjon av RESH)
<value value="45879" />
~~~ 

## Nasjonale identifikatorsystem eksisterer ikke
Dersom nasjonale identifikatorer ikke eksisterer for ressurstypen kan ulike kombinasjoner av system/value benyttes for å sikre global identifikasjon. En mulighet er å benytte globalt unike generelle identifikatorsystem slik som UUID for å generere globalt unike identifikatorer. Et alternativ kan være at lokalt unike identifikatorer benyttes sammen med et globalt unikt navnerom kontrollert av organisasjonen, for å sikre at lokalt unike identifikatorer forblir unike på innenfor det angitte systemet (identifier.system).

### Bruk av UUID
Ved samhandling mellom aktører og virksomheter kan UUID benyttes som global unik identifikator for identifier.value. I tilfeller hvor UUID benyttes vil system være urn:ietf:rfc:3986.

Eksempel: 
~~~
<system value="urn:ietf:rfc:3986" />
<value value="urn:uuid:791ecfdd-7851-4a66-b51a-8b5b484daffb" />
~~~

### Bruk av OID + lokal verdi
Alternativt kan et globalt unikt navnerom (identifier.system med unik OID/URL) kombinert med lokale unik identifikator (identifier.value) benyttes. Tilsammen vil system og value være globalt unik  I dette tilfellet er det organisasjonen som står ansvarlig for å benytte et navnerom (identifier.system verdi) de kontrollerer selv og som organisasjonen har registrert globalt. Dette kan gå inn i dagens nasjonale OID-regime, men vi anbefaler bruk av URL som standardrepresentasjon i stedet for dagens numeriske urn:OID-identifikator. 

Eksempel Appointment:
~~~
<system value="urn:oid:2.16.578.1.12.4.3.1.4.20.1" /> (OID for DIPS Sykehuset Østfold)
<value value="1234567" />

<system value="http://oid.helse-sorost.no/so/dips" /> (URL for DIPS Sykehuset Østfold)
<value value="1234567" />
~~~
