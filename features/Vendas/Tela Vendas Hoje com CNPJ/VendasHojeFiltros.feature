#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ/Filtros_Historico_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Filtros Histórico de Vendas

  Background:
    Given Usuário logou na aplicação
    And Usuário acessa Vendas Hoje

  Scenario Outline: Filtrar histórico de vendas por Produtos
    When Existem vendas com "produto" tipo "<tipoDeProduto>"
    And Usuário filtra por tudo, exceto "<tipoDeProduto>", em "Produtos (0)"
    Then Serão filtradas as vendas com "produto" tipo "<tipoDeProduto>"
    @pt-br
    Examples:
      | tipoDeProduto         |
      | Crédito               |
      | Crédito Internacional |
      | Débito                |
      | Débito Internacional  |
      | Refeição              |
      | Alimentação           |
      | Premium               |
      | Cultura               |
      | Auto                  |
      | Gift                  |
      | Corporativo           |
      | Benefícios            |
      | Multiplo              |


