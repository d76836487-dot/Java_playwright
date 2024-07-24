#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Recebimentos/Resumo/Antecipação
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Antecipação



  Scenario Outline: Health Check Tela Antecipação
    Given open portal "<alianca>" and logon
    And Usuário acessou página de Antecipação
    And "Antecipação" esta visivel na pagina de Antecipação
    And "Valor disponível para antecipação" esta visivel na pagina de Antecipação
    And "Como funciona?" esta visivel na pagina de Antecipação
    And "Antecipação eventual" esta visivel na pagina de Antecipação
    And "Antecipação automática" esta visivel na pagina de Antecipação
    And logout
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @azulzinha @alliances @Antecipacao
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |



#testes em revisao da webview
  @TestCaseKey=LPDC-T421
  Scenario Outline: Tela Antecipação - Troca de estabelecimento Documento
    Given open portal "<alianca>" and logon
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    #Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    #And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    #And Usuário acessou página de Antecipação
    And Popup terá ECs do documento selecionado
    #And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar
    And logout
    @sicredi @alliances @HealthCheck  @Antecipacao1
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |



    @azulzinha @alliances  @Antecipacao1
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @Antecipacao1
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |





  @TestCaseKey=LPDC-T406
  Scenario Outline: Tela Antecipação - Troca de estabelecimento  EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou página de Antecipação
    When Usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado
    And logout
    @sicredi @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @Antecipacao
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

