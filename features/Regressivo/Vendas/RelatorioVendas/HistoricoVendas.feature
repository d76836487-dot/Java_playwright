#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Historico_de_vendas
@Zephyr:Status=Deprecated
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Vendas
@HistoricoVendas
Feature: Historico de vendas
<<<<<<< HEAD
 
  @navegacao
=======

>>>>>>> 86ba97a093aa34f41e97ceb03232b20799192940
  @TestCaseKey=LPDC-T1218
  Scenario Outline: Verificar texto do rodape - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

  @TestCaseKey=LPDC-T1215
  Scenario Outline: Visualizar campos de Total e Valor - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | campos                                                      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Total de vendas;Valor bruto;Valor líquido;Valor cancelado" |

  @totalizadores
  @TestCaseKey=LPDC-T1407
  Scenario Outline: Validar totalizadores - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

  @periodo
  @TestCaseKey=LPDC-T1237
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | periodo           |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | periodo           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | periodo           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | periodo           |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | periodo           |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | periodo           |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | periodo           |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"           |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias"  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14 Dias" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"       |

  @maisDetalhes
  @TestCaseKey=LPDC-T1217
  Scenario Outline: Verificar dados do link Mais detalhes - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica os dados do link Mais detalhes
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

  @personalizarColunas
  @TestCaseKey=LPDC-T1220
  Scenario Outline: Personalizar colunas - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | colunas                                                                                                                                     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                         |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Data da venda;Cód. de autorização;Parcelas;Bandeira;Valor bruto;Valor líquido;Terminal;Comprovante de venda;Valor da taxa;Estabelecimento" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização;Parcelas;Canal;Valor líquido;Terminal"                                                                                 |

  @filtro
  @TestCaseKey=LPDC-T1208
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @bin
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @bin
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @bin
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @bin
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @bin
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @bin
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @sicredi
    @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @sicredi
    @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @sicredi
    @produto
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @sicredi
    @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @sicredi
    @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @sicredi
    @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @azulzinha
    @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @azulzinha
    @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @azulzinha
    @produto
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @azulzinha
    @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @azulzinha
    @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @azulzinha
    @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @afinz
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @afinz
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @afinz
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @afinz
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @afinz
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @afinz
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @afinz
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @claropay
    @codAutorizacao
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @claropay
    @status
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @claropay
    @produto
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @claropay
    @canal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @claropay
    @valores
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @claropay
    @terminal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @banqi
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @banqi
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @banqi
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @banqi
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @banqi
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @banqi
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @banqi
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @banqi
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @corujacapital
    @codAutorizacao
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @corujacapital
    @status
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @corujacapital
    @produto
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @corujacapital
    @canal
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @corujacapital
    @valores
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @corujacapital
    @estabelecimento
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @corujacapital
    @terminal
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1206
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @sicredi
    @excel
    @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @sicredi
    @excel
    @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @sicredi
    @csv
    @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @sicredi
    @csv
    @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @azulzinha
    @excel
    @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @azulzinha
    @excel
    @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @azulzinha
    @csv
    @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @azulzinha
    @csv
    @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @afinz
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @afinz
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @afinz
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @afinz
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @claropay
    @excel
    @simplificado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @claropay
    @excel
    @detalhado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @claropay
    @csv
    @simplificado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @claropay
    @csv
    @detalhado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @banqi
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @banqi
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @banqi
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @banqi
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @corujacapital
    @excel
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @corujacapital
    @excel
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @corujacapital
    @csv
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @corujacapital
    @csv
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1227
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @sicredi
    @excel
    @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @sicredi
    @excel
    @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @sicredi
    @csv
    @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @sicredi
    @csv
    @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @azulzinha
    @excel
    @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @excel
    @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @azulzinha
    @csv
    @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @azulzinha
    @csv
    @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @afinz
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @afinz
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @afinz
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @afinz
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @excel
    @simplificado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @claropay
    @excel
    @detalhado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @claropay
    @csv
    @simplificado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @claropay
    @csv
    @detalhado
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @banqi
    @excel
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @banqi
    @excel
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @banqi
    @csv
    @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @banqi
    @csv
    @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @corujacapital
    @excel
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @corujacapital
    @excel
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @corujacapital
    @csv
    @simplificado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @corujacapital
    @csv
    @detalhado
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

