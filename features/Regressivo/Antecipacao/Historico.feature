#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Antecipacao/Historico
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Historico
Feature: Historico

  @navegacao
  Scenario Outline: Verificar texto do rodape - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And verifica o texto do rodape
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio  |
      | "bin"   | "antecipacao" | ""      | "Histórico"   |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  |

  @navegacao
  Scenario Outline: Visualizar campos de Total e Valor - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And visualiza os campos <campos> - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | campos                                            |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Total de antecipações pagas;Valor líquido pago"  |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | campos                                            |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Total de antecipações pagas;Valor líquido pago"  |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | campos                                            |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Total de antecipações pagas;Valor líquido pago"  |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | campos                                            |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "Total de antecipações pagas;Valor líquido pago"  |

  @periodo
  Scenario Outline: Validar Periodo <periodo> aplicado no calendario - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplica o periodo <periodo> - <abaRelatorio>
    And valida o periodo <periodo> aplicado - <abaRelatorio>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | periodo |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Hoje"  |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | periodo |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Hoje"  |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | periodo |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Hoje"  |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | periodo |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "Hoje"  |

  @filtro
  Scenario Outline: Realizar filtro - <filtro>: <valor> - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor> - <abaRelatorio>
    And valida que foi atribuido o valor <valor> do filtro <filtro> - <abaRelatorio>
    @bin @status
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | filtro    | valor               |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "todos"             |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "Em Andamento"      |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada"          |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada Parcial"  |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "Não Efetuada"      |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Status"  | "Pago"              |

    @sicredi @status
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | filtro    | valor               |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "todos"             |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Em Andamento"      |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada"          |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada Parcial"  |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Não Efetuada"      |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Pago"              |

    @azulzinha @status
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | filtro    | valor               |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "todos"             |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Em Andamento"      |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada"          |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada Parcial"  |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Não Efetuada"      |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Status"  | "Pago"              |

    @claropay @status
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | filtro    | valor               |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "todos"             |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "Em Andamento"      |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada"          |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "Efetuada Parcial"  |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "Não Efetuada"      |
      | "claropay"  | "antecipacao" | ""      | "Histórico"   | "Status"  | "Pago"              |

  @gerarArquivo @nomeArquivo
  Scenario Outline: Validar nome do arquivo: <tipoArquivo> - Gerar arquivo - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida o nome do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           |
    
    @bin @csv
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           |
    
    @sicredi @excel
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           |
    
    @sicredi @csv
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           |
    
    @azulzinha @excel
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           |
    
    @azulzinha @csv
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           |
    
    @claropay @excel
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "Excel"     | "N"           |
    
    @claropay @csv
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "CSV"       | "N"           |
    
  @gerarArquivo @colunasArquivo
  Scenario Outline: Validar colunas do arquivo: <tipoArquivo> - Gerar arquivo - Historico
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And valida as colunas <colunas> do arquivo para o Tipo de arquivo <tipoArquivo> e Tipo de relatorio <tipoRelatorio> gerado - <abaRelatorio>
    @bin @excel
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @bin @csv
    Examples:
      | alianca | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "bin"   | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @sicredi @excel
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @sicredi @csv
    Examples:
      | alianca   | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "sicredi" | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @azulzinha @excel
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "Excel"     | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @azulzinha @csv
    Examples:
      | alianca     | menu          | submenu | abaRelatorio  | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"   | "CSV"       | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @claropay @excel
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "Excel"     | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |

    @claropay @csv
    Examples:
      | alianca    | menu          | submenu | abaRelatorio | tipoArquivo | tipoRelatorio | colunas                                                                                                                                                                   |
      | "claropay" | "antecipacao" | ""      | "Histórico"  | "CSV"       | "N"           | "Status;Data da solicitação;Valor bruto solicitado;Valor do desconto;Valor líquido solicitado;Valor líquido aprovado;Tipo;Taxa;Código de antecipação;Pagamento efetuado"  |