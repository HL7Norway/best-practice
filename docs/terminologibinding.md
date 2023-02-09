En informasjonsmodell vil ha både kodede og ikke-kodede informasjonselementer. Et ikke-kodet informasjonselement kan ha tekst-, tall- eller datobaserte verdier. 
Et kodet informasjonselement krever en kodet verdi hvor verdien må være et av et sett av forhåndsdefinerte koder. I FHIR kaller vi dette settet av lovlige koder 
for et verdisett. Kodene i et verdisett hentes fra et kodeverk eller en terminologi. Terminologibinding definerer nettopp hvilke koder som er tillatt å bruke i et 
kodede informasjonselementet i en informasonsmodell. Typisk er lovlige koder for et administrativt informasjonselement bundet til kodene i Volven-kodeverk eller et 
informasjonselement for prosedyrer bundet til alle kodene i NCSP, NCMP eller NCRP.  
Et verdisett vil imidlertid ikke alltid inneholde alle kodene i et kodeverk. Er verdisett kan også inneholde et subsett av koder fra et kodeverk og også en 
kombinasjon av koder fra ulike kodeverk. Et verdisett vil typisk implementeres i et klinisk fagsystem i form av en drop-down box med gyldige koder for den 
gitte konteksten.

* [Prinsipper for bruk av FHIR med kodeverk og terminologi](docs/prinsipper_kodeverk.md)



* [CodeSystem-ressurs, ValueSet og OID-er](docs/codesystem.md)
  * [Volven](docs/codesystem.md#kodeverk-fra-volvenno)
  * [Måleenhet](docs/ucum.md)
  * [SNOMED CT](docs/snomed-ct.md)
