# Identifikatorer i FHIR

HL7 FHIR skiller strengt mellom forretningsidentifikator som skal være en global unik forretningsidentifikator og en id som er en identifikator på en instans av ressursen i ett system [Logiske id og identifikator](https://www.hl7.org/fhir/resource.html#id).

I hovedsak identifiserer identifikatorer en ressurs globalt ved bruk av system og value-attributtene på Identifier-elementet. For ressurser som skal utveksles bør disse være er globalt unike. Overordnet har vi to overordnede use-case - enten finnes det nasjonalt unike idenfikatorer eller så gjør det ikke det.

## Nasjonalt unike navnerom eksisterer 

I mange tilfeller finnes det offisielle nasjonale identifikatorer som vil være preferert å benytte for samhandling. Eksempler på dette er FNR, HNR og DNR for pasient, HPR-nummmer for helsepersonell, RESH og Enhetsidentifikator fra Brønnøysundregisterne for organisasjon etc. Da benyttes en OID (som forhåpentligvis snart kan representeres i form av en URL) i system-attributtet med tilhørende verdi i value-attributtet. 

Eksempel RESH:
~~~
<system value="urn:oid:2.16.578.1.12.4.1.4.1026" /> (OID for identifikasjon av RESH)
<value value="45879" />
~~~

## Nasjonale identifkatorsystm eksisterer ikke

Dersom nasjonale identifikatorer ikke eksisterer for ressurstypen kan ulike kombinasjoner av system/value benyttes for å sikre global identifikasjon. Beste praksis er å benytte globalt unike generelle identifikatorsystem slik som UUID for å generere globalt unike identifikatorer. Som et alternativ til dette kan lokalt unike identifikatorer benyttes sammen med et globalt unikt navnerom kontrollert av organisasjonen, for å sikre at lokalt unike identifikatorer forblir unike på innenfor det angitte systemet (identifier.system).

### Bruk av UUID
Ved samhandling mellom aktører og virksomheter anbefales bruk av UUID som global unik identifikator for identifier.value. I tilfeller hvor UUID benyttes vil system være **urn:ietf:rfc:3986**.

Eksempel: 
~~~
<system value="urn:ietf:rfc:3986" />
<value value="urn:uuid:791ecfdd-7851-4a66-b51a-8b5b484daffb" />
~~~

### Bruk av OID + lokal verdi
Dersom systemene som skal samhandle ikke kan forholde seg til UUID, kan et globalt unikt navnerom (identifier.system) og en lokalt unik identifikator verdi (identifier.value) benyttes. I dette tilfellet er det organisasjonen som står ansvarlig for å benytte et navnerom (identifier.system verdi) de kontrollerer selv og som organisasjonen har registrert globalt. Organisasjonen må også sørge for at alle identifier.value som utstedes er og forblir unike innenfor navnerommet.

Eksempel Appointment :
~~~
<system value="urn:oid:2.16.578.1.12.4.3.1.4.20.1" /> (OID for DIPS Sykehuset Østfold)
<value value="1234567" />
~~~
