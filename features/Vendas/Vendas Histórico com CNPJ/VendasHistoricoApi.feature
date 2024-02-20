#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Histórico_com_CNPJ_com_API
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Histórico com CNPJ com API

  Background:
    Given Usuário tenta logar na aplicação
    And Usuário acessou com sucesso
    And Usuário acessou Vendas - Histórico de Vendas

  Scenario Outline: Compara valores bruto, líquido e total de vendas com api
    Given Usuário viu "<período>" em "Vendas - Histórico Vendas - Período - Descrição"
    Then Valor bruto será igual a API
    And Valor líquido será igual a API
    And Total de vendas será igual a API
    @pt-br
    Examples:
      | período |
      | Ontem   |
