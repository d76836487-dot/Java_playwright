#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Antecipação_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Antecipação com API e Seleção EC

  @azulzinha @bin003 @bin007 @sicredi @PermiteAdiantamento
  @TestCaseKey=SMP-T317
  Scenario: Tela Antecipação - botão trocar estabelecimento - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá ECs do documento selecionado
    And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar

  @azulzinha @bin003 @bin007 @sicredi @PermiteAdiantamento
  @TestCaseKey=SMP-T316
  Scenario: Tela Antecipação - botão trocar estabelecimento - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado

