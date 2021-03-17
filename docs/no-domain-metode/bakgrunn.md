# Bakgrunn

## Strategisk retning innen normering

Internasjonale standarder og internasjonalt samarbeid om e-helse er og vil bli mer aktuelt i fremtiden. Direktoratet for e-helses rapport "Utviklingstrekk 2020" peker på at utfordringer innen helsesektoren er sammenfallende for flere land og at det er viktig å være med i internasjonalt standardiseringsarbeid for å utvikle, lære og bidra til felles løsninger.

Direktoratet for e-helse har tidligere utarbeidet Strategi for e-helsestandarder 2018-2022 med de tre fokusområdene nasjonal styring, standardisert informasjonsinnhold og internasjonale standarder. Veikart for e-helsestandarder (2019) følger opp strategien gjennom å beskrive tiltak innenfor internasjonale standarder for datadeling og dokumentdeling.

I kravene til Akson samhandling står det at et hovedprinsipp for realisering av målbilde om helhetlig samhandling er at det skal benyttes åpne API, internasjonale standarder og Felles språk for samhandling.

## Direktoratets anbefalinger

I 2019 ble det utgitt [retningslinje hvor direktoratet anbefaler bruk av FHIR for datadeling](https://ehelse.no/standarder/ikke-standarder/anbefaling-om-bruk-av-hl7-fhir-for-datadeling). Samme år ble også 13 FHIR basisprofiler utviklet i samarbeid mellom sektor, HL7 Norge, og Direktoratet for e-helse normert som anbefalt standarder i referansekatalogen.

Det er også arbeidet med prinsipper og tiltak for nasjonal styring og forvaltning av FHIR. FHIR er en viktig standard som nå tas i bruk i mange sammenhenger, og arbeidet med denne vil også fungere som utprøvingsarena for prosesser, rutiner og koordinering med andre internasjonale standarder.

## Metodegrunnlag

Forslaget til metode bygger i hovedsak på eksisterende metoder innen normering, arkitektur og programvareutvikling.

### Smidig tilnærming

Det er et ønske om å modernisere hvordan programvareutviklingen og normeringen blir gjennomført i helsesektoren. Det er et mål at normeringsaktiviteter i større grad er basert på dokumenterte behov i sektoren, og hvor sektoren er motivert til å delta i normeringsarbeidet både i standardiseringsorganisasjoner og i samarbeid med direktoratet. Dette betyr at normeringsarbeidet må henge sammen med konkrete utviklingsprosjekter i sektoren og følge en smidig tilnærming hvor normeringsproduktene leverer verdi til sektor underveis i utviklingsløpet og blir videreutviklet og komplettert i senere iterasjoner

![Smidig utviklingsmetode](../../images/no-domain-smidig.png)

**Figur** Smidig utviklingsmetode

Smidig tilnærming betyr også at normeringsproduktene eller deler av disse må utvikles, testes og settes i drift i løpet av en sprint slik at man kan evaluere hvordan produktet fungerer i praksis. Dette vil vanligvis være avhengig av at normeringsaktiviteten er koblet til en utviklingsaktivitet.

### Forvaltningsmodellen

Forvaltningsmodellen beskriver hvordan Direktoratet for e-helse skal utvikle og forvalte normerende produkter. Metoden må beskrive hvordan utviklingen av områdeprofiler skal forholde seg til forvaltningsmodellen og spesifisere hvordan forvaltningsmodellen blir tolket i arbeidet med utvikling av områdeprofiler. Det er et mål at metoden skal bygge på forvaltningsmodellen og gi mer detaljert informasjon om hvordan forvaltningsmodellen kan benyttes i denne konkrete konteksten.

<img src="../../images/no-domain-prosess-forvaltningsmodell.png" alt="Fasene i forvaltningsmodellen" width="50%" />

**Figur** Fasene i forvaltningsmodellen

### HL7 FHIR utviklingsmetode

HL7 International benytter i utviklingen av HL7 FHIR selv en form for iterativ utvikling av den underliggende standarden. I praksis betyr dette at standarden blir normert i løpet av flere år og det er i skrivende stund bare deler av standarden som ansees som Normativ. I utviklingen av en metode for områdeprofiler er det derfor naturlig å gjenbruke de samme mekanismene for standardisering som HL7 benytter i utviklingen av FHIR blant annet [maturity model](https://confluence.hl7.org/display/FHIR/FHIR+Maturity+Model).

### Profileringsnivåer for HL7 FHIR i Norge

I Norge arbeides det med profilering av HL7 FHIR på flere nivåer av detaljering. Øverst i det norske profileringshierarkiet har vi norske basisprofiler som skal sammenfatte omforente krav til hvordan FHIR ressurser skal benyttes i Norge uavhengig av anvendelsesområde. Disse profilene er åpne og inneholder bare det alle aktører er enige om med hensyn til koding og navngivning av ressurser og navnerom. De norske områdeprofilene er ment som et profileringsnivå under basisprofilene og har som formål å presisere bruk av HL7 FHIR innen et bestemt anvendelsesområde. Prosjekter og implementasjoner kan deretter velge å profilere implementerte profiler knyttet til en konkret implementasjon. Disse kan inneholde spesifikke krav som bare gjelder innenfor en virksomhet.

![Profileringshierarki](../../images/Profileringshierarki-norsk.png)  

**Figur** Profileringshierarki for HL7 FHIR i Norge

### Prosjektveiviseren

Metoden baserer seg på Digitaliseringsdirektoratets veileder for bruk av smidig metode for programvareutvikling, [Prosjektstyring og smidig utviklingsmetodikk | Digitaliseringsdirektoratet](https://www.prosjektveiviseren.no/prosjekttyper/digitaliseringsprosjekter/programvareutvikling/prosjektstyring-og-smidig-utviklingsmetodikk). Digitaliseringsdirektoratets veileder beskriver hvordan smidig kan benyttes i alle prosjektets faser og beskriver eksempler på epos og hvordan de forskjellige fasene i prosjektmodellen kan deles inn i flere sprinter/iterasjoner.

![Prosjektveiviseren](../../images/no-domain-prosjektveiviser.png)

**Figur** Smidig utviklingsmetode Digitaliseringsdirektoratet
