#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Antecipacao/Relatorio_de_antecipacoes
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Antecipacao
@RelatorioAntecipacoes
Feature: Relatorio de antecipacoes 

  @navegacao
  @TestCaseKey=LPDC-T1281
  Scenario Outline: Verificar texto do rodape - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
  @TestCaseKey=LPDC-T1287
  Scenario Outline: Visualizar campos de Total e Valor - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

  @totalizadores
  @TestCaseKey=LPDC-T1472
  Scenario Outline: Validar totalizadores - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" |

  @periodo
  @TestCaseKey=LPDC-T1283
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | periodo           |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | periodo           |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | periodo           |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | periodo           |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | periodo           |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

  @filtro
  @TestCaseKey=LPDC-T1284
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @numeroSimulacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @bin
    @bandeira
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @bin
    @tipos
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @sicredi
    @numeroSimulacao
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @sicredi
    @tipos
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @azulzinha
    @numeroSimulacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @azulzinha
    @tipos
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @claropay
    @numeroSimulacao
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @claropay
    @tipos
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @corujapay
    @numeroSimulacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @corujapay
    @bandeira
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @corujapay
    @tipos
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1282
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @sicredi
    @excel
    @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @sicredi
    @excel
    @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @sicredi
    @csv
    @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @sicredi
    @csv
    @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @azulzinha
    @excel
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @azulzinha
    @excel
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @azulzinha
    @csv
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @azulzinha
    @csv
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @claropay
    @excel
    @simplificado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @claropay
    @excel
    @detalhado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @claropay
    @csv
    @simplificado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @claropay
    @csv
    @detalhado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @corujapay
    @excel
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @corujapay
    @excel
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @corujapay
    @csv
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @corujapay
    @csv
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1285
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @sicredi
    @excel
    @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @sicredi
    @excel
    @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @sicredi
    @csv
    @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @sicredi
    @csv
    @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @azulzinha
    @excel
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @azulzinha
    @excel
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @azulzinha
    @csv
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @azulzinha
    @csv
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @claropay
    @excel
    @simplificado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @claropay
    @excel
    @detalhado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @claropay
    @csv
    @simplificado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @claropay
    @csv
    @detalhado
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @corujapay
    @excel
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @corujapay
    @excel
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @corujapay
    @csv
    @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @corujapay
    @csv
    @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "corujapay" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

