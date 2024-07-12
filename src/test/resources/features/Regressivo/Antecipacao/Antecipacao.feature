#language: en
@sicredi @bin003
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Antecipação_Trocar_Estabelecimento
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Antecipação Trocar Estabelecimento

  @azulzinha @bin003 @bin007   @PermiteAdiantamento
  @TestCaseKey=SMP-T317
  Scenario Outline: Tela Antecipação - botão trocar estabelecimento - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá ECs do documento selecionado
    And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar
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
  @azulzinha @bin003 @bin007  @PermiteAdiantamento
  @TestCaseKey=SMP-T316
  Scenario Outline: Tela Antecipação - botão trocar estabelecimento - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado
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
