#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Atecipacao/Antecipação
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Antecipação

  ###################################################################################
  #  TESTE NO DASHBOARD TELA INICIAL
  ###################################################################################
  @TestCaseKey=LPDC-T574
  Scenario Outline: Dashboard antecipação drill down
    Given open portal "<alianca>" and logon
    And Todas as barras de carregamento sumiram
    And Usuário verá "Dashboard - Antecipação"
    And o número do estabelecimento "<nrestab>" na coluna Estabelecimento,
    #And a mensagem "Antecipação automática contratada" na coluna Valor/Produto
    And o valor que pode ser antecipado em "Dashboard - Valor Antecipação"
    And o usuário clica em "Dashboard - Ir para Antecipação"
    And Usuário verá a pagina de antecipação
    And logout
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca | nrestab     |
      | usuário master | sicredi | EC 99990109 |

  @TestCaseKey=LPDC-T586
  Scenario Outline: Dashboard Antecipação validação de valores
    Given open portal "<alianca>" and logon
    And Todas as barras de carregamento sumiram
    And Usuário verá "Dashboard - Antecipação"
    Given Salva o valor a antecipar "Home - Card Antecipação - Valor"
    Then o usuario vai para a pagina de antecipação
    Then o usuário deve visualizar o Valor disponível para antecipação igual ao apresentado no dashboard
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |



  @TestCaseKey=LPDC-T576
  Scenario Outline: Dashboard Antecipação com EC flex
    Given open portal "<alianca>" and logon
    And Todas as barras de carregamento sumiram
    And Usuário verá "Dashboard - Antecipação"
    Then o usuário visualizará o número do estabelecimento na coluna Estabelecimento e a mensagem "Plano Flex contratado"
    #And o usuário visualizará valor na coluna 'ValorProduto'
    #And o usuário visualizará o botão "Ir para antecipação
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca     |
      | usuário master | sicrediflex |



  ###################################################################################
  #  TESTE NA TELA DE ANTECIPAÇÃO
  ###################################################################################
  @TestCaseKey=LPDC-T491
  Scenario Outline: Health Check Tela Antecipação
    Given open portal "<alianca>" and logon
    And Todas as barras de carregamento sumiram
    And o usuário acessou página de Antecipação
    And o texto "Antecipação" esta visivel na pagina de Antecipação
    And o texto "Valor disponível para antecipação" esta visivel na pagina de Antecipação
    And o texto "Como funciona?" esta visivel na pagina de Antecipação
    And o texto "Antecipação automática" esta visivel na pagina de Antecipação
    And o texto "Antecipação eventual" esta visivel na pagina de Antecipação
    And o usuário clica no link "Histórico"
    And o texto "Total de antecipações pagas" esta visivel na pagina de Antecipação Historico
    And o texto "Valor líquido pago" esta visivel na pagina de Antecipação Historico
    #Then o usuário visualizará na página da Antecipação o nome do estabelecimento
    #Then o usuário visualizará na CNPJ do estabelecimento
    #Then o usuário visualizará o número do estabelecimento
    And logout
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances @Antecipacao
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

  #testes em revisao da webview
  @TestCaseKey=LPDC-T421
  Scenario Outline: Tela Antecipação - Troca de estabelecimento comercial
    Given open portal "<alianca>" and logon
    And o usuário acessou página de Antecipação
    When o usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    #Given o usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    #And o usuário selecionou um documento com maior número de ECs e clicar Acessar
    #And o usuário acessou página de Antecipação
    And Popup terá ECs do documento selecionado
    #And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar
    And logout
    @sicredi @alliances @HealthCheck @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

  @TestCaseKey=LPDC-T406
  Scenario Outline: Tela Antecipação troca de estabelecimento  EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And o usuário acessou página de Antecipação
    When o usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Popup será fechado ao clicar em Selecionar
    #And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado
    And logout
    @sicredi @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |



