## Grunnprinsipper
Vi versjonerer på URL. Domenenavn og ressurs vil være det samme for nytt og gammelt API, men versjonsnummer (siste parameter i URL) vil differensiere versjon.

VIKTIG DISTINKSJON: Vi kan ikke bryte API-kontrakten med konsumentene for Minor og Errata. Dette leses under fra føringene for utforming 
av eksterne API for Grunndata-tjenester / Persontjenesten:

> Begrepet "non-breaking-changes" betegner endringer i grensesnittet (API funksjonalitet) eller FHIR datamodell som kan konsumeres av en eksisterende klient uten at klienten gjør endringer på sin implementasjon

<img src="https://raw.githubusercontent.com/thomiz/best-practice/master/images/api-url-versjoner.png" alt="Hierarki FHIR-profiler i Norge" width="50%" />

* Ved ny versjon av et eksisterende API (Minor/Errata) - endres backend i API-konfigurasjonen i Azure API Management (ny versjon av API på ny pod, gammel pod/image beholdes temporært for å sikre rollback-muligheter)
* Vi godtar samme bearer-token fra HelseID 
* Kontrakten opprettholdes med konsumentene (ellers er det ikke en Minor/Errata)
* Vi får på denne måten overført samtlige klienter til nyeste versjon, uten at de trenger å gjøre endringer på sin side (dette følges av føringene i kapittelet under - parafrasert: "ny funksjonalitet medfører ikke krav til å bruke den")
* Gammel "Minor/Errata" versjon tidsbegrenses IKKE, den ruller KONTINUERLIG videre med kort bakoverkompatibilitet / rollback-mulighet
* Ved Major - endringer som må anses som "breaking changes" og potensielt bryter bakoverkompatibilitiet, legges det opp ny versjon i Microsoft Azure API Management
* Vi krever et eget audience og scope i bearer-token for ny versjon
* Ny versjon gis versjonsnummer iht nummereringsstandard (marketing/arkitekt?)
* API versjoneres på URL (path)
https://eksempelapi.helsepunkt.no/persontjenesten/v2
...
Konsumenter varsles om at API må byttes fra gammelt til nytt API hos konsument innen gitt grace-period (eksempelvis "12 måneder fra nytt API oppstår")
Gammelt API tidsbegrenses etter spesifikasjon fra API-eier
Det må bestemmes om noen versjon av et API skal ha forlenget levetid, eksempelvis første versjon
Nytt API skal gå gjennom tre faser: Innfasing - "Produksjon" - Utfasing

## API Versjoner i produksjon

<img src="https://raw.githubusercontent.com/thomiz/best-practice/master/images/api-versjoner.png" alt="Hierarki FHIR-profiler i Norge" width="100%" />

* Det vil til enhver tid til være minst 3 versjoner av et API tilgjengelig, som tegningen over viser
* Dersom endring skjer i kontrakten, som medfører breaking change / Major versioning, så må versjon fremskyndes.
* Tegningen tar høyde for ny versjon per år - må kun anses som eksempel og skal ikke være styrende. API-eier bestemmer release cycle.
* Det er en forutsetning at EPJ-leverandører utvikler løsning for å kunne konsumere nytt API, og inkluderer i sin årlige patch/release av EPJ-systemet
* Dette fordrer en dialog mellom kunde/MF Helse/EPJ leverandør

## Endringer og versjonering

Endringer i API kan forårsakes av et utall forskjellige grunner, som er vanskelig å forutse uten erfaringsbase. Enkelte er lette å identifisere som Major (slik som "Erstatte FHIR server), mens feilretting av datamodellen kan utløse Major/Minor/Errata. Endringer i API må/bør gå gjennom et changeboard (ref. ITIL) som avgjør hvilken type endring som skal adresseres, og hva slags impact dette vil ha.

Major-versjoner trenger ikke nødvendigvis følge FHIR-versjoner (merk - det er ikke en 1:1 relasjon mellom FHIR-versjon og API-versjon - eventuelle like versjonsnummer er å anse som tilfeldigheter):

Potensielle endringer som kan/vil forårsake major/minor/errata (ikke detaljert):

* Nye data  / Ny datakilde
* Feilretting i datamodellen
* Feiltolkning av data 
* Det vi fikk var noe annet enn det vi trodde vi skulle få 
* Oppgradering av Vonk-versjonen, f.eks. fra 3.1.1 til 3.1.3 (skrevet april 2020, kan være fullstendig utdatert når dette leses)
* Erstatte FHIR-server, f.eks. fra Fire.ly Vonk til Microsoft FHIR-server 
* Definere nye FHIR-profiler på errata-nivå, f.eks. fra v4.0.0 til v4.0.1
* Release nye versjoner av Vonk-plugins (dataminimerings- og autentiserings plugins) som kan påvirke funksjonaliteten for sluttkonsumentene

