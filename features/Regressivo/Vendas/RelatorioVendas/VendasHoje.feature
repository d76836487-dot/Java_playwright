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
      | alianca | dashboard | abaRelatorio  |
      | "bin"   | "vendas"  | "Hoje"        |

    @sicredi
    Examples:
      | alianca   | dashboard | abaRelatorio  |
      | "sicredi" | "vendas"  | "Hoje"        |

    @azulzinha
    Examples:
      | alianca     | dashboard | abaRelatorio |
      | "azulzinha" | "vendas"  | "Hoje"       |

    @afinz
    Examples:
      | alianca | dashboard | abaRelatorio  |
      | "afinz" | "vendas"  | "Hoje"        |

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
    And visualiza os campos <campos>
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
    And realiza a personalizacao das colunas <colunas>
    And valida que foi aplicado a personalizacao das colunas <colunas>
    @bin @personalizarColunas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @sicredi @personalizarColunas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @azulzinha @personalizarColunas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @afinz @personalizarColunas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | colunas                                                                                                                        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

  Scenario Outline: Realizar filtro - <filtro>: <valor> - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor>
    And valida que foi atribuido o valor <valor> do filtro <filtro>
    @bin @filtro @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "primeiroRegistro"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "WWW333"                  |

    @bin @filtro @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Autorizada"              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Recusada"                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Estornada"               |

    @bin @filtro @produtos
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito Internacional"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito Internacional"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Refeição"                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Alimentação"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Premium"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Cultura"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Auto"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Gift"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Corporativo"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Benefícios"              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multiplo"                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Flex"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Natal"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multibenefícios"         |

    @bin @filtro @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "selecionarPrimeiraOpcao" |

    @bin @filtro @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Mastercard"              |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Maestro"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Cabal"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Elo"                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Banese"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Ticket"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Alelo"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Sorocred"                |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Amex"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Hipercard"               |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Pluxee"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "VR"                      |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Visa"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Softnex"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Redecompras"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Fepas"                   |

    @bin @filtro @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "100;300"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "500;1000"                |

    @bin @filtro @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "selecionarPrimeiraOpcao" |

    @bin @filtro @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "selecionarPrimeiraOpcao" |

    @sicredi @filtro @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "primeiroRegistro"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "WWW333"                  |

    @sicredi @filtro @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Autorizada"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Recusada"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Estornada"               |

    @sicredi @filtro @produtos
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito Internacional"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito Internacional"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Refeição"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Alimentação"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Premium"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Cultura"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Auto"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Gift"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Corporativo"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Benefícios"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multiplo"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Flex"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Natal"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multibenefícios"         |

    @sicredi @filtro @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "selecionarPrimeiraOpcao" |

    @sicredi @filtro @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Mastercard"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Maestro"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Cabal"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Elo"                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Banese"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Ticket"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Alelo"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Sorocred"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Amex"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Hipercard"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Pluxee"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "VR"                      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Visa"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Softnex"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Redecompras"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Fepas"                   |

    @sicredi @filtro @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "100;300"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "500;1000"                |

    @sicredi @filtro @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "selecionarPrimeiraOpcao" |

    @sicredi @filtro @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "selecionarPrimeiraOpcao" |

    @azulzinha @filtro @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "primeiroRegistro"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "WWW333"                  |

    @azulzinha @filtro @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Autorizada"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Recusada"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Estornada"               |

    @azulzinha @filtro @produtos
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito Internacional"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito Internacional"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Refeição"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Alimentação"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Premium"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Cultura"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Auto"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Gift"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Corporativo"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Benefícios"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multiplo"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Flex"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Natal"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multibenefícios"         |

    @azulzinha @filtro @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "selecionarPrimeiraOpcao" |

    @azulzinha @filtro @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Mastercard"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Maestro"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Cabal"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Elo"                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Banese"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Ticket"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Alelo"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Sorocred"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Amex"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Hipercard"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Pluxee"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "VR"                      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Visa"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Softnex"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Redecompras"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Fepas"                   |

    @azulzinha @filtro @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "100;300"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "500;1000"                |

    @azulzinha @filtro @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "selecionarPrimeiraOpcao" |

    @azulzinha @filtro @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "selecionarPrimeiraOpcao" |

    @afinz @filtro @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "primeiroRegistro"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "codAutorizacao"  | "WWW333"                  |

    @afinz @filtro @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Autorizada"              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Recusada"                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "status"          | "Estornada"               |

    @afinz @filtro @produtos
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Crédito Internacional"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Débito Internacional"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Refeição"                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Alimentação"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Premium"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Cultura"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Auto"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Gift"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Corporativo"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Benefícios"              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multiplo"                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Flex"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Natal"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "produtos"        | "Multibenefícios"         |

    @afinz @filtro @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "canal"           | "selecionarPrimeiraOpcao" |

    @afinz @filtro @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Mastercard"              |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Maestro"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Cabal"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Elo"                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Banese"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Ticket"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Alelo"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Sorocred"                |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Amex"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Hipercard"               |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Pluxee"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "VR"                      |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Visa"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Softnex"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Redecompras"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "bandeira"        | "Fepas"                   |

    @afinz @filtro @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "100;300"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "valores"         | "500;1000"                |

    @afinz @filtro @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "estabelecimento" | "selecionarPrimeiraOpcao" |

    @afinz @filtro @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "terminal"        | "selecionarPrimeiraOpcao" |

  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo <tipoArquivo> gerado
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
    And valida as colunas <colunas> do arquivo <tipoArquivo> gerado
    @bin @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @bin @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @sicredi @gerarArquivo @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @sicredi @gerarArquivo @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @azulzinha @gerarArquivo @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha @gerarArquivo @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @afinz @gerarArquivo @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |

    @afinz @gerarArquivo @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio | tipoArquivo | colunas                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |