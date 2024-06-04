#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorio_de_Vendas/Relatorio_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Relatorio de Vendas

  @HealthCheck
  @TestCaseKey=SMP-T363
  Scenario: Health check Relatório de vendas
    Given Usuário efetue logon
    #When Usuário tenta logar na aplicação
    When Usuário acessou página de Vendas
    And ao clicar no menu lateral "Relatório de vendas"
    Then ele deve ver as informações de vendas atuais, incluindo abas para "Hoje", "Histórico de vendas", "Não efetivadas", "Pré autorizações" e "Voucher"

