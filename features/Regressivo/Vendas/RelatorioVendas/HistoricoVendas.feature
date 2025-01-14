#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Historico_de_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@HistoricoVendas
Feature: Historico de vendas

  @navegacao
  @TestCaseKey=LPDC-T1216
  Scenario Outline: Acessar Historico de vendas via menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
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

  @navegacao
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

  @navegacao
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

  @periodo
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | periodo          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"      |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | periodo          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"      |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | periodo          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"      |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | periodo          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Ontem"          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 7 Dias" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Últimos 14"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Mês Atual"      |

  @navegacao @maisDetalhes
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

  @filtro
  @TestCaseKey=LPDC-T1208
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @bin @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @bin @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @bin @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @bin @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @bin @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @bin @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @bin @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @sicredi @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @sicredi @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @sicredi @produto
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @sicredi @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @sicredi @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @sicredi @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @sicredi @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @sicredi @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @azulzinha @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @azulzinha @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @azulzinha @produto
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @azulzinha @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @azulzinha @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @azulzinha @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @azulzinha @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @azulzinha @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

    @afinz @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Cód. de autorização" | "WWW333"           |

    @afinz @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro   | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Aprovada"          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada"         |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Status" | "Cancelada parcial" |

    @afinz @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Débito"            |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crédito à vista"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Emissor" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Parcelado Lojista" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Produto" | "Crediário"         |

    @afinz @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro  | valor               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "todos"             |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Link de Pagamento" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "POS Wifi GPRS"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Canal" | "Ecommerce TEF"     |

    @afinz @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Visa"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Mastercard" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Amex"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Cabal"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Elo"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Bandeira" | "Hipercard"  |

    @afinz @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Valores" | "500;1000" |

    @afinz @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Estabelecimento" | "91084373" |

    @afinz @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "ECC05DE6" |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Terminal" | "00062723" |

  @gerarArquivo @nomeArquivo
  @TestCaseKey=LPDC-T1206
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @bin @excel @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @bin @csv @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @bin @csv @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @sicredi @excel @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @sicredi @excel @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @sicredi @csv @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @sicredi @csv @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @azulzinha @excel @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @azulzinha @excel @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @azulzinha @csv @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @azulzinha @csv @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @afinz @excel @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" |

    @afinz @excel @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @afinz @csv @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" |

    @afinz @csv @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

  @gerarArquivo @colunasArquivo
  @TestCaseKey=LPDC-T1227
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Historico de vendas
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @bin @excel @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @bin @csv @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @bin @csv @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @sicredi @excel @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @sicredi @excel @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @sicredi @csv @simplificado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @sicredi @csv @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @azulzinha @excel @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @azulzinha @excel @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @azulzinha @csv @simplificado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @azulzinha @csv @detalhado
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @afinz @excel @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                               |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Número do cartão;Cód. Ref. Cartão" |

    @afinz @excel @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "Excel"     | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor Original da Venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

    @afinz @csv @simplificado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                                                                                                                                         |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "simplificado" | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor original da venda;Valor bruto;Valor da taxa;Valor líquido;Valor cancelado;Status;Número do terminal;Comprovante da venda;Cód. do pedido;Número do estabelecimento;Nome do estabelecimento;Num cartão;Cód. Ref. Cartão" |

    @afinz @csv @detalhado
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" | "CSV"       | "detalhado"   | "Data da venda;Hora da venda;Código de autorização;Código do estabelecimento;Nome do estabelecimento;Comprovante de venda;Código do pedido;Canal;Número do Terminal;Produto;Parcelas;Tipo de cartão;Bandeira;Status;Valor original da venda;Valor bruto da transação;Valor bruto da parcela;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Cartão pré pago;Data prevista de pagamento da venda;Status do pagamento da venda;Data efetiva do pagamento da venda;Código de pagamento;Cód. Ref. Cartão" |

