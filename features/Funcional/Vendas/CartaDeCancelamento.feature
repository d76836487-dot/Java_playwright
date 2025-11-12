#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/CartaDeCancelamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: CartaDeCancelamento

  @TestCaseKey=LPDC-T1987
  Scenario: Filtro de datas padrão
    Given que o usuário esteja logado no portal de cancelamento de carta
    When o usuário acessa a tela de consulta de carta de cancelamento
    Then a tela deve exibir os cancelamentos do dia anterior com o texto "Ontem"

  @TestCaseKey=LPDC-T1988
  Scenario: Filtro por Order Id
    Given que o usuário esteja logado no portal de cancelamento de carta
    When o usuário filtra os cancelamentos pelo Order Id "X"
    Then a tela deve exibir os cancelamentos correspondentes ao Order Id "X"

  @TestCaseKey=LPDC-T1989
  Scenario: Exibição de informações não clicáveis
    Given que o usuario esteja logado no portal de cancelamento de carta
    When o usuário acessa a tela de consulta de carta de cancelamento
    And as informacoes de data do cancelamento, valor do cancelamento, bandeira, produto, status e
    Then a opcao de download da carta de cancelamento devem ser exibidas por linha e nao devem ser clicaveis

