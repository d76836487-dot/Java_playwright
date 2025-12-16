#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Novo/Histórico_de_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Novo
@Vendas
@HistoricoVendas
Feature: Histórico de vendas

  @exportarRelatorio
  Scenario Outline: Validar Exportar relatório - Tipo de arquivo <tipoArquivo> - Tipo de relatório <tipoRelatorio> - Vendas > Histórico de vendas
    Given que realizei Login no Portal pela aliança <alianca>
    When realizo o acesso via menu <menu> > submenu <submenu>
    Then exibe a aba <abaRelatorio> com sucesso
    And é validado o relatório da aba <abaRelatorio> - Tipo de arquivo <tipoArquivo> - Tipo de relatório <tipoRelatorio>

    @bin
    @excel
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "bin"   | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @bin
    @excel
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @bin
    @csv
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "bin"   | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @bin
    @csv
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "bin"   | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @sicredi
    @excel
    @simplificado
    Examples:
      | alianca   | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "sicredi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @sicredi
    @excel
    @detalhado
    Examples:
      | alianca   | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @sicredi
    @csv
    @simplificado
    Examples:
      | alianca   | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "sicredi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @sicredi
    @csv
    @detalhado
    Examples:
      | alianca   | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "sicredi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @azulzinha
    @excel
    @simplificado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "azulzinha" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @azulzinha
    @excel
    @detalhado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @azulzinha
    @csv
    @simplificado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "azulzinha" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @azulzinha
    @csv
    @detalhado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "azulzinha" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @afinz
    @excel
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "afinz" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @afinz
    @excel
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @afinz
    @csv
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "afinz" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @afinz
    @csv
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "afinz" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @claropay
    @excel
    @simplificado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "claropay"  | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @claropay
    @excel
    @detalhado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "claropay"  | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @claropay
    @csv
    @simplificado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "claropay"  | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @claropay
    @csv
    @detalhado
    Examples:
      | alianca     | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "claropay"  | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @banqi
    @excel
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "banqi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @banqi
    @excel
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "banqi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @banqi
    @csv
    @simplificado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "banqi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @banqi
    @csv
    @detalhado
    Examples:
      | alianca | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "banqi" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |

    @corujacapital
    @excel
    @simplificado
    Examples:
      | alianca         | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "corujacapital" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "simplificado"  |

    @corujacapital
    @excel
    @detalhado
    Examples:
      | alianca         | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "Excel"     | "detalhado"   |

    @corujacapital
    @csv
    @simplificado
    Examples:
      | alianca         | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio   |
      | "corujacapital" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "simplificado"  |

    @corujacapital
    @csv
    @detalhado
    Examples:
      | alianca         | menu      | submenu               | abaRelatorio          | tipoArquivo | tipoRelatorio |
      | "corujacapital" | "Vendas"  | "Relatório de vendas" | "Histórico de vendas" | "CSV"       | "detalhado"   |