#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Hoje
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Hoje

  @TestCaseKey=SMP-T9
  Scenario Outline: Mensagem de Resumo de Vendas
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário acessa Vendas Hoje
    Then Usuário verá em "Home - Resumo" o valor "<descrição>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |descrição                                                                                                                                                                                                                                                          |
      |Usuario master     |sicredi  | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |
    @afinz @alliances
    Examples:
      |Description        |alianca  |descrição                                                                                                                                                                                                                                                          |
      |Usuario master     |afinz    | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |descrição                                                                                                                                                                                                                                                          |
      |Usuario master     |azulzinha| Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |
    @bin @alliances
    Examples:
      |Description        |alianca  |descrição                                                                                                                                                                                                                                                          |
      |Usuario master     |bin      | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  # TODO: fix me when we have 'rebatedores'
  @TestCaseKey=SMP-T6
  Scenario Outline: Visualização da Quantidade e Valor de Vendas Hoje
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário acessa Vendas Hoje
    Then Usuário verá em "Vendas Hoje - Resumo - Quantidade Vendas" o valor "0"
    And Usuário verá em "Vendas Hoje - Resumo - Valor Vendas" o valor "<valor vendas>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |valor vendas |
      |Usuario master     |sicredi  |R$           |
    @afinz @alliances
    Examples:
      |Description        |alianca  |valor vendas |
      |Usuario master     |afinz    |R$           |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |valor vendas |
      |Usuario master     |azulzinha|R$           |
    @bin @alliances
    Examples:
      |Description        |alianca  |valor vendas |
      |Usuario master     |bin      |R$           |


  @TestCaseKey=SMP-T7
  Scenario Outline: Rodapé de Vendas Hoje
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @sicredi @alliances
    Examples:
      |Description        |alianca  | descrição                                                                             |
      |Usuario master     |sicredi  | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @afinz @alliances
    Examples:
      |Description        |alianca  | descrição                                                                             |
      |Usuario master     |afinz    | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  | descrição                                                                             |
      |Usuario master     |azulzinha| © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @bin @alliances
    Examples:
      |Description        |alianca  | descrição                                                                             |
      |Usuario master     |bin      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |


  @TestCaseKey=SMP-T8
  Scenario Outline: O menu expande quando o usuário passa o mouse
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário passa o mouse sobre "Menu Lateral - Vendas"
    Then O menu lateral expandiu contendo "Vendas"
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


  @TestCaseKey=SMP-T149
  Scenario Outline: Ocultar valores de Vendas Hoje
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessa Vendas Hoje
    And Todas as barras de carregamento sumiram
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Vendas Hoje - Resumo - Quantidade Vendas" o valor "••••"
    And Usuário verá em "Vendas Hoje - Resumo - Valor Vendas" o valor "R$ ••••"
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

#=========================vendas Hoje com API


  #@TestCaseKey=SMP-T151
  #Scenario Outline: Quantidade de vendas é igual a API
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Usuário acessa Vendas Hoje
  #  And Todas as requisições HTTP foram respondidas
  #  Given Usuário acessou Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API

  #@TestCaseKey=SMP-T154
  #Scenario Outline: Estabelecimentos no filtro é igual a API
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Usuário acessa Vendas Hoje
  #  And Todas as requisições HTTP foram respondidas
  #  Given Usuário abriu a opção "<accordion>" no filtro de Vendas Hoje
  #  Then Opções do filtro corresponderão aos ECs da API
  #  @pt-br
  #  Examples:
  #    | accordion           |
  #    | Estabelecimento (0) |

  #@ignore
  #@TestCaseKey=SMP-T163
  #Scenario Outline: Compara primeira página do histórico de venda hoje com API
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Usuário acessa Vendas Hoje
  #  And Todas as requisições HTTP foram respondidas
  #  Given Usuário acessou Vendas Hoje
  #  Then Primeira página do histórico de venda hoje serão equivalentes com a API

