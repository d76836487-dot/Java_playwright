#language:en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Relatorio_de_Vendas/Vendas_Relatorio_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Relatorio de Vendas

  #Ajustado e passando 13/06/2024 - Bressan
  @TestCaseKey=LPDC-T59
  Scenario Outline: Health check Relatório de vendas
    Given open portal "<alianca>" and logon
    When Usuário acessou página de Vendas
    And ao clicar no menu lateral "Relatorio de Vendas"
    Then ele deve ver as informações de vendas atuais, incluindo abas para "Hoje", "Histórico de vendas", "Não efetivadas", "Pré autorizações" e "Voucher"
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T68
  Scenario Outline: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    #And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    #And Usuário acessou Vendas - Voucher
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher do excel é igual a Total de Vendas da tela
    And A soma de vendas voucher é igual ao valor bruto autorizado
    @sicredi @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu |
      | Usuario master | sicredi | Vendas |         | Voucher   |

    @afinz @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu |
      | Usuario master | afinz   | Vendas |         | Voucher   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | menu   | submenu | thirdmenu |
      | Usuario master | azulzinha | Vendas |         | Voucher   |

    @bin @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu |
      | Usuario master | bin     | Vendas |         | Voucher   |

  @TestCaseKey=LPDC-T52
  Scenario Outline: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Voucher
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher do excel é igual a Total de Vendas da tela
    And A soma de vendas voucher é igual ao valor bruto autorizado
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T42
  Scenario Outline: Valores tela Vendas - PRÉ-AUTORIZADAS deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Pré Autorizações
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Pré Autorizações - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Pré Autorizadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Pré Autorizadas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de vendas autorizadas (confirmadas) é igual ao valor bruto autorizado
    And A soma de vendas pré-autorizadas é igual ao valor bruto a confirmar
    And A contagem de vendas pré-autorizadas é igual a Total de Vendas
    @sicredi @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | sicredi | Excel  |
      | Usuario master | sicredi | CSV    |

    @afinz @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | afinz   | Excel  |
      | Usuario master | afinz   | CSV    |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | format |
      | Usuario master | azulzinha | Excel  |
      | Usuario master | azulzinha | CSV    |

    @bin @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | bin     | Excel  |
      | Usuario master | bin     | CSV    |

  @TestCaseKey=LPDC-T41
  Scenario Outline: Valores tela Vendas - PRÉ-AUTORIZADAS deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Pré Autorizações
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Pré Autorizações - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Pré Autorizadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Pré Autorizadas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de vendas autorizadas (confirmadas) é igual ao valor bruto autorizado
    And A soma de vendas pré-autorizadas é igual ao valor bruto a confirmar
    And A contagem de vendas pré-autorizadas é igual a Total de Vendas
    @sicredi @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | sicredi | Excel  |
      | Usuario master | sicredi | CSV    |

    @afinz @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | afinz   | Excel  |
      | Usuario master | afinz   | CSV    |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | format |
      | Usuario master | azulzinha | Excel  |
      | Usuario master | azulzinha | CSV    |

    @bin @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | bin     | Excel  |
      | Usuario master | bin     | CSV    |

  @TestCaseKey=LPDC-T49
  Scenario Outline: Valores tela Vendas - NÃO EFETIVADAS deve bater com exportação - com seleção de Documento
    #Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    Given open portal "<alianca>" and logon
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Não Realizadas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Não Efetivadas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Não Efetivadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no cabeçalho
    And A soma de vendas recusadas é igual a "Não Efetivadas - Recusadas"
    And A soma de vendas estornadas é igual a "Não Efetivadas - Estornadas"
    @sicredi @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | sicredi | Excel  |
      | Usuario master | sicredi | CSV    |

    @afinz @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | afinz   | Excel  |
      | Usuario master | afinz   | CSV    |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | format |
      | Usuario master | azulzinha | Excel  |
      | Usuario master | azulzinha | CSV    |

    @bin @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | bin     | Excel  |
      | Usuario master | bin     | CSV    |

  @TestCaseKey=LPDC-T51
  Scenario Outline: Valores tela Vendas - NÃO EFETIVADAS deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Não Realizadas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Não Efetivadas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Não Efetivadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no cabeçalho
    And A soma de vendas recusadas é igual a "Não Efetivadas - Recusadas"
    And A soma de vendas estornadas é igual a "Não Efetivadas - Estornadas"
    @sicredi @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | sicredi | Excel  |
      | Usuario master | sicredi | CSV    |

    @afinz @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | afinz   | Excel  |
      | Usuario master | afinz   | CSV    |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | format |
      | Usuario master | azulzinha | Excel  |
      | Usuario master | azulzinha | CSV    |

    @bin @alliances
    Examples:
      | Description    | alianca | format |
      | Usuario master | bin     | Excel  |
      | Usuario master | bin     | CSV    |

  @TestCaseKey=LPDC-T50
  Scenario Outline: Selecionar Ontem seleciona o dia anterior
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    When Usuário seleciona Ontem
    Then 'Date ranger - Início Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data de ontem'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
    @sicredi @alliances @sicredi_T164
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | sicredi | Vendas |         | Histórico de vendas |

    @afinz @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | afinz   | Vendas |         | Histórico de vendas |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | menu   | submenu | thirdmenu           |
      | Usuario master | azulzinha | Vendas |         | Histórico de vendas |

    @bin @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | bin     | Vendas |         | Histórico de vendas |

  @TestCaseKey=LPDC-T60
  Scenario Outline: Selecionar Mês Atual seleciona o dia anterior
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    When Usuário seleciona Mês Atual
    Then 'Date ranger - Início Data Selecionada' representará 'dia início do mês'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data início do mês'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
    @sicredi @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | sicredi | Vendas |         | Histórico de vendas |

    @afinz @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | afinz   | Vendas |         | Histórico de vendas |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | menu   | submenu | thirdmenu           |
      | Usuario master | azulzinha | Vendas |         | Histórico de vendas |

    @bin @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | bin     | Vendas |         | Histórico de vendas |

  @TestCaseKey=LPDC-T360
  Scenario Outline: Selecionar Últimos 7 Dias seleciona 7 dias anteriores
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    When Usuário seleciona Últimos 7 Dias
    Then 'Date ranger - Início Data Selecionada' representará 'dia de sete dias atrás'
    And 'Date ranger - Fim Data Selecionada' representará 'dia de ontem'
    And 'Date ranger - Dia inicial Digitado' representará 'data de sete dias atrás'
    And 'Date ranger - Dia final Digitado' representará 'data de ontem'
    @sicredi @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | sicredi | Vendas |         | Histórico de vendas |

    @afinz @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | afinz   | Vendas |         | Histórico de vendas |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | menu   | submenu | thirdmenu           |
      | Usuario master | azulzinha | Vendas |         | Histórico de vendas |

    @bin @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | bin     | Vendas |         | Histórico de vendas |

  @TestCaseKey=LPDC-T56
  Scenario Outline: Rodapé de Vendas Hoje
    Given open portal "<alianca>" and logon
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @sicredi @alliances
    Examples:
      | Description    | alianca | descrição                                                                             |
      | Usuario master | sicredi | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

    @afinz @alliances
    Examples:
      | Description    | alianca | descrição                                                                             |
      | Usuario master | afinz   | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | descrição                                                                             |
      | Usuario master | azulzinha | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

    @bin @alliances
    Examples:
      | Description    | alianca | descrição                                                                             |
      | Usuario master | bin     | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=LPDC-T70
  Scenario Outline: Traz como padrão Ontem no filtro do período
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    Then Usuário verá em "Vendas - Histórico Vendas - Período - Descrição" o valor "<período>"
    @sicredi @alliances
    Examples:
      | Description    | alianca | período | menu   | submenu | thirdmenu           |
      | Usuario master | sicredi | Ontem   | Vendas |         | Histórico de vendas |

    @afinz @alliances
    Examples:
      | Description    | alianca | período | menu   | submenu | thirdmenu           |
      | Usuario master | afinz   | Ontem   | Vendas |         | Histórico de vendas |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | período | menu   | submenu | thirdmenu           |
      | Usuario master | azulzinha | Ontem   | Vendas |         | Histórico de vendas |

    @bin @alliances
    Examples:
      | Description    | alianca | período | menu   | submenu | thirdmenu           |
      | Usuario master | bin     | Ontem   | Vendas |         | Histórico de vendas |

  @TestCaseKey=LPDC-T71
  Scenario Outline: Ocultar valores de Vendas - Histórico de Vendas
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Vendas - Histórico de Vendas - Resumo - Quantidade de vendas" o valor "••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor bruto" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor líquido" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor cancelado" o valor "R$ ••••"
    @sicredi @alliances @sicredi_T167
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | sicredi | Vendas |         | Histórico de vendas |

    @afinz @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | afinz   | Vendas |         | Histórico de vendas |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | menu   | submenu | thirdmenu           |
      | Usuario master | azulzinha | Vendas |         | Histórico de vendas |

    @bin @alliances
    Examples:
      | Description    | alianca | menu   | submenu | thirdmenu           |
      | Usuario master | bin     | Vendas |         | Histórico de vendas |

  @TestCaseKey=LPDC-T69
  Scenario Outline: Compara valores bruto, líquido e total de vendas com api
    Given open portal "<alianca>" and logon
    And Usuário acessou Vendas - Histórico de Vendas
    Given Usuário viu "<período>" em "Vendas - Histórico Vendas - Período - Descrição"
    Then Valor bruto será igual a API
    And Valor líquido será igual a API
    And Total de vendas será igual a API
    @sicredi @alliances
    Examples:
      | Description    | alianca | período |
      | Usuario master | sicredi | Ontem   |

    @afinz @alliances
    Examples:
      | Description    | alianca | período |
      | Usuario master | afinz   | Ontem   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | período |
      | Usuario master | azulzinha | Ontem   |

    @bin @alliances
    Examples:
      | Description    | alianca | período |
      | Usuario master | bin     | Ontem   |

  @TestCaseKey=LPDC-T67
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Histórico de Vendas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Histórico de Vendas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Histórico de Vendas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Histórico de Vendas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de todos valores Brutos é igual a "Vendas Histórico - Valor Bruto"
    And A soma de todos valores Líquidos é igual a "Vendas Histórico - Valor Líquido"
    And A soma de todos valores Cancelados é igual a "Vendas Histórico - Valor Cancelados"
    Examples:
      | formato            |
      | Excel Simplificado |
      | Excel Detalhado    |
      | CSV Simplificado   |
      | CSV Detalhado      |

    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T61
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Histórico de Vendas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Histórico de Vendas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Histórico de Vendas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Histórico de Vendas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de todos valores Brutos é igual a "Vendas Histórico - Valor Bruto"
    And A soma de todos valores Líquidos é igual a "Vendas Histórico - Valor Líquido"
    And A soma de todos valores Cancelados é igual a "Vendas Histórico - Valor Cancelados"
    @sicredi @alliances
    Examples:
      | Description    | alianca | formato            |
      | Usuario master | sicredi | Excel Simplificado |
      | Usuario master | sicredi | Excel Detalhado    |
      | Usuario master | sicredi | CSV Simplificado   |
      | Usuario master | sicredi | CSV Detalhado      |

    @afinz @alliances
    Examples:
      | Description    | alianca | formato            |
      | Usuario master | afinz   | Excel Simplificado |
      | Usuario master | afinz   | Excel Detalhado    |
      | Usuario master | afinz   | CSV Simplificado   |
      | Usuario master | afinz   | CSV Detalhado      |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | formato            |
      | Usuario master | azulzinha | Excel Simplificado |
      | Usuario master | azulzinha | Excel Detalhado    |
      | Usuario master | azulzinha | CSV Simplificado   |
      | Usuario master | azulzinha | CSV Detalhado      |

    @bin @alliances
    Examples:
      | Description    | alianca | formato            |
      | Usuario master | bin     | Excel Simplificado |
      | Usuario master | bin     | Excel Detalhado    |
      | Usuario master | bin     | CSV Simplificado   |
      | Usuario master | bin     | CSV Detalhado      |

  @TestCaseKey=LPDC-T58
  Scenario Outline: Mensagem de Resumo de Vendas
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário acessa Vendas Hoje
    Then Usuário verá em "Home - Resumo" o valor "<descrição>"
    @sicredi @alliances
    Examples:
      | Description    | alianca | descrição                                                                                                                                                                                                                                                          |
      | Usuario master | sicredi | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

    @afinz @alliances
    Examples:
      | Description    | alianca | descrição                                                                                                                                                                                                                                                          |
      | Usuario master | afinz   | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | descrição                                                                                                                                                                                                                                                          |
      | Usuario master | azulzinha | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

    @bin @alliances
    Examples:
      | Description    | alianca | descrição                                                                                                                                                                                                                                                          |
      | Usuario master | bin     | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  # TODO: fix me when we have 'rebatedores'
  @TestCaseKey=LPDC-T66
  Scenario Outline: Visualização da Quantidade e Valor de Vendas Hoje
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário acessa Vendas Hoje
    Then Usuário verá em "Vendas Hoje - Resumo - Quantidade Vendas" o valor "0"
    And Usuário verá em "Vendas Hoje - Resumo - Valor Vendas" o valor "<valor vendas>"
    @sicredi @alliances
    Examples:
      | Description    | alianca | valor vendas |
      | Usuario master | sicredi | R$           |

    @afinz @alliances
    Examples:
      | Description    | alianca | valor vendas |
      | Usuario master | afinz   | R$           |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | valor vendas |
      | Usuario master | azulzinha | R$           |

    @bin @alliances
    Examples:
      | Description    | alianca | valor vendas |
      | Usuario master | bin     | R$           |

  @TestCaseKey=LPDC-T73
  Scenario Outline: O menu expande quando o usuário passa o mouse
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    When Usuário passa o mouse sobre "Menu Lateral - Vendas"
    Then O menu lateral expandiu contendo "Vendas"
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T65
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
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  #=========================vendas Hoje com API
  #
  #Scenario Outline: Quantidade de vendas é igual a API
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Usuário acessa Vendas Hoje
  #  And Todas as requisições HTTP foram respondidas
  #  Given Usuário acessou Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API
  #
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
  #
  #Scenario Outline: Compara primeira página do histórico de venda hoje com API
  #  Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
  #  And Usuário acessa Vendas Hoje
  #  And Todas as requisições HTTP foram respondidas
  #  Given Usuário acessou Vendas Hoje
  #  Then Primeira página do histórico de venda hoje serão equivalentes com a API
  #======================= Vendas Hoje com Filtros
  @TestCaseKey=LPDC-T72
  Scenario Outline: Filtrar histórico de vendas por Produtos
    Given open portal "<alianca>" and logon
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas
    Given Existem vendas com "Vendas Hoje - Histórico - Coluna Produto" tipo "<tipoDeProduto>"
    When Usuário filtra por tudo, exceto "<tipoDeProduto>", em "Produtos (0)"
    Then Serão filtradas as vendas com produto "<tipoDeProduto>"
    @sicredi @alliances
    Examples:
      | Description    | alianca | tipoDeProduto |
      | Usuario master | sicredi | Crédito       |

    @afinz @alliances
    Examples:
      | Description    | alianca | tipoDeProduto |
      | Usuario master | afinz   | Débito        |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | tipoDeProduto        |
      | Usuario master | azulzinha | Débito Internacional |

    @bin @alliances
    Examples:
      | Description    | alianca | tipoDeProduto |
      | Usuario master | bin     | Alimentação   |

  @TestCaseKey=LPDC-T46
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
      | Description    | alianca | status venda | grupo filtro |
      | Usuario master | sicredi | Autorizada   | Status (0)   |
      | Usuario master | sicredi | Recusada     | Status (0)   |
      | Usuario master | sicredi | Estornada    | Status (0)   |

    @afinz @alliances
    Examples:
      | Description    | alianca | status venda | grupo filtro |
      | Usuario master | afinz   | Autorizada   | Status (0)   |
      | Usuario master | afinz   | Recusada     | Status (0)   |
      | Usuario master | afinz   | Estornada    | Status (0)   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | status venda | grupo filtro |
      | Usuario master | azulzinha | Autorizada   | Status (0)   |
      | Usuario master | azulzinha | Recusada     | Status (0)   |
      | Usuario master | azulzinha | Estornada    | Status (0)   |

    @bin @alliances
    Examples:
      | Description    | alianca | status venda | grupo filtro |
      | Usuario master | bin     | Autorizada   | Status (0)   |
      | Usuario master | bin     | Recusada     | Status (0)   |
      | Usuario master | bin     | Estornada    | Status (0)   |

  @TestCaseKey=LPDC-T43
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
      | Description    | alianca | bandeira   | grupo filtro  |
      | Usuario master | sicredi | Mastercard | Bandeiras (0) |
      | Usuario master | sicredi | Visa       | Bandeiras (0) |

    @afinz @alliances
    Examples:
      | Description    | alianca | bandeira   | grupo filtro  |
      | Usuario master | afinz   | Mastercard | Bandeiras (0) |
      | Usuario master | afinz   | Visa       | Bandeiras (0) |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | bandeira   | grupo filtro  |
      | Usuario master | azulzinha | Mastercard | Bandeiras (0) |
      | Usuario master | azulzinha | Visa       | Bandeiras (0) |

    @bin @alliances
    Examples:
      | Description    | alianca | bandeira   | grupo filtro  |
      | Usuario master | bin     | Mastercard | Bandeiras (0) |
      | Usuario master | bin     | Visa       | Bandeiras (0) |

  @TestCaseKey=LPDC-T63
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
      | Description    | alianca | status venda | filtro status | bandeira   | filtro bandeira |
      | Usuario master | sicredi | Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      | Usuario master | sicredi | Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @afinz @alliances
    Examples:
      | Description    | alianca | status venda | filtro status | bandeira   | filtro bandeira |
      | Usuario master | afinz   | Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      | Usuario master | afinz   | Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | status venda | filtro status | bandeira   | filtro bandeira |
      | Usuario master | azulzinha | Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      | Usuario master | azulzinha | Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

    @bin @alliances
    Examples:
      | Description    | alianca | status venda | filtro status | bandeira   | filtro bandeira |
      | Usuario master | bin     | Autorizada   | Status (0)    | Mastercard | Bandeiras (0)   |
      | Usuario master | bin     | Recusada     | Status (0)    | Visa       | Bandeiras (0)   |

  #================ Vendaws Hoje com seleção EC
  #@ignore # TODO: confirmar a api desta tela...
  #
  #Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master)
  #  Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
  #  And Usuário selecionou um EC e clicar Acessar
  #  When Usuário acessa Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado
  #@ignore # TODO: confirmar a api desta tela...
  #
  #Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master) terá mesma quantidade vendas
  #  Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
  #  And Usuário selecionou um documento e clicar Acessar
  #  When Usuário acessa Vendas Hoje
  #  Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado
  @TestCaseKey=LPDC-T48
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
      | Description    | alianca | formato |
      | Usuario master | sicredi | Excel   |
      | Usuario master | sicredi | CSV     |

    @afinz @alliances
    Examples:
      | Description    | alianca | formato |
      | Usuario master | afinz   | Excel   |
      | Usuario master | afinz   | CSV     |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | formato |
      | Usuario master | azulzinha | Excel   |
      | Usuario master | azulzinha | CSV     |

    @bin @alliances
    Examples:
      | Description    | alianca | formato |
      | Usuario master | bin     | Excel   |
      | Usuario master | bin     | CSV     |

  @TestCaseKey=LPDC-T352
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
      | Description    | alianca | formato |
      | Usuario master | sicredi | Excel   |
      | Usuario master | sicredi | CSV     |

    @afinz @alliances
    Examples:
      | Description    | alianca | formato |
      | Usuario master | afinz   | Excel   |
      | Usuario master | afinz   | CSV     |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | formato |
      | Usuario master | azulzinha | Excel   |
      | Usuario master | azulzinha | CSV     |

    @bin @alliances
    Examples:
      | Description    | alianca | formato |
      | Usuario master | bin     | Excel   |
      | Usuario master | bin     | CSV     |

