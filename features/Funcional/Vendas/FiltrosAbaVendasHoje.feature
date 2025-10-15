#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/NovaVendasHoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: VendasHoje

  @TestCaseKey=LPDC-T1564
  Scenario: Verificar totalizadores na aba Hoje
    Given acesso ao menu Vendas e aba Hoje
    Then os totalizadores devem exibir:
      | Totalizador                      |
      | Valor total de vendas bruto      |
      | Valor total de vendas rejeitadas |
      | Número de vendas                 |
      | Data do dia                      |

  @TestCaseKey=LPDC-T1567
  Scenario: Verificar cor do totalizador de vendas rejeitadas
    Given acesso ao menu Vendas e aba Hoje
    Then o totalizador "Valor total de vendas rejeitadas" deve ter a cor #CC4747

  @TestCaseKey=LPDC-T1570
  Scenario: Verificar número de vendas e data na aba Hoje
    Given acesso ao menu Vendas e aba Hoje
    When as vendas do dia são registradas
    Then o número de vendas e a data do dia devem ser exibidos corretamente

  @TestCaseKey=LPDC-T1565
  Scenario: Verificar colunas da tabela de autorizações
    Given acesso ao menu Vendas e aba Hoje
    Then as colunas da tabela de autorizações devem ser:
      | Coluna                |
      | Horário               |
      | Bandeira              |
      | Modalidade            |
      | Código de autorização |
      | Valor bruto           |
      | Status                |

  @TestCaseKey=LPDC-T1569
  Scenario Outline: Verificar status das autorizações
    Given acesso ao menu Vendas e aba Hoje
    When uma autorização com status "<Status>" é registrada
    Then o status da autorização deve ser "<Status>" com a cor correta
    Examples:
      | Status      |
      | Aprovada    |
      | Autorizada  |
      | Estornada   |
      | Recusada    |
      | A confirmar |

  @TestCaseKey=LPDC-T1597
  Scenario: Verificar funcionalidade do botão Recarregar vendas
    Given acesso ao menu Vendas e aba Hoje
    When clico no botão "Recarregar vendas?"
    Then a página deve ser atualizada

  @TestCaseKey=LPDC-T1596
  Scenario: Verificar tooltip Não encontrou sua venda?
    Given acesso ao menu Vendas e aba Hoje
    Then o tooltip "Não encontrou sua venda?" deve estar presente com a cor da aliança

  @TestCaseKey=LPDC-T1572
  Scenario: Verificar mensagem ao aplicar filtros que zeram autorizações
    Given acesso ao menu Vendas e aba Hoje
    When aplico filtros que resultam em zero autorizações
    Then uma mensagem específica deve ser exibida

  @TestCaseKey=LPDC-T1581
  Scenario: Verificar tabela de autorizações com diferentes modalidades
    Given acesso ao menu Vendas e aba Hoje
    When as autorizações do dia incluem diferentes modalidades
      | Modalidade      |
      | Débito          |
      | Crédito à vista |
      | Pix             |
    Then a tabela deve exibir corretamente cada modalidade

  @TestCaseKey=LPDC-T1574
  Scenario: Verificar transações Pix van na aba Hoje
    Given acesso ao menu Vendas e aba Hoje
    When registram transações de Pix van
    Then as transações devem ser exibidas como "Pix Compra"

  @TestCaseKey=LPDC-T1590
  Scenario Outline: Validar diferentes tipos de transações na aba Hoje
    Given acesso ao menu Vendas e aba Hoje
    When adiciono uma transação de tipo "<Tipo>" com valor "<Valor>"
    Then a aba Hoje deve refletir corretamente a transação adicionada
    Examples:
      | Tipo    | Valor   |
      | full    | 1000,00 |
      | van     | 2000,00 |
      | voucher | 1500,00 |
      | Pix van | 2500,00 |

  @TestCaseKey=LPDC-T1571
  Scenario: Verificar autorizações com diferentes códigos
    Given acesso ao menu Vendas e aba Hoje
    When clico nos registros com autorizações com diferentes códigos
    Then cada autorização deve exibir seu respectivo código corretamente

  @TestCaseKey=LPDC-T1599
  Scenario: Verificar valor bruto das autorizações
    Given acesso ao menu Vendas e aba Hoje
    And valido as autorizações com valores brutos variados
    Then a coluna "Valor bruto" deve exibir os valores corretamente

  @TestCaseKey=LPDC-T1586
  Scenario: Verificar horário das autorizações
    Given acesso ao menu Vendas e aba Hoje
    And valido a autorização e seu horário
    Then a coluna "Horário" deve exibir os horários corretamente

  @TestCaseKey=LPDC-T1588
  Scenario: Verificar modalidade ao registrar uma autorização Pix
    Given acesso ao menu Vendas e aba Hoje
    When registro uma autorização com modalidade Pix
    Then a Bandeira deve ser exibida como "Pix Compra"

  @TestCaseKey=LPDC-T1595
  Scenario: Verificar exibição da data atual na aba Hoje
    Given acesso ao menu Vendas e aba Hoje
    Then a data exibida deve ser a data atual

  @TestCaseKey=LPDC-T1575
  Scenario Outline: Exportar relatório de vendas com renomeação de campos
    Given que o usuário esteja na aba "Vendas Hoje"
    When exporta o relatório no formato <formato>
    Then o arquivo exportado deve conter as seguintes colunas renomeadas
      | De                  | Para                  |
      | Cód. de autorização | Código de autorização |
      | Produto             | Modalidade            |
    And os totalizadores devem estar renomeados conforme especificado
      | De                            | Para                                    |
      | Período de Venda: data à data | Período de Venda: data                  |
      | Valor bruto: valor            | Valor total de vendas bruto: valor      |
      | Valor não efetivadas: valor   | Valor total de vendas rejeitadas: valor |
    Examples:
      | formato |
      | Excel   |
      | CSV     |

  @TestCaseKey=LPDC-T1591
  Scenario: Salvar comprovante de venda autorizado
    Given que o usuário esteja na aba "Detalhe da venda"
    And tenha realizado uma transação de <tipo_transacao> autorizada
    When clica em "Salvar comprovante"
    Then um PDF de comprovante autorizado deve ser gerado seguindo o layout padrão

  @TestCaseKey=LPDC-T1600
  Scenario: Salvar comprovante de venda rejeitado
    Given que o usuário esteja na aba "Detalhe da venda"
    And tenha realizado uma transação de <tipo_transacao> rejeitada
    When clica em "Salvar comprovante"
    Then um PDF de comprovante rejeitado deve ser gerado seguindo o layout padrão

  @TestCaseKey=LPDC-T1573
  Scenario Outline: Gerar comprovante de autorização com diferentes tipos de transação
    Given que o usuário esteja na aba "Detalhe da venda"
    And tenha realizado uma transação de <tipo_transacao> com status <status>
    When clica em "Salvar comprovante"
    Then um PDF de comprovante <status> para <tipo_transacao> deve ser gerado corretamente
    Examples:
      | tipo_transacao | status     |
      | Débito         | autorizado |
      | Crédito        | autorizado |
      | Voucher        | autorizado |
      | Pré-autorizaçã | autorizado |
      | Pix Van        | autorizado |
      | Débito         | rejeitado  |
      | Crédito        | rejeitado  |
      | Voucher        | rejeitado  |
      | Pré-autorizaçã | rejeitado  |
      | Pix Van        | rejeitado  |

  @TestCaseKey=LPDC-T1568
  Scenario: Verificar layout do comprovante de transação autorizada
    Given que o usuário esteja na aba "Detalhe da venda"
    And tenha realizado uma transação de "Crédito" autorizada
    When clica em "Salvar comprovante"
    Then o PDF gerado deve conter todas as informações necessárias no layout padrão

  @TestCaseKey=LPDC-T1582
  Scenario: Verificar layout do comprovante de transação rejeitada
    Given que o usuário esteja na aba "Detalhe da venda"
    And tenha realizado uma transação de "Débito" rejeitada
    When clica em "Salvar comprovante"
    Then o PDF gerado deve conter todas as informações de rejeição no layout padrão

  @TestCaseKey=LPDC-T1576
  Scenario: Exportar relatório de vendas e verificar nome do arquivo
    Given que o usuário esteja na aba "Vendas Hoje"
    When exporta o relatório no formato Excel na data
    Then o nome do arquivo exportado deve ser "Relatorio_de_Vendas_Hoje.xlsx"

  @TestCaseKey=LPDC-T1563
  Scenario: Exportar relatório de vendas com período de venda único
    Given que o usuário esteja na aba "Vendas Hoje"
    When exporta o relatório no formato Excel
    Then o totalizador "Período de Venda" deve exibir apenas uma data

  @TestCaseKey=LPDC-T1566
  Scenario Outline: Exportar relatório e verificar renomeação de campo específico
    Given que o usuário esteja na aba "Vendas Hoje"
    When exporta o relatório no formato <formato>
    Then o campo <campo_original> deve estar renomeado para <campo_renomeado> no arquivo exportado
    Examples:
      | formato | campo_original      | campo_renomeado       |
      | Excel   | Cód. de autorização | Código de autorização |
      | Excel   | Produto             | Modalidade            |
      | CSV     | Cód. de autorização | Código de autorização |
      | CSV     | Produto             | Modalidade            |

  @TestCaseKey=LPDC-T1578
  Scenario: Aplicar filtros padrão com accordions fechados
    Given estou na aba de vendas "Hoje"
    Then os filtros devem ser exibidos com todos os accordions fechados

  @TestCaseKey=LPDC-T1603
  Scenario: Abrir accordion de filtro Modalidade
    Given estou na aba de vendas "Hoje"
    When clico no filtro "Modalidade"
    Then o accordion de "Modalidade" deve ser expandido

  @TestCaseKey=LPDC-T1580
  Scenario: Selecionar opções nos filtros
    Given estou na aba de vendas "Hoje"
    When seleciono as seguintes opções de filtros
      | Filtro     | Opção Selecionada |
      | Modalidade | Online            |
      | Status     | Completo          |
      | Bandeira   | Visa              |
    Then as opções selecionadas devem estar destacadas

  @TestCaseKey=LPDC-T1587
  Scenario: Limpar todos os filtros
    Given eu tenha selecionado os seguintes filtros
      | Filtro     | Opção Selecionada |
      | Modalidade | Online            |
      | Status     | Completo          |
      | Bandeira   | Visa              |
    When clico em "Limpar filtros"
    Then todas as opções de filtros devem estar desmarcadas

  @TestCaseKey=LPDC-T1601
  Scenario Outline: Remover filtro aplicado
    Given eu tenha aplicado os seguintes filtros
      | Filtro   | Opção Selecionada |
      | <Filtro> | <Opção>           |
    When clico no "x" do filtro "<Filtro>"
    And clico em "Mostrar resultados"
    Then o filtro "<Filtro>" deve ser removido dos resultados
    Examples:
      | Filtro          | Opção    |
      | Modalidade      | Online   |
      | Status          | Completo |
      | Bandeira        | Visa     |
      | Estabelecimento | Loja A   |

  @TestCaseKey=LPDC-T1592
  Scenario: Recarregar lista de terminais quando não carrega
    Given estou na aba de vendas "Hoje"
    And clico no filtro "Terminal"
    When a lista de terminais não carrega
    Then devo ver um botão de recarregar

  @TestCaseKey=LPDC-T1589
  Scenario: Selecionar múltiplos filtros e verificar destaque
    Given estou na aba de vendas "Hoje"
    When seleciono as seguintes opções de filtros
      | Filtro     | Opção Selecionada |
      | Modalidade | Presencial        |
      | Status     | Pendente          |
    Then os filtros "Modalidade" e "Status" devem estar destacados

  @TestCaseKey=LPDC-T1577
  Scenario: Verificar comportamento dos accordions ao aplicar filtros
    Given estou na aba de vendas "Hoje"
    And todos os accordions de filtros estão fechados
    When aplico um filtro em "Bandeira"
    Then o accordion de "Bandeira" deve permanecer aberto

  @TestCaseKey=LPDC-T1598
  Scenario: Verificar filtros replicados em outras abas
    Given eu tenha aplicado os seguintes filtros na aba de vendas "Hoje"
      | Filtro     | Opção Selecionada |
      | Modalidade | Online            |
    When navego para outra aba do Portal
    Then os mesmos filtros devem estar disponíveis e aplicados

  @TestCaseKey=LPDC-T1602
  Scenario: Verificar comportamento ao não selecionar nenhum filtro
    Given estou na aba de vendas "Hoje"
    When clico em "Mostrar resultados" sem selecionar filtros
    Then todos os resultados devem ser exibidos sem filtros aplicados

  @TestCaseKey=LPDC-T1584
  Scenario: Verificar destaque de filtros conforme a aliança
    Given estou na aba de vendas "Hoje"
    When seleciono o filtro "Status" com a opção "Completo"
    Then o filtro "Status" deve estar destacado de acordo com a aliança

  @TestCaseKey=LPDC-T1593
  Scenario: Verificar que filtros funcionam como botões
    Given estou na aba de vendas "Hoje"
    When clico no filtro "Método de captura"
    Then o filtro "Método de captura" deve funcionar como um botão

  @TestCaseKey=LPDC-T1585
  Scenario: Verificar que filtros podem ser selecionados e desmarcados
    Given estou na aba de vendas "Hoje"
    When seleciono e desmarco o filtro "Bandeira" com a opção "Mastercard"
    Then o filtro "Bandeira" com a opção "Mastercard" deve estar desmarcado

  @TestCaseKey=LPDC-T1583
  Scenario: Verificar que clicar em "Limpar filtros" após aplicar alguns filtros
    Given eu tenha aplicado os seguintes filtros
      | Filtro     | Opção Selecionada |
      | Modalidade | Online            |
      | Status     | Completo          |
    When clico em "Limpar filtros"
    Then todos os filtros devem estar desmarcados

  @TestCaseKey=LPDC-T1579
  Scenario: Verificar que ao aplicar filtros, os resultados refletem corretamente
    Given estou na aba de vendas "Hoje"
    When aplico os seguintes filtros
      | Filtro   | Opção      |
      | Status   | Completo   |
      | Terminal | Terminal 1 |
    And clico em "Mostrar resultados"
    Then os resultados devem corresponder aos filtros "Completo" e "Terminal 1"

  @TestCaseKey=LPDC-T1604
  Scenario: Verificar que filtros aplicados são visíveis no resumo do modal
    Given eu tenha aplicado os seguintes filtros
      | Filtro     | Opção      |
      | Modalidade | Online     |
      | Terminal   | Terminal 1 |
    When abro o modal de filtros na aba "Recebimentos Pagos"
    Then o resumo deve mostrar
      | Filtro     | Opção      |
      | Modalidade | Online     |
      | Terminal   | Terminal 1 |

  @TestCaseKey=LPDC-T1594
  Scenario: Verificar comportamento do botão de recarregar na lista de terminais
    Given estou na aba de vendas "Hoje"
    And clico no filtro "Terminal"
    When a lista de terminais falha ao carregar
    And clico no botão de recarregar
    Then a lista de terminais deve ser carregada com sucesso

