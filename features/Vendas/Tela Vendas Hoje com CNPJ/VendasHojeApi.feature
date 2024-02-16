#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ_com_API
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ com API

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  Scenario: Quantidade de vendas é igual a API
    Given Usuário acessou Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API
