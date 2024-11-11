#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Negocio/Negócio
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Negócio

  @TestCaseKey=LPDC-T492
  Scenario Outline: Health check Negócio
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    And "Negócio" esta visivel na pagina de negócios
    And "Trocar estabelecimento" esta visivel na pagina de negócios
    And "Dados Cadastrais" esta visivel na pagina de negócios
    And "Meus Domicílios" esta visivel na pagina de negócios
    And "Meus Terminais" esta visivel na pagina de negócios
    And "Taxas e Tarifas" esta visivel na pagina de negócios
    And logout
    @sicredi @alliances @HealthCheck @HealthCheck
    Examples:
      | Description    | alianca | menu    |
      | Usuario master | sicredi | Negócio |

    @afinz @alliances @HealthCheck
    Examples:
      | Description    | alianca | menu    |
      | Usuario master | afinz   | Negócio |

    @azulzinha @alliances @HealthCheck
    Examples:
      | Description    | alianca   | menu    |
      | Usuario master | azulzinha | Negócio |

    @bin @alliances @HealthCheck
    Examples:
      | Description    | alianca | menu    |
      | Usuario master | bin     | Negócio |

  @TestCaseKey=LPDC-T434
  Scenario Outline: Tela Negócio - botão trocar estabelecimento - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou página de Negócio
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá ECs do documento selecionado
    And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T408
  Scenario Outline: Tela Negócio - botão trocar estabelecimento - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou página de Negócio
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

