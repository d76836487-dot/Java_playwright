#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Agenda_de_recebimentos_da_semana
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Agenda de recebimentos da semana

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

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso
    And Todas as requisições HTTP foram respondidas

  Scenario: conteúdo correto da Agenda de recebimentos da semana
    Given que estou na tela “início” do Portal
    Given Agenda de recebimentos da semana carregou
    When visualizar o box "Agenda de recebimentos da semana"
    Then devo visualizar 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados

#  *Dado* que estou na tela “início” do Portal
#  *Quando* visualizar o box “Agenda de recebimentos da semana”
#  *Então* devo visualizar o dia “hoje” destacado e os dias anteriores com valores verdes e os próximos com letras pretas
#
#  *Dado* que estou na tela “início” do Portal
#  *Quando* não tiver agenda de recebimentos da semana para exibir
#  *Então* devo visualizar a mensagem “Você não possui nenhum recebimento previsto para essa semana”
#  *E* um botão “Ver recebimentos detalhado”
#
#  {panel}
#  {panel:title=CENÁRIO DE TESTE|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=2}
#  h6. *CENÁRIOS: VALIDAÇÕES DE DIRECIONAMENTOS DOS BOXES DA HOME *
#
#  *Dado* que estou na tela “início” do Portal
#  *Quando* não tiver agenda de recebimentos da semana para exibir
#  *Então* devo visualizar a mensagem “Você não possui nenhum recebimento previsto para essa semana”
#  *E* um botão “Ver recebimentos detalhado”
#
#  *Dado* que estou na tela “início” do Portal
#  *Quando* não tiver agenda de recebimentos para algum dia, mas tiver para outros
#  *Então* devo visualizar os valores nos dias pertinentes e o valor 0,00 para os demais que não possuem previsão de agenda.
