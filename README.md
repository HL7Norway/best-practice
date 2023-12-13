# FHIR best practice fra HL7 Norge

Dette er beste praksis sidene for utvikling og bruk av HL7 FHIR i Norge. Sidene er utviklet i samarbeid mellom HL7 Norge, Direktoratet for e-Helse og helsesektoren. Alle interesserte kan bidra i utviklingen av sidene ved å lage en pull request på forslag til endringer, oppdateringer eller tillegg.

## Om sidene

Sidene publiseres på github.io via github pages og bruker Jekyll. Vi bruker i tillegg jekyll temaet Just-the-docs for utformingen av sidene. All innsjekking av ny kildekode i repoet kommer fortløpende ut på github.io.

### Kladd først

Kladder skal legges i _draft folder før de er kvalitetssikret av redaktør. Det er god praksis å utvikle nye sider i egen gren (branch) for å hindre at uferdige sider kommer direkte ut på websidene.

## Utvikling av sidene

## Spesielt om FHIR fagforum sidene

FHIR fagforum sidene inneholder to såkalte *collections*. Dette gjør det enklere å holde referat og agenda oppdatert og brukes for å holde [møteplanen](docs/FHIR-faglig-forum/index.md) oppdatert. Alle filer med frontmatter som ligger i katalogen *_agenda* eller *_referat* kommer med i møteplanen. Agenda skal ha følgende frontmatter:

~~~
---
layout: default
title: FHIR fagforum møte nr X
dato: <dato for møtet>
tema: <tema for møtet>
---
~~~