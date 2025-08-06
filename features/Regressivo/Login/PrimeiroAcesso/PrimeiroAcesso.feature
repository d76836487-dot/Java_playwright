#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Login/PrimeiroAcesso/Primeiro_acesso
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@PrimeiroAcesso
Feature: Primeiro acesso

  @ga
  Scenario Outline: Validar Primeiro acesso - <alianca>
    Given que foi acessado o portal <alianca>
    And realiza a etapa 1 do <fluxo> - <usuario>
    And realiza a etapa 2 do <fluxo> - <receberPor>
    When realiza a etapa 3 do <fluxo> - <senha>
    Then valida que a senha foi cadastrada com sucesso
    @bin
    @email
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha           |
      | "bin"   | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@123456" |

    @bin
    @sms
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha           |
      | "bin"   | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@123456" |

    @sicredi
    @email
    Examples:
      | alianca   | fluxo             | usuario          | receberPor | senha           |
      | "sicredi" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@123456" |

    @sicredi
    @sms
    Examples:
      | alianca   | fluxo             | usuario          | receberPor | senha           |
      | "sicredi" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@123456" |

    @azulzinha
    @email
    Examples:
      | alianca     | fluxo             | usuario          | receberPor | senha           |
      | "azulzinha" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@123456" |

    @azulzinha
    @sms
    Examples:
      | alianca     | fluxo             | usuario          | receberPor | senha           |
      | "azulzinha" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@123456" |

    @afinz
    @email
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha           |
      | "afinz" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@123456" |

    @afinz
    @sms
    Examples:
      | alianca | fluxo             | usuario          | receberPor | senha           |
      | "afinz" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@123456" |

    @claropay
    @email
    Examples:
      | alianca    | fluxo             | usuario          | receberPor | senha           |
      | "claropay" | "Primeiro acesso" | "75211485000161" | "E-mail"   | "Fiserv@123456" |

    @claropay
    @sms
    Examples:
      | alianca    | fluxo             | usuario          | receberPor | senha           |
      | "claropay" | "Primeiro acesso" | "75211485000161" | "SMS"      | "Fiserv@123456" |