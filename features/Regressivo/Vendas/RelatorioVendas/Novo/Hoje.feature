#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Novo/Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Novo
@Vendas
@Hoje
Feature: Hoje

  @exportarRelatorio
  @TestCaseKey=LPDC-T2050
  Scenario Outline: Validar Exportar relatório - Tipo de arquivo <tipoArquivo> - Tipo de relatório <tipoRelatorio> - Vendas > Hoje
    Given que realizei Login no Portal pela aliança <alianca>
    When realizo o acesso via menu <menu> > submenu <submenu>
    Then exibe a aba <abaRelatorio> com sucesso
    And é validado o relatório da aba <abaRelatorio> - Tipo de arquivo <tipoArquivo> - Tipo de relatório <tipoRelatorio>
    @bin
    @excel
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @bin
    @csv
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "bin"   | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @sicredi
    @excel
    Examples:
      | alianca   | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @sicredi
    @csv
    Examples:
      | alianca   | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "sicredi" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @azulzinha
    @excel
    Examples:
      | alianca     | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @azulzinha
    @csv
    Examples:
      | alianca     | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @afinz
    @excel
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @afinz
    @csv
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "afinz" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @claropay
    @excel
    Examples:
      | alianca    | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @claropay
    @csv
    Examples:
      | alianca    | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "claropay" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @banqi
    @excel
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @banqi
    @csv
    Examples:
      | alianca | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "banqi" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

    @corujapay
    @excel
    Examples:
      | alianca     | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujapay" | "Vendas" | "Relatório de vendas" | "Hoje"       | "Excel"     | ""            |

    @corujapay
    @csv
    Examples:
      | alianca     | menu     | submenu               | abaRelatorio | tipoArquivo | tipoRelatorio |
      | "corujapay" | "Vendas" | "Relatório de vendas" | "Hoje"       | "CSV"       | ""            |

