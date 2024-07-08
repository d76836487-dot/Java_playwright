# language: en
@sicredi @bin003 @vendas
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Historico_de_Vendas/Vendas_Historico
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Historico



  @TestCaseKey=SMP-T164
  Scenario Outline: Selecionar Ontem seleciona o dia anterior
    Given open portal "<alianca>" and logon
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Ontem
    Then 'Date ranger - Início Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data de ontem'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
  @TestCaseKey=SMP-T165
  Scenario Outline: Selecionar Mês Atual seleciona o dia anterior
    Given open portal "<alianca>" and logon
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Mês Atual
    Then 'Date ranger - Início Data Selecionada' representará 'dia início do mês'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data início do mês'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
  @TestCaseKey=SMP-T166
  Scenario Outline: Selecionar Últimos 7 Dias seleciona 7 dias anteriores
    Given open portal "<alianca>" and logon
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Últimos 7 Dias
    Then 'Date ranger - Início Data Selecionada' representará 'dia de sete dias atrás'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data de sete dias atrás'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
