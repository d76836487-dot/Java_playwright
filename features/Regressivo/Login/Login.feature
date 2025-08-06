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
    @bin
    @vendas
    @Hoje
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @bin
    @vendas
    @HistoricoVendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @bin
    @vendas
    @NaoEfetivadas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @bin
    @vendas
    @PreAutorizacoes
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @bin
    @vendas
    @Voucher
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @bin
    @recebimentos
    @Pagos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @bin
    @recebimentos
    @Futuros
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @bin
    @recebimentos
    @DebitosAjustes
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @bin
    @antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio            |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" |

    @bin
    @antecipacao
    @Historico
    Examples:
      | alianca | menu          | submenu | abaRelatorio |
      | "bin"   | "antecipacao" | ""      | "Histórico"  |

    @bin
    @antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi
    @vendas
    @Hoje
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi
    @vendas
    @HistoricoVendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    @vendas
    @NaoEfetivadas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi
    @vendas
    @PreAutorizacoes
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi
    @vendas
    @Voucher
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi
    @recebimentos
    @Pagos
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi
    @recebimentos
    @Futuros
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi
    @recebimentos
    @DebitosAjustes
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi
    @antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca   | menu          | submenu | abaRelatorio            |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" |

    @sicredi
    @antecipacao
    @Historico
    Examples:
      | alianca   | menu          | submenu | abaRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Histórico"  |

    @sicredi
    @antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha
    @vendas
    @Hoje
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha
    @vendas
    @HistoricoVendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    @vendas
    @NaoEfetivadas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha
    @vendas
    @PreAutorizacoes
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha
    @vendas
    @Voucher
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha
    @recebimentos
    @Pagos
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha
    @recebimentos
    @Futuros
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha
    @recebimentos
    @DebitosAjustes
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha
    @antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" |

    @azulzinha
    @antecipacao
    @Historico
    Examples:
      | alianca     | menu          | submenu | abaRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"  |

    @azulzinha
    @antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @afinz
    @vendas
    @Hoje
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz
    @vendas
    @HistoricoVendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    @vendas
    @NaoEfetivadas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz
    @vendas
    @PreAutorizacoes
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz
    @vendas
    @Voucher
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz
    @recebimentos
    @Pagos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz
    @recebimentos
    @Futuros
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz
    @recebimentos
    @DebitosAjustes
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    @vendas
    @Hoje
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay
    @vendas
    @HistoricoVendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    @vendas
    @NaoEfetivadas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio     |
      | "claropay" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @claropay
    @vendas
    @PreAutorizacoes
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay
    @vendas
    @Voucher
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay
    @recebimentos
    @Pagos
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay
    @recebimentos
    @Futuros
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay
    @recebimentos
    @DebitosAjustes
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    @antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca    | menu          | submenu | abaRelatorio            |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" |

    @claropay
    @antecipacao
    @Historico
    Examples:
      | alianca    | menu          | submenu | abaRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  |

    @claropay
    @antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
  @TestCaseKey=LPDC-T1327
  Scenario Outline: Realizar Login no portal <alianca> e acessar Dashboard via <dashboard>
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin
    @vendas
    @Hoje
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "bin"   | "vendasHoje"    | "Hoje"       |
      | "bin"   | "ultimasVendas" | "Hoje"       |

    @bin
    @recebimentos
    @Pagos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "bin"   | "recebimentos"             | "Pagos"      |
      | "bin"   | "agendaRecebimentosSemana" | "Pagos"      |

    @sicredi
    @vendas
    @Hoje
    Examples:
      | alianca   | dashboard       | abaRelatorio |
      | "sicredi" | "vendasHoje"    | "Hoje"       |
      | "sicredi" | "ultimasVendas" | "Hoje"       |

    @sicredi
    @recebimentos
    @Pagos
    Examples:
      | alianca   | dashboard                  | abaRelatorio |
      | "sicredi" | "recebimentos"             | "Pagos"      |
      | "sicredi" | "agendaRecebimentosSemana" | "Pagos"      |

    @azulzinha
    @vendas
    @Hoje
    Examples:
      | alianca     | dashboard       | abaRelatorio |
      | "azulzinha" | "vendasHoje"    | "Hoje"       |
      | "azulzinha" | "ultimasVendas" | "Hoje"       |

    @azulzinha
    @recebimentos
    @Pagos
    Examples:
      | alianca     | dashboard                  | abaRelatorio |
      | "azulzinha" | "recebimentos"             | "Pagos"      |
      | "azulzinha" | "agendaRecebimentosSemana" | "Pagos"      |

    @afinz
    @vendas
    @Hoje
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "afinz" | "vendasHoje"    | "Hoje"       |
      | "afinz" | "ultimasVendas" | "Hoje"       |

    @afinz
    @recebimentos
    @Pagos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "afinz" | "recebimentos"             | "Pagos"      |
      | "afinz" | "agendaRecebimentosSemana" | "Pagos"      |

    @claropay
    @vendas
    @Hoje
    Examples:
      | alianca    | dashboard       | abaRelatorio |
      | "claropay" | "vendasHoje"    | "Hoje"       |
      | "claropay" | "ultimasVendas" | "Hoje"       |

    @claropay
    @recebimentos
    @Pagos
    Examples:
      | alianca    | dashboard                  | abaRelatorio |
      | "claropay" | "recebimentos"             | "Pagos"      |
      | "claropay" | "agendaRecebimentosSemana" | "Pagos"      |

  @ga
  @mfa
  @master
  @TestCaseKey=LPDC-T1429
  Scenario Outline: Validar login com MFA ativo - Usuario Master - <alianca>
    Given realizar login no portal com MFA ativo <alianca>
    When enviar o codigo do <fluxo> via <receberPor>
    Then valida que a home do portal foi carregada com sucesso
    @bin
    @email
    Examples:
      | alianca | fluxo | receberPor |
      | "bin"   | "MFA" | "E-mail"   |

    @bin
    @sms
    Examples:
      | alianca | fluxo | receberPor |
      | "bin"   | "MFA" | "SMS"      |

    @sicredi
    @email
    Examples:
      | alianca   | fluxo | receberPor |
      | "sicredi" | "MFA" | "E-mail"   |

    @sicredi
    @sms
    Examples:
      | alianca   | fluxo | receberPor |
      | "sicredi" | "MFA" | "SMS"      |

    @azulzinha
    @email
    Examples:
      | alianca     | fluxo | receberPor |
      | "azulzinha" | "MFA" | "E-mail"   |

    @azulzinha
    @sms
    Examples:
      | alianca     | fluxo | receberPor |
      | "azulzinha" | "MFA" | "SMS"      |

    @afinz
    @email
    Examples:
      | alianca | fluxo | receberPor |
      | "afinz" | "MFA" | "E-mail"   |

    @afinz
    @sms
    Examples:
      | alianca | fluxo | receberPor |
      | "afinz" | "MFA" | "SMS"      |

    @claropay
    @email
    Examples:
      | alianca    | fluxo | receberPor |
      | "claropay" | "MFA" | "E-mail"   |

    @claropay
    @sms
    Examples:
      | alianca    | fluxo | receberPor |
      | "claropay" | "MFA" | "SMS"      |

  @ga
  @mfa
  @secundario
  @TestCaseKey=LPDC-T1427
  Scenario Outline: Validar login com MFA ativo - Usuario Secundario - <alianca>
    Given realizar login no portal com MFA ativo <alianca>
    When enviar o codigo do <fluxo> via <receberPor>
    Then valida que a home do portal foi carregada com sucesso
    @bin
    @email
    Examples:
      | alianca         | fluxo | receberPor |
      | "binSecundario" | "MFA" | "E-mail"   |

    @bin
    @sms
    Examples:
      | alianca         | fluxo | receberPor |
      | "binSecundario" | "MFA" | "SMS"      |

    @sicredi
    @email
    Examples:
      | alianca             | fluxo | receberPor |
      | "sicrediSecundario" | "MFA" | "E-mail"   |

    @sicredi
    @sms
    Examples:
      | alianca             | fluxo | receberPor |
      | "sicrediSecundario" | "MFA" | "SMS"      |

    @azulzinha
    @email
    Examples:
      | alianca               | fluxo | receberPor |
      | "azulzinhaSecundario" | "MFA" | "E-mail"   |

    @azulzinha
    @sms
    Examples:
      | alianca               | fluxo | receberPor |
      | "azulzinhaSecundario" | "MFA" | "SMS"      |

    @afinz
    @email
    Examples:
      | alianca           | fluxo | receberPor |
      | "afinzSecundario" | "MFA" | "E-mail"   |

    @afinz
    @sms
    Examples:
      | alianca           | fluxo | receberPor |
      | "afinzSecundario" | "MFA" | "SMS"      |

    @claropay
    @email
    Examples:
      | alianca              | fluxo | receberPor |
      | "claropaySecundario" | "MFA" | "E-mail"   |

    @claropay
    @sms
    Examples:
      | alianca              | fluxo | receberPor |
      | "claropaySecundario" | "MFA" | "SMS"      |

