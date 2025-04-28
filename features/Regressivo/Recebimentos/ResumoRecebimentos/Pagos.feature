#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/ResumoRecebimentos/Pagos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
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

  @periodo
  @TestCaseKey=LPDC-T1277
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | periodo       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @binCedidos @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | periodo       |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @sicredi @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | periodo       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @sicrediCedidos @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | periodo       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @azulzinha @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | periodo       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @azulzinhaCedidos @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | periodo       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @afinz @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | periodo       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @afinzCedidos @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | periodo       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

    @claropay @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | periodo       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Hoje"        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Essa Semana" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Este Mês"    |

    @claropayCedidos @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | periodo       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Hoje"        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Essa Semana" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Este Mês"    |

  @personalizarColunas
  @TestCaseKey=LPDC-T1270
  Scenario Outline: Personalizar colunas - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And realiza a personalizacao das colunas <colunas> - <abaRelatorio>
    And valida que foi aplicado a personalizacao das colunas <colunas> - <abaRelatorio>
    @bin @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @binCedidos @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @sicredi @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @sicrediCedidos @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @azulzinha @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @azulzinhaCedidos @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @afinz @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @afinzCedidos @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @claropay @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

    @claropayCedidos @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | colunas                                                                        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Banco;EC;Valor de pagamento"                                         |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto;Tipo;Código de pagamento;Status"                                      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status" |

  @filtro
  @TestCaseKey=LPDC-T1265
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @codPagamento @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @bin @status @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @bin @produto @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @bin @bandeira @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @bin @valores @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @bin @estabelecimento @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @bin @banco @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @bin @tipos @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @binCedidos @codPagamento @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @binCendidos @status @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @binCendidos @produto @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @binCendidos @bandeira @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @binCendidos @valores @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @binCendidos @estabelecimento @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @binCendidos @banco @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @binCendidos @tipos @valoresCedidos
    Examples:
      | alianca       | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "binCendidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @sicredi @codPagamento @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @sicredi @status @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @sicredi @produto @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @sicredi @bandeira @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @sicredi @valores @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @sicredi @estabelecimento @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @sicredi @banco @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @sicredi @tipos @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @sicrediCedidos @codPagamento @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @sicrediCedidos @status @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @sicrediCedidos @produto @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @sicrediCedidos @bandeira @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @sicrediCedidos @valores @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @sicrediCedidos @estabelecimento @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @sicrediCedidos @banco @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @sicrediCedidos @tipos @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @azulzinha @codPagamento @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @azulzinha @status @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @azulzinha @produto @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @azulzinha @bandeira @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @azulzinha @valores @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @azulzinha @estabelecimento @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @azulzinha @banco @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @azulzinha @tipos @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @azulzinhaCedidos @codPagamento @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @azulzinhaCedidos @status @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @azulzinhaCedidos @produto @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @azulzinhaCedidos @bandeira @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @azulzinhaCedidos @valores @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @azulzinhaCedidos @estabelecimento @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @azulzinhaCedidos @banco @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @azulzinhaCedidos @tipos @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @afinz @codPagamento @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @afinz @status @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @afinz @produto @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @afinz @bandeira @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @afinz @valores @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @afinz @estabelecimento @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @afinz @banco @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @afinz @tipos @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @afinzCedidos @codPagamento @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @afinzCedidos @status @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @afinzCedidos @produto @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @afinzCedidos @bandeira @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @afinzCedidos @valores @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @afinzCedidos @estabelecimento @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @afinzCedidos @banco @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @afinzCedidos @tipos @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

    @claropay @codPagamento @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "primeiroRegistro" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Cód. de pagamento" | "WWW333"           |

    @claropay @status @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "todos"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Enviado" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Status" | "Pago"    |

    @claropay @produto @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "todos"   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Crédito" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Produto" | "Débito"  |

    @claropay @bandeira @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "todos"           |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Visa"            |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Hipercard/Hiper" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Mastercard"      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "ELO Full"        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "Amex Full"       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Bandeira" | "CABAL"           |

    @claropay @valores @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "2000;3000" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Valores" | "5000;8000" |

    @claropay @estabelecimento @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "todos"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Estabelecimento" | "91913769" |

    @claropay @banco @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "todos"                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Banco" | "077 - Banco Inter S.A." |

    @claropay @tipos @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "todos"                  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Liquidação de venda"    |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação automática" |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Tipos" | "Antecipação manual"     |

    @claropayCedidos @codPagamento @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro              | valor              |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "primeiroRegistro" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Cód. de pagamento" | "WWW333"           |

    @claropayCedidos @status @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro   | valor     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "todos"   |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Enviado" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Status" | "Pago"    |

    @claropayCedidos @produto @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro    | valor     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "todos"   |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Crédito" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Produto" | "Débito"  |

    @claropayCedidos @bandeira @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro     | valor             |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "todos"           |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Visa"            |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Hipercard/Hiper" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Mastercard"      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "ELO Full"        |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "Amex Full"       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Bandeira" | "CABAL"           |

    @claropayCedidos @valores @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro    | valor       |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "2000;3000" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Valores" | "5000;8000" |

    @claropayCedidos @estabelecimento @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro            | valor      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "todos"    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Estabelecimento" | "99990095" |

    @claropayCedidos @banco @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro  | valor                      |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "todos"                    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Banco" | "341 - Itaú Unibanco S.A." |

    @claropayCedidos @tipos @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | filtro  | valor                    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "todos"                  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Liquidação de venda"    |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação automática" |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Tipos" | "Antecipação manual"     |

  @gerarArquivo @nomeArquivo
  @TestCaseKey=LPDC-T1274
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @bin @excel @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @bin @csv @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @bin @csv @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @binCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @binCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @binCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @binCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @sicredi @excel @simplificado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @sicredi @excel @detalhado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @sicredi @csv @simplificado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @sicredi @csv @detalhado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @sicrediCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @sicrediCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @sicrediCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @sicrediCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @azulzinha @excel @simplificado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @azulzinha @excel @detalhado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @azulzinha @csv @simplificado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @azulzinha @csv @detalhado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @azulzinhaCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @azulzinhaCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @azulzinhaCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @azulzinhaCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @afinz @excel @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @afinz @excel @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @afinz @csv @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @afinz @csv @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @afinzCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @afinzCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @afinzCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @afinzCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

    @claropay @excel @simplificado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" |

    @claropay @excel @detalhado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   |

    @claropay @csv @simplificado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" |

    @claropay @csv @detalhado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   |

    @claropayCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" |

    @claropayCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   |

    @claropayCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" |

    @claropayCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   |

  @gerarArquivo @colunasArquivo
  @TestCaseKey=LPDC-T1279
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Pagos
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @bin @excel @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @bin @csv @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @bin @csv @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @binCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @binCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @binCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @binCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca      | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "binCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi @excel @simplificado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicredi @excel @detalhado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicredi @csv @simplificado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @sicredi @csv @detalhado @meusDomicilios
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicrediCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @sicrediCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @sicrediCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @sicrediCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca          | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "sicrediCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha @excel @simplificado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinha @excel @detalhado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinha @csv @simplificado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @azulzinha @csv @detalhado @meusDomicilios
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinhaCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @azulzinhaCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @azulzinhaCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @azulzinhaCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca            | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "azulzinhaCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz @excel @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinz @excel @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinz @csv @simplificado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @afinz @csv @detalhado @meusDomicilios
    Examples:
      | alianca | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinzCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @afinzCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @afinzCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @afinzCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca        | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "afinzCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay @excel @simplificado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                   |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropay @excel @detalhado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropay @csv @simplificado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                                      |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "simplificado" | "Data do pagamento;Bandeira;Produto;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @claropay @csv @detalhado @meusDomicilios
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos_Meus Domicílios" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropayCedidos @excel @simplificado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                  |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor pagamento;Status" |

    @claropayCedidos @excel @detalhado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "Excel"     | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

    @claropayCedidos @csv @simplificado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio  | colunas                                                                                     |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "simplificado" | "Data do pagamento;Banco;Agência;Conta;Tipo;EC;Cód. de pagamento;Valor do pagamento;Status" |

    @claropayCedidos @csv @detalhado @valoresCedidos
    Examples:
      | alianca           | menu           | submenu              | abaRelatorio            | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | "claropayCedidos" | "recebimentos" | "resumoRecebimentos" | "Pagos_Valores Cedidos" | "CSV"       | "detalhado"   | "Data de pagamento;Código de pagamento;Tipo de pagamento;Data da venda;Hora da venda;Número do estabelecimento;Nome do estabelecimento;Código de autorização;Comprovante da venda;Código do pedido;Canal;Número do terminal;Produto;Parcelas;Tipo de Cartão;Bandeira;Status da venda;Valor bruto da transação;Valor bruto da parcela paga;Valor da taxa (MDR);Valor líquido da parcela/transação;Número do cartão;Banco;Agência;Conta" |

