#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/ResumoRecebimentos/Pagos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Recebimentos
@Pagos
Feature: Pagos

  @navegacao
  @TestCaseKey=LPDC-T1258
  Scenario Outline: Verificar texto do rodape - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

  @navegacao
  @TestCaseKey=LPDC-T1269
  Scenario Outline: Visualizar campos de Total e Valor - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio | campos                                       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio | campos                                       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio | campos                                       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio | campos                                       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio | campos                                       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos"      | "Total recebido;Total agendado;Total cedido" |

  @totalizadores
  @TestCaseKey=LPDC-T1450
  Scenario Outline: Validar totalizadores - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida os totalizadores - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

  @periodo
  @TestCaseKey=LPDC-T1277
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | periodo       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @bin
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | periodo       |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @sicredi
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | periodo       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @sicredi
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | periodo       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @azulzinha
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | periodo       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @azulzinha
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | periodo       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @afinz
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | periodo       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @afinz
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | periodo       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @claropay
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | periodo       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @claropay
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | periodo       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @banqi
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | periodo       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @banqi
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | periodo       |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @corujacapital
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | periodo       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @corujacapital
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | periodo       |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

  @personalizarColunas
  @TestCaseKey=LPDC-T1270
  Scenario Outline: Personalizar colunas - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @bin
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @sicredi
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @sicredi
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @azulzinha
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @azulzinha
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @afinz
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @afinz
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @claropay
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @claropay
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @banqi
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @banqi
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @corujacapital
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @corujacapital
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

  @filtro
  @TestCaseKey=LPDC-T1265
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @bin
    @status
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @bin
    @produto
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @bin
    @bandeira
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @bin
    @valores
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @bin
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @bin
    @banco
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @bin
    @tipos
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @bin
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @bin
    @status
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @bin
    @produto
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @bin
    @bandeira
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @bin
    @valores
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @bin
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @bin
    @banco
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @bin
    @tipos
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @sicredi
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @sicredi
    @status
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @sicredi
    @produto
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @sicredi
    @bandeira
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @sicredi
    @valores
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @sicredi
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @sicredi
    @banco
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @sicredi
    @tipos
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @sicredi
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @sicredi
    @status
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @sicredi
    @produto
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @sicredi
    @bandeira
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @sicredi
    @valores
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @sicredi
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @sicredi
    @banco
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @sicredi
    @tipos
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @azulzinha
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @azulzinha
    @status
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @azulzinha
    @produto
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @azulzinha
    @bandeira
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @azulzinha
    @valores
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @azulzinha
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @azulzinha
    @banco
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @azulzinha
    @tipos
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @azulzinha
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @azulzinha
    @status
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @azulzinha
    @produto
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @azulzinha
    @bandeira
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @azulzinha
    @valores
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @azulzinha
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @azulzinha
    @banco
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @azulzinha
    @tipos
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @afinz
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @afinz
    @status
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @afinz
    @produto
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @afinz
    @bandeira
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @afinz
    @valores
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @afinz
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @afinz
    @banco
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @afinz
    @tipos
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @afinz
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @afinz
    @status
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @afinz
    @produto
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @afinz
    @bandeira
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @afinz
    @valores
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @afinz
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @afinz
    @banco
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @afinz
    @tipos
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @claropay
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @claropay
    @status
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @claropay
    @produto
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @claropay
    @bandeira
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @claropay
    @valores
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @claropay
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @claropay
    @banco
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @claropay
    @tipos
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @claropay
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @claropay
    @status
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @claropay
    @produto
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @claropay
    @bandeira
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @claropay
    @valores
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @claropay
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @claropay
    @banco
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @claropay
    @tipos
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @banqi
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @banqi
    @status
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @banqi
    @produto
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @banqi
    @bandeira
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @banqi
    @valores
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @banqi
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @banqi
    @banco
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @banqi
    @tipos
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @banqi
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @banqi
    @status
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @banqi
    @produto
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @banqi
    @bandeira
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @banqi
    @valores
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @banqi
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @banqi
    @banco
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @banqi
    @tipos
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @corujacapital
    @codPagamento
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @corujacapital
    @status
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @corujacapital
    @produto
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @corujacapital
    @bandeira
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @corujacapital
    @valores
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @corujacapital
    @estabelecimento
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @corujacapital
    @banco
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @corujacapital
    @tipos
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @corujacapital
    @codPagamento
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @corujacapital
    @status
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @corujacapital
    @produto
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @corujacapital
    @bandeira
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @corujacapital
    @valores
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @corujacapital
    @estabelecimento
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @corujacapital
    @banco
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @corujacapital
    @tipos
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

  @gerarArquivo
  @nomeArquivo
  @TestCaseKey=LPDC-T1274
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @bin
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @bin
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @bin
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @bin
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @bin
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @bin
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @bin
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @sicredi
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @sicredi
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @sicredi
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @sicredi
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @sicredi
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @sicredi
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @sicredi
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @sicredi
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @azulzinha
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @azulzinha
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @azulzinha
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @azulzinha
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @azulzinha
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @azulzinha
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @azulzinha
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @azulzinha
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @afinz
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @afinz
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @afinz
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @afinz
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @afinz
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @afinz
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @afinz
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @afinz
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @claropay
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @claropay
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @claropay
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @claropay
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @claropay
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @claropay
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @claropay
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @claropay
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @banqi
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @banqi
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @banqi
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @banqi
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @banqi
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @banqi
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @banqi
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @banqi
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @corujacapital
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @corujacapital
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @corujacapital
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @corujacapital
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @corujacapital
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @corujacapital
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @corujacapital
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @corujacapital
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

  @gerarArquivo
  @colunasArquivo
  @TestCaseKey=LPDC-T1279
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @bin
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @bin
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @bin
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @bin
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @bin
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @sicredi
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @sicredi
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @azulzinha
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @azulzinha
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @afinz
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @afinz
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @claropay
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @claropay
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @banqi
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @banqi
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @banqi
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @banqi
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @banqi
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @banqi
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @banqi
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @banqi
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "banqiCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @corujacapital
    @excel
    @simplificado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @corujacapital
    @excel
    @detalhado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @corujacapital
    @csv
    @simplificado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @corujacapital
    @csv
    @detalhado
    @meusDomicilios
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @corujacapital
    @excel
    @simplificado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @corujacapital
    @excel
    @detalhado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @corujacapital
    @csv
    @simplificado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @corujacapital
    @csv
    @detalhado
    @valoresCedidos
    Examples:
      | alianca                 | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "corujacapitalCedidos"  | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |