#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Tela Vendas Hoje com CNPJ

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T9
  Scenario Outline: Mensagem de Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Usuário verá mensagem "<descrição>"
    @pt-br
    Examples:
      | descrição                                                                                                                                                                                                                                                          |
      | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  @TestCaseKey=SMP-T6
  Scenario Outline: Visualização do Campo Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Página conterá na seção Resumo de Vendas "<descrição>", total de vendas "<total>", e valor bruto "<valor>"
    Examples:
      | total | valor        | descrição                                                                                                                                                                                                                                                          |
      | 59    | R$ 47.100,00 | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  @TestCaseKey=SMP-T7
  Scenario Outline: Rodapé de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=SMP-T8
  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre vendas
    Then O menu de vendas expande

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

