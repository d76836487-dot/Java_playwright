#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/CartaDeCancelamento/CartaDeCancelamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Carta De Cancelamento

  Scenario: Filtro de datas padrão
    Given que o usuário esteja logado no portal de cancelamento de carta
    When o usuário acessa a tela de consulta de carta de cancelamento
    Then a tela deve exibir os cancelamentos do dia anterior com o texto "Ontem"

  Scenario: Filtro por Order Id
    Given que o usuário esteja logado no portal de cancelamento de carta
    When o usuário filtra os cancelamentos pelo Order Id "X"
    Then a tela deve exibir os cancelamentos correspondentes ao Order Id "X"

  Scenario: Exibição de informações não clicáveis
    Given que o usuário esteja logado no portal de cancelamento de carta
    When o usuário acessa a tela de consulta de carta de cancelamento
    And as informações de data do cancelamento, valor do cancelamento, bandeira, produto, status e
    Then a opção de download da carta de cancelamento devem ser exibidas por linha e não devem ser clicáveis