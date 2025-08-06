#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Voucher
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Voucher
Feature: Voucher

  @navegacao
  @TestCaseKey=LPDC-T1214
  Scenario Outline: Verificar texto do rodape - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

  @navegacao
  @TestCaseKey=LPDC-T1207
  Scenario Outline: Visualizar campos de Total e Valor - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | campos                        |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Total de vendas;Valor bruto" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | campos                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Total de vendas;Valor bruto" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | campos                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Total de vendas;Valor bruto" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | campos                        |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Total de vendas;Valor bruto" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | campos                        |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Total de vendas;Valor bruto" |

  @totalizadores
  Scenario Outline: Validar totalizadores - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

  @periodo
  @TestCaseKey=LPDC-T1236
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | periodo           |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Ontem"           |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 7 Dias"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 14 Dias" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | periodo           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Ontem"           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 7 Dias"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 14 Dias" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | periodo           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Ontem"           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 7 Dias"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 14 Dias" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | periodo           |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Ontem"           |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 7 Dias"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 14 Dias" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | periodo           |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Ontem"           |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 7 Dias"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Últimos 14 Dias" |

  @personalizarColunas
  @TestCaseKey=LPDC-T1205
  Scenario Outline: Personalizar colunas - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                                            |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Número do Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização;Produto;Bandeira;Número do Terminal;Status"                                                                           |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | colunas                                                                                                                                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                                            |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Número do Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização;Produto;Bandeira;Número do Terminal;Status"                                                                           |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | colunas                                                                                                                                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                                            |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Número do Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização;Produto;Bandeira;Número do Terminal;Status"                                                                           |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                                            |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Número do Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização;Produto;Bandeira;Número do Terminal;Status"                                                                           |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | colunas                                                                                                                                    |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                                            |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Número do Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização;Produto;Bandeira;Número do Terminal;Status"                                                                           |

  @filtro
  @TestCaseKey=LPDC-T1209
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "WWW333"           |

    @bin
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Autorizada" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Estornada"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Recusada"   |

    @bin
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor   |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "todos" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "POS"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "TEF"   |

    @bin
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "todos"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "CABAL"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESE"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "TICKET"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "ALELO"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOROCRED"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESTES"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "PLUXEE"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "VR"          |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOFTNEX"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "REDECOMPRAS" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "FEPAS"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SODEXO"      |

    @bin
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "500;1000" |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "91084373" |

    @bin
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "ECC05DE6" |

    @sicredi
    @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "WWW333"           |

    @sicredi
    @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Autorizada" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Estornada"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Recusada"   |

    @sicredi
    @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro  | valor   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "todos" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "POS"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "TEF"   |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "todos"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "CABAL"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESE"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "TICKET"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "ALELO"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOROCRED"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESTES"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "PLUXEE"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "VR"          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOFTNEX"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "REDECOMPRAS" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "FEPAS"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SODEXO"      |

    @sicredi
    @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "500;1000" |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "91084373" |

    @sicredi
    @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "ECC05DE6" |

    @azulzinha
    @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "WWW333"           |

    @azulzinha
    @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Autorizada" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Estornada"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Recusada"   |

    @azulzinha
    @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro  | valor   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "todos" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "POS"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "TEF"   |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "todos"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "CABAL"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESE"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "TICKET"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "ALELO"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOROCRED"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESTES"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "PLUXEE"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "VR"          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOFTNEX"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "REDECOMPRAS" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "FEPAS"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SODEXO"      |

    @azulzinha
    @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "500;1000" |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "91084373" |

    @azulzinha
    @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "ECC05DE6" |

    @afinz
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "WWW333"           |

    @afinz
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Autorizada" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Estornada"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Recusada"   |

    @afinz
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor   |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "todos" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "POS"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "TEF"   |

    @afinz
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "todos"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "CABAL"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESE"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "TICKET"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "ALELO"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOROCRED"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESTES"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "PLUXEE"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "VR"          |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOFTNEX"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "REDECOMPRAS" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "FEPAS"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SODEXO"      |

    @afinz
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "500;1000" |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "91084373" |

    @afinz
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "ECC05DE6" |

    @claropay
    @codAutorizacao
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "primeiroRegistro" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Cód. de autorização" | "WWW333"           |

    @claropay
    @status
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "todos"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Autorizada" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Estornada"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Status" | "Recusada"   |

    @claropay
    @canal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro  | valor   |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "todos" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "POS"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Canal" | "TEF"   |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "todos"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "CABAL"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESE"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "TICKET"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "ALELO"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOROCRED"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "BANESTES"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "PLUXEE"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "VR"          |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SOFTNEX"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "REDECOMPRAS" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "FEPAS"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Bandeira" | "SODEXO"      |

    @claropay
    @valores
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "100;300"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Valores" | "500;1000" |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Estabelecimento" | "91084373" |

    @claropay
    @terminal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "LNK01D49" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "PGW0D0D1" |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Terminal" | "ECC05DE6" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1210
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1203
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Voucher
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                         |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelas;Bandeira;Canal;Número do terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

