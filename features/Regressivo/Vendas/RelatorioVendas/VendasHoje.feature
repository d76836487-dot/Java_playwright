#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
Feature: Vendas Hoje

  Scenario Outline: Acessar menu lateral - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    @bin
    Examples:
      | alianca | menu     | submenu           |
      | "bin"   | "vendas" | "relatorioVendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           |
      | "sicredi" | "vendas" | "relatorioVendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           |
      | "azulzinha" | "vendas" | "relatorioVendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           |
      | "afinz" | "vendas" | "relatorioVendas" |

  Scenario Outline: Acessar Dashboard Vendas - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que o Vendas Hoje foi acessado com sucesso
    @bin
    Examples:
      | alianca | dashboard |
      | "bin"   | "vendas"  |

    @sicredi
    Examples:
      | alianca   | dashboard |
      | "sicredi" | "vendas"  |

    @azulzinha
    Examples:
      | alianca     | dashboard |
      | "azulzinha" | "vendas"  |

    @afinz
    Examples:
      | alianca | dashboard |
      | "afinz" | "vendas"  |

  Scenario Outline: Verificar texto do rodape - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           |
      | "bin"   | "vendas" | "relatorioVendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           |
      | "sicredi" | "vendas" | "relatorioVendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           |
      | "azulzinha" | "vendas" | "relatorioVendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           |
      | "afinz" | "vendas" | "relatorioVendas" |

  Scenario Outline: Visualizar campos do Resumo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And visualiza os campos <campo1> e <campo2>
    @bin
    Examples:
      | alianca | menu     | submenu           | campo1            | campo2        |
      | "bin"   | "vendas" | "relatorioVendas" | "Total de vendas" | "Valor bruto" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | campo1            | campo2        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Total de vendas" | "Valor bruto" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | campo1            | campo2        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Total de vendas" | "Valor bruto" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | campo1            | campo2        |
      | "afinz" | "vendas" | "relatorioVendas" | "Total de vendas" | "Valor bruto" |

  Scenario Outline: Personalizar colunas - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And realiza a personalizacao das colunas <colunas>
    And valida que foi aplicado a personalizacao das colunas <colunas>
    @bin
    Examples:
      | alianca | menu     | submenu           | colunas                                                                                                                        |
      | "bin"   | "vendas" | "relatorioVendas" | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "bin"   | "vendas" | "relatorioVendas" | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "bin"   | "vendas" | "relatorioVendas" | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | colunas                                                                                                                        |
      | "sicredi" | "vendas" | "relatorioVendas" | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "sicredi" | "vendas" | "relatorioVendas" | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | colunas                                                                                                                        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

    @afinz
    Examples:
      | alianca | menu     | submenu           | colunas                                                                                                                        |
      | "afinz" | "vendas" | "relatorioVendas" | "dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
      | "afinz" | "vendas" | "relatorioVendas" | "dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
      | "afinz" | "vendas" | "relatorioVendas" | "codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

  Scenario Outline: Realizar filtro - <filtro>: <valor> - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor>
    And valida que foi atribuido o valor <valor> do filtro <filtro>
    @bin
    Examples:
      | alianca | menu     | submenu           | filtro            | valor                     |
      | "bin"   | "vendas" | "relatorioVendas" | "codAutorizacao"  | "primeiroRegistro"        |
      | "bin"   | "vendas" | "relatorioVendas" | "codAutorizacao"  | "WWW333"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "status"          | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "status"          | "Autorizada"              |
      | "bin"   | "vendas" | "relatorioVendas" | "status"          | "Recusada"                |
      | "bin"   | "vendas" | "relatorioVendas" | "status"          | "Estornada"               |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Crédito"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Crédito Internacional"   |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Débito"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Débito Internacional"    |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Refeição"                |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Alimentação"             |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Premium"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Cultura"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Auto"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Gift"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Corporativo"             |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Benefícios"              |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Multiplo"                |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Flex"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Natal"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "produtos"        | "Multibenefícios"         |
      | "bin"   | "vendas" | "relatorioVendas" | "canal"           | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "canal"           | "selecionarPrimeiraOpcao" |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Mastercard"              |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Maestro"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Cabal"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Elo"                     |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Banese"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Ticket"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Alelo"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Sorocred"                |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Amex"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Hipercard"               |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Pluxee"                  |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "VR"                      |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Visa"                    |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Softnex"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Redecompras"             |
      | "bin"   | "vendas" | "relatorioVendas" | "bandeira"        | "Fepas"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "valores"         | "100;300"                 |
      | "bin"   | "vendas" | "relatorioVendas" | "estabelecimento" | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "estabelecimento" | "selecionarPrimeiraOpcao" |
      | "bin"   | "vendas" | "relatorioVendas" | "terminal"        | "todos"                   |
      | "bin"   | "vendas" | "relatorioVendas" | "terminal"        | "selecionarPrimeiraOpcao" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | filtro            | valor                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "primeiroRegistro"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "WWW333"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "status"          | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "status"          | "Autorizada"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "status"          | "Recusada"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "status"          | "Estornada"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito Internacional"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Débito"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Débito Internacional"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Refeição"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Alimentação"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Premium"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Cultura"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Auto"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Gift"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Corporativo"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Benefícios"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Multiplo"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Flex"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Natal"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "produtos"        | "Multibenefícios"         |
      | "sicredi" | "vendas" | "relatorioVendas" | "canal"           | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "canal"           | "selecionarPrimeiraOpcao" |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Mastercard"              |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Maestro"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Cabal"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Elo"                     |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Banese"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Ticket"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Alelo"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Sorocred"                |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Amex"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Hipercard"               |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Pluxee"                  |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "VR"                      |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Visa"                    |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Softnex"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Redecompras"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "bandeira"        | "Fepas"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "valores"         | "100;300"                 |
      | "sicredi" | "vendas" | "relatorioVendas" | "estabelecimento" | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "estabelecimento" | "selecionarPrimeiraOpcao" |
      | "sicredi" | "vendas" | "relatorioVendas" | "terminal"        | "todos"                   |
      | "sicredi" | "vendas" | "relatorioVendas" | "terminal"        | "selecionarPrimeiraOpcao" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | filtro            | valor                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "primeiroRegistro"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "WWW333"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "status"          | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "status"          | "Autorizada"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "status"          | "Recusada"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "status"          | "Estornada"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito Internacional"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Débito"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Débito Internacional"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Refeição"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Alimentação"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Premium"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Cultura"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Auto"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Gift"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Corporativo"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Benefícios"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Multiplo"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Flex"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Natal"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "produtos"        | "Multibenefícios"         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "canal"           | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "canal"           | "selecionarPrimeiraOpcao" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Mastercard"              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Maestro"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Cabal"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Elo"                     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Banese"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Ticket"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Alelo"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Sorocred"                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Amex"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Hipercard"               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Pluxee"                  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "VR"                      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Visa"                    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Softnex"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Redecompras"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "bandeira"        | "Fepas"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "valores"         | "100;300"                 |
      | "azulzinha" | "vendas" | "relatorioVendas" | "estabelecimento" | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "estabelecimento" | "selecionarPrimeiraOpcao" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "terminal"        | "todos"                   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "terminal"        | "selecionarPrimeiraOpcao" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | filtro            | valor                     |
      | "afinz" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "primeiroRegistro"        |
      | "afinz" | "vendas" | "relatorioVendas" | "codAutorizacao"  | "WWW333"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "status"          | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "status"          | "Autorizada"              |
      | "afinz" | "vendas" | "relatorioVendas" | "status"          | "Recusada"                |
      | "afinz" | "vendas" | "relatorioVendas" | "status"          | "Estornada"               |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Crédito Internacional"   |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Débito"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Débito Internacional"    |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Refeição"                |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Alimentação"             |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Premium"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Cultura"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Auto"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Gift"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Corporativo"             |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Benefícios"              |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Multiplo"                |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Flex"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Natal"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "produtos"        | "Multibenefícios"         |
      | "afinz" | "vendas" | "relatorioVendas" | "canal"           | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "canal"           | "selecionarPrimeiraOpcao" |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Mastercard"              |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Maestro"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Cabal"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Elo"                     |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Banese"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Ticket"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Alelo"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Sorocred"                |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Amex"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Hipercard"               |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Pluxee"                  |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "VR"                      |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Visa"                    |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Softnex"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Redecompras"             |
      | "afinz" | "vendas" | "relatorioVendas" | "bandeira"        | "Fepas"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "valores"         | "100;300"                 |
      | "afinz" | "vendas" | "relatorioVendas" | "estabelecimento" | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "estabelecimento" | "selecionarPrimeiraOpcao" |
      | "afinz" | "vendas" | "relatorioVendas" | "terminal"        | "todos"                   |
      | "afinz" | "vendas" | "relatorioVendas" | "terminal"        | "selecionarPrimeiraOpcao" |

  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And valida o nome do arquivo <tipoArquivo> gerado
    @bin
    Examples:
      | alianca | menu     | submenu           | tipoArquivo |
      | "bin"   | "vendas" | "relatorioVendas" | "Excel"     |
      | "bin"   | "vendas" | "relatorioVendas" | "CSV"       |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | tipoArquivo |
      | "sicredi" | "vendas" | "relatorioVendas" | "Excel"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "CSV"       |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | tipoArquivo |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Excel"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "CSV"       |

    @afinz
    Examples:
      | alianca | menu     | submenu           | tipoArquivo |
      | "afinz" | "vendas" | "relatorioVendas" | "Excel"     |
      | "afinz" | "vendas" | "relatorioVendas" | "CSV"       |

  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And valida as colunas <colunas> do arquivo <tipoArquivo> gerado
    @bin
    Examples:
      | alianca | menu     | submenu           | tipoArquivo | colunas                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |
      | "bin"   | "vendas" | "relatorioVendas" | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | tipoArquivo | colunas                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | tipoArquivo | colunas                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |

    @afinz
    Examples:
      | alianca | menu     | submenu           | tipoArquivo | colunas                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Excel"     | "Data da venda;Cód. de autorização;Comprovante da venda;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "CSV"       | "Data da venda;Cód. de autorização;Comprovante;Produto;Parcelado;Bandeira;Canal;Terminal;Valor bruto;Status;Número do estabelecimento;Final do cartão;Cód. Ref. Cartão"          |