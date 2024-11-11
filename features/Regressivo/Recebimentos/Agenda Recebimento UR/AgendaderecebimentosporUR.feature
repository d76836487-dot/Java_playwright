#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR

  @TestCaseKey=LPDC-T319
  Scenario Outline: Totais líquidos por bandeira e produto
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given existem recebimentos listados
    Then Valor total Líquido de UR será igual à soma dos valores das Bandeiras
    And logout
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

  @TestCaseKey=LPDC-T284
  Scenario Outline: Totais apresentados em Tela
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given existem recebimentos listados
    Then Valor total é igual a soma do Valor Líquido com o Valor Pago
    And logout
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

  @TestCaseKey=LPDC-T301
  Scenario Outline: Ocultar Valores na Agenda UR
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    #Given Usuário seleciona Ontem
    And Todas as barras de carregamento sumiram
    #And Usuário clicou em uma linha de recebimento
    When usuário clica no "Ocultar Valores" no "Header"
    And Todas as barras de carregamento sumiram
    Then Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor total" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor pago" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total bruto" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total taxa MDR" o mesmo valor "- R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total antecipação Eventual" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total antecipação automática" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total de deduções" o mesmo valor "- R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total ajustes crédito" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total contratos" o mesmo valor "R$ ••••"
    And logout
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

  @TestCaseKey=LPDC-T285
  Scenario Outline: Consultar Botão Filtros
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Filtrar"
    And usuário clica no "Bandeiras (0)" em "Filter - Accordion"
    Then Usuário verá o accordion em "Filter - Bandeiras (0)" as opções abaixo somente
    """
    Mastercard Débito, Mastercard Crédito, Visa Débito, Visa Crédito, ELO Débito, ELO Crédito,
    Cabal Débito, Cabal Crédito, Hipercard Crédito, Amex Crédito
    """
    And Usuário verá em "Filter - Bandeiras (0)" na cor primária "<cor>"
    Then Usuário verá fundo na cor primário "<cor>" quando clicar nas bandeiras no "Filter - Bandeiras (0)"
    @sicredi
    Examples:
      | cor              | alianca |
      | rgb(63, 161, 16) | sicredi |

    @azulzinha
    Examples:
      | cor              | alianca |
      | rgb(0, 198, 204) | afinz   |

    @bin
    Examples:
      | cor              | alianca |
      | rgb(255, 102, 0) | bin     |

    @afinz
    Examples:
      | cor              | alianca |
      | rgb(0, 198, 204) | afinz   |

  @TestCaseKey=LPDC-T282
  Scenario Outline: Consultar Período (Esse Mês)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    And usuário clicou no "Date ranger - Este mês"
    When usuário clica "Paginação - abrir opção de paginação"
    And usuário clica "Paginação - mostrar 50 itens"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia 01 do mês corrente até o último dia do mês
    And logout
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

  @TestCaseKey=LPDC-T314
  Scenario Outline: Consultar Período (Hoje)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Hoje"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia atual apenas
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @LPDC-T319
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @LPDC-T319
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances @LPDC-T319
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T287
  Scenario Outline: Consultar Período (Essa semana)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Essa semana"
    And existem recebimentos listados
    Then Irá apresentar resultados referentes a Essa semana
    And logout
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

  @TestCaseKey=LPDC-T316
  Scenario Outline: Botão Cancelar da modal Exportar
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Exportar"
    When usuário clica "Agenda de Recebimentos por UR - Exportar - Botão Cancelar"
    Then Usuário não verá nenhum "Agenda de Recebimentos por UR - Exportar - Modal"
    And logout
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

  @TestCaseKey=LPDC-T385
  Scenario Outline: Botão X da modal Exportar
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Exportar"
    When usuário clica "Agenda de Recebimentos por UR - Exportar - Botão X"
    Then Usuário não verá nenhum "Agenda de Recebimentos por UR - Exportar - Modal"
    And logout
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

  @TestCaseKey=LPDC-T295
  Scenario Outline: Baixar Arquivo Excel e CSV
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    And usuário clicou no "Date ranger - Essa semana"
    And Todas as barras de carregamento sumiram
    When Usuário faz exportação em "<format>" do Recebimentos por UR
    Then Exportação foi feita com sucesso
    Examples:
      | format |
      | Excel  |
      | CSV    |

  #==>
  @TestCaseKey=LPDC-T308
  Scenario Outline: Acesso a Agenda de recebimentos por UR Com apenas um Documento
    Given open portal "<alianca>" and logon
    And Usuário selecionar um documento e clicar Acessar
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário não verá em "Agenda de Recebimentos por UR" opção de Alterar Documento
    And logout
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

  @TestCaseKey=LPDC-T294
  Scenario Outline: Acesso a Agenda de recebimentos por UR Com vários Documentos
    Given open portal "<alianca>" and logon
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário verá em "Agenda de Recebimentos por UR" opção de Alterar Documento
    And selecionando o Documento no Header o Usuário visualizara o Respectivo Documento selecionado
    And logout
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

  @TestCaseKey=LPDC-T318
  Scenario Outline: Acesso a Agenda de recebimentos por UR selecionando um Estabelecimento no Modal
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then Usuário visualizará em Agenda de recebimentos por UR o Documento selecionado
    And logout
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

  @TestCaseKey=LPDC-T298
  Scenario Outline: Valida valores da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR" de <dias úteis> dias úteis
    And Usuário selecionou data com base no arquivo de consistência
    And Carregou recebimentos listados
    Then Campo "Agenda de Recebimentos por UR - Resumo - Valor Total" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total bruto" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total taxa MDR" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total antecipação Eventual" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total antecipação automática" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total de deduções" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total ajustes crédito" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total contratos" terá mesmo valor que consultado antes, salvando em arquivo
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | sicredi | -1         |

    @afinz @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | afinz   | -1         |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | dias úteis |
      | Usuario master | azulzinha | -1         |

    @bin @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | bin     | -1         |

  @TestCaseKey=LPDC-T304
  Scenario Outline: Valida valores do lote da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR Com Lote" de <dias úteis> dias úteis
    And Usuário selecionou data com base no arquivo de consistência
    And Carregou recebimentos listados
    Then Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Valor atualizado das URs" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Valor pago" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Saldo disponível negociável" terá mesmo valor que consultado antes, salvando em arquivo
    Examples:
      | dias úteis | alianca |
      | -1         | sicredi |
      | -2         | sicredi |
      | -3         | sicredi |
      | -4         | sicredi |
      | -5         | sicredi |
      | -6         | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | afinz   | -1         |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | dias úteis |
      | Usuario master | azulzinha | -1         |

    @bin @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | bin     | -1         |

  # o portal é muito lento para validar ausência de informações
  @TestCaseKey=LPDC-T299
  Scenario Outline: Valida ausência de valores do lote da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR Sem Lote" de <dias úteis> dias úteis
    And Usuário selecionou data com base no arquivo de consistência
    And não existem recebimentos listados
    Then Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total" terá valor "sem lote de recebimento", salvando em arquivo
    @afinz @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | afinz   | -1         |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | dias úteis |
      | Usuario master | azulzinha | -1         |

    @bin @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | bin     | -1         |

  @TestCaseKey=LPDC-T305
  Scenario Outline: Valida valores futuro da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR Futuro" de <dias úteis> dias úteis
    And Carregou recebimentos listados
    When Usuário seleciona data com base no arquivo de consistência
    Then Campo "Agenda de Recebimentos por UR - Agenda Futura - Saldo" terá mesmo valor que consultado antes, salvando em arquivo
    Examples:
      | dias úteis | alianca |
      | 1          | sicredi |
      | 2          | sicredi |
      | 3          | sicredi |
      | 4          | sicredi |
      | 5          | sicredi |
      | 6          | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | afinz   | 1          |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | dias úteis |
      | Usuario master | azulzinha | 1          |

    @bin @alliances
    Examples:
      | Description    | alianca | dias úteis |
      | Usuario master | bin     | 1          |

  @TestCaseKey=LPDC-T288
  Scenario Outline: Consultar Campos Valor Total, Valor Total líquido de URs, Valor pago, na Seção Resumo
    Given open portal "<alianca>" and logon
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário passa o mouse sobre "Agenda de Recebimentos por UR - Resumo - Tooltip do Valor Total"
    Then Usuário verá em "Agenda de Recebimentos por UR - Resumo - Texto do tooltip do Valor Total" o texto
      | Esse campo é a soma dos campos “valor total líquido de UR´s” e “valor pago” |
    And Usuário visualizará o campo "Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Tooltip do Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor Total líquido de URs" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor pago" na seção "Agenda de Recebimentos por UR - Resumo"
    And logout
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

  @TestCaseKey=LPDC-T297
  Scenario Outline: Consultar Campos Total de Entradas e saídas , na Seção Resumo
    Given open portal "<alianca>" and logon
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    Then Usuário visualizará o campo "Total de entradas e saídas" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total bruto" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total taxa MDR" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total antecipação Eventual" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total antecipação automática" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total de deduções" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total ajustes crédito" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total contratos" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "O que são esses totais?" na seção "Agenda de Recebimentos por UR - Resumo"
    And logout
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

  @TestCaseKey=LPDC-T302
  Scenario Outline: Botão “O que são esses totais?”
    Given open portal "<alianca>" and logon
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When usuário clica em "O que são esses totais?" na seção "Agenda de Recebimentos por UR - Resumo"
    Then Deve abrir um modal com Todos os termos usados e um Scroll para rolagem, Botões X e Entendi!
      | Entenda os termos usados                                                                                                                                                                                |
      | Valor total líquido/atualizado de URs                                                                                                                                                                   |
      | Valor total previsto a ser pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado. Não inclui valores já pagos no período.                  |
      | Valor pago                                                                                                                                                                                              |
      | Valor total já pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado.                                                                      |
      | Total bruto                                                                                                                                                                                             |
      | Valor total das vendas realizadas no periodo selecionado.                                                                                                                                               |
      | Total taxa MDR                                                                                                                                                                                          |
      | Valor total referente à taxa MDR sobre as vendas realizadas no período selecionado.                                                                                                                     |
      | Total antecipação eventual                                                                                                                                                                              |
      | Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio da antecipação eventual                                                                            |
      | Total antecipação automática                                                                                                                                                                            |
      | Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio de antecipação automática contratada.                                                              |
      | Total deduções                                                                                                                                                                                          |
      | Valor total das deduções no período selecionado, como por exemplo: aluguel, cancelamento de venda, chargeback e entre outros débitos. Não considera desconto de taxa MDR.                               |
      | Total ajuste a crédito                                                                                                                                                                                  |
      | Valor total dos ajustes a crédito no período selecionado, como por exemplo: comissão por venda de recarga, entre outros.                                                                                |
      | Total contratos                                                                                                                                                                                         |
      | Valor total a pagar ou já pago ao estabelecimento ou financiador referente a operações como gravame, cessão e outros ônus, realizadas pelo estabelecimento junto ao financiador no período selecionado. |
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

  @TestCaseKey=LPDC-T286
  Scenario Outline: Consultar Componente Totais líquidos por bandeira
    Given open portal "<alianca>" and logon
    #OBS: Apresentar a relação das bandeiras de forma fixa no front e popular CASO retorne valor da API. Se não retornar valor, apresentar com R$ 0,00
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário visualizará o campo "card Totais líquidos por bandeira" na seção "Agenda de Recebimentos por UR"
    Then abaixo do gráfico deve ser apresentado uma bolinha na cor da sua respectiva bandeira nas colorações:
      | bandeira   | colorações  | rgb               |
      | Mastercard | laranja     | rgb(255, 95, 0)   |
      | ELO        | amarelo     | rgb(255, 198, 34) |
      | Visa       | roxo        | rgb(26, 31, 113)  |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  |
      | Amex       | azul claro  | rgb(46, 177, 229) |
      | Cabal      | azul escuro | rgb(13, 92, 147)  |
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

  @TestCaseKey=LPDC-T320
  Scenario Outline: Consultar Componente “gráfico”
    Given open portal "<alianca>" and logon
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    And houver dados no Campo Totais líquidos por bandeira
    When Usuário passa mouse por cima do Componente “gráfico” em Totais líquidos por bandeira
    Then deve ser apresentado um tooltip informando qual a bandeira e o valor que se refere aquela cor. A ordem de apresentação e coloração deve ser:
      | bandeira   | coloração   | rgb               |
      | Mastercard | laranja     | rgb(255, 95, 0)   |
      | ELO        | amarelo     | rgb(255, 198, 34) |
      | Visa       | roxo        | rgb(26, 31, 113)  |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  |
      | Amex       | azul claro  | rgb(46, 177, 229) |
      | Cabal      | azul escuro | rgb(13, 92, 147)  |
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

  @TestCaseKey=LPDC-T309
  Scenario Outline: Consultar Componente “gráfico” sem valores
    Given open portal "<alianca>" and logon
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When não houver dados no Campo Totais líquidos por bandeira
    Then deve ser apresentado a frase "Sem informações para detalhamento"
    And todas as bandeiras deve vir com valores zerados
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

  @TestCaseKey=LPDC-T322
  Scenario Outline: Consultar Detalhe totais por bandeira e produto
    Given open portal "<alianca>" and logon
    #Obs.: Apresentar bandeira com total ainda que o total seja zero.
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When usuário clica no "Botão Detalhe totais por bandeira" em "Agenda de Recebimentos por UR"
    Then abrira um modal com: Totais líquidos por bandeira e produtos, Bolinha na cor do Cartão, Logo do Cartão e Nome do Cartão, Total em Crédito, Total em Débito, e o Botões, X acima e fechar na "<cor da Instituição>" abaixo
      | bandeira   | colorações  | rgb               | logo                     |
      | Mastercard | laranja     | rgb(255, 95, 0)   | BandeiraMastercard       |
      | ELO        | amarelo     | rgb(255, 198, 34) | BandeiraElo              |
      | Visa       | roxo        | rgb(26, 31, 113)  | visalogo_logotyp_us1_old |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  | BandeiraHipercard        |
      | Amex       | azul claro  | rgb(46, 177, 229) | BandeiraAmex             |
      | Cabal      | azul escuro | rgb(13, 92, 147)  | BandeiraCabal            |
    @afinz
    Examples:
      | cor da Instituição |
      | rgb(0, 198, 204)   |

    @azulzinha
    Examples:
      | cor da Instituição |
      | rgb(247, 148, 30)  |

    @bin003 @bin007
    Examples:
      | cor da Instituição |
      | rgb(255, 102, 0)   |

    @sicredi
    Examples:
      | cor da Instituição |
      | rgb(63, 161, 16)   |

  @TestCaseKey=LPDC-T393
  Scenario Outline: Consultar Botão Período
    Given open portal "<alianca>" and logon
    #Obs: Esse menu terá dados de histórico (passado) mas também de futuro.
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário seleciona Botão Período
    Then Abrirá componente de calendário que deve vir por default "Este Mês"
    And 'Date ranger - Início Data Selecionada' representará 'data início do mês'
    And 'Date ranger - Fim Data Selecionada' representará 'data final do mês'
    And Usuário pode selecionar a data conforme desejado
    And Usuário pode preencher a data conforme desejado
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

  @TestCaseKey=LPDC-T312
  Scenario Outline: Direcionamento
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    When usuário clica sobre um lote (bandeira e produto) da listagem apresentada
    Then usuário será direcionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
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

  @TestCaseKey=LPDC-T321
  Scenario Outline: Consultar Layout da seção Resumo
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    When usuário clica sobre um lote (bandeira e produto) da listagem apresentada
    Then usuário será direcionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And usuário visualizará no título do Resumo da UR a data no formato "dd/MM/yyyy"
    And Usuário verá em "Detalhe da UR - Botão Exportar" o texto "Exportar"
    And Usuário verá no card da seção Resumo a imagem da bandeira, seguido do nome da bandeira
    And Usuário verá no card da seção Resumo o Valor total, Total atualizado da UR, Valor pago, Total de deduções
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

  @TestCaseKey=LPDC-T324
  Scenario Outline: Seção Resumo Botão Mostrar todos os detalhes
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica no "Botão Mostrar todos os detalhes" em "Detalhe da UR - Resumo"
    Then usuário verá na seção resumo os elementos
    """
    Total bruto, Total taxa MDR, Total antecipação eventual, Total antecipação automática, Total deduções,
    Total ajuste crédito, Total contratos
    """
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

  @TestCaseKey=LPDC-T317
  Scenario Outline: Confere Valor Total de Agenda de recebimentos por UR com exportação
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given usuário clicou sobre o lote <numero lote> (bandeira e produto) da listagem apresentada
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When Usuário clica em Exportar como Excel
    And usuário clica em "Mostrar todos os detalhes" no "Detalhe da UR - Resumo"
    Then "Valor total" do Detalhe da UR será igual ao "Valor total" do Excel
    And "Valor Atualizado da UR" do Detalhe da UR será igual ao "Total atualizado de UR" do Excel
    And "Valor Pago" do Detalhe da UR será igual ao "Valor pago" do Excel
    And "Total de Deduções" do Detalhe da UR será igual ao "Total de deduções" do Excel
    And "Total bruto valor" do Detalhe da UR será igual ao "Total bruto" do Excel
    And "Total taxa MDR valor" do Detalhe da UR será igual ao "Total taxa MDR" do Excel
    And "Total antecipação eventual valor" do Detalhe da UR será igual ao "Total antecipação eventual" do Excel
    And "Total antecipação automática valor" do Detalhe da UR será igual ao "Total antecipação automática" do Excel
    And "Total deduções valor" do Detalhe da UR será igual ao "Total deduções" do Excel
    And "Total ajuste crédito valor" do Detalhe da UR será igual ao "Total ajustes crédito" do Excel
    And "Total contratos valor" do Detalhe da UR será igual ao "Total contratos" do Excel
    @sicredi @alliances
    Examples:
      | Description    | alianca | numero lote |
      | Usuario master | sicredi | 0           |

    @afinz @alliances
    Examples:
      | Description    | alianca | numero lote |
      | Usuario master | afinz   | 0           |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | numero lote |
      | Usuario master | azulzinha | 0           |

    @bin @alliances
    Examples:
      | Description    | alianca | numero lote |
      | Usuario master | bin     | 0           |

  @TestCaseKey=LPDC-T306
  Scenario Outline: Consultar Pagamentos da UR (Status Pago)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha valor pago maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica "Detalhe da UR - Visualizar Pagamentos"
    Then Usuário visualizar status pago com bolinha na cor verde
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

  @TestCaseKey=LPDC-T292
  Scenario Outline: Consultar Pagamentos da UR (Status Programado)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given Usuário seleciona Próximos 14 Dias
    And usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica "Detalhe da UR - Visualizar Pagamentos"
    Then Usuário visualizar status programado com bolinha na cor amarelo
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

  #produto,
  #botão Mostrar todos os detalhes
  #  Scenario Outline: Consultar Abas na Tela / Detalhe da UR
  #    Given Usuário está logado Agenda de recebimentos por UR
  #    When Clicar sobre um lote (bandeira e produto) da listagem apresentada
  #    And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
  #    Then usuário visualizara as abas (Vendas vinculadas, Pagamentos, Créditos e deduções, Contratos)
  @TestCaseKey=LPDC-T290
  Scenario Outline: Nome das colunas do Arquivo Excel
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When Usuário clica em Exportar como Excel
    Then Nome do arquivo será "Relatório_simplificado_Agenda_de_recebimentos_por_UR_" seguido de data e hora padrão "dd_MM_yyyy_HHmm"
    And Terá campo com um dos valores ou formatações abaixo na aba Resumo
      | campo                        | valor                                    | tipo validação |
      | Bandeira                     | Mastercard,ELO,Visa,Hipercard,Amex,Cabal | csv            |
      | Produto                      | Crédito,Débito                           | csv            |
      | Valor total                  | valor monetário                          | formato        |
      | Total atualizado de UR       | valor monetário                          | formato        |
      | Valor pago                   | valor monetário                          | formato        |
      | Total de deduções            | valor monetário                          | formato        |
      | Total bruto                  | valor monetário                          | formato        |
      | Total taxa MDR               | valor monetário                          | formato        |
      | Total antecipação eventual   | valor monetário                          | formato        |
      | Total antecipação automática | valor monetário                          | formato        |
      | Total taxa de antecipação    | valor monetário                          | formato        |
      | Total deduções               | valor monetário                          | formato        |
      | Total ajustes crédito        | valor monetário                          | formato        |
      | Total contratos              | valor monetário                          | formato        |
    And Terá as colunas abaixo na aba "Vendas vinculadas" em Detalhe UR
    """
    Produto ,Bandeira,Data prevista de liquidação,Data da venda,Cód. de autorização,Tipo do Produto,Parcela,Valor bruto,
    Valor bruto da parcela,Valor líquido,Valor da taxa,NSU,Canal,Terminal,Estabelecimento,Data efetiva de pagamento
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Pagamentos" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,CPF/CNPJ do beneficiário,Data do pagamento, Valor ,Situação,
    Domicílio bancário,CPF/CNPJ do títular ,Tipo de conta,Agência ,Conta
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Créditos e Deduções" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,Tipo de evento,Data do evento,NSU,Order ID ,Valor,Valor da venda,
    Valor líquido do cancelamento,Valor deduzido da UR,Código de autorização,UR de origem da venda,Data da UR de origem
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Contratos" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,Situação,CPF/CNPJ do beneficiário,Razão Social do beneficiario ,
    Identificador do contrato,Tipo de contrato,Prioridade de Contrato,Valor comprometido,Valor pago / a pagar,
    Data do pagamento,Domicílio bancário,CPF/CNPJ do titular da conta,Tipo de conta,Agência,Conta
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
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

  @TestCaseKey=LPDC-T283
  Scenario Outline: Detalhe Venda
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When usuário clica "Detalhe da UR - Venda - Data Venda 0"
    Then Usuário verá "Detalhe da UR - Popup"
    And Valores da popup da UR da venda tem mesmas informações que listagem
    And Popup da UR da venda será fechada após usuário clicar no botão Fechar
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

#
#
#
# aguardando confirmação PO. Este cenário não está acontecendo mais
#Scenario: Consultar Período (anterior a abril /2024) ***
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Período
#    And seleciona um Período anterior a abril/2024
#    And Clica no Botão Aplicar
#    Then Mostrara O card com os dias bloqueados e a seguinte mensagem: Para períodos anteriores a abril/2024 consulte Recebimentos > Resumo de recebimentos
#
# quando eu filtro, mas abro uma linha, está trazendo as bandeiras não filtradas. Aguardando confirmação PO
#Scenario: Consultar Aplicando filtros
#
#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário seleciona Botão Filtros
#    And clica na seta
#    And Usuário seleciona alguma Bandeira
#  (Obs: que ao selecionar a bandeira o botão ficará em um tom mais forte” na cor da instituição)
#    And clica no Botão Mostrar resultados
#    Then deve ser populado o número dentre os parênteses (x) conforme a quantidade de Bandeiras selecionadas trazendo os resultados conforme as Bandeiras selecionadas
#  Obs.: Testar com diferentes bandeiras e também com bandeiras múltiplas, tipo master débito e visa crédito, etc...
#
#
#
#Scenario: Consultar  Botão Exportar
#
#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário seleciona Botão Exportar
#    Then abrira modal com a mensagem: Escolha como deseja exportar o relatório Opções de Exportar (Excel,CSV,PDF) , os botões: X, Cancelar e Gerar arquivo
#
#
#
#Feature: Exportando arquivos Excel/CSV/PDF
#
#
#QScenario: Consultar  Arquivo PDF
#
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Usuário clica no Botão Exportar
#  And Usuário seleciona Tipo de arquivo PDF
#  And seleciona Botão Gerar arquivo
#  Then arquivo será exportado com sucesso
#
#  Feature: Consultar  Arquivos Excel/CSV/PDF
#
#
#QScenario: Consultar  Excel Simplificado
#
#  Given Usuário Exportou arquivo Excel Simplificado
#  When usuário abrir o arquivo
#  Then arquivo estará com Aba única com totalizadores + listagem de arranjos de acordo com o período. A linha 13 deve vir com filtro aplicado para facilitar para o cliente. Nome do arquivo: Relatório_simplificado_Agenda de recebimentos por UR_ [data e hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento
#
#
#
#QScenario: Consultar  CSV
#  Given Usuário Exportou arquivo CSV
#  When usuário abrir o arquivo
#  When arquivo estará com Aba única com totalizadores + listagem de arranjos de acordo com o período. A linha 13 deve vir com filtro aplicado para facilitar para o cliente. Nome do arquivo: Relatório_simplificado_Agenda de recebimentos por UR_[data e hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento
#
#
#QScenario: Consultar  PDF
#  Given Usuário Exportou arquivo PDF Simplificado
#  When Usuário abrir o arquivo
#  Then Nome do PDF: Relatório_Agenda de recebimentos por UR_ [data e
#  hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento, nesse caso não vão seguir o LAYOUT à risca, mas as informações devem estar IGUAIS as que eu defini no requisito.
#
#  Feature: Seção Meus recebimentos
#
#
#QScenario: Consultar Meus recebimentos
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário visualizar a seção meus recebimentos
#  Then visualizará os Botões Filtros e Exportar (na cor da Instituição)
#  And uma listagem com os totais por dia contendo as informações: Data,Valor Total, Valor atualizado das URs + quantidade de URs, Valor pago, Saldo disponível negociável
#
#  Obs.: O Botão filtro só fica na cor se aplicado filtro de alguma bandeira
#
#
#
#QScenario: Consultar detalhe da UR por dia / Meus recebimentos
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário seleciona uma Lote na seção meus recebimentos
#  And clica no Accordion
#  Then Usuário visualizara no detalhe os lançamentos da UR
#  •    Total bruto
#  •    Total taxa MDR (com sinal negativo a frente do valor)
#  •    Total antecipação eventual
#  •    Total antecipação automática
#  •    Total deduções (com sinal negativo a frente do valor)
#  •    Total ajustes crédito
#  •    Total contratos
#  OBS: Apresentar todas as 7 linhas ainda que o retorno seja zerado
#  And visualizará a imagem da bandeira, o nome da bandeira, o Produto (Crédito ou débito) e o Valor do pagamento
#
#  Feature: Agenda de recebimentos por UR / Detalhe da UR
#
#
#QScenario: Direcionamento / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  Then usuário será direcionado a tela “Agenda de recebimentos por UR > Detalhe da UR”
#
#
#
#QScenario: Consultar Layout da seção Resumo / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  Then visualizará, “Resumo dd/mm/aaaa”, um botão Exportar, um card com a imagem da bandeira, nome da bandeira e produto, Valor total, Total atualizado da UR, Valor pago, Total de deduções , botão Mostrar todos os detalhes
#
#
#QScenario: Consultar Abas na Tela / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  Then usuário visualizara as abas (Vendas vinculadas, Pagamentos, Créditos e deduções, Contratos)
#
#  Feature: Botão Exportar/ Detalhe da UR
#
#  34.Cenário: Botão Exportar
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário Clica Botão Exportar (que deve estar na cor da Instituição)
#  Then o arquivo deve ser baixado na extensão Excel
#
#  Feature: Exportando Excel / Detalhe da UR
#
#
#QScenario: Exportando Arquivo Excel
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário Clica Botão Exportar
#  Then arquivo será exportado com sucesso
#
#  Obs: Independente da extensão que o cliente solicitar, o arquivo deve contemplar TODAS as 4 abas. Validar modelo exportado com meu modelo anexo no documento de requisito.
#
#
#  Feature: Consultar Arquivos Excel / Detalhe da UR
#
#  Feature: Vendas Vinculadas / Detalhe da UR
#
#
#QScenario: Consultar Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  AND Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  When seleciona aba Vendas vinculadas
#  Then Usuário visualizara: Busca por Código de autorização, colunas: Data da venda, Cód de autorização, Produto, Parcela, Valor Bruto, Valor bruto da parcela, Valor Líquido, Valor da Taxa, abaixo da tela: Exibindo 10 com opção de 30 itens ou 50 itens, X resultado(s) e paginação < 1,2,3, etc...>
#
#
#
#QScenario: Botão Busca por cód de autorização / Vendas vinculadas
#  Given Usuário está na tela Detalhe da UR > Aba Vendas vinculadas
#  When inserir no campo Busca Por Cod de autorização um código valido
#  And clicar na Lupa para Buscar
#  Then será apresentada a venda correspondente aquele código de autorização
#
#
#
#QScenario: Botão Busca por cód de autorização invalido / Vendas vinculadas
#  Given Usuário está na tela Detalhe da UR” > aba Vendas vinculadas
#  When insere no campo Busca Por Cod de autorização um código invalido
#  And clica na Lupa para Buscar
#  Then apresentara na tela “Nenhum resultado encontrado”
#
#
#  40.Sccenário: Consultar Informações tooltip (Parcela) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Parcela
#  Then usuário verá a mensagem: Referência da parcela paga x total de parcelas da venda
#
#
#
#
#QScenario: Consultar Informações tooltip (Valor bruto da parcela) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Valor bruto da parcela
#  Then usuário verá a mensagem: Valor bruto da parcela paga
#
#
#
#QScenario: Consultar Informações tooltip (Valor líquido) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Valor líquido
#  Then usuário verá a mensagem: Valor líquido da parcela paga
#
#
#QScenario: Botão X Modal Detalhe de Venda vinculada
#  Given Usuário está no modal Detalhe da venda vinculada
#  When Usuário clica no Botão X
#  Then Usuário deverá retornar a página “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#
#  Feature: Pagamento
#
#
#QScenario: Consultar Sem Pagamento / Pagamentos da UR
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar Pagamentos
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#  Feature: Créditos e deduções
#
#QScenario: Consultar Sem Informações Detalhe de Créditos e deduções da UR
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário clicar na aba Créditos e deduções
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#
#QScenario: Consultar Créditos e deduções / Tooltip (Order ID)
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Créditos e deduções
#  And Usuário passa Mouse sobre o Tooltip em (Order ID)
#  Then Usuário visualizara a seguinte mensagem: Número da transação online.
#
#  Feature: Contratos
#
#
#
#QScenario: Consultar Contratos na UR Sem Informações
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#
#QScenario: Consultar Contratos / Tooltip (Tipo de contrato)
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Tipo de Contrato)
#  Então Usuário visualizara a seguinte mensagem: tipo de negociação realizada entre o estabelecimento e o financiador (gravame, cessão ou outros ônus)
#
#
#QScenario: Consultar Tooltip (Prioridade de contrato) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Prioridade de contrato)
#  Then Usuário visualizara a seguinte mensagem: se o estabelecimento negociou seus recebíveis com mais de um financiador, a prioridade indica a ordem em que cada negociação foi concluída (caso tenha negociado apenas um contrato a prioridade será 1)
#
#
#
#QScenario: Consultar Tooltip (Regra de divisão) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Regra de divisão)
#  Then Usuário visualizara a seguinte mensagem: indica-se se o contrato realizado com o financiador é em percentual ou valor fixo.
#
#  69.Scenário Consultar Tooltip (Valor comprometido) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Valor comprometido)
#  Then Usuário visualizara a seguinte mensagem: indica o valor correspondente à regra de divisão
#
#  70.Cenário: Consultar Tooltip (Valor atingido) Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Valor atingido)
#  Then Usuário visualizara a seguinte mensagem: indica o valor obtido pelo financiador de acordo com o valor da UR.
#
#
#QScenario: Consulta de Tooltip em Valor total
#
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário Está em Resumo, Valor total.
#  Then Usuário deve visualizar o ícone do Tooltip em Valor Total
#  And o texto: Esse campo é a soma dos campos “Valor total líquido de URs” e “Valor pago
#
#
