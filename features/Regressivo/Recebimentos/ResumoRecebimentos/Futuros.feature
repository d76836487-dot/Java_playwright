#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/ResumoRecebimentos/Futuros
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Recebimentos
@Futuros 
Feature: Futuros

  @navegacao
  @TestCaseKey=LPDC-T1260
  Scenario Outline: Verificar texto do rodape - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

  @navegacao
  @TestCaseKey=LPDC-T1271
  Scenario Outline: Visualizar campos de Total e Valor - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | campos                                   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | campos                                   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | campos                                   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | campos                                   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Total de vendas;Total líquido previsto" |

  @totalizadores
  @TestCaseKey=LPDC-T1451
  Scenario Outline: Validar totalizadores - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

  @periodo
  @TestCaseKey=LPDC-T1259
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | periodo               |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | periodo               |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | periodo               |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | periodo               |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | periodo               |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | periodo               |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | periodo               |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Amanhã"              |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Proxima Semana"      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim de Semana" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Próximo Mês"         |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Até o fim do mês"    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Este Mês"            |

  @personalizarColunas
  @TestCaseKey=LPDC-T1261
  Scenario Outline: Personalizar colunas - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | colunas                                                                                                                                     |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Produto;Bandeira;Valor bruto da parcela;Número do Terminal;Cód. do pedido"                                                   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização;Parcelas;Valor bruto;Valor líquido;Canal;Número do estabelecimento"                                                    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Número do Terminal;Canal;Cód. do pedido;Número do estabelecimento" |

  @filtro
  @TestCaseKey=LPDC-T1262
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codAutorizacao
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @bin
    @produto
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @bin
    @bandeira
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @sicredi
    @codAutorizacao
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @sicredi
    @produto
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @azulzinha
    @codAutorizacao
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @azulzinha
    @produto
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @afinz
    @codAutorizacao
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @afinz
    @produto
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @afinz
    @bandeira
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @claropay
    @codAutorizacao
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @claropay
    @produto
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @banqi
    @codAutorizacao
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @banqi
    @produto
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @banqi
    @bandeira
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @banqi
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @corujacapital
    @codAutorizacao
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @corujacapital
    @produto
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @corujacapital
    @estabelecimento
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1257
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @bin
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @sicredi
    @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @sicredi
    @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @afinz
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @afinz
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @claropay
    @excel
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @claropay
    @csv
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @banqi
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @banqi
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @corujacapital
    @excel
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @corujacapital
    @csv
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1263
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @bin
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @sicredi
    @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @sicredi
    @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @afinz
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @afinz
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @claropay
    @excel
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @claropay
    @csv
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @banqi
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @banqi
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @corujacapital
    @excel
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @corujacapital
    @csv
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

