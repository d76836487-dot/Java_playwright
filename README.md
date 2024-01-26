#### en

WIP

#### pt-br

Ainda preciso documentar isso, mas ta indo!

# Automacao portaldocliente.fiserv.com

These are UI tests for portaldocliente.fiserv.com


# Running tests per configuration
Each configuration is associated to one contract and one user.

To run it for a specific configuration add these options in Environment Variables when running with IntelliJ:

- CONTRACT_URL
- CONTRACT_USER
- CONTRACT_PASSWORD
- CONTRACT_IDENTITY

# Command to get ids
npx playwright codegen playwright.dev