#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/ResumoRecebimentos/Debitos_e_ajustes
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Recebimentos
@DebitosAjustes
Feature: Debitos e ajustes 

  @navegacao
  @TestCaseKey=LPDC-T1275
  Scenario Outline: Verificar texto do rodape - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujapay
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

  @navegacao
  @TestCaseKey=LPDC-T1272
  Scenario Outline: Visualizar campos de Total e Valor - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

    @corujapay
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | campos                                                       |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Total de cobranças de aluguel;Total de cobranças pendentes" |

  @totalizadores
  @TestCaseKey=LPDC-T1452
  Scenario Outline: Validar totalizadores - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujapay
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

  @periodo
  @TestCaseKey=LPDC-T1278
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | periodo |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | periodo |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | periodo |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | periodo |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | periodo |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | periodo |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

    @corujapay
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | periodo |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M-1"   |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M0"    |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "M+1"   |

  @filtro
  @TestCaseKey=LPDC-T1276
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @status
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @bin
    @valores
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @bin
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @sicredi
    @status
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @sicredi
    @valores
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @sicredi
    @estabelecimento
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @azulzinha
    @status
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @azulzinha
    @valores
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @azulzinha
    @estabelecimento
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @afinz
    @status
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @afinz
    @valores
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @afinz
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @claropay
    @status
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @claropay
    @valores
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @claropay
    @estabelecimento
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @banqi
    @status
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @banqi
    @valores
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @banqi
    @estabelecimento
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

    @corujapay
    @status
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro   | valor      |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "todos"    |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Pendente" |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Status" | "Debitado" |

    @corujapay
    @valores
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro    | valor     |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "10;50"   |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Valores" | "-10;-50" |

    @corujapay
    @estabelecimento
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | filtro            | valor      |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "todos"    |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Estabelecimento" | "91913769" |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1280
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @bin
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @sicredi
    @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @sicredi
    @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @afinz
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @afinz
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @claropay
    @excel
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @claropay
    @csv
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @banqi
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @banqi
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

    @corujapay
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           |

    @corujapay
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1273
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Debitos e ajustes
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @bin
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @sicredi
    @excel
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @sicredi
    @csv
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @afinz
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @afinz
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @claropay
    @excel
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @claropay
    @csv
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @banqi
    @excel
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @banqi
    @csv
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @corujapay
    @excel
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "Excel"     | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

    @corujapay
    @csv
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        | tipoArquivo | tipoRelatorio | colunas                                                                                                  |
      | "corujapay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" | "CSV"       | "N"           | "Data do ajuste;Valor do aluguel;Comprovante;Tecnologia;Estabelecimento;Data efetiva da cobrança;Status" |

