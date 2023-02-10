
### Prinsipp – Utvikling av verdisett på regionalt nivå bør forankres i nasjonale standardiseringsprosesser for å sikre felles bruk blant alle samhandlende parter. Dette er spesielt relevant for bruk av SNOMED CT.

For de fleste kodeverkene vil man i ved anvendelse i samhandling inkludere alle kodene i et kodeverk i et verdisett for utveksling. Det vil si at man har et 1:1-forhold mellom koder i kodeverk og koder i verdisett. Det er for eksempel vanlig å inkludere alle koder ved bruk av Volven 9602, Volven 8406, ICPC-2 eller NCMP i verdisettene.  
Dette er ikke mulig med bruk av SNOMED CT. SNOMED CT inneholder rundt 400 000 koder som inneholder alt fra prosedyrer, diagnoser, anatomisk lokasjon, hendelser, sosial kontekst, landkoder og mye mer. Det er derfor nødvendig å definere akkurat hvilket SNOMED-kodeverdier som er gyldige i en gitt type samhandling. 
Dersom hver enkelt lokale/ regionale fagmiljø velger sine koder med noe ulike fokus og ulike granuleringsnivå vil SNOMED CT i mindre grad bidra til å øke samhandlingsevne og analysemuligheter på tvers i sektor. Utvikling av verdisett i SNOMED CT for samhandling bør derfor helst forankres på nasjonalt nivå.

### Prinsipp - Bruk av prekoordinerte begreper i SNOMED CT (og evt andre ontologibaserte terminologier) begrenses til å spisse begreper bundet til et enkelt element i standardiserte informasjonsmodeller for lagring i og utveksling mellom kliniske fagsystemer

For terminologier finnes det ulike måter å sette sammen begreper/ koder for å uttrykke mer komplekse konsepter. Det skilles i den sammenheng gjerne mellom pre- og postkoordinering og expressions. Prekoordinering definerer nye faste begreper ved å kombinere to eksisterende begreper, mens postkoordinering og expressions setter sammen to eller flere begreper til et nytt sammensatt begrep on-the-fly.
Ved prekoordinering i SNOMED CT setter man sammen to eller flere eksisterende begreper i SNOMED og gir det sammensatte begrepet en ny selvstendig kode. I SNOMED CT finnes for eksempel det  pre-koordinerte uttrykket «mistenkt lungekreft»  som er satt sammen av tre andre SNOMED-begreper:
 
162573006 suspected lung cancer = 415684004 suspected + 39607008 lung structure + 363346000 cancer

Bruk av sammensatte/aggregerte begreper som bryter med internasjonale standardiserte informasjonsmodeller som openEHR og FHIR kan gjøre overgangen til internasjonale standarder mindre effektiv og redusere gevinster for eksempel knyttet til enkel integrasjon og søk i informasjon. Dette fordi det kan bli en utfordring at nye sammensatte terminoloigbegreper ikke "passer inn" i informasjonsmodellen. 
For eksempel ser vi at et aggregert begrep som "mistenkt lungekreft" hverken passer inn i informasjonselementet "Problem/diagnose", «Anatomisk lokalisering» eller Diagnostisk sikkerhet» i informasonsmodellen i figuren under.
 

Prinsippet bidrar til å sikre konsistens i valg mellom hva som beskrives i informasjonsmodell og hva som beskrives med terminologi. 
Faren med utstrakt bruk av prekoordinering er ellers såkalt «combinatorial explosion» hvor hele terminologien blir for stor og uoversiktlig på grunn av alle mulige kombinasjoner av begreper settes sammen til for å lage nye selvstendige begreper. Pre-koordinering skaper også utfordringer knyttet til søk fordi samme begrep kan forekomme i mange varianter kombinert med andre begreper. 

### Prinsipp - Post-koordinering og expressions skal kun vurderes der det er konkludert at det ikke er hensiktsmessig å uttrykke den aggregerte informasjonsmengden ved hjelp av  prekoordinering eller informasjonsstrukturer i informasjonsmodell, og at det er teknisk mulig 

Ved post-koordinering kombineres to eller flere begreper fra terminologien til et nytt sammensatt begrep on-the-fly. De beholder hver sine unike id-er, men kombineres sammen ved hjelp av en egen syntax. Expressions kan anvendes for å uttrykke enda mer komplekse kliniske uttrykk direkte i terminologi.  
Ved bruk av post-koordinering og expressions innfører man nye informasjonsstrukturer bygd på de formelle underliggende konseptmodellene for de ulike hierarkiene i SNOMED CT. Disse er dagens kliniske fagsystemer ikke designet for å støtte. SNOMED International har utviklet en egen syntax - SNOMED CT Expression Constraint Language -  for å uttrykke sammensatte begreper ved hjelp av post-koordinering og expressions i SNOMED CT. 

Et eksempel på et post-koordinert uttrykk som definerer at pasientens far har hatt hjerteinfarkt er:
281666001|family history of disorder|:{246090004|associated finding|=22298006|myocardial infarction|,408732007|subject relationship context|=444295003|father of subject|} 

Det er teknisk komplisert å implementere støtte for post-koordinering og det er i dag få, om noen,  kliniske fagsystemer som kan håndterer implementering av post-koordinerte SNOMED CT-begreper per i dag. Med tanke på utveksling så vil det også kunne være utfordrende å representere post-koordinerte begreper benyttet sammen med standardiserte informasjonsmodeller. 


