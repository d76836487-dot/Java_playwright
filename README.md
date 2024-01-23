#### en

WIP

#### pt-br

Ainda preciso documentar isso, mas ta indo!

# Automacao portaldocliente.fiserv.com

These are UI tests for portaldocliente.fiserv.com


# Running tests per profile
Each profile is associated to one contract and one user.

To run it for a specific profile add this option in VM Options when running with IntelliJ:
- -Dspring.profiles.active=azulzinha-cnpj

# Command to get ids
npx playwright codegen playwright.dev
