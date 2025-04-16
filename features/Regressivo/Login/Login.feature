#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Login/Login
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Login
Feature: Login

  @navegacao
  @TestCaseKey=LPDC-T1328
  Scenario Outline: Realizar Login no portal <alianca> e acessar Menu Lateral via <menu>><submenu>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @bin @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @bin @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @bin @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @bin @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @bin @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @bin @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @bin @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @bin @antecipacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi @vendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi @vendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi @vendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi @vendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi @vendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi @recebimentos
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi @recebimentos
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi @recebimentos
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi @antecipacao
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha @vendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha @vendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha @vendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha @vendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha @vendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha @recebimentos
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha @recebimentos
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha @recebimentos
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha @antecipacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @afinz @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz @vendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz @recebimentos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay @vendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay @vendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay @vendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio     |
      | "claropay" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @claropay @vendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay @vendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay @recebimentos
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay @recebimentos
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay @recebimentos
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay @antecipacao
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
  @TestCaseKey=LPDC-T1327
  Scenario Outline: Realizar Login no portal <alianca> e acessar Dashboard via <dashboard>
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin @vendas
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "bin"   | "vendas"        | "Hoje"       |
      | "bin"   | "ultimasVendas" | "Hoje"       |

    @bin @recebimentos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "bin"   | "recebimentos"             | "Pagos"      |
      | "bin"   | "agendaRecebimentosSemana" | "Pagos"      |

    @sicredi @vendas
    Examples:
      | alianca   | dashboard       | abaRelatorio |
      | "sicredi" | "vendas"        | "Hoje"       |
      | "sicredi" | "ultimasVendas" | "Hoje"       |

    @sicredi @recebimentos
    Examples:
      | alianca   | dashboard                  | abaRelatorio |
      | "sicredi" | "recebimentos"             | "Pagos"      |
      | "sicredi" | "agendaRecebimentosSemana" | "Pagos"      |

    @azulzinha @vendas
    Examples:
      | alianca     | dashboard       | abaRelatorio |
      | "azulzinha" | "vendas"        | "Hoje"       |
      | "azulzinha" | "ultimasVendas" | "Hoje"       |

    @azulzinha @recebimentos
    Examples:
      | alianca     | dashboard                  | abaRelatorio |
      | "azulzinha" | "recebimentos"             | "Pagos"      |
      | "azulzinha" | "agendaRecebimentosSemana" | "Pagos"      |

    @afinz @vendas
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "afinz" | "vendas"        | "Hoje"       |
      | "afinz" | "ultimasVendas" | "Hoje"       |

    @afinz @recebimentos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "afinz" | "recebimentos"             | "Pagos"      |
      | "afinz" | "agendaRecebimentosSemana" | "Pagos"      |

    @claropay @vendas
    Examples:
      | alianca    | dashboard       | abaRelatorio |
      | "claropay" | "vendas"        | "Hoje"       |
      | "claropay" | "ultimasVendas" | "Hoje"       |

    @claropay @recebimentos
    Examples:
      | alianca    | dashboard                  | abaRelatorio |
      | "claropay" | "recebimentos"             | "Pagos"      |
      | "claropay" | "agendaRecebimentosSemana" | "Pagos"      |

