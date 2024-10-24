#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Dirf_Nativa_Home_Logada
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Dirf Nativa Home Logada

  @TestCaseKey=LPDC-T907
  Scenario: Acessar o menu Informe de Rendimento a partir do acesso rápido da home logada (personalizada)
    Given que o usuário está logado na home
    When usuário clica no acesso rápido
    Then usuário deve ver a opção "Informe de Rendimento"
    And usuário clica na opção "Informe de Rendimento"
    Then usuário deve ser redirecionado para a página de Informe de Rendimento
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T905
  Scenario: Acessar o menu Informe de Rendimento a partir do rodapé
    Given que o usuário está logado na home
    When usuário rola a página até o rodapé
    Then usuário deve ver a opção "Informe de Rendimento" no rodapé
    And usuário clica na opção "Informe de Rendimento" no rodapé
    Then usuário deve ser redirecionado para a página de Informe de Rendimento
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T906
  Scenario: Exibir mensagem correta no subtítulo da tela de Informe de Rendimentos
    Given que estou na tela de Informe de Rendimentos
    When a tela é carregada corretamente
    Then eu devo ver o subtítulo "O informe de rendimentos te mostra no detalhe o quanto voce recebeu e pagou ao decorrer do período de um ano"
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T902
  Scenario: Cliente vê anos por default ao clicar no accordion
    Given que o cliente está na página de extração de DIRF
    When o cliente clica no accordion
    Then os anos "2020", "2021", "2022", "2023" e "2024" são exibidos por padrão
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T898
  Scenario: Cliente seleciona um EC e um ano com DIRF disponível
    Given que o cliente está na página de extração de DIRF
    When o cliente seleciona o EC no componente troca de estabelecimento
    And o cliente expande o accordion para selecionar o ano da DIRF
    Then os anos de "2020", "2021", "2022", "2023" e "2024" são exibidos por padrão
    And o cliente seleciona o ano que deseja extrair a DIRF
    Then os dados da DIRF para o ano selecionado são exibidos
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T901
  Scenario: Cliente seleciona um EC e um ano sem DIRF disponível
    Given que o cliente está na página de extração de DIRF
    When o cliente seleciona o EC no componente troca de estabelecimento
    And o cliente expande o accordion para selecionar o ano da DIRF
    Then os anos de "2020", "2021", "2022", "2023" e "2024" são exibidos por padrão
    And o cliente seleciona o ano que deseja extrair a DIRF
    And não há DIRF disponível para o EC e ano selecionado
    Then uma mensagem "Sem resultados" é exibida
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T903
  Scenario: Baixar DIRF em PDF com loading no botão
    Given que o cliente está na página de extração de DIRF
    And o cliente selecionou um EC válido
    And o cliente selecionou um ano para extrair a DIRF
    When o cliente clica no botão "Baixar"
    Then o estado de loading é aplicado no botão
    And o arquivo PDF da DIRF começa a ser baixado
    And o estado de loading no botão é removido após a conclusão do download
    And o arquivo PDF da DIRF é salvo no dispositivo do cliente
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T900
  Scenario: Validando nome do Arquivo PDF
    Given que o usuário baixou um arquivo PDF
    When ele abrir o arquivo
    Then o arquivo PDF deve ter o nome no formato "Informe_de_rendimento_[Número do EC]_[ANO REFERENCIA]_[Data e hora do download]"
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T908
  Scenario: Cliente seleciona um EC e um ano sem resultados de DIRF
    Given que o cliente está na página de extração de DIRF
    And o cliente selecionou um EC válido
    And o cliente expandiu o accordion para selecionar o ano
    When o cliente seleciona um ano para extrair a DIRF
    And não há resultados de DIRF para o EC e ano selecionados
    Then uma mensagem "Relatório não disponível para esse ano" , O seu estabelecimento não possui movimentações referentes ao ano selecionado para gerar o relatório para DIRF. é exibida
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T909
  Scenario: Exibir mensagem de erro se o download falhar
    Given que o cliente está na página de extração de DIRF
    And o cliente selecionou o ano para extrair a DIRF
    When o cliente clica no botão "Baixar"
    Then o estado de loading é aplicado no botão
    And há um problema durante o download do PDF
    Then uma mensagem de erro "Ocorreu um erro. Por favor, não foi possível completar sua solicitação Tente novamente mais tarde." é exibida
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T904
  Scenario: Fechar modal usando o botão "x"
    Given que o cliente está na tela do modal de DIRF
    And o cliente havia selecionado o ano "2022"
    When o cliente clica no botão "x"
    Then o modal é fechado
    And o cliente retorna para a tela "Informe de Rendimento"
    And o ano "2022" permanece selecionado
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |

  @TestCaseKey=LPDC-T899
  Scenario: Fechar modal usando o botão "Fechar"
    Given que o cliente está na tela do modal de DIRF
    And o cliente havia selecionado o ano "2022"
    When o cliente clica no botão "Fechar"
    Then o modal é fechado
    And o cliente retorna para a tela "Informe de Rendimento"
    And o ano "2022" permanece selecionado
      | Perfis         |
      | master         |
      | sec op         |
      | sec con        |
      | Operador com F |
      | Operador sem F |