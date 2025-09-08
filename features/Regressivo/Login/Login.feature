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
    @Vendas
    @Hoje
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @bin
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @bin
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @bin
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @bin
    @Vendas
    @Voucher
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @bin
    @Recebimentos
    @Pagos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @bin
    @Recebimentos
    @Futuros
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @bin
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @bin
    @Antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca | menu          | submenu | abaRelatorio            |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" |

    @bin
    @Antecipacao
    @Historico
    Examples:
      | alianca | menu          | submenu | abaRelatorio |
      | "bin"   | "antecipacao" | ""      | "Histórico"  |

    @bin
    @Antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi
    @Vendas
    @Hoje
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi
    @Vendas
    @Voucher
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi
    @Recebimentos
    @Pagos
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi
    @Recebimentos
    @Futuros
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi
    @Antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca   | menu          | submenu | abaRelatorio            |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" |

    @sicredi
    @Antecipacao
    @Historico
    Examples:
      | alianca   | menu          | submenu | abaRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Histórico"  |

    @sicredi
    @Antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha
    @Vendas
    @Hoje
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha
    @Vendas
    @Voucher
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha
    @Recebimentos
    @Pagos
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha
    @Recebimentos
    @Futuros
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha
    @Antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" |

    @azulzinha
    @Antecipacao
    @Historico
    Examples:
      | alianca     | menu          | submenu | abaRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"  |

    @azulzinha
    @Antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @afinz
    @Vendas
    @Hoje
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz
    @Vendas
    @Voucher
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz
    @Recebimentos
    @Pagos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz
    @Recebimentos
    @Futuros
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    @Vendas
    @Hoje
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio     |
      | "claropay" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @claropay
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay
    @Vendas
    @Voucher
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay
    @Recebimentos
    @Pagos
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay
    @Recebimentos
    @Futuros
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    @Antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca    | menu          | submenu | abaRelatorio            |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" |

    @claropay
    @Antecipacao
    @Historico
    Examples:
      | alianca    | menu          | submenu | abaRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  |

    @claropay
    @Antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

    @banqi
    @Vendas
    @Hoje
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @banqi
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @banqi
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "banqi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @banqi
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "banqi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @banqi
    @Vendas
    @Voucher
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @banqi
    @Recebimentos
    @Pagos
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @banqi
    @Recebimentos
    @Futuros
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @banqi
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujacapital
    @Vendas
    @Hoje
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       |

    @corujacapital
    @Vendas
    @HistoricoVendas
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @corujacapital
    @Vendas
    @NaoEfetivadas
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @corujacapital
    @Vendas
    @PreAutorizacoes
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @corujacapital
    @Vendas
    @Voucher
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Voucher"    |

    @corujacapital
    @Recebimentos
    @Pagos
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @corujacapital
    @Recebimentos
    @Futuros
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @corujacapital
    @Recebimentos
    @DebitosAjustes
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujacapital
    @Antecipacao
    @SolicitarAntecipacao
    Examples:
      | alianca         | menu          | submenu | abaRelatorio            |
      | "corujacapital" | "antecipacao" | ""      | "Solicitar antecipação" |

    @corujacapital
    @Antecipacao
    @Historico
    Examples:
      | alianca         | menu          | submenu | abaRelatorio |
      | "corujacapital" | "antecipacao" | ""      | "Histórico"  |

    @corujacapital
    @Antecipacao
    @RelatorioAntecipacoes
    Examples:
      | alianca         | menu          | submenu | abaRelatorio                |
      | "corujacapital" | "antecipacao" | ""      | "Relatório de antecipações" |

  @navegacao
  @TestCaseKey=LPDC-T1327
  Scenario Outline: Realizar Login no portal <alianca> e acessar Dashboard via <dashboard>
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin
    @Vendas
    @Hoje
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "bin"   | "vendasHoje"    | "Hoje"       |
      | "bin"   | "ultimasVendas" | "Hoje"       |

    @bin
    @Recebimentos
    @Pagos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "bin"   | "recebimentos"             | "Pagos"      |
      | "bin"   | "agendaRecebimentosSemana" | "Pagos"      |

    @sicredi
    @Vendas
    @Hoje
    Examples:
      | alianca   | dashboard       | abaRelatorio |
      | "sicredi" | "vendasHoje"    | "Hoje"       |
      | "sicredi" | "ultimasVendas" | "Hoje"       |

    @sicredi
    @Recebimentos
    @Pagos
    Examples:
      | alianca   | dashboard                  | abaRelatorio |
      | "sicredi" | "recebimentos"             | "Pagos"      |
      | "sicredi" | "agendaRecebimentosSemana" | "Pagos"      |

    @azulzinha
    @Vendas
    @Hoje
    Examples:
      | alianca     | dashboard       | abaRelatorio |
      | "azulzinha" | "vendasHoje"    | "Hoje"       |
      | "azulzinha" | "ultimasVendas" | "Hoje"       |

    @azulzinha
    @Recebimentos
    @Pagos
    Examples:
      | alianca     | dashboard                  | abaRelatorio |
      | "azulzinha" | "recebimentos"             | "Pagos"      |
      | "azulzinha" | "agendaRecebimentosSemana" | "Pagos"      |

    @afinz
    @Vendas
    @Hoje
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "afinz" | "vendasHoje"    | "Hoje"       |
      | "afinz" | "ultimasVendas" | "Hoje"       |

    @afinz
    @Recebimentos
    @Pagos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "afinz" | "recebimentos"             | "Pagos"      |
      | "afinz" | "agendaRecebimentosSemana" | "Pagos"      |

    @claropay
    @Vendas
    @Hoje
    Examples:
      | alianca    | dashboard       | abaRelatorio |
      | "claropay" | "vendasHoje"    | "Hoje"       |
      | "claropay" | "ultimasVendas" | "Hoje"       |

    @claropay
    @Recebimentos
    @Pagos
    Examples:
      | alianca    | dashboard                  | abaRelatorio |
      | "claropay" | "recebimentos"             | "Pagos"      |
      | "claropay" | "agendaRecebimentosSemana" | "Pagos"      |

    @banqi
    @Vendas
    @Hoje
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "banqi" | "vendasHoje"    | "Hoje"       |
      | "banqi" | "ultimasVendas" | "Hoje"       |

    @banqi
    @Recebimentos
    @Pagos
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "banqi" | "recebimentos"             | "Pagos"      |
      | "banqi" | "agendaRecebimentosSemana" | "Pagos"      |

    @corujacapital
    @Vendas
    @Hoje
    Examples:
      | alianca         | dashboard       | abaRelatorio |
      | "corujacapital" | "vendasHoje"    | "Hoje"       |
      | "corujacapital" | "ultimasVendas" | "Hoje"       |

    @corujacapital
    @Recebimentos
    @Pagos
    Examples:
      | alianca         | dashboard                  | abaRelatorio |
      | "corujacapital" | "recebimentos"             | "Pagos"      |
      | "corujacapital" | "agendaRecebimentosSemana" | "Pagos"      |

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

    @banqi
    @email
    Examples:
      | alianca | fluxo | receberPor |
      | "banqi" | "MFA" | "E-mail"   |

    @banqi
    @sms
    Examples:
      | alianca | fluxo | receberPor |
      | "banqi" | "MFA" | "SMS"      |

    @corujacapital
    @email
    Examples:
      | alianca         | fluxo | receberPor |
      | "corujacapital" | "MFA" | "E-mail"   |

    @corujacapital
    @sms
    Examples:
      | alianca         | fluxo | receberPor |
      | "corujacapital" | "MFA" | "SMS"      |

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

    @banqi
    @email
    Examples:
      | alianca           | fluxo | receberPor |
      | "banqiSecundario" | "MFA" | "E-mail"   |

    @banqi
    @sms
    Examples:
      | alianca           | fluxo | receberPor |
      | "banqiSecundario" | "MFA" | "SMS"      |

    @corujacapital
    @email
    Examples:
      | alianca                   | fluxo | receberPor |
      | "corujacapitalSecundario" | "MFA" | "E-mail"   |

    @corujacapital
    @sms
    Examples:
      | alianca                   | fluxo | receberPor |
      | "corujacapitalSecundario" | "MFA" | "SMS"      |