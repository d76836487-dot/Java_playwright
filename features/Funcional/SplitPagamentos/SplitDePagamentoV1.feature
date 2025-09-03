#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SplitPagamentos/SplitDePagamentoV1
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SplitDePagamentoV1

  @TestCaseKey=LPDC-T1288
  Scenario: O Franqueador nao deve ver vendas no menu HOJE
    Given que estou logado como Franqueador
    When acesso a aba HOJE no menu de vendas
    Then nao devo ver nenhuma transacao registrada

  @TestCaseKey=LPDC-T1295
  Scenario: O Franqueador deve ver vendas na aba Historico de vendas
    Given que estou logado como Franqueador
    And houve transacoes feitas pelas filiais franqueadas em dias anteriores
    When acesso a aba Historico de vendas no menu de vendas
    Then devo ver as transacoes registradas no historico

  @TestCaseKey=LPDC-T1298
  Scenario: O usuario sem Split de pagamento Personalizar coluna
    Given Usuario deve esta em Historico de vendas
    When clicar em personalizar coluna
    Then nao deve aparecer a coluna Valor original da venda
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador Sem F      |

  @TestCaseKey=LPDC-T1297
  Scenario: O usuario sem Split de pagamento csv e excel simplificado e detalhado
    Given Usuario deve esta em Historico de vendas
    And clicar no exportar
    And Selecionar Relatorio Simplificado e Relatorio Detalhado
    Then Verificar que nao possui a coluna Valor original da venda
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador Sem F      |

  @TestCaseKey=LPDC-T1293
  Scenario: O usuario sem Split de pagamento sem a coluna Valor original da venda em Relatorio
    Given Usuario deve esta em Relatorios
    And clicar no exportar
    And Selecionar Relatorio Simplificado e Relatorio Detalhado
    Then Verificar que nao possui a coluna Valor original da venda
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador Sem F      |

  @TestCaseKey=LPDC-T1290
  Scenario: O Franqueador Nao deve Visualizar Vendas hoje e ultimas vendas no dashboard
    Given Logar no portal com franqueador
    When Visualizar o Dashboard na home logada
    Then Validar que o Vendas hoje e Ultimas vendas nao aparecem para o perfil do Franqueador

  @TestCaseKey=LPDC-T1289
  Scenario: O usuario franqueador Personalizar coluna - Franqueador
    Given Usuario franqueador deve esta em Historico de vendas
    When clicar em personalizar coluna
    Then deve aparecer a coluna Valor original da venda que apresentara o valor capturado pelo franqueador quando selecionada

  @TestCaseKey=LPDC-T1294
  Scenario: Exportar csv e excel Simplificado na aba Historico de vendas - Franqueador
    Given Usuario franqueador deve esta em Historico de vendas
    When quando clicar em exportar
    And baixar o relatorio simplificado
    Then deve conter as seguintes colunas Valor royalties, Valor bruto parceiro, Valor liquido parceiro
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1310
  Scenario: Exportar csv e excel Detalhado na aba Historico de vendas - Franqueador
    Given Usuario franqueador deve esta em Historico de vendas
    When quando clicar em exportar
    And baixar o relatório Detalhado
    Then deve conter as seguintes colunas Valor royalties da transacao, Valor royalties da parcela, Valor bruto da transacao parceiro, Valor bruto da parcela parceiro e Valor liquido da parcela/transacao parceiro
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1303
  Scenario: Validar que Franqueado e Franqueador exiba Valor original da venda em detalhes da venda
    Given Usuario franqueador deve esta em historico de vendas
    When clicar em uma venda do historico de vendas
    Then deve validar os campos: data da venda, codigo de autorizacao, VALOR ORIGINAL DA VENDA, valor bruto, canal, status, numero do terminal, numero do estabelecimento, cod.do pedido, comprovante de venda

  @TestCaseKey=LPDC-T1302
  Scenario: Validar que Franqueado e Franqueador exiba Valor original da venda em PDF
    Given Usuario franqueador deve esta em historico de vendas
    When clicar em uma venda do historico de vendas
    And clicar em exportar comprovante
    Then deve validar os campos: data da venda, codigo de autorizacao, VALOR ORIGINAL DA VENDA, valor bruto, canal, status, numero do terminal, numero do estabelecimento, cod.do pedido, comprovante de venda

  @TestCaseKey=LPDC-T1308
  Scenario: Validar Excel e CSV Relatorio Detalhado Franqueador em Recebimento Pagos
    Given Usuario franqueador esteja na pagina de Recebimentos Pagos
    When clicar em exportar
    And baixar o arquivo Excel e Csv detalhado
    Then Validar as colunas, Nome do estabelecimento, Valor original da venda, Valor original da parcela, Valor royalties da parcela, “Valor bruto da transacao parceiro”, “Valor bruto da parcela paga parceiro” e “Valor liquido da parcela/transacao parceiro”

  @TestCaseKey=LPDC-T1296
  Scenario: Validar que o Excel CSV e PDF simplificado sem alteracao
    Given Usuario Franqueador esteja na pagina recebimentos pagos
    When exportar o arquivo simplificado
    Then validar os campos Data do pagamento, Bandeira, Produto, Banco, Agencia, Conta, Tipo, EC, Cod. de pagamento, Valor pagamento, Status

  @TestCaseKey=LPDC-T1307
  Scenario: Menu relatorios de Vendas no perfil Franqueador
    Given Usuario Franqueador esteja no menu relatorio
    When Clicar em gerar relatorio
    And selecionar Tipo de Relatorio Vendas, selecionar o Periodo, EC, Formato do arquivo
    And selecionar gerar relatorio
    Then abrir o arquivo e validar as colunas Valor royalties da transacao e Valor royalties da parcela , Valor bruto da transacao parceiro , Valor bruto da parcela parceiro , Valor líquido da parcela/transação parceiro
    And Validar a posicao Valor royalties da parcela e Valor bruto da transacao parceiro deve esta entre Valor original da venda e Valor bruto da parcela parceiro
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1305
  Scenario: Menu relatorios de Pagamento no perfil Franqueador
    Given Usuario Franqueador esteja no menu relatorio
    When Clicar em gerar relatorio
    And selecionar Tipo de Relatorio Pagamento, selecionar o Periodo, EC, Formato do arquivo
    And selecionar gerar relatorio
    Then abrir o arquivo e validar as colunas Valor original da venda, Valor original da parcela e Valor royalties da parcela, Valor bruto da transacao parceiro , Valor bruto da parcela paga parceiro , Valor líquido da parcela/transação parceiro
    And validar a posicao dos campos Valor original da venda, Valor original da parcela e Valor royalties da parcela entre os campos Status da venda e Valor bruto da transacao parceiro
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1306
  Scenario: Verificar que o Franqueador nao visualiza vendas no menu HOJE
    Given que estou logado como Franqueador
    And houve transacoes realizadas hoje
    When acesso a aba HOJE no menu de vendas
    Then nao deve visualizar as transacoes registradas para o dia atual

  @TestCaseKey=LPDC-T1291
  Scenario: O Franqueado deve ver vendas no menu HOJE
    Given que estou logado como Franqueador
    When acesso a aba "HOJE" no menu de vendas
    Then devo ver transacao registrada

  @TestCaseKey=LPDC-T1299
  Scenario: Verificar que o Franqueado visualiza vendas no menu HOJE
    Given que estou logado como Franqueado
    And houve transacoes realizadas hoje
    When acesso a aba "HOJE" no menu de vendas
    Then devo visualizar as transacoes registradas para o dia atual

  @TestCaseKey=LPDC-T1292
  Scenario: O usuario franqueador Personalizar coluna - Franqueado
    Given Usuario franqueado deve esta em Historico de vendas
    When clicar em personalizar coluna
    Then deve aparecer a coluna Valor original da venda que apresentara o valor capturado pelo franqueado quando selecionada

  @TestCaseKey=LPDC-T1300
  Scenario: Exportar csv e excel Simplificado na aba Historico de vendas - Franqueado
    Given Usuario franqueado deve esta em Historico de vendas
    When quando clicar em exportar
    And baixar o relatorio simplificado
    Then deve conter as seguintes colunas Valor royalties, Valor bruto, Valor liquido, sem a palavra parceiro ao lado
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1301
  Scenario: Exportar csv e excel Detalhado na aba Historico de vendas - Franqueado
    Given Usuario franqueado deve esta em Historico de vendas
    When quando clicar em exportar
    And baixar o relatorio Detalhado
    Then deve conter as seguintes colunas Valor royalties da transacao, Valor royalties da parcela, Valor bruto da transacao, Valor bruto da parcela e Valor liquido da parcela/transacao e nao deve ter o nome parceiro ao lado
      | Arquivo |
      | CSV     |
      | Excel   |

  @TestCaseKey=LPDC-T1304
  Scenario: Validar Excel e CSV Relatorio Detalhado Franqueado em Recebimento Pagos
    Given Usuario franqueado esteja na pagina de Recebimentos Pagos
    When clicar em exportar
    And baixar o arquivo Excel e Csv detalhado
    Then Validar as colunas, Nome do estabelecimento, Valor original da venda, Valor original da parcela, Valor royalties da parcela, Valor bruto da transacao, Valor bruto da parcela paga sem ter o nome parceiro ao lado

  @TestCaseKey=LPDC-T1309
  Scenario: Validar que o Excel CSV e PDF Recebimentos pagos simplificado sem alteracao
    Given Usuario Franqueador esteja na pagina recebimentos pagos
    When exportar o arquivo simplificado
    Then validar os campos Data do pagamento, Bandeira, Produto, Banco, Agencia, Conta, Tipo, EC, Cod. de pagamento, Valor pagamento, Status

