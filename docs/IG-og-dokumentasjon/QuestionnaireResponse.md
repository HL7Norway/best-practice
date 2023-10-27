## Bruk av QuestionniareResponse

QuestionnaireResponse kan benyttes til å hente inn mange forskjellige typer informasjon i form et FHIR grensesnitt, gjerne i sammenheng med bruk av Questionnaire for å uttrykke bestemte måter sluttbrukeren skal svare på konkrete spørsmål.

Fordelen med å benytte QuestionnaireResponse er at man kan støtte alle mulige informasjonselementer og definere disse opp helt fritt fra FHIR modellen. Denne fleksibiliteten er viktig men krever også at løsninger bare benytter QuestionnaireResponse der det ikke er naturlig å benytte andre ressurser. Spesielt vil QuestionnaireResponse ha overlappende scenarier med bruk av Medications, Summary og Diagnostic ressurser som i prinsippet kan benyttes til å hente inn informasjon om pasienten om alt fra medisinering til oppsummerende informasjon om behandling og alle typer observasjoner og diagnoser.

I tilfeller hvor man vurderer bruk av QuestionnaireResponse/Questionnaire må man derfor vurdere om det er andre ressurser som er mer naturlig å benytte for brukerhistorien. I korte trekk er det slik at Questionnaire/QuestionnaireResponse bare skal benyttes der informasjonsinnhentingen faktisk er et typisk spørreskjema scenario, med predefinerte spørsmål og predefinert innhold i svaret. I alle tilfeller hvor informasjonen eksisterer i systemet eller skal populeres fra andre kilder vil andre ressurser eller kombinasjoner av disse være det riktige valget.

Andre viktige avklaringer som må gjøres når man vurderer løsning for bruk av spørreskjema er:
* Ren FHIR REST API tilnærming
* Benytte mer spesialiserte operasjoner eller søk (skreddersydde operations/searchparameters)
* Benytte Bundles med sterke krav til innhold
* Benytte definerte meldinger/dokumenter for rapportering

