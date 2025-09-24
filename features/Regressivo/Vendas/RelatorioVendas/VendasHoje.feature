#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Vendas
@Hoje
Feature: Vendas Hoje

  @navegacao
  @TestCaseKey=LPDC-T1229
  Scenario Outline: Verificar texto do rodape - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       |

  @navegacao
  @TestCaseKey=LPDC-T1232
  Scenario Outline: Visualizar campos de Total e Valor - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | campos                        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | campos                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | campos                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | campos                        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | campos                        |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | campos                        |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | campos                        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Total de vendas;Valor bruto" |

  @totalizadores
  @TestCaseKey=LPDC-T1413
  Scenario Outline: Validar totalizadores - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       |

  @personalizarColunas
  @TestCaseKey=LPDC-T1233
  Scenario Outline: Personalizar colunas - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | colunas                                                                                                                                                |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                                    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                                  |

  @filtro
  @TestCaseKey=LPDC-T1234
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @bin
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @bin
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @bin
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @bin
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @bin
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @bin
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @sicredi
    @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @sicredi
    @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @sicredi
    @produto
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @sicredi
    @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @sicredi
    @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @sicredi
    @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @azulzinha
    @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @azulzinha
    @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @azulzinha
    @produto
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @azulzinha
    @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @azulzinha
    @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @azulzinha
    @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @afinz
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @afinz
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @afinz
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @afinz
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @afinz
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @afinz
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @afinz
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @claropay
    @codAutorizacao
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @claropay
    @status
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @claropay
    @produto
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @claropay
    @canal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @claropay
    @valores
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @claropay
    @terminal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @banqi
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @banqi
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @banqi
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @banqi
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @banqi
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @banqi
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @banqi
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @banqi
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @corujacapital
    @codAutorizacao
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @corujacapital
    @status
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @corujacapital
    @produto
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro    | valor                   |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "todos"                 |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito"               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Crédito Internacional" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito"                |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Débito Internacional"  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Refeição"              |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Alimentação"           |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Premium"               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Cultura"               |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Auto"                  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Gift"                  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Corporativo"           |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Benefícios"            |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multiplo"              |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Flex"                  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Natal"                 |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Produto" | "Multibenefícios"       |

    @corujacapital
    @canal
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro     | valor         |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "todos"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Mastercard"  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Maestro"     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Cabal"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Elo"         |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Banese"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Ticket"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Alelo"       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Sorocred"    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Amex"        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Hipercard"   |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Pluxee"      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "VR"          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Visa"        |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Softnex"     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Redecompras" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Bandeira" | "Fepas"       |

    @corujacapital
    @valores
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @corujacapital
    @estabelecimento
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @corujacapital
    @terminal
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1231
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @banqi
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @banqi
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

    @corujacapital
    @excel
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           |

    @corujacapital
    @csv
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1235
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @claropay
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @claropay
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @banqi
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @banqi
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @corujacapital
    @excel
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @corujacapital
    @csv
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                 |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |