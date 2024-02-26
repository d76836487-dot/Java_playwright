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

  @TestCaseKey=SMP-T164
  Scenario: Selecionar Ontem seleciona o dia anterior
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Ontem
    Then 'Date ranger - Início Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data de ontem'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'

  @TestCaseKey=SMP-T165
  Scenario: Selecionar Mês Atual seleciona o dia anterior
    Given Usuário acessou Vendas - Histórico de Vendas
    When Usuário seleciona Mês Atual
    Then 'Date ranger - Início Data Selecionada' representará 'dia início do mês'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data início do mês'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'

