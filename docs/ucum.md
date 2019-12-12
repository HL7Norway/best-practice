# Måleenheter

For måleenheter skal det benyttes _[The Unified Code for Units of Measure](https://unitsofmeasure.org)_ (UCUM) hvis måleenheten er en del av UCUM. 

UCUM benyttes både av [International Patient Summary v0.2.0](http://hl7.org/fhir/uv/ips/2018Sep/StructureDefinition-quantity-uv-ips.html) (IPS) og [HL7 FHIR Vital Signs](https://www.hl7.org/fhir/observation-vitalsigns.html).

**Diskusjonspunkt:** Kodeverk for målenhet fra Volven bør ikke benyttes. Det må gjøres en vurdering hvordan måleenheter for legemidlers styrke skal tas i bruk. [Se ISO IDMP 11240](https://www.idmp1.com/wiki/iso-11240/). 

## Ressurser

* [Hvordan bruke UCUM med FHIR](https://www.hl7.org/fhir/ucum.html) <br/> Beskriver blant annet hvordan man konstruerer ValueSet (subsett) av UCUM.

## Eksempel

```
"valueQuantity": {
        "value": 107,
        "unit": "mmHg",
        "system": "http://unitsofmeasure.org",
        "code": "mm[Hg]"
      },
```
