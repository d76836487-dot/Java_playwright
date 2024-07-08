#language:en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorio_de_Vendas/Relatorio_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Relatorio de Vendas
  #Ajustado e passando 13/06/2024 - Bressan
  @TestCaseKey=SMP-T363
  Scenario Outline: Health check Relatório de vendas
    Given open portal "<alianca>" and logon
    When Usuário acessou página de Vendas
    And ao clicar no menu lateral "Relatorio de Vendas"
    Then ele deve ver as informações de vendas atuais, incluindo abas para "Hoje", "Histórico de vendas", "Não efetivadas", "Pré autorizações" e "Voucher"
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

