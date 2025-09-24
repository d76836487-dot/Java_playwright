#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Login/Login
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Login
Feature: Login

  @navegacao
  @TestCaseKey=LPDC-T1328
  Scenario Outline: Realizar Login no portal <alianca> e acessar Menu Lateral via <menu>><submenu>
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Hoje"       |

    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "bin"   | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "bin"   | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "bin"   | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @bin
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "bin"   | "vendas" | "relatorioVendas" | "Voucher"    |

    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @bin
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "bin"   | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio            |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" |

    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio |
      | "bin"   | "antecipacao" | ""      | "Histórico"  |

    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio                |
      | "bin"   | "antecipacao" | ""      | "Relatório de antecipações" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio          |
      | "sicredi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio     |
      | "sicredi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio       |
      | "sicredi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @sicredi
    Examples:
      | alianca   | menu     | submenu           | abaRelatorio |
      | "sicredi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @sicredi
    Examples:
      | alianca   | menu           | submenu              | abaRelatorio        |
      | "sicredi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio            |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio |
      | "sicredi" | "antecipacao" | ""      | "Histórico"  |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio                |
      | "sicredi" | "antecipacao" | ""      | "Relatório de antecipações" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Hoje"       |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio          |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio     |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio       |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @azulzinha
    Examples:
      | alianca     | menu     | submenu           | abaRelatorio |
      | "azulzinha" | "vendas" | "relatorioVendas" | "Voucher"    |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @azulzinha
    Examples:
      | alianca     | menu           | submenu              | abaRelatorio        |
      | "azulzinha" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio |
      | "azulzinha" | "antecipacao" | ""      | "Histórico"  |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio                |
      | "azulzinha" | "antecipacao" | ""      | "Relatório de antecipações" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Hoje"       |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "afinz" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "afinz" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "afinz" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @afinz
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "afinz" | "vendas" | "relatorioVendas" | "Voucher"    |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @afinz
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "afinz" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Hoje"       |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio          |
      | "claropay" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio     |
      | "claropay" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio       |
      | "claropay" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @claropay
    Examples:
      | alianca    | menu     | submenu           | abaRelatorio |
      | "claropay" | "vendas" | "relatorioVendas" | "Voucher"    |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @claropay
    Examples:
      | alianca    | menu           | submenu              | abaRelatorio        |
      | "claropay" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio            |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio |
      | "claropay" | "antecipacao" | ""      | "Histórico"  |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio                |
      | "claropay" | "antecipacao" | ""      | "Relatório de antecipações" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Hoje"       |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio          |
      | "banqi" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio     |
      | "banqi" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio       |
      | "banqi" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @banqi
    Examples:
      | alianca | menu     | submenu           | abaRelatorio |
      | "banqi" | "vendas" | "relatorioVendas" | "Voucher"    |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @banqi
    Examples:
      | alianca | menu           | submenu              | abaRelatorio        |
      | "banqi" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Hoje"       |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio          |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Histórico de vendas" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio     |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Não efetivadas" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio       |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Pré-autorizações" |

    @corujacapital
    Examples:
      | alianca         | menu     | submenu           | abaRelatorio |
      | "corujacapital" | "vendas" | "relatorioVendas" | "Voucher"    |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Pagos"      |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Futuros"    |

    @corujacapital
    Examples:
      | alianca         | menu           | submenu              | abaRelatorio        |
      | "corujacapital" | "recebimentos" | "resumoRecebimentos" | "Débitos e ajustes" |

    @corujacapital
    Examples:
      | alianca         | menu          | submenu | abaRelatorio            |
      | "corujacapital" | "antecipacao" | ""      | "Solicitar antecipação" |

    @corujacapital
    Examples:
      | alianca         | menu          | submenu | abaRelatorio |
      | "corujacapital" | "antecipacao" | ""      | "Histórico"  |

    @corujacapital
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
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "bin"   | "vendasHoje"    | "Hoje"       |
      | "bin"   | "ultimasVendas" | "Hoje"       |

    @bin
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "bin"   | "recebimentos"             | "Pagos"      |
      | "bin"   | "agendaRecebimentosSemana" | "Pagos"      |

    @sicredi
    Examples:
      | alianca   | dashboard       | abaRelatorio |
      | "sicredi" | "vendasHoje"    | "Hoje"       |
      | "sicredi" | "ultimasVendas" | "Hoje"       |

    @sicredi
    Examples:
      | alianca   | dashboard                  | abaRelatorio |
      | "sicredi" | "recebimentos"             | "Pagos"      |
      | "sicredi" | "agendaRecebimentosSemana" | "Pagos"      |

    @azulzinha
    Examples:
      | alianca     | dashboard       | abaRelatorio |
      | "azulzinha" | "vendasHoje"    | "Hoje"       |
      | "azulzinha" | "ultimasVendas" | "Hoje"       |

    @azulzinha
    Examples:
      | alianca     | dashboard                  | abaRelatorio |
      | "azulzinha" | "recebimentos"             | "Pagos"      |
      | "azulzinha" | "agendaRecebimentosSemana" | "Pagos"      |

    @afinz
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "afinz" | "vendasHoje"    | "Hoje"       |
      | "afinz" | "ultimasVendas" | "Hoje"       |

    @afinz
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "afinz" | "recebimentos"             | "Pagos"      |
      | "afinz" | "agendaRecebimentosSemana" | "Pagos"      |

    @claropay
    Examples:
      | alianca    | dashboard       | abaRelatorio |
      | "claropay" | "vendasHoje"    | "Hoje"       |
      | "claropay" | "ultimasVendas" | "Hoje"       |

    @claropay
    Examples:
      | alianca    | dashboard                  | abaRelatorio |
      | "claropay" | "recebimentos"             | "Pagos"      |
      | "claropay" | "agendaRecebimentosSemana" | "Pagos"      |

    @banqi
    Examples:
      | alianca | dashboard       | abaRelatorio |
      | "banqi" | "vendasHoje"    | "Hoje"       |
      | "banqi" | "ultimasVendas" | "Hoje"       |

    @banqi
    Examples:
      | alianca | dashboard                  | abaRelatorio |
      | "banqi" | "recebimentos"             | "Pagos"      |
      | "banqi" | "agendaRecebimentosSemana" | "Pagos"      |

    @corujacapital
    Examples:
      | alianca         | dashboard       | abaRelatorio |
      | "corujacapital" | "vendasHoje"    | "Hoje"       |
      | "corujacapital" | "ultimasVendas" | "Hoje"       |

    @corujacapital
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