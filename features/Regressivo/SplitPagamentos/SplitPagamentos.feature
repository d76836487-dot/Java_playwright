#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/SplitPagamentos/Split_de_pagamentos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@splitPagamentos
Feature: Split de pagamentos

  @transacoes
  @TestCaseKey=LPDC-T1412
  Scenario Outline: Validar que <apresentacao> as transacoes na aba <abaRelatorio> - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida que <apresentacao> as transacoes
    @bin
    @franqueador
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio | apresentacao    |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       | "não apresenta" |

    @bin
    @franqueador
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | apresentacao |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @bin
    @franqueado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | apresentacao |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "apresenta"  |

    @bin
    @franqueado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | apresentacao |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @sicredi
    @franqueador
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio | apresentacao    |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       | "não apresenta" |

    @sicredi
    @franqueador
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | apresentacao |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @sicredi
    @franqueado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio | apresentacao |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "apresenta"  |

    @sicredi
    @franqueado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | apresentacao |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @azulzinha
    @franqueador
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio | apresentacao    |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       | "não apresenta" |

    @azulzinha
    @franqueador
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | apresentacao |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @azulzinha
    @franqueado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio | apresentacao |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "apresenta"  |

    @azulzinha
    @franqueado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | apresentacao |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @afinz
    @franqueador
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio | apresentacao    |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       | "não apresenta" |

    @afinz
    @franqueador
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | apresentacao |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @afinz
    @franqueado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio | apresentacao |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "apresenta"  |

    @afinz
    @franqueado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | apresentacao |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @claropay
    @franqueador
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio | apresentacao    |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       | "não apresenta" |

    @claropay
    @franqueador
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | apresentacao |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

    @claropay
    @franqueado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio | apresentacao |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "apresenta"  |

    @claropay
    @franqueado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | apresentacao |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "apresenta"  |

  @dashboard
  @TestCaseKey=LPDC-T1411
  Scenario Outline: Validar visualizacao do dashboard <dashboard> - <alianca>
    Given realizar login no portal <alianca>
    And visualizo o dashboard na Home logada
    Then valido que o dashboard <dashboard> <visivel>
    @bin
    @franqueador
    Examples:
      | alianca          | dashboard       | visivel            |
      | "binFranqueador" | "vendasHoje"    | "não está visível" |
      | "binFranqueador" | "ultimasVendas" | "não está visível" |

    @bin
    @franqueado
    Examples:
      | alianca         | dashboard       | visivel        |
      | "binFranqueado" | "vendasHoje"    | "está visível" |
      | "binFranqueado" | "ultimasVendas" | "está visível" |

    @sicredi
    @franqueador
    Examples:
      | alianca              | dashboard       | visivel            |
      | "sicrediFranqueador" | "vendasHoje"    | "não está visível" |
      | "sicrediFranqueador" | "ultimasVendas" | "não está visível" |

    @sicredi
    @franqueado
    Examples:
      | alianca             | dashboard       | visivel        |
      | "sicrediFranqueado" | "vendasHoje"    | "está visível" |
      | "sicrediFranqueado" | "ultimasVendas" | "está visível" |

    @azulzinha
    @franqueador
    Examples:
      | alianca                | dashboard       | visivel            |
      | "azulzinhaFranqueador" | "vendasHoje"    | "não está visível" |
      | "azulzinhaFranqueador" | "ultimasVendas" | "não está visível" |

    @azulzinha
    @franqueado
    Examples:
      | alianca               | dashboard       | visivel        |
      | "azulzinhaFranqueado" | "vendasHoje"    | "está visível" |
      | "azulzinhaFranqueado" | "ultimasVendas" | "está visível" |

    @afinz
    @franqueador
    Examples:
      | alianca            | dashboard       | visivel            |
      | "afinzFranqueador" | "vendasHoje"    | "não está visível" |
      | "afinzFranqueador" | "ultimasVendas" | "não está visível" |

    @afinz
    @franqueado
    Examples:
      | alianca           | dashboard       | visivel        |
      | "afinzFranqueado" | "vendasHoje"    | "está visível" |
      | "afinzFranqueado" | "ultimasVendas" | "está visível" |

    @claropay
    @franqueador
    Examples:
      | alianca               | dashboard       | visivel            |
      | "claropayFranqueador" | "vendasHoje"    | "não está visível" |
      | "claropayFranqueador" | "ultimasVendas" | "não está visível" |

    @claropay
    @franqueado
    Examples:
      | alianca              | dashboard       | visivel        |
      | "claropayFranqueado" | "vendasHoje"    | "está visível" |
      | "claropayFranqueado" | "ultimasVendas" | "está visível" |

  @personalizarColunas
  @master
  @TestCaseKey=LPDC-T1410
  Scenario Outline: Validar que nao apresenta as colunas - Personalizar colunas - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And que no Personalizar colunas nao apresenta as colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | colunas                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | colunas                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | colunas                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | colunas                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | colunas                   |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

  @personalizarColunas
  @TestCaseKey=LPDC-T1409
  Scenario Outline: Validar que apresenta as colunas - Personalizar colunas - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    @franqueador
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | colunas                   |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @bin
    @franqueado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | colunas                   |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @sicredi
    @franqueador
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | colunas                   |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @sicredi
    @franqueado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | colunas                   |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @azulzinha
    @franqueador
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | colunas                   |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @azulzinha
    @franqueado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | colunas                   |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @afinz
    @franqueador
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | colunas                   |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @afinz
    @franqueado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | colunas                   |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @claropay
    @franqueador
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | colunas                   |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

    @claropay
    @franqueado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | colunas                   |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valor original da venda" |

  @detalhesVenda
  Scenario Outline: Validar Valor original da venda - Detalhes da venda - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica se o Valor original da venda <visivel>
    @bin
    @master
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | visivel             |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "não está visível"  |

    @bin
    @franqueador
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio |  visivel         |
      | "binFranqueador"  | "vendas" | "relatorioVendas" | "Hoje"       |  "está visível"  |

    @bin
    @franqueado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | visivel         |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "está visível"  |

    @sicredi
    @master
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | visivel             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "não está visível"  |

    @sicredi
    @franqueador
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio |  visivel         |
      | "sicrediFranqueador"  | "vendas" | "relatorioVendas" | "Hoje"       |  "está visível"  |

    @sicredi
    @franqueado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio | visivel         |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "está visível"  |

    @azulzinha
    @master
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | visivel             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "não está visível"  |

    @azulzinha
    @franqueador
    Examples:
      | alianca                 | menu     | submenu           | abaRelatorio |  visivel         |
      | "azulzinhaFranqueador"  | "vendas" | "relatorioVendas" | "Hoje"       |  "está visível"  |

    @azulzinha
    @franqueado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio | visivel         |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "está visível"  |

    @afinz
    @master
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | visivel             |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "não está visível"  |

    @afinz
    @franqueador
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio |  visivel         |
      | "afinzFranqueador"  | "vendas" | "relatorioVendas" | "Hoje"       |  "está visível"  |

    @afinz
    @franqueado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio | visivel         |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Hoje"       | "está visível"  |

    @claropay
    @master
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | visivel             |
      | "claropay"  | "vendas" | "relatorioVendas" | "Hoje"       | "não está visível"  |

    @claropay
    @franqueador
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio |  visivel         |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Hoje"       |  "está visível"  |

    @claropay
    @franqueado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio | visivel         |
      | "claropayFranqueado"  | "vendas" | "relatorioVendas" | "Hoje"       | "está visível"  |

  @gerarArquivo
  @colunasArquivo
  @master
  @TestCaseKey=LPDC-T1414
  Scenario Outline: Validar que nao apresenta as colunas - Gerar arquivo - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1408
  Scenario Outline: Validar que apresenta as colunas - Gerar arquivo - <alianca>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                                    |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão"  |

    @bin
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @bin
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                              |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão"  |

    @bin
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca          | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "binFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @bin
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                 |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @bin
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @bin
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                           |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @bin
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "binFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @bin
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "binFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "binFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @bin
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "binFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "binFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @bin
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "binFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "binFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @bin
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "binFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "binFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                                    |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão"  |

    @sicredi
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @sicredi
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                              |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão"  |

    @sicredi
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "sicrediFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @sicredi
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                 |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @sicredi
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @sicredi
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                           |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @sicredi
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca             | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "sicrediFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @sicredi
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicrediFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "sicrediFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicrediFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "sicrediFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca             | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicrediFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca             | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "sicrediFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca             | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicrediFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca             | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "sicrediFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                                    |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                              |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca                | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "azulzinhaFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                 |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                           |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @azulzinha
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "azulzinhaFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @azulzinha
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca                | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinhaFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca                | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "azulzinhaFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca                | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinhaFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca                | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "azulzinhaFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinhaFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "azulzinhaFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinhaFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "azulzinhaFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                                    |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão"  |

    @afinz
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @afinz
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                              |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão"  |

    @afinz
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca            | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | "afinzFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @afinz
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                 |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @afinz
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @afinz
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                           |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @afinz
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca           | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | "afinzFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão"  |

    @afinz
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinzFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "afinzFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinzFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "afinzFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinzFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "afinzFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinzFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "afinzFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                                   |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão" |

    @claropay
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                             |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto parceiro;Valor da taxa;Valor líquido parceiro;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão" |

    @claropay
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca               | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | "claropayFranqueador" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                                  |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Número do cartão;Cód. Ref. Cartão"  |

    @claropay
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor Royalties da transação;Valor Royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                                                            |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor royalties;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Descrição do link;Num cartão;Cód. Ref. Cartão"  |

    @claropay
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca              | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | "claropayFranqueado" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor royalties da transação;Valor royalties da parcela;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Descrição do link;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @franqueador
    @excel
    @simplificado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropayFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @franqueador
    @excel
    @detalhado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "claropayFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @franqueador
    @csv
    @simplificado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropayFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @franqueador
    @csv
    @detalhado
    Examples:
      | alianca               | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "claropayFranqueador" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @franqueado
    @excel
    @simplificado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropayFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @franqueado
    @excel
    @detalhado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "claropayFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @franqueado
    @csv
    @simplificado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropayFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @franqueado
    @csv
    @detalhado
    Examples:
      | alianca              | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "claropayFranqueado" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor original da venda;Valor original da parcela;Valor royalties da parcela;Valor bruto da transação parceiro;Valor bruto da parcela paga parceiro;Valor da taxa (MDR);Valor líquido da parcela/transação parceiro;Número do cartão;Banco;Agência;Conta" |
