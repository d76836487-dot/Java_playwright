#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Login/EsqueciMinhaSenha/Esqueci_minha_senha
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@EsqueciMinhaSenha
Feature: Esqueci minha senha

  @ga
  @TestCaseKey=LPDC-T1426
  Scenario Outline: Validar Esqueci minha senha - <alianca>
    Given que foi acessado o portal <alianca>
    And realiza a etapa 1 do <fluxo> - <usuario>
    And realiza a etapa 2 do <fluxo> - <receberPor>
    When realiza a etapa 3 do <fluxo> - <senha>
    Then valida que a senha foi cadastrada com sucesso
    @bin
    @email
    Examples:
      | alianca | fluxo                 | usuario          | receberPor | senha           |
      | "bin"   | "Esqueci minha senha" | "71633816000827" | "E-mail"   | "Fiserv@123456" |

    @bin
    @sms
    Examples:
      | alianca | fluxo                 | usuario          | receberPor | senha           |
      | "bin"   | "Esqueci minha senha" | "75213076000102" | "SMS"      | "Fiserv@123456" |

    @sicredi
    @email
    Examples:
      | alianca   | fluxo                 | usuario          | receberPor | senha           |
      | "sicredi" | "Esqueci minha senha" | "75213076000102" | "E-mail"   | "Fiserv@123456" |

    @sicredi
    @sms
    Examples:
      | alianca   | fluxo                 | usuario          | receberPor | senha           |
      | "sicredi" | "Esqueci minha senha" | "75213076000102" | "SMS"      | "Fiserv@123456" |

    @azulzinha
    @email
    Examples:
      | alianca     | fluxo                 | usuario          | receberPor | senha           |
      | "azulzinha" | "Esqueci minha senha" | "75213076000102" | "E-mail"   | "Fiserv@123456" |

    @azulzinha
    @sms
    Examples:
      | alianca     | fluxo                 | usuario          | receberPor | senha           |
      | "azulzinha" | "Esqueci minha senha" | "75213076000102" | "SMS"      | "Fiserv@123456" |

    @afinz
    @email
    Examples:
      | alianca | fluxo                 | usuario          | receberPor | senha           |
      | "afinz" | "Esqueci minha senha" | "75213076000102" | "E-mail"   | "Fiserv@123456" |

    @afinz
    @sms
    Examples:
      | alianca | fluxo                 | usuario          | receberPor | senha           |
      | "afinz" | "Esqueci minha senha" | "75213076000102" | "SMS"      | "Fiserv@123456" |

    @claropay
    @email
    Examples:
      | alianca    | fluxo                 | usuario          | receberPor | senha           |
      | "claropay" | "Esqueci minha senha" | "75213076000102" | "E-mail"   | "Fiserv@123456" |

    @claropay
    @sms
    Examples:
      | alianca    | fluxo                 | usuario          | receberPor | senha           |
      | "claropay" | "Esqueci minha senha" | "75213076000102" | "SMS"      | "Fiserv@123456" |