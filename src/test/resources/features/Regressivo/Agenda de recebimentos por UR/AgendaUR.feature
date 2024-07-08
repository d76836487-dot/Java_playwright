#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR


  @TestCaseKey=SMP-T328
  Scenario Outline: Valor total Líquido de UR igual a soma do Valor de Bandeiras
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given existem recebimentos listados
    Then Valor total Líquido de UR será igual à soma dos valores das Bandeiras
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


  @TestCaseKey=SMP-T330
  Scenario Outline: Valor total é igual a soma do Valor Líquido com o Valor Pago
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given existem recebimentos listados
    Then Valor total é igual a soma do Valor Líquido com o Valor Pago
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


  @TestCaseKey=SMP-T355
  Scenario Outline: Botão Ocultar Valores na Agenda UR
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    #Given Usuário seleciona Ontem
    And Todas as barras de carregamento sumiram
    And Usuário clicou em uma linha de recebimento
    When usuário clica no "Ocultar Valores" no "Header"
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


  @TestCaseKey=SMP-T356
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
      | cor              |alianca|
      | rgb(63, 161, 16) |sicredi|

    @azulzinha
    Examples:
      | cor              |alianca|
      | rgb(0, 102, 179) |afinz  |

    @bin
    Examples:
      | cor              |alianca|
      | rgb(255, 102, 0) |bin    |

    @afinz
    Examples:
      | cor              |alianca|
      | rgb(0, 198, 204) |afinz  |

  @TestCaseKey=SMP-T364
  Scenario Outline: Consultar Período (Esse Mês)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    And usuário clicou no "Date ranger - Este mês"
    When usuário clica "Paginação - abrir opção de paginação"
    And usuário clica "Paginação - mostrar 50 itens"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia 01 do mês corrente até o último dia do mês
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

  @TestCaseKey=SMP-T375
  Scenario Outline: Consultar Período (Hoje)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Hoje"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia atual apenas
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

  @TestCaseKey=SMP-T376
  Scenario Outline: Consultar Período (Essa semana)
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Essa semana"
    And existem recebimentos listados
    Then Irá apresentar resultados referentes a Essa semana
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

  @TestCaseKey=SMP-T378
  Scenario Outline: Botão Cancelar da modal Exportar
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Exportar"
    When usuário clica "Agenda de Recebimentos por UR - Exportar - Botão Cancelar"
    Then Usuário não verá nenhum "Agenda de Recebimentos por UR - Exportar - Modal"
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

  @TestCaseKey=SMP-T379
  Scenario Outline: Botão X da modal Exportar
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Exportar"
    When usuário clica "Agenda de Recebimentos por UR - Exportar - Botão X"
    Then Usuário não verá nenhum "Agenda de Recebimentos por UR - Exportar - Modal"
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
  @TestCaseKey=SMP-T377
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
  @TestCaseKey=SMP-T300
 Scenario Outline: Acesso a Agenda de recebimentos por UR Com apenas um Documento
    Given open portal "<alianca>" and logon
    And Usuário selecionar um documento e clicar Acessar
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário não verá em "Agenda de Recebimentos por UR" opção de Alterar Documento
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
  @TestCaseKey=SMP-T305
  Scenario Outline: Acesso a Agenda de recebimentos por UR Com vários Documentos
    Given open portal "<alianca>" and logon
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário verá em "Agenda de Recebimentos por UR" opção de Alterar Documento
    And selecionando o Documento no Header o Usuário visualizara o Respectivo Documento selecionado
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
  @TestCaseKey=SMP-T318
  Scenario Outline: Acesso a Agenda de recebimentos por UR selecionando um Estabelecimento no Modal
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then Usuário visualizará em Agenda de recebimentos por UR o Documento selecionado
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
  @TestCaseKey=SMP-T326
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
    @sicredi @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |sicredi    |-1        |
        @afinz @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |afinz    |-1        |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  | dias úteis|
      |Usuario master     |azulzinha|-1        |
    @bin @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |bin      |-1        |

  @TestCaseKey=SMP-T331
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
      | dias úteis |alianca  |
      | -1         |sicredi|
      | -2         |sicredi|
      | -3         |sicredi|
      | -4         |sicredi|
      | -5         |sicredi|
      | -6         |sicredi|
    @afinz @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |afinz    |-1        |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  | dias úteis|
      |Usuario master     |azulzinha|-1        |
    @bin @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |bin      |-1        |
# o portal é muito lento para validar ausência de informações
  @ignore
  @TestCaseKey=SMP-T332
  Scenario Outline: Valida ausência de valores do lote da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR Sem Lote" de <dias úteis> dias úteis
    And Usuário selecionou data com base no arquivo de consistência
    And não existem recebimentos listados
    Then Campo "Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total" terá valor "sem lote de recebimento", salvando em arquivo
    Examples:
      | dias úteis |alianca  |
      | -1         |sicredi|
      | -2         |sicredi|
      | -3         |sicredi|
      | -4         |sicredi|
      | -5         |sicredi|
      | -6         |sicredi|
    @afinz @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |afinz    |-1        |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  | dias úteis|
      |Usuario master     |azulzinha|-1        |
    @bin @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |bin      |-1        |

  @TestCaseKey=SMP-T327
  Scenario Outline: Valida valores futuro da UR se é igual a outras datas já consultadas
    Given open portal "<alianca>" and logon
    And Usuário acessou a página de Agenda de Recebimentos por UR
    Given Carregou arquivo com histórico do "UR Futuro" de <dias úteis> dias úteis
    And Carregou recebimentos listados
    When Usuário seleciona data com base no arquivo de consistência
    Then Campo "Agenda de Recebimentos por UR - Agenda Futura - Saldo" terá mesmo valor que consultado antes, salvando em arquivo
    Examples:
      | dias úteis |alianca  |
      | 1          |sicredi|
      | 2          |sicredi|
      | 3          |sicredi|
      | 4          |sicredi|
      | 5          |sicredi|
      | 6          |sicredi|
    @afinz @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |afinz    |1        |

    @azulzinha @alliances
    Examples:
      |Description        |alianca  | dias úteis|
      |Usuario master     |azulzinha|1        |
    @bin @alliances
    Examples:
      |Description        |alianca  |dias úteis|
      |Usuario master     |bin      |1        |

