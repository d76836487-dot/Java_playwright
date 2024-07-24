#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Ajuda/Ajuda_Whatsapp
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Ajuda Whatsapp

  @TestCaseKey=LPDC-T149
  Scenario Outline: Visualização do componente Whatsapp
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    #When usuário clica "Menu Ajuda"
    When usuário clica no Menu Ajuda
    Then usuário visualiza o componente "Ajuda - Whatsapp" na cor "<cor>" no canto inferior à direita da tela
    And logout
    @azulzinha @alliances @WhatsApp
    Examples:
      | Description    | alianca   | cor               |
      | Usuario master | azulzinha | rgb(247, 148, 30) |

    @bin @alliances @WhatsApp
    Examples:
      | Description    | alianca | cor               |
      | Usuario master | bin     | rgb(46, 139, 201) |

  @TestCaseKey=LPDC-T129
  Scenario Outline: Validação da flutuação do componente Whatsapp
    Given open portal "<alianca>" and logon
    When usuário clica no Menu Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente "Ajuda - Whatsapp" acompanhando a rolagem da tela
    And logout
    @azulzinha @alliances  @WhatsApp
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @WhatsApp
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T122
  Scenario Outline: Visualização do campo Atendimento pelo Whatsapp
    Given open portal "<alianca>" and logon
    When usuário clica no Menu Ajuda
    When usuário move a tela através do scroll até o final da página
    Then usuário visualizará o campo Atendimento pelo Whatsapp contendo a frase e o número do telefone sublinhado: <dados>
    And logout
    @azulzinha @alliances  @WhatsApp
    Examples:
      | Description    | alianca   | dados                                                                                                                           |
      | Usuario master | azulzinha | Atendimento pelo Whatsapp,Tire suas dúvidas com nosso atendimento pelo Whatsapp a qualquer momento,Telefone,+55 (11) 94147 3336 |

    @bin @alliances  @WhatsApp
    Examples:
      | Description    | alianca | dados                                                                                                                           |
      | Usuario master | bin     | Atendimento pelo Whatsapp,Tire suas dúvidas com nosso atendimento pelo Whatsapp a qualquer momento,Telefone,+55 (11) 94270 1270 |

  @TestCaseKey=LPDC-T108
  Scenario Outline: Validação da URL do Whatsapp
    Given open portal "<alianca>" and logon
    When usuário clica no Menu Ajuda
    When usuário clica no "Ajuda - Atendimento pelo Whatsapp - número do telefone sublinhado" e uma nova aba se abre
    Then usuário será direcionado para url "<url>" na nova aba
    And logout

    @azulzinha @alliances  @WhatsApp
    Examples:
      | Description    | alianca   | url                                  |
      | Usuario master | azulzinha | https://wa.me/message/LVFYRJUOSFODE1 |

    @bin @alliances
    Examples:
      | Description    | alianca | url                                  |
      | Usuario master | bin     | https://wa.me/message/FC2JELHHFGAKJ1 |

  @TestCaseKey=LPDC-T132
  Scenario Outline: Visualização do componente Chatbot
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    When usuário clica no Menu Ajuda
    Then usuário visualiza o componente "Ajuda - Chatbot" na cor "rgb(20, 110, 55)" no canto inferior à direita da tela
    And logout
    @sicredi @alliances  @WhatsApp
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |



  @TestCaseKey=LPDC-T120
  Scenario Outline: Validação da flutuação do componente Chatbot
    Given open portal "<alianca>" and logon
    When usuário clica no Menu Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente "Ajuda - Chatbot" acompanhando a rolagem da tela
    And logout
    @sicredi @alliances  @WhatsApp
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |



  @TestCaseKey=LPDC-T133
  Scenario Outline: Validação da URL do Chatbot
    Given open portal "<alianca>" and logon
    When usuário clica no Menu Ajuda
    When usuário clica em "Ajuda - Chatbot" e uma nova aba se abre
    Then usuário será direcionado para url "https://firstdata-silver.virtualinteractions.com.br/pt_BR/avi-sicredi.html?id=106&source=3&target=1&channel=1&launchType=popup" na nova aba
    And logout
    @sicredi @alliances  @WhatsApp
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |



