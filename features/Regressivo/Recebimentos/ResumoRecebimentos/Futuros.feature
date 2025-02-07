#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/ResumoRecebimentos/Futuros
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Futuros
Feature: Futuros

  @navegacao
  Scenario Outline: Acessar Futuros via menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
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

  @navegacao
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

  @navegacao
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

  @periodo
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo>
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

  @personalizarColunas
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

  @filtro
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @codAutorizacao
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @bin @produto
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @bin @bandeira
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @bin @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @sicredi @codAutorizacao
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @sicredi @produto
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @sicredi @bandeira
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @sicredi @estabelecimento
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @azulzinha @codAutorizacao
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @azulzinha @produto
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @azulzinha @bandeira
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @azulzinha @estabelecimento
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

    @afinz @codAutorizacao
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro                | valor              |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "primeiroRegistro" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Cód. de autorização" | "WWW333"           |

    @afinz @produto
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro    | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Débito"  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Produto" | "Crédito" |

    @afinz @bandeira
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro     | valor        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "todos"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Visa"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Mastercard" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Amex"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Cabal"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Elo"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Bandeira" | "Hipercard"  |

    @afinz @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | filtro            | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Estabelecimento" | "91913769" |

  @gerarArquivo @nomeArquivo
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @bin @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @sicredi @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @sicredi @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @azulzinha @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @azulzinha @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

    @afinz @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           |

    @afinz @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           |

  @gerarArquivo @colunasArquivo
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Futuros
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @bin @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @sicredi @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @sicredi @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @azulzinha @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @azulzinha @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @afinz @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "Excel"     | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

    @afinz @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                 |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    | "CSV"       | "N"           | "Data prevista de pagamento;Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto parcela;Valor da taxa;Valor líquido;Número do terminal;Canal;Cód. do pedido;Número do estabelecimento;Número do cartão" |

