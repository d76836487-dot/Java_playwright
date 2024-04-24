#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados

  @TestCaseKey=SMP-T328
  Scenario: Valor total Líquido de UR igual a soma do Valor de Bandeiras
    Then Valor total Líquido de UR será igual à soma dos valores das Bandeiras

  @TestCaseKey=SMP-T330
  Scenario: Valor total é igual a soma do Valor Líquido com o Valor Pago
    Then Valor total é igual a soma do Valor Líquido com o Valor Pago

