#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Tela Vendas Hoje com CNPJ

  Background:
    When Usuário tenta logar na aplicacao
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T9
  Scenario Outline: Mensagem de Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Usuário verá mensagem "<descricao>"
    @pt-br
    Examples:
      | descricao                                                                                                                                                                                                                                                          |
      | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  @TestCaseKey=SMP-T6
  Scenario Outline: Visualização do Campo Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Página conterá na seção Resumo de Vendas "<descricao>", total de vendas "<total>", e valor bruto "<valor>"
    Examples:
      | total | valor        | descricao                                                                                                                                                                                                                                                          |
      | 59    | R$ 47.100,00 | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  @TestCaseKey=SMP-T7
  Scenario Outline: Rodapé de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descricao>" com o ano atual
    @pt-br
    Examples:
      | descricao                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=SMP-T8
  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre vendas
    Then O menu de vendas expande

  @TestCaseKey=SMP-T15
  Scenario Outline: Filtrar histórico de vendas por status
    When Usuário acessa Vendas Hoje
    And Existem vendas com status "<statusvenda>"
    When Usuário filtra por tudo, exceto "<statusvenda>", em "<grupofiltro>"
    Then Serão filtradas as vendas com status "<statusvenda>"
    @pt-br
    Examples:
      | statusvenda | grupofiltro |
      | Autorizada  | Status (0)  |
      | Recusada    | Status (0)  |
      | Estornada   | Status (0)  |

  # getByTestId("generic-filter-check-all-bandeiras")
  # getByTestId("generic-filter-div-bandeira-Mastercard")
  @TestCaseKey=SMP-T21
  Scenario Outline: Filtrar histórico de vendas por bandeira
    When Usuário acessa Vendas Hoje
    And Existem vendas com bandeira "<bandeira>"
    When Usuário filtra por tudo, exceto "<bandeira>", em "<grupofiltro>"
    Then Serão filtradas as vendas com bandeira "<bandeira>"
    @pt-br
    Examples:
      | bandeira   | grupofiltro   |
      | Mastercard | Bandeiras (0) |
      | Visa       | Bandeiras (0) |

#      | Maestro     | Bandeiras (0) |
#      | Cabal       | Bandeiras (0) |
#      | Elo         | Bandeiras (0) |
#      | Banese      | Bandeiras (0) |
#      | Ticket      | Bandeiras (0) |
#      | Alelo       | Bandeiras (0) |
#      | Sorocred    | Bandeiras (0) |
#      | Amex        | Bandeiras (0) |
#      | Hipercard   | Bandeiras (0) |
#      | Sodexo      | Bandeiras (0) |
#      | VR          | Bandeiras (0) |
#      | Softnex     | Bandeiras (0) |
#      | Redecompras | Bandeiras (0) |
#      | Fepas       | Bandeiras (0) |
