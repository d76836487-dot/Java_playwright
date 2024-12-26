#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@VendasHoje
Feature: Vendas Hoje

  Scenario Outline: Acessar Vendas Hoje via menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
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

  Scenario Outline: Acessar Vendas Hoje via Dashboard Vendas
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin
    Examples:
      | alianca | dashboard | abaRelatorio |
      | "bin"   | "vendas"  | "Hoje"       |

    @sicredi
    Examples:
      | alianca   | dashboard | abaRelatorio |
      | "sicredi" | "vendas"  | "Hoje"       |

    @azulzinha
    Examples:
      | alianca     | dashboard | abaRelatorio |
      | "azulzinha" | "vendas"  | "Hoje"       |

    @afinz
    Examples:
      | alianca | dashboard | abaRelatorio |
      | "afinz" | "vendas"  | "Hoje"       |

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

  Scenario Outline: Personalizar colunas - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin @personalizarColunas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;codReferenciaCartao" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                         |

    @sicredi @personalizarColunas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                         |

    @azulzinha @personalizarColunas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                         |

    @afinz @personalizarColunas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Produto;Bandeira;Valor bruto;Status"                                                                                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Valor bruto;Status;Estabelecimento;Final do cartão;Cód. referência do cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização;Canal;Estabelecimento;Final do cartão;Cód. referência do cartão"                                                         |

  Scenario Outline: Realizar filtro - <filtro>: <valor> - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @filtro @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @bin @filtro @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @bin @filtro @produto
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

    @bin @filtro @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |


    @bin @filtro @bandeira
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

    @bin @filtro @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @bin @filtro @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @bin @filtro @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @sicredi @filtro @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @sicredi @filtro @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @sicredi @filtro @produto
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

    @sicredi @filtro @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @sicredi @filtro @bandeira
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

    @sicredi @filtro @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @sicredi @filtro @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @sicredi @filtro @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @azulzinha @filtro @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @azulzinha @filtro @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @azulzinha @filtro @produto
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

    @azulzinha @filtro @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @azulzinha @filtro @bandeira
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

    @azulzinha @filtro @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @azulzinha @filtro @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @azulzinha @filtro @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

    @afinz @filtro @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Cód. de autorização" | "WWW333"           |

    @afinz @filtro @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro   | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Autorizada" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Recusada"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Status" | "Estornada"  |

    @afinz @filtro @produto
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

    @afinz @filtro @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro  | valor       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "todos"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "ECOMMERCE" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "POS"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Canal" | "TEF"       |

    @afinz @filtro @bandeira
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

    @afinz @filtro @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Valores" | "500;1000" |

    @afinz @filtro @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Estabelecimento" | "91084373" |

    @afinz @filtro @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Terminal" | "ECC05DE6" |

  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo <tipoArquivo> gerado - <abaRelatorio>
    @bin @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     |

    @bin @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       |

    @sicredi @gerarArquivo @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     |

    @sicredi @gerarArquivo @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       |

    @azulzinha @gerarArquivo @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     |

    @azulzinha @gerarArquivo @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       |

    @afinz @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     |

    @afinz @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       |

  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo <tipoArquivo> gerado - <abaRelatorio>
    @bin @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @bin @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @sicredi @gerarArquivo @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @sicredi @gerarArquivo @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha @gerarArquivo @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha @gerarArquivo @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @afinz @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @afinz @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |