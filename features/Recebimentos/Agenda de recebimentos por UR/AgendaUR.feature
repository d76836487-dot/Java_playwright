#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessou a página de Agenda de Recebimentos por UR

  @TestCaseKey=SMP-T328
  Scenario: Valor total Líquido de UR igual a soma do Valor de Bandeiras
    Given existem recebimentos listados
    Then Valor total Líquido de UR será igual à soma dos valores das Bandeiras

  @TestCaseKey=SMP-T330
  Scenario: Valor total é igual a soma do Valor Líquido com o Valor Pago
    Given existem recebimentos listados
    Then Valor total é igual a soma do Valor Líquido com o Valor Pago

  @TestCaseKey=SMP-T355
  Scenario: Botão Ocultar Valores na Agenda UR
    Given Usuário seleciona Ontem
    And Todas as barras de carregamento sumiram
    And Usuário clicou em uma linha de recebimento
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor Total" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Valor pago" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total bruto" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total taxa MDR" o mesmo valor "- R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total antecipação Eventual" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total antecipação automática" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total de deduções" o mesmo valor "- R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total ajustes crédito" o mesmo valor "R$ ••••"
    And Usuário verá em todos os "Agenda de Recebimentos por UR - Resumo - Total contratos" o mesmo valor "R$ ••••"

  @TestCaseKey=SMP-T356
  Scenario Outline: Consultar Botão Filtros
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
      | cor              |
      | rgb(63, 161, 16) |

    @azulzinha
    Examples:
      | cor              |
      | rgb(0, 102, 179) |

    @bin007 @bin003
    Examples:
      | cor              |
      | rgb(255, 102, 0) |

    @afinz
    Examples:
      | cor              |
      | rgb(0, 198, 204) |

  @TestCaseKey=SMP-T364
  Scenario: Consultar Período (Esse Mês)
    Given Usuário selecionou Botão Período
    And usuário clicou no "Date ranger - Este mês"
    When usuário clica "Paginação - abrir opção de paginação"
    And usuário clica "Paginação - mostrar 50 itens"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia 01 do mês corrente até o último dia do mês

  @TestCaseKey=SMP-T375
  Scenario: Consultar Período (Hoje)
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Hoje"
    And existem recebimentos listados
    Then Irá apresentar resultados do dia atual apenas

  @TestCaseKey=SMP-T376
  Scenario: Consultar Período (Essa semana)
    Given Usuário selecionou Botão Período
    When usuário clica "Date ranger - Essa semana"
    And existem recebimentos listados
    Then Irá apresentar resultados referentes a Essa semana

  Scenario: Botão Cancelar da modal Exportar
    Given usuário clicou no "Agenda de Recebimentos por UR - Botão Exportar"
    When usuário clica "Agenda de Recebimentos por UR - Exportar - Botão Cancelar"
    Then Usuário não verá nenhum "Agenda de Recebimentos por UR - Exportar - Modal"

#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário seleciona Botão Exportar
#    Then abrira modal com a mensagem: Escolha como deseja exportar o relatório Opções de Exportar (Excel,CSV,PDF) , os botões: X, Cancelar e Gerar arquivo