#======================= Vendas Hoje com Filtros



  @TestCaseKey=SMP-T23
  Scenario Outline: Filtrar histórico de vendas por Produtos
    Given open portal "<alianca>" and logon
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas
    Given Existem vendas com "Vendas Hoje - Histórico - Coluna Produto" tipo "<tipoDeProduto>"
    When Usuário filtra por tudo, exceto "<tipoDeProduto>", em "Produtos (0)"
    Then Serão filtradas as vendas com produto "<tipoDeProduto>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |tipoDeProduto        |
      |Usuario master     |sicredi  | Crédito              |
    @afinz @alliances
    Examples:
      |Description        |alianca  |tipoDeProduto        |
      |Usuario master     |afinz    |Débito               |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |tipoDeProduto        |
      |Usuario master     |azulzinha| Débito Internacional |
    @bin @alliances
    Examples:
      |Description        |alianca  |tipoDeProduto        |
      |Usuario master     |bin      |Alimentação          |

  @TestCaseKey=SMP-T15
  Scenario Outline: Filtrar histórico de vendas por status
    Given open portal "<alianca>" and logon
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas
    When Usuário acessa Vendas Hoje
    And Existem vendas com status "<status venda>"
    When Usuário filtra por tudo, exceto "<status venda>", em "<grupo filtro>"
    Then Serão filtradas as vendas com status "<status venda>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |status venda | grupo filtro |
      |Usuario master     |sicredi  |Autorizada   | Status (0)   |
      |Usuario master     |sicredi  |Recusada     | Status (0)   |
      |Usuario master     |sicredi  | Estornada    | Status (0)   |
    @afinz @alliances
    Examples:
      |Description        |alianca  |status venda | grupo filtro |
      |Usuario master     |afinz    |Autorizada   | Status (0)   |
      |Usuario master     |afinz    |Recusada     | Status (0)   |
      |Usuario master     |afinz    | Estornada    | Status (0)   |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |status venda | grupo filtro |
      |Usuario master     |azulzinha|Autorizada   | Status (0)   |
      |Usuario master     |azulzinha|Recusada     | Status (0)   |
      |Usuario master     |azulzinha| Estornada    | Status (0)   |
    @bin @alliances
    Examples:
      |Description        |alianca  |status venda | grupo filtro |
      |Usuario master     |bin      |Autorizada   | Status (0)   |
      |Usuario master     |bin      |Recusada     | Status (0)   |
      |Usuario master     |bin      | Estornada    | Status (0)   |

  @TestCaseKey=SMP-T21
  Scenario Outline: Filtrar histórico de vendas por bandeira
     Given open portal "<alianca>" and logon
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessa Vendas Hoje
    And Existem vendas com bandeira "<bandeira>"
    When Usuário filtra por tudo, exceto "<bandeira>", em "<grupo filtro>"
    Then Serão filtradas as vendas com bandeira "<bandeira>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |bandeira   | grupo filtro  |
      |Usuario master     |sicredi  |Mastercard | Bandeiras (0) |
      |Usuario master     |sicredi  |Visa       | Bandeiras (0) |

    @afinz @alliances
    Examples:
      |Description        |alianca  |bandeira   | grupo filtro  |
      |Usuario master     |afinz    |Mastercard | Bandeiras (0) |
      |Usuario master     |afinz    |Visa       | Bandeiras (0) |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  |bandeira   | grupo filtro  |
      |Usuario master     |azulzinha|Mastercard | Bandeiras (0) |
      |Usuario master     |azulzinha|Visa       | Bandeiras (0) |

    @bin @alliances
    Examples:
      |Description        |alianca  |bandeira   | grupo filtro  |
      |Usuario master     |bin      |Mastercard | Bandeiras (0) |
      |Usuario master     |bin      |Visa       | Bandeiras (0) |


  @TestCaseKey=SMP-T22
  Scenario Outline: Filtrar histórico de vendas por status e bandeira
     Given open portal "<alianca>" and logon
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessa Vendas Hoje
    And Existem vendas com status "<status venda>"
    And Existem vendas com bandeira "<bandeira>"
    When Usuário filtra por tudo, exceto "<status venda>", em "<filtro status>"
    And Usuário filtra por tudo, exceto "<bandeira>", em "<filtro bandeira>"
    Then Serão filtradas as vendas com bandeira "<bandeira>"
    And Serão filtradas as vendas com status "<status venda>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  | status venda | filtro status | bandeira   | filtro bandeira |
      |Usuario master     |sicredi  |Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      |Usuario master     |sicredi  |Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @afinz @alliances
    Examples:
      |Description        |alianca  | status venda | filtro status | bandeira   | filtro bandeira |
      |Usuario master     |afinz    |Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      |Usuario master     |afinz    |Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  | status venda | filtro status | bandeira   | filtro bandeira |
      |Usuario master     |azulzinha|Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      |Usuario master     |azulzinha|Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @bin @alliances
    Examples:
      |Description        |alianca  | status venda | filtro status | bandeira   | filtro bandeira |
      |Usuario master     |bin      |Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      |Usuario master     |bin      |Recusada     | Status (0)    | Visa       | Bandeiras (0)   |


    #================ Vendaws Hoje com seleção EC

  #@ignore # TODO: confirmar a api desta tela...
  #@TestCaseKey=SMP-T288
  #Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master)
  #  Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
  #  And Usuário selecionou um EC e clicar Acessar
  #  When Usuário acessa Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

  #@ignore # TODO: confirmar a api desta tela...
  #@TestCaseKey=SMP-T291
  #Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master) terá mesma quantidade vendas
  #  Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
  #  And Usuário selecionou um documento e clicar Acessar
  #  When Usuário acessa Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado



  @TestCaseKey=SMP-T294
  Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master) terá mesmos estabelecimentos no filtro
     Given open portal "<alianca>" and logon
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas Hoje
    And usuário clicou no "Vendas Hoje - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Vendas Hoje' terá somente o ECs do documento selecionado
    And A soma de todos valores Brutos é igual a "Vendas Hoje - Resumo - Valor Vendas"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |sicredi  | Excel   |
      |Usuario master     |sicredi  | CSV     |
    @afinz @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |afinz    | Excel   |
      |Usuario master     |afinz    | CSV     |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |azulzinha| Excel   |
      |Usuario master     |azulzinha| CSV     |
    @bin @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |bin      | Excel   |
      |Usuario master     |bin      | CSV     |

  @TestCaseKey=SMP-T295
  Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master) terá mesmos estabelecimentos no filtro
     Given open portal "<alianca>" and logon
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas Hoje
    And usuário clicou no "Vendas Hoje - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Vendas Hoje' terá somente o ECs do documento selecionado
    And A soma de todos valores Brutos é igual a "Vendas Hoje - Resumo - Valor Vendas"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |sicredi  | Excel   |
      |Usuario master     |sicredi  | CSV     |
    @afinz @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |afinz    | Excel   |
      |Usuario master     |afinz    | CSV     |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |azulzinha| Excel   |
      |Usuario master     |azulzinha| CSV     |
    @bin @alliances
    Examples:
      |Description        |alianca  |formato |
      |Usuario master     |bin      | Excel   |
      |Usuario master     |bin      | CSV     |