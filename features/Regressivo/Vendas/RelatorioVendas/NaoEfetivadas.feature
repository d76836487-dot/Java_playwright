#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Nao_efetivadas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@NaoEfetivadas
Feature: Nao efetivadas

  @navegacao
  @TestCaseKey=LPDC-T1212
  Scenario Outline: Acessar Nao efetivadas via menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

  @navegacao
  @TestCaseKey=LPDC-T1199
  Scenario Outline: Verificar texto do rodape - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

  @navegacao
  @TestCaseKey=LPDC-T1201
  Scenario Outline: Visualizar campos de Total e Valor - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | campos                                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Total de recusadas;Total de estornadas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | campos                                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Total de recusadas;Total de estornadas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | campos                                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Total de recusadas;Total de estornadas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | campos                                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Total de recusadas;Total de estornadas" |

  @personalizarColunas
  @TestCaseKey=LPDC-T1213
  Scenario Outline: Personalizar colunas - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | colunas                                                                                                                |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                        |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Terminal;Valor bruto;Status;Estabelecimento;Final do cartão" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização;Produto;Bandeira;Terminal;Status"                                                                 |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | colunas                                                                                                                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Terminal;Valor bruto;Status;Estabelecimento;Final do cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização;Produto;Bandeira;Terminal;Status"                                                                 |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | colunas                                                                                                                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Terminal;Valor bruto;Status;Estabelecimento;Final do cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização;Produto;Bandeira;Terminal;Status"                                                                 |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | colunas                                                                                                                |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Comprovante de venda;Parcelas;Canal;Valor bruto"                                                        |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Data da venda;Cód. de autorização;Produto;Parcelas;Canal;Terminal;Valor bruto;Status;Estabelecimento;Final do cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização;Produto;Bandeira;Terminal;Status"                                                                 |

  @filtro
  @TestCaseKey=LPDC-T1211
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "WWW333"           |

    @bin @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro   | valor       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "todos"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Estornada" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Recusada"  |

    @bin @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro    | valor                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "todos"                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado"         |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Débito"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado Emissor" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crediário"                 |

    @bin @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro  | valor       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "todos"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "POS"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "TEF"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "ECOMMERCE" |

    @bin @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro     | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Visa"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Mastercard" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Amex"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Cabal"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Elo"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Hipercard"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Maestro"    |

    @bin @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "500;1000" |

    @bin @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "91084373" |

    @bin @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "ECC05DE6" |

    @sicredi @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "WWW333"           |

    @sicredi @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro   | valor       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "todos"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Estornada" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Recusada"  |

    @sicredi @produto
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro    | valor                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "todos"                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado"         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Débito"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado Emissor" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crediário"                 |

    @sicredi @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro  | valor       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "todos"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "POS"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "TEF"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "ECOMMERCE" |

    @sicredi @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro     | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Visa"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Mastercard" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Amex"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Cabal"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Elo"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Hipercard"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Maestro"    |

    @sicredi @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "500;1000" |

    @sicredi @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "91084373" |

    @sicredi @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "ECC05DE6" |

    @azulzinha @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "WWW333"           |

    @azulzinha @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro   | valor       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "todos"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Estornada" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Recusada"  |

    @azulzinha @produto
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro    | valor                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "todos"                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado"         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Débito"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado Emissor" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crediário"                 |

    @azulzinha @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro  | valor       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "todos"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "POS"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "TEF"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "ECOMMERCE" |

    @azulzinha @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro     | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Visa"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Amex"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Elo"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Hipercard"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Maestro"    |

    @azulzinha @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "500;1000" |

    @azulzinha @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "91084373" |

    @azulzinha @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "ECC05DE6" |

    @afinz @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Cód. de autorização" | "WWW333"           |

    @afinz @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro   | valor       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "todos"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Estornada" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Status" | "Recusada"  |

    @afinz @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro    | valor                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "todos"                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado"         |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Débito"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crédito Parcelado Emissor" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Produto" | "Crediário"                 |

    @afinz @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro  | valor       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "todos"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "POS"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "TEF"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Canal" | "ECOMMERCE" |

    @afinz @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro     | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Visa"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Mastercard" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Amex"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Cabal"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Elo"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Hipercard"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Bandeira" | "Maestro"    |

    @afinz @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Valores" | "500;1000" |

    @afinz @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Estabelecimento" | "91084373" |

    @afinz @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Terminal" | "ECC05DE6" |

  @gerarArquivo
  @TestCaseKey=LPDC-T1202
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           |

    @bin @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           |

    @sicredi @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           |

    @sicredi @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           |

    @azulzinha @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           |

    @azulzinha @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           |

    @afinz @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           |

    @afinz @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           |

  @gerarArquivo
  @TestCaseKey=LPDC-T1204
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Nao efetivadas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @bin @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @sicredi @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @sicredi @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @azulzinha @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @azulzinha @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @afinz @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "Excel"     | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

    @afinz @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" | "CSV"       | "N"           | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Número Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão" |

