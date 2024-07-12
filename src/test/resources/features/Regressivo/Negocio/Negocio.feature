#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Recebimento_Resumo_Negócio
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Recebimento Resumo Negócio

  @TestCaseKey=SMP-T314
  Scenario Outline: Tela Negócio - botão trocar estabelecimento - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou página de Negócio
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

  @TestCaseKey=SMP-T315
  Scenario Outline: Tela Negócio - botão trocar estabelecimento - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou página de Negócio
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
