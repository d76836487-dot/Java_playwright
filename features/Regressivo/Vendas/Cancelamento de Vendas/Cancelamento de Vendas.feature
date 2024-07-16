#language:en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Cancelamento_Vendas/Cancelamento_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Cancelamento de Vendas


  Scenario Outline: Verifica se a pagina Cancelamento de vendas carregou com sucesso
    Given open portal "<alianca>" and logon
    When Usuário acessou página de Vendas
    Then ao clicar no menu lateral "Cancelamento de vendas"
    And verifica se a pagina  "Cancelamento de vendas" carregou com sucesso
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
  #==========================================================================================================================================================
  #@sicredi
  #
  #Scenario Outline: Cancela Venda e confere
  #  Given que o usuário está logado e está na seção de Vendas
  #  When solicitar um cancelamento de uma venda em "Historico de vendas" informando o motivo "<motivos>"
  # Then A solicitação de cancelamento deve estar listada em "Histórico de cancelamentos" no menu "Cancelamento de Vendas"
  #  Examples:
  #    | Motivos            |
  #    | Cobrança Duplicata |

 #==========================================================================================================================================================

  Scenario Outline: Acesso ao menu Relatório de Vendas
    Given open portal "<alianca>" and logon
    When Usuário acessou página de Vendas
    Then ao clicar no menu lateral "Cancelamento de vendas"
    And seleciona 30 Dias
    And Usuário verá "Histórico de cancelamentos - Label Data do cancelamento"
    And Usuário verá "Histórico de cancelamentos - Label Valor cancelado"
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
