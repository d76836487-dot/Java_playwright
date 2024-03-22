#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada_Conferindo_Com_Api
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home Logada Conferindo Com Api

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso e sessão foi salva

  @TestCaseKey=SMP-T118
  Scenario: Recebimentos Hoje no card Recebimentos é igual a API
    Given Usuário acessou o Home
    Then Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API

  @TestCaseKey=SMP-T139
  Scenario: Valor de Recebimentos Futuros Previstos na Home é igual à API
    Given Usuário acessou o Home
    Then Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API

  @TestCaseKey=SMP-T29
  Scenario: Valor de Vendas Hoje na Home é igual à API
    Given Usuário acessou o Home
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API

  @TestCaseKey=SMP-T31
  Scenario: Compara últimas vendas na Home com a API
    Given Usuário acessou o Home
    And encontrou o campo "Home - Card Últimas Vendas - Valor"
    Then 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API

  @ignore # não tenho certeza se este teste está correto
  @TestCaseKey=SMP-T146
  Scenario: Compara agenda de recebimento da semana com a API
    Given Usuário acessou o Home
    Then 'Home - Card agenda semana' será igual a API

  @ignore # não tenho certeza se este teste está correto
  @MDRPadrão @PermiteAdiantamento
  @TestCaseKey=SMP-T162
  Scenario: Está trazendo todos os ECs no card Adiantamento igual a API
    Given Usuário acessou o Home
    Then 'Home - Card Antecipação - ECs' são os mesmos que a API

