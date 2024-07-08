#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Agenda_de_recebimentos_da_semana
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Agenda de recebimentos da semana

  OBJETIVO:
  Essa história tem como objetivo a criação de uma nova home logada para o cliente obter informações em real time quando
  se logar no Portal, além de navegar em uma jornada com novo Design Sistem.
  Essa demanda é para todas as alianças usuárias do App: Bin, FBD, Caixa, Afinz, Sicredi e Redepop.
  VISÃO DO USUÁRIO
  *Eu como* usuário do Portal
  *Quero* visualizar uma nova Home logada
  *Para* ter acesso a informações real time com um novo Design Sistem
  TIPO DE MANUTENÇÃO:
  Criação
  ESCOPO - Lista de Funcionalidades:
  - Visualização de “Agenda de recebimentos da semana” com informações sobre os recebimentos dos 5 dias da semana
  - Visualização da data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados.
  - Visualização do botão “Ver recebimentos detalhado”
  - Visualizar “Hoje” destacado com a cor da aliança
  - Visualizar valores em verde o dia atual e os dias anteriores que já passaram
  - Visualizar em preto os dias que ainda estão por vir

  #Background:
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T144
  Scenario Outline: conteúdo correto da Agenda de recebimentos da semana
    GGiven open portal "<alianca>" and logon
    Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados
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
  @TestCaseKey=SMP-T150
  Scenario Outline: destaque para as informações da agenda de recebimentos
    Given open portal "<alianca>" and logon
    Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará o dia "hoje" destacado e os dias anteriores com valores verdes e os próximos com letras pretas
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
  @TestCaseKey=SMP-T145
  Scenario Outline: Agenda de recebimentos da semana vazia
    Given open portal "<alianca>" and logon
    And não existir Agenda de recebimentos da semana para exibir
    Then Usuário verá em "Home - Agenda de recebimentos da semana - mensagem" o valor "Você não possui nenhum recebimento previsto para essa semana."
    And usuário visualizará um botão "Ver recebimentos detalhado"
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
