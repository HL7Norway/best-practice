# Identifikatorer i FHIR

HL7 FHIR skiller strengt mellom forretningsidentifikator som skal være en global unik forretningsidentifikator og en id som er en identifikator på en instans av ressursen i ett system [Logiske id og identifikator](https://www.hl7.org/fhir/resource.html#id).

## Identifikatorer

I hovedsak identifiserer identifikatorer en ressurs gloalt og sammenstillingen av system og value må være unik. For ressurser som skal utveksles vil det være en fordel om disse er globalt unike for eksempel i form av en UUID. I tilfeller hvor UUID benyttes vil system være **urn:ietf:rfc:3986**.

Eksempel: 
~~~
<system value="urn:ietf:rfc:3986" />
<value value="urn:uuid:791ecfdd-7851-4a66-b51a-8b5b484daffb" />
~~~