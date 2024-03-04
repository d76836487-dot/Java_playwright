#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Ajuda/Validação_componente_Whatsapp_nas_instituições_BIN_003_ou_007
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Validação componente Whatsapp nas instituições BIN 003 ou 007

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T176
  Scenario Outline: Visualização do componente Whatsapp
    Given que estou na tela “início” do Portal
    When usuário clica "Header - Ajuda"
    Then usuário visualiza o componente "Ajuda - Whatsapp" na cor "<cor>" no canto inferior à direita da tela
    @azulzinha
    Examples:
      | cor               |
      | rgb(247, 148, 30) |

    @bin
    Examples:
      | cor               |
      | rgb(46, 139, 201) |

  @TestCaseKey=SMP-T175
  @bin @azulzinha
  Scenario: Validação da flutuação do componente Whatsapp
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente "Ajuda - Whatsapp" acompanhando a rolagem da tela

  @TestCaseKey=SMP-T181
  Scenario Outline: Visualização do campo Atendimento pelo Whatsapp
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll até o final da página
    Then usuário visualizará o campo Atendimento pelo Whatsapp contendo a frase e o número do telefone sublinhado: <dados>
    @azulzinha
    Examples:
      | dados                                                                                                                           |
      | Atendimento pelo Whatsapp,Tire suas dúvidas com nosso atendimento pelo Whatsapp a qualquer momento,Telefone,+55 (11) 94147 3336 |

    @bin
    Examples:
      | dados                                                                                                                           |
      | Atendimento pelo Whatsapp,Tire suas dúvidas com nosso atendimento pelo Whatsapp a qualquer momento,Telefone,+55 (11) 94270 1270 |

  @TestCaseKey=SMP-T185
  Scenario Outline: Validação da URL do Whatsapp
    Given usuário está na página Ajuda
    When usuário clica no "número do telefone sublinhado" na "Ajuda - Atendimento pelo Whatsapp" e uma nova aba se abre
    Then usuário será direcionado para url "<url>" na nova aba
    @azulzinha
    Examples:
      | url                                  |
      | https://wa.me/message/LVFYRJUOSFODE1 |

    @bin
    Examples:
      | url                                  |
      | https://wa.me/message/FC2JELHHFGAKJ1 |

  @sicredi
  Scenario: Visualização do componente Chatbot
    Given que estou na tela “início” do Portal
    When usuário clica "Header - Ajuda"
    Then usuário visualiza o componente "Ajuda - Chatbot" na cor "rgb(20, 110, 55)" no canto inferior à direita da tela

  @sicredi
  Scenario: Validação da flutuação do componente Chatbot
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente "Ajuda - Chatbot" acompanhando a rolagem da tela

  @sicredi
  Scenario: Validação da URL do Chatbot
    Given usuário está na página Ajuda
    When usuário clica em "Ajuda - Chatbot" e uma nova aba se abre
    Then usuário será direcionado para url "https://firstdata-silver.virtualinteractions.com.br/pt_BR/avi-sicredi.html?id=106&source=3&target=1&channel=1&launchType=popup" na nova aba
