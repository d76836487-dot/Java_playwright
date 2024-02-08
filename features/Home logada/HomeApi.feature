#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada_Conferindo_Com_Api
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Home Logada Conferindo Com Api

  @api
  @TestCaseKey=SMP-T118
  Scenario: Recebimentos Hoje no card Recebimentos é igual a API
    Given Usuário acessou o Home
    Then Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API

  @api
  @TestCaseKey=SMP-T139
  Scenario: Valor de Recebimentos Futuros Previstos na Home é igual à API
    Given Usuário acessou o Home
    Then Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API

  @api
  @TestCaseKey=SMP-T29
  Scenario: Valor de Vendas Hoje na Home é igual à API
    Given Usuário acessou o Home
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API

  @api
  @TestCaseKey=SMP-T31
  Scenario: Compara últimas vendas na Home com a API
    Given Usuário acessou o Home
    And Usuário NÃO verá mensagem "Você não possui nenhuma venda no último mês"
    Then 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API

