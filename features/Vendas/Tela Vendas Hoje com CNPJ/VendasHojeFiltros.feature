#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ/Filtros_Histórico_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Filtros Histórico de Vendas

  Background:
    Given Usuário logou na aplicação
    And Usuário acessa Vendas Hoje

  @TestCaseKey=SMP-T23
  Scenario Outline: Filtrar histórico de vendas por Produtos
    When Existem vendas com "produto" tipo "<tipoDeProduto>"
    And Usuário filtra por tudo, exceto "<tipoDeProduto>", em "Produtos (0)"
    Then Serão filtradas as vendas com "produto" tipo "<tipoDeProduto>"
    @pt-br
    Examples:
      | tipoDeProduto        |
      | Crédito              |
      | Débito               |
      | Débito Internacional |
      | Alimentação          |

  @TestCaseKey=SMP-T15
  Scenario Outline: Filtrar histórico de vendas por status
    When Usuário acessa Vendas Hoje
    And Existem vendas com status "<status venda>"
    When Usuário filtra por tudo, exceto "<status venda>", em "<grupo filtro>"
    Then Serão filtradas as vendas com status "<status venda>"
    @pt-br
    Examples:
      | status venda | grupo filtro |
      | Autorizada   | Status (0)   |
      | Recusada     | Status (0)   |
      | Estornada    | Status (0)   |

  @TestCaseKey=SMP-T21
  Scenario Outline: Filtrar histórico de vendas por bandeira
    When Usuário acessa Vendas Hoje
    And Existem vendas com bandeira "<bandeira>"
    When Usuário filtra por tudo, exceto "<bandeira>", em "<grupo filtro>"
    Then Serão filtradas as vendas com bandeira "<bandeira>"
    @pt-br
    Examples:
      | bandeira   | grupo filtro  |
      | Mastercard | Bandeiras (0) |
      | Visa       | Bandeiras (0) |

  @TestCaseKey=SMP-T22
  Scenario Outline: Filtrar histórico de vendas por status e bandeira
    When Usuário acessa Vendas Hoje
    And Existem vendas com status "<status venda>"
    And Existem vendas com bandeira "<bandeira>"
    When Usuário filtra por tudo, exceto "<status venda>", em "<filtro status>"
    And Usuário filtra por tudo, exceto "<bandeira>", em "<filtro bandeira>"
    Then Serão filtradas as vendas com bandeira "<bandeira>"
    And Serão filtradas as vendas com status "<status venda>"
    @pt-br
    Examples:
      | status venda | filtro status | bandeira   | filtro bandeira |
      | Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      | Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

