#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Antecipacao/Relatorio_de_antecipacoes
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@RelatorioAntecipacoes
Feature: Relatorio de antecipacoes

  @navegacao
  Scenario Outline: Acessar Relatorio de antecipacoes via menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
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

    @afinz
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
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

    @afinz
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
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

    @afinz
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | campos                                                                                                                                          |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Valor bruto das vendas;Valor líquido das vendas;Total de desconto valor líquido;Valor antecipado pago;Total de desconto valor antecipado pago" |

  @periodo
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo>
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

    @afinz
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | periodo           |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Ontem"           |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 7 Dias"  |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Últimos 14 Dias" |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Mês Passado"     |

  @filtro
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @numeroSimulacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @bin @bandeira
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @bin @tipos
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @sicredi @numeroSimulacao
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @sicredi @bandeira
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @sicredi @tipos
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @azulzinha @numeroSimulacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @azulzinha @bandeira
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @azulzinha @tipos
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

    @afinz @numeroSimulacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro                | valor              |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "primeiroRegistro" |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Número da simulação" | "WWW333"           |

    @afinz @bandeira
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro     | valor        |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "todos"      |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Visa"       |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Mastercard" |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Amex"       |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Cabal"      |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Elo"        |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Bandeira" | "Hipercard"  |

    @afinz @tipos
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | filtro  | valor        |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "todos"      |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Automática" |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Tipos" | "Manual"     |

  @gerarArquivo @nomeArquivo
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @bin @excel @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @bin @csv @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @bin @csv @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @sicredi @excel @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @sicredi @excel @detalhado
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | "" | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @sicredi @csv @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @sicredi @csv @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @azulzinha @excel @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @azulzinha @excel @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @azulzinha @csv @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @azulzinha @csv @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

    @afinz @excel @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" |

    @afinz @excel @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   |

    @afinz @csv @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" |

    @afinz @csv @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   |

  @gerarArquivo @colunasArquivo
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Relatorio de antecipacoes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @bin @excel @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @bin @csv @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @bin @csv @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @sicredi @excel @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @sicredi @excel @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @sicredi @csv @simplificado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @sicredi @csv @detalhado
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @azulzinha @excel @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @azulzinha @excel @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @azulzinha @csv @simplificado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @azulzinha @csv @detalhado
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @afinz @excel @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @afinz @excel @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "Excel"     | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

    @afinz @csv @simplificado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio  | colunas                                                                                                                                                                   |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "simplificado" | "Número da simulação;Data da solicitação;Data do pagamento;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago;Tipo" |

    @afinz @csv @detalhado
    Examples:
      | alianca | menu          | submenu | abaRelatorio                | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                    |
      | "afinz" | "antecipacao" | ""      | "Relatório de antecipações" | "CSV"       | "detalhado"   | "Número da simulação;Data da solicitação;Data do pagamento;Tipo;Bandeira;Produto;Valor bruto das vendas;Valor desconto MDR;Valor líquido das vendas;Valor desconto antecipação;Valor pago" |

