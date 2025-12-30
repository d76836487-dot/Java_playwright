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

# Running with IntelliJ
1. Set the user information in your environment.
   1. You may set environment variable, like AFINZ_CONTRACT_USER / AFINZ_CONTRACT_PASSWORD / AFINZ_CONTRACT_MFASECRETKEY.
   2. OR you may create a file with user/password/mfa key.
      1. Ex: application-afinz.yml. This file must be same directory as application.yml 
      2. Set values like this:
````
user-profiles:
   afinz:
      user: <cnpj>
      password: <pwd>
      mfaSecretKey: <key>  
````
2. Set the profile to run: -Dspring.profiles.active=afinz
3. Optionally you may set the tags: -Dcucumber.filter.tags="@playwright and not @ignore and not @rebatedor"
4. Optionally you may set profile as standard at "Edit configuration templates"
5. You are ready to run the tests.

# Running all tests at once
Considering you have set user and password, open git bash and run
````
./run_all_institutions.sh
````

There you have options:
-t <tags>: quais tags para rodar. Ex: -t '@playwright and not @ignore'. Padrão: '@playwright and not @ignore and not @rebatedor'.
-p <perfis>: quais perfis deve rodar. Ex: -p 'afinz azulzinha'. Padrão: 'sicredi azulzinha afinz ota-azulzinha ota-afinz bin003 bin007'.
-z <cycle id>: qual id do test cycle para subir evidências. Ex: -z 'SMP-C13'. Padrão: não subir no zephyr.


# Run tests at with bash
Run this command with bash (change azulzinha for respective configuration):
```
set -o allexport; source azulzinha.env; set + o allexport; mvn $MAVEN_CLI_OPTS clean verify -Dcucumber .filter .tags = " $CUCUMBER_TAG_EXPRESSION "
````

# Command to get ids
```
npx playwright codegen playwright.dev
```
