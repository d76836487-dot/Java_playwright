#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Login/PrimeiroAcesso/Primeiro_acesso
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@PrimeiroAcesso
Feature: Primeiro acesso

  @ga
  @TestCaseKey=LPDC-T1428
  Scenario Outline: Validar Primeiro acesso - <alianca>
    Given que foi acessado o portal <alianca>
    And realiza a etapa 1 do <fluxo> - <usuario>
    And realiza a etapa 2 do <fluxo> - <receberPor>
    When realiza a etapa 3 do <fluxo> - <senha>
    Then valida que a senha foi cadastrada com sucesso
    @bin
    @email
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "bin"   | "Primeiro acesso" | "71633816000827" | "E-mail"   | "Fiserv@12345" |

    @bin
    @sms
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "bin"   | "Primeiro acesso" | "71633816000828" | "SMS"      | "Fiserv@12345" |

    @sicredi
    @email
    Examples:
      | alianca   | fluxo             | usuario          | receberPor | senha          |
      | "sicredi" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @sicredi
    @sms
    Examples:
      | alianca   | fluxo             | usuario          | receberPor | senha          |
      | "sicredi" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

    @azulzinha
    @email
    Examples:
      | alianca     | fluxo             | usuario          | receberPor | senha          |
      | "azulzinha" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @azulzinha
    @sms
    Examples:
      | alianca     | fluxo             | usuario          | receberPor | senha          |
      | "azulzinha" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

    @afinz
    @email
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "afinz" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @afinz
    @sms
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "afinz" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

    @claropay
    @email
    Examples:
      | alianca    | fluxo             | usuario          | receberPor | senha          |
      | "claropay" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @claropay
    @sms
    Examples:
      | alianca    | fluxo             | usuario          | receberPor | senha          |
      | "claropay" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

    @banqi
    @email
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "banqi" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @banqi
    @sms
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha          |
      | "banqi" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

    @corujacapital
    @email
    Examples:
      | alianca         | fluxo             | usuario          | receberPor | senha          |
      | "corujacapital" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@12345" |

    @corujacapital
    @sms
    Examples:
      | alianca         | fluxo             | usuario          | receberPor | senha          |
      | "corujacapital" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@12345" |

