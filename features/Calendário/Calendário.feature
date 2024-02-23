# language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Calendário/Componente_calendário
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Componente calendário

  Background:
    Given Usuário tenta logar na aplicação
    And Usuário acessou com sucesso

  @ignore
  @TestCaseKey=SMP-T164
  Scenario: Selecionar Ontem seleciona o dia anterior
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Ontem
    Then Data seleciona representa dia anterior

