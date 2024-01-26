# language: en
@playwright
Feature: Verifica se portal tem identidade do contrato

  Scenario: Nome da página é igual ao contrato
    Given Usuário acessou o portal
    Then Nome da página é Portal <contrato> - Login

#  Scenario: Imagem da página é igual ao contrato
#    Given Usuário acessou o portal
#    Then Imagem da página é referente ao contrato