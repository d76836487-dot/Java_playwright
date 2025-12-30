#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Antecipacao/Solicitar_Antecipacao
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao 
@Antecipacao
@SolicitarAntecipacao
Feature: Solicitar Antecipacao

  @automatica
  @TestCaseKey=LPDC-T1335
  Scenario Outline: Solicitar antecipacao - Automatica
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And solicitar anticipacao automatica contendo os seguintes valores Bandeiras <bandeiras>, Produtos <produtos>, Frequencia <frequencia> e Dia de recebimento <diaRecebimento>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | frequencia  | diaRecebimento |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "Diária"    | "Diário"       |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito à vista"   | "Semanal"   | "Sexta-feira"  |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Crédito Parcelado" | "Quinzenal" | "16-30"        |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "Amex;Cabal;Hiper;ELO"                 | "Todos"             | "Mensal"    | "31"           |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | frequencia  | diaRecebimento |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "Diária"    | "Diário"       |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito à vista"   | "Semanal"   | "Sexta-feira"  |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Crédito Parcelado" | "Quinzenal" | "16-30"        |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "Amex;Cabal;Hiper;ELO"                 | "Todos"             | "Mensal"    | "31"           |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | frequencia  | diaRecebimento |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "Diária"    | "Diário"       |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito à vista"   | "Semanal"   | "Sexta-feira"  |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Crédito Parcelado" | "Quinzenal" | "16-30"        |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "Amex;Cabal;Hiper;ELO"                 | "Todos"             | "Mensal"    | "31"           |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | frequencia  | diaRecebimento |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "Diária"    | "Diário"       |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito à vista"   | "Semanal"   | "Sexta-feira"  |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Crédito Parcelado" | "Quinzenal" | "16-30"        |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "Amex;Cabal;Hiper;ELO"                 | "Todos"             | "Mensal"    | "31"           |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | frequencia  | diaRecebimento |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "Diária"    | "Diário"       |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito à vista"   | "Semanal"   | "Sexta-feira"  |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Crédito Parcelado" | "Quinzenal" | "16-30"        |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "Amex;Cabal;Hiper;ELO"                 | "Todos"             | "Mensal"    | "31"           |

  @eventual
  @TestCaseKey=LPDC-T1332
  Scenario Outline: Solicitar antecipacao - Eventual
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que a aba <abaRelatorio> do relatorio foi acessada com sucesso
    And solicitar anticipacao eventual contendo os seguintes valores Bandeiras <bandeiras>, Produtos <produtos>, Todo o periodo <todoPeriodo>, Vencimento de <diaVencimentoDe>, Ate <diaAte>, Valor <valor> e Minimo ou Maximo <minimoMaximo>
    @bin
    Examples:
      | alianca | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | todoPeriodo | diaVencimentoDe | diaAte | valor  | minimoMaximo |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "S"         | ""              | ""     | "1200" | "minimo"     |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "Visa;ELO"                             | "Crédito à vista"   | "N"         | "D0"            | "D+2"  | "1000" | "maximo"     |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito Parcelado" | "N"         | "D+1"           | "D+4"  | "800"  | "maximo"     |
      | "bin"   | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Todos"             | "S"         | ""              | ""     | "1500" | "minimo"     |

    @sicredi
    Examples:
      | alianca   | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | todoPeriodo | diaVencimentoDe | diaAte | valor  | minimoMaximo |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "S"         | ""              | ""     | "1200" | "minimo"     |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa;ELO"                             | "Crédito à vista"   | "N"         | "D0"            | "D+2"  | "1000" | "maximo"     |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito Parcelado" | "N"         | "D+1"           | "D+4"  | "800"  | "maximo"     |
      | "sicredi" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Todos"             | "S"         | ""              | ""     | "1500" | "minimo"     |

    @azulzinha
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | todoPeriodo | diaVencimentoDe | diaAte | valor  | minimoMaximo |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "S"         | ""              | ""     | "1200" | "minimo"     |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa;ELO"                             | "Crédito à vista"   | "N"         | "D0"            | "D+2"  | "1000" | "maximo"     |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito Parcelado" | "N"         | "D+1"           | "D+4"  | "800"  | "maximo"     |
      | "azulzinha" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Todos"             | "S"         | ""              | ""     | "1500" | "minimo"     |

    @claropay
    Examples:
      | alianca    | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | todoPeriodo | diaVencimentoDe | diaAte | valor  | minimoMaximo |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "S"         | ""              | ""     | "1200" | "minimo"     |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa;ELO"                             | "Crédito à vista"   | "N"         | "D0"            | "D+2"  | "1000" | "maximo"     |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito Parcelado" | "N"         | "D+1"           | "D+4"  | "800"  | "maximo"     |
      | "claropay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Todos"             | "S"         | ""              | ""     | "1500" | "minimo"     |

    @corujapay
    Examples:
      | alianca     | menu          | submenu | abaRelatorio            | bandeiras                              | produtos            | todoPeriodo | diaVencimentoDe | diaAte | valor  | minimoMaximo |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard;Visa;Amex;Cabal;Hiper;ELO" | "Todos"             | "S"         | ""              | ""     | "1200" | "minimo"     |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa;ELO"                             | "Crédito à vista"   | "N"         | "D0"            | "D+2"  | "1000" | "maximo"     |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "MasterCard"                           | "Crédito Parcelado" | "N"         | "D+1"           | "D+4"  | "800"  | "maximo"     |
      | "corujapay" | "antecipacao" | ""      | "Solicitar antecipação" | "Visa"                                 | "Todos"             | "S"         | ""              | ""     | "1500" | "minimo"     |

