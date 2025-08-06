#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Pre_autorizacoes
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@PreAutorizacoes
Feature: Pre autorizacoes

  @navegacao
  @TestCaseKey=LPDC-T1224
  Scenario Outline: Verificar texto do rodape - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

  @navegacao
  @TestCaseKey=LPDC-T1219
  Scenario Outline: Visualizar campos de Total e Valor - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | campos                                                           |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Total de vendas;Valor bruto autorizado;Valor bruto a confirmar" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | campos                                                           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Total de vendas;Valor bruto autorizado;Valor bruto a confirmar" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | campos                                                           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Total de vendas;Valor bruto autorizado;Valor bruto a confirmar" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | campos                                                           |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Total de vendas;Valor bruto autorizado;Valor bruto a confirmar" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | campos                                                           |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Total de vendas;Valor bruto autorizado;Valor bruto a confirmar" |

  @totalizadores
  Scenario Outline: Validar totalizadores - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

  @periodo
  @TestCaseKey=LPDC-T1238
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | periodo           |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Hoje"            |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Ontem"           |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 7 Dias"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 14 Dias" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Este Mês"        |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | periodo           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Hoje"            |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Ontem"           |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 7 Dias"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 14 Dias" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Este Mês"        |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | periodo           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Hoje"            |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Ontem"           |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 7 Dias"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 14 Dias" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Este Mês"        |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | periodo           |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Hoje"            |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Ontem"           |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 7 Dias"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 14 Dias" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Este Mês"        |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | periodo           |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Hoje"            |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Ontem"           |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 7 Dias"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Últimos 14 Dias" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Este Mês"        |

  @personalizarColunas
  @TestCaseKey=LPDC-T1225
  Scenario Outline: Personalizar colunas - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | colunas                                                                                                                                                             |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Cód. de autorização;Bandeira;Valor autorizado;Status"                                                                                                |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Data alvo;Produto;Bandeira;Valor autorizado;Valor confirmado;Número do Terminal;Estabelecimento comercial;Final do cartão;Cód. referência do cartão" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data alvo;Produto;Canal;Valor confirmado;Comprovante de venda"                                                                                                     |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | colunas                                                                                                                                                             |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Cód. de autorização;Bandeira;Valor autorizado;Status"                                                                                                |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Data alvo;Produto;Bandeira;Valor autorizado;Valor confirmado;Número do Terminal;Estabelecimento comercial;Final do cartão;Cód. referência do cartão" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data alvo;Produto;Canal;Valor confirmado;Comprovante de venda"                                                                                                     |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | colunas                                                                                                                                                             |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Cód. de autorização;Bandeira;Valor autorizado;Status"                                                                                                |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Data alvo;Produto;Bandeira;Valor autorizado;Valor confirmado;Número do Terminal;Estabelecimento comercial;Final do cartão;Cód. referência do cartão" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data alvo;Produto;Canal;Valor confirmado;Comprovante de venda"                                                                                                     |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | colunas                                                                                                                                                             |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Cód. de autorização;Bandeira;Valor autorizado;Status"                                                                                                |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Data alvo;Produto;Bandeira;Valor autorizado;Valor confirmado;Número do Terminal;Estabelecimento comercial;Final do cartão;Cód. referência do cartão" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data alvo;Produto;Canal;Valor confirmado;Comprovante de venda"                                                                                                     |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | colunas                                                                                                                                                             |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Cód. de autorização;Bandeira;Valor autorizado;Status"                                                                                                |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data da venda;Data alvo;Produto;Bandeira;Valor autorizado;Valor confirmado;Número do Terminal;Estabelecimento comercial;Final do cartão;Cód. referência do cartão" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Data alvo;Produto;Canal;Valor confirmado;Comprovante de venda"                                                                                                     |

  @filtro
  @TestCaseKey=LPDC-T1221
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro                | valor              |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "WWW333"           |

    @bin
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro   | valor         |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "todos"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "A Confirmar" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Autorizada"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Expirada"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Estornada"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Recusada"    |

    @bin
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro    | valor     |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "todos"   |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "Crédito" |

    @bin
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro  | valor       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "todos"     |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "POS"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "TEF"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "ECOMMERCE" |

    @bin
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro     | valor        |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "todos"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Visa"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Mastercard" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Amex"       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Cabal"      |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Elo"        |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Hipercard"  |

    @bin
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro    | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "100;300"  |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "500;1000" |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro            | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "91084373" |

    @bin
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro     | valor      |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "todos"    |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "LNK01D49" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "PGW0D0D1" |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "ECC05DE6" |

    @sicredi
    @codAutorizacao
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro                | valor              |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "WWW333"           |

    @sicredi
    @status
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro   | valor         |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "todos"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "A Confirmar" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Autorizada"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Expirada"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Estornada"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Recusada"    |

    @sicredi
    @produto
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro    | valor     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "todos"   |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "Crédito" |

    @sicredi
    @canal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro  | valor       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "todos"     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "POS"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "TEF"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "ECOMMERCE" |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro     | valor        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "todos"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Visa"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Mastercard" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Amex"       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Cabal"      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Elo"        |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Hipercard"  |

    @sicredi
    @valores
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro    | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "100;300"  |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "500;1000" |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro            | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "91084373" |

    @sicredi
    @terminal
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | filtro     | valor      |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "todos"    |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "LNK01D49" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "PGW0D0D1" |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "ECC05DE6" |

    @azulzinha
    @codAutorizacao
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro                | valor              |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "WWW333"           |

    @azulzinha
    @status
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro   | valor         |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "todos"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "A Confirmar" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Autorizada"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Expirada"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Estornada"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Recusada"    |

    @azulzinha
    @produto
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro    | valor     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "todos"   |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "Crédito" |

    @azulzinha
    @canal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro  | valor       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "todos"     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "POS"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "TEF"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "ECOMMERCE" |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro     | valor        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "todos"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Visa"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Amex"       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Elo"        |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Hipercard"  |

    @azulzinha
    @valores
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro    | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "100;300"  |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "500;1000" |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro            | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "91084373" |

    @azulzinha
    @terminal
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | filtro     | valor      |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "todos"    |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "LNK01D49" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "PGW0D0D1" |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "ECC05DE6" |

    @afinz
    @codAutorizacao
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro                | valor              |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "WWW333"           |

    @afinz
    @status
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro   | valor         |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "todos"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "A Confirmar" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Autorizada"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Expirada"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Estornada"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Recusada"    |

    @afinz
    @produto
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro    | valor     |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "todos"   |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "Crédito" |

    @afinz
    @canal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro  | valor       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "todos"     |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "POS"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "TEF"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "ECOMMERCE" |

    @afinz
    @bandeira
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro     | valor        |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "todos"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Visa"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Mastercard" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Amex"       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Cabal"      |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Elo"        |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Hipercard"  |

    @afinz
    @valores
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro    | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "100;300"  |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "500;1000" |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro            | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "91084373" |

    @afinz
    @terminal
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | filtro     | valor      |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "todos"    |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "LNK01D49" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "PGW0D0D1" |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "ECC05DE6" |

    @claropay
    @codAutorizacao
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro                | valor              |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "primeiroRegistro" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Cód. de autorização" | "WWW333"           |

    @claropay
    @status
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro   | valor         |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "todos"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "A Confirmar" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Autorizada"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Expirada"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Estornada"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Status" | "Recusada"    |

    @claropay
    @produto
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro    | valor     |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "todos"   |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Produto" | "Crédito" |

    @claropay
    @canal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro  | valor       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "todos"     |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "POS"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "TEF"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Canal" | "ECOMMERCE" |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro     | valor        |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "todos"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Visa"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Mastercard" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Amex"       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Cabal"      |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Elo"        |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Bandeira" | "Hipercard"  |

    @claropay
    @valores
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro    | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "100;300"  |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Valores" | "500;1000" |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro            | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Estabelecimento" | "91084373" |

    @claropay
    @terminal
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | filtro     | valor      |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "todos"    |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "LNK01D49" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "PGW0D0D1" |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Terminal" | "ECC05DE6" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1222
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1226
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Pre autorizacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "Excel"     | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                          |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" | "CSV"       | "N"           | "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante da venda;Número do terminal;Estabelecimento comercial;Final do cartão;Cód. Ref. Cartão" |

