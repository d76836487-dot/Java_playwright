#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Home
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home

  @TestCaseKey=LPDC-T273
  Scenario Outline: Login com sucesso
    Given open portal "<alianca>" and logon
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

  @TestCaseKey=LPDC-T488
  Scenario Outline: Health Check Itens Home
    Given open portal "<alianca>" and logon
    And "Informe de Rendimento" esta visivel no acesso rapido
    And "Recebimentos" esta visivel no acesso rapido
    And "Negócio" esta visivel no acesso rapido
    And "Solicitações" esta visivel no acesso rapido
    And "Vendas hoje" esta visivel na home
    And "Antecipação" esta visivel na home
    And "Recebimentos" esta visivel na home
    And "Últimas vendas" esta visivel na home
    And "Agenda de recebimentos da semana" esta visivel na home
    And logout
    @sicredi @alliances @HealthCheckHomeItens
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @HealthCheckHomeItens
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @HealthCheckHomeItens
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @HealthCheckHomeItens
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T111
  Scenario Outline: Logim com credenciais invalidas
    When Usuário tenta logar na aplicação "<alianca>" com "81633816000210" e "Fiserv@123"
    Then verifica mensagem em tela "Parece que você ainda não é nosso cliente"
    And logout
    #Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"
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

  @TestCaseKey=LPDC-T137
  Scenario Outline: Usuário tenta logar com senha errada
    When Usuário loga com senha errada "<alianca>"
    And Todas as requisições HTTP foram respondidas
    Then Usuário verá em "Login - mensagem de erro" o valor "<descrição>"
    And logout
    @sicredi @alliancesr
    Examples:
      | Description    | alianca | descrição                                                                                           |
      | Usuario master | sicredi | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

    @afinz @alliances
    Examples:
      | Description    | alianca | descrição                                                                                           |
      | Usuario master | afinz   | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | descrição                                                                                           |
      | Usuario master | azulzinha | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

    @bin @alliances
    Examples:
      | Description    | alianca | descrição                                                                                           |
      | Usuario master | bin     | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

  #@TestCaseKey=LPDC-T47
  #Scenario Outline: Antecipação na Home
  #  Given open portal "<alianca>" and logon
  #  #Given que estou na tela “início” do Portal
  #  And "item Antecipação" está disponível na "Home - acesso rápido"
  #  When usuário clica no "item Antecipação" na "Home - acesso rápido"
  #  Then será direcionado para a jornada de "Antecipação"
  #  |Usuario secundario |https://bin.qa.portaldocliente.fiserv.com                |bressan@sec    |Fiserv@456   |
  #colocar por yaml
  # |Usuario Com F      |https://bin.qa.portaldocliente.fiserv.com/operador       |bressan@sec    |Fiserv@456   |
  #|Usuario Com F      |https://afinz.qa.portaldocliente.fiserv.com/operador     |bressan@sec    |Fiserv@456   |
  # |Usuario Com F      |https://azulzinha.qa.portaldocliente.fiserv.com/operador |bressan@sec    |Fiserv@456   |
  # |Usuario Com F      |https://sicredi.qa.portaldocliente.fiserv.com/operador   |bressan@sec    |Fiserv@456   |
  #|Usuario Sem F      |https://sicredi.qa.portaldocliente.fiserv.com/externo    |bressan@sec    |Fiserv@456     |
  #|Usuario Sem F      |https://afinz.qa.portaldocliente.fiserv.com/externo      |bressan@sec    |Fiserv@456     |
  #@TestCaseKey=LPDC-T53
  #Scenario Outline: Relatórios na Home
  #  Given open portal "<alianca>" and logon
  #  #Given que estou na tela “início” do Portal
  #  And "item Relatórios" está disponível na "Home - acesso rápido"
  #  When usuário clica no "item Relatórios" na "Home - acesso rápido"
  #  Then será direcionado para a jornada de "Relatórios"
  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Documentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Documentos
  #@TestCaseKey=LPDC-T107
  #Scenario Outline: : Informe de rendimentos na Home
  #  Given open portal "<alianca>" and logon
  #  #Given que estou na tela “início” do Portal
  #  And "item Informe de rendimento" está disponível na "Home - acesso rápido"
  #  When usuário clica no "item Informe de rendimento" na "Home - acesso rápido" e uma nova aba se abre
  #  Then será direcionado para a jornada de "Informe de rendimento" na nova aba
  #@TestCaseKey=LPDC-T236
  #Scenario Outline: : Vendas na Home
  #  Given open portal "<alianca>" and logon
  #  #Given que estou na tela “início” do Portal
  #  And "item Vendas" está disponível na "Home - acesso rápido"
  #  When usuário clica no "item Vendas" na "Home - acesso rápido"
  #  Then será direcionado para a jornada de "Vendas Hoje"
  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Detalhe de pagamentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Detalhe de pagamentos
  # TODO: aguardar corrigir o testId
  # @TestCaseKey=LPDC-T362
  # Scenario Outline: Negócio na Home
  #   Given open portal "<alianca>" and logon
  #   #Given que estou na tela “início” do Portal
  #   And "item Meu negócio" está disponível na "Home - acesso rápido"
  #   When usuário clica no "item Meu negócio" na "Home - acesso rápido"
  #   Then será direcionado para a jornada de "Negócio"
  # @TestCaseKey=LPDC-T274
  # Scenario Outline: Solicitações na Home
  #   Given open portal "<alianca>" and logon
  #Given que estou na tela “início” do Portal
  #   And "item Solicitações" está disponível na "Home - acesso rápido"
  #   When usuário clica no "item Solicitações" na "Home - acesso rápido"
  #   Then será direcionado para a jornada de "Solicitações"
  #*Dado* que eu sou um cliente MDR FLEX
  #*Quando* me logar ao Portal
  #*Então* não devo visualizar no acesso rápido a opção “Antecipação”
  #
  #*Dado* que eu sou um cliente MDR PADRÃO
  #*Quando* me logar ao Portal
  #*Então* devo visualizar no acesso rápido a opção “Antecipação”
  #
  #{panel}
  #{panel:title=CENÁRIO DE TESTE|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=2}
  #h6. *CENÁRIOS: VALIDAÇÕES DE DIRECIONAMENTOS DOS BOXES DA HOME *
  #
  #
  #*Dado* que estou na tela “início” do Portal
  #*Então* devo visualizar uma espécie de carrossel com quatro funcionalidades “default” sendo elas “Antecipação”, “Relatórios”, “Documentos” e “Informe de rendimento”, respectivamente.
  #
  @TestCaseKey=LPDC-T100
  Scenario Outline: Banner de comunicação comercial maquininha
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Usuário verá em "Home - Maquininha" o valor "<descrição>"
    And Usuário verá em "Home - Maquininha - Botão Confira" o valor "<texto botão>"
    And logout
    @sicredi @alliances @banner
    Examples:
      | Description    | alianca | descrição                           | texto botão |
      | Usuario master | sicredi | Veja as vantagens da sua maquininha | Confira     |

    @afinz @alliances  @banner
    Examples:
      | Description    | alianca | descrição                           | texto botão |
      | Usuario master | afinz   | Veja as vantagens da sua maquininha | Confira     |

    @azulzinha @alliances  @banner
    Examples:
      | Description    | alianca   | descrição                           | texto botão |
      | Usuario master | azulzinha | Veja as vantagens da sua maquininha | Confira     |

    @bin @alliances  @banner
    Examples:
      | Description    | alianca | descrição                           | texto botão |
      | Usuario master | bin     | Veja as vantagens da sua maquininha | Confira     |

  @TestCaseKey=LPDC-T260
  Scenario Outline: Drill Down Vendas Hoje
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    When usuário clica "Home - Card Vendas Hoje - Ver Tudo"
    And check screen text "Vendas"
    And logout
    @sicredi @alliances @vendasHoje
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @vendasHoje
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @vendasHoje
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @vendasHoje
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  # TODO: fix to use anticipation linked to data-testid
  @TestCaseKey=LPDC-T258
  Scenario Outline: Drill down Recebimentos
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And Usuário clica em ver tudo no card "Recebimentos"
    And check screen text "Recebimentos"
    And logout
    @sicredi @alliances @Recebimentos
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @Recebimentos
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @Recebimentos
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @Recebimentos
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T487
  Scenario Outline: Drill down Antecipação
    Given open portal "<alianca>" and logon
    #Then Usuário estará com acesso e sessão foi salva
    #And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Usuário verá card Antecipação
    And Usuário verá em "Home - Card Antecipação - Botão Ir" o valor "<texto botão>"
    And check screen text "Antecipação"
    And logout
    @sicredi @alliances @Antecipação
    Examples:
      | Description    | alianca | texto botão         |
      | Usuario master | sicredi | Ir para antecipação |

  @TestCaseKey=LPDC-T490
  Scenario Outline: Drill down Ultimas vendas
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And Usuário clica em ver tudo no card "Últimas vendas"
    And check screen text "Vendas"
    And logout
    @sicredi @alliances @UltimasVendas
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances @UltimasVendas
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances @UltimasVendas
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances @UltimasVendas
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T489
  Scenario Outline: Drill down Agenda de recebimentos da semana
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And Usuário clica em ver tudo no card "Agenda de recebimentos da semana"
    And check screen text "Recebimentos"
    And logout
    @sicredi @alliances @AgeRecSemana
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances @AgeRecSemana
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances @AgeRecSemana
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances @AgeRecSemana
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T350
  Scenario Outline: Validação de calculos Card Recebimentos
    Given open portal "<alianca>" and logon
    #Then Usuário estará com acesso e sessão foi salva
    #And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Calcula Card Recebimentos
    And logout
    @sicredi @alliances @CalcCardRec
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances  @CalcCardRec
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances  @CalcCardRec
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances  @CalcCardRec
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T386
  Scenario Outline: Ocultar valores da Home
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "R$ ••••"
    And Usuário verá em "Home - Card Recebimento - Total Recebimento" o valor "R$ ••••"
    And Usuário verá em "Home - Card Recebimento - Recebimento Hoje" o valor "R$ ••••"
    And Usuário verá em "Home - Card Recebimento - Recebimento Previsto" o valor "R$ ••••"
    And Usuário verá em todos os campos "Home - Card Últimas Vendas - Valor" o valor "R$ ••••" - se existir
    And Usuário verá em todos os campos "Home - Card Antecipação - Valor" o valor "R$ •••• /" - se existir
    And Usuário verá em "Home - Agenda Recebimento - Valor Segunda" o valor "R$ ••••" - se existir
    And Usuário verá em "Home - Agenda Recebimento - Valor Terça" o valor "R$ ••••" - se existir
    And Usuário verá em "Home - Agenda Recebimento - Valor Quarta" o valor "R$ ••••" - se existir
    And Usuário verá em "Home - Agenda Recebimento - Valor Quinta" o valor "R$ ••••" - se existir
    And Usuário verá em "Home - Agenda Recebimento - Valor Sexta" o valor "R$ ••••" - se existir
    And logout
    @sicredi @alliances @Ocultarvalores
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

  @TestCaseKey=LPDC-T126
  Scenario Outline: Abrir Modal Personalizar Acesso Rápido (inclui Adiantamento)
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    When clicar no botão "Personalizar"
    Then devo visualizar a um modal com demais <funcionalidades> para escolher
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                             |
      | Usuario master | sicredi | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @afinz @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                             |
      | Usuario master | afinz   | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | funcionalidades                                                                             |
      | Usuario master | azulzinha | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @bin @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                             |
      | Usuario master | bin     | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

  @TestCaseKey=LPDC-T112
  Scenario Outline: recebimentos futuros existem
    Given open portal "<alianca>" and logon
    #Then Usuário estará com acesso e sessão foi salva
    #And Todas as requisições HTTP foram respondidas
    #Given que estou na tela “início” do Portal
    And existem valores futuros a receber
    Then usuário verá em "Home - Card Recebimento - Recebimento Previsto" valor maior que 0,00
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

  @TestCaseKey=LPDC-T64
  Scenario Outline: Recebimentos Hoje no card Recebimentos é igual a API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API
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

  @TestCaseKey=LPDC-T62
  Scenario Outline: Valor de Recebimentos Futuros Previstos na Home é igual à API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API
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

  @TestCaseKey=LPDC-T130
  Scenario Outline: Valor de Vendas Hoje na Home é igual à API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API
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

  @TestCaseKey=LPDC-T275
  Scenario Outline: Busca de código EC valido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente o EC correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
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

  @TestCaseKey=LPDC-T349
  Scenario Outline: Busca de código EC inválido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
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

  @TestCaseKey=LPDC-T390
  Scenario Outline: Busca de Documento (CNPJ ou CPF) inválido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
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

  @TestCaseKey=LPDC-T399
  Scenario Outline: Validar botão “X” no componente “Buscar por documento” na aba Documento na tela de personalize sua visualização (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário poderá limpar a busca clicando no X
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

  @TestCaseKey=LPDC-T118
  Scenario Outline: Busca de documento válido aba Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento'
    Then Filtro apresentará somente a informação correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
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

  @TestCaseKey=LPDC-T54
  Scenario Outline: Usuário não existente no GA1 nem no GA2 e sem cadastro na Fiserv
    Given open portal "<alianca>" and logon
    And Usuário clicou no botão esqueci minha senha
    When Usuário tenta recuperar senha com "81633816000210"
    Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"
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

  @TestCaseKey=LPDC-T115
  Scenario Outline: Busca de documento inválido aba Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
    #And Botão "Trocar Estabelecimento - Botão Acessar" estará visível e desabilitado
    #And Botão "Trocar Estabelecimento - Marcar como Padrão" estará visível e desabilitado
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

  #======================================================================================================================
  #==testes falhando sicredi
  @TestCaseKey=LPDC-T341
  Scenario Outline: Validar Campos do Personalize sua Visualização aba Documento. (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When usuário clica no "Botão Todos Documentos" em "Trocar Estabelecimento"
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou nome"
    And Usuário verá em "Trocar Estabelecimento - Botão Todos Documentos - Explicação" o texto "Essa visão irá agrupar todos os estabelecimentos abaixo do documento "
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma consolidada, agrupando os estabelecimentos abaixo do documento. Você poderá alterar a seleção a qualquer momento no portal."
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

  @TestCaseKey=LPDC-T242
  Scenario Outline: Valida Nomes, CNPJ/CPFs, número EC e status com API
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    And usuário clica no "Botão selecionar por Estabelecimento" em "Trocar Estabelecimento"
    Then Todos Nomes, CNPJ CPFs, número ECs e status são iguais a API
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

  @TestCaseKey=LPDC-T119
  Scenario Outline: abrir notificações
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And Usuário tinha de mais de uma notificação
    When usuário clica no "Notificações" na "Header"
    Then o Portal deve abrir as "Minhas Notificações"
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

  @TestCaseKey=LPDC-T270
  Scenario Outline: recebimentos futuros não existem
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And não existem valores futuros para receber
    Then Usuário verá em "Home - Card Recebimento - Recebimento Previsto" o valor "R$ 0,00"
    And logout
    @sicredi @alliances @RecebimentoPrevisto
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

  @TestCaseKey=LPDC-T134
  Scenario Outline: Redirecionamento Correto (Usuário Master) - o usuário verá modal Personalizar ao logar
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO
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

  @TestCaseKey=LPDC-T104
  Scenario Outline: Validar Campos do Personalize sua Visualização aba Estabelecimento. (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento, ou número do estabelecimento ou nome"
    And Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma correspondente ao estabelecimento escolhido. Você poderá alterar a seleção a qualquer momento no portal."
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

  @TestCaseKey=LPDC-T255
  Scenario Outline: Compara últimas vendas na Home com a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And encontrou o campo "Home - Card Últimas Vendas - Valor"
    Then 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API
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

  @TestCaseKey=LPDC-T55
  Scenario Outline: Validar não seleção no checkbox de não mostrar novamente (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO
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

  @TestCaseKey=LPDC-T267
  Scenario Outline: Validação do Botão Acessar (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Documento estará previamente selecionado
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

  @TestCaseKey=LPDC-T116
  Scenario Outline: Abrir Modal Personalizar Acesso Rápido (exclui Adiantamento)
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    When clicar no botão "Personalizar"
    Then devo visualizar a um modal com demais <funcionalidades> para escolher
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                |
      | Usuario master | sicredi | Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @afinz @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                |
      | Usuario master | afinz   | Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | funcionalidades                                                                |
      | Usuario master | azulzinha | Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

    @bin @alliances
    Examples:
      | Description    | alianca | funcionalidades                                                                |
      | Usuario master | bin     | Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

  @TestCaseKey=LPDC-T99
  Scenario Outline: Validar expansão do dropdown na aba Estabelecimento. (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário expande primeiro dropdown
    Then O primeiro dropdown estará expandido
    And O dropdown conterá com as informações de Nome fantasia do EC
    And O dropdown conterá com as informações de número do EC
    And O dropdown conterá com as informações do status do EC no BW
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

  @TestCaseKey=LPDC-T381
  Scenario Outline: Busca de Documento (CNPJ ou CPF) válido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente EC do documento correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
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

  # TODO: fix to use anticipation linked to data-testid
  # TODO: fix this: And Usuário não verá botão com texto "<texto botão>"
  @TestCaseKey=LPDC-T382
  Scenario Outline: Usuário MDR Padrão NÃO verá card "Receba antes"
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then Usuário não verá card Antecipação
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

  @TestCaseKey=LPDC-T121
  Scenario Outline: Valor de vendas hoje e percentual no card Vendas Hoje do Home
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "<valor venda>"
    And Usuário verá em "Home - Card Vendas Hoje - Percentual Vendas Hoje" o valor "<percentual>"
    @sicredi @alliances
    Examples:
      | Description    | alianca | valor venda  | percentual |
      | Usuario master | sicredi | R$ 55.400,00 | 21%        |

    @afinz @alliances
    Examples:
      | Description    | alianca | valor venda  | percentual |
      | Usuario master | afinz   | R$ 55.400,00 | 21%        |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   | valor venda  | percentual |
      | Usuario master | azulzinha | R$ 55.400,00 | 21%        |

    @bin @alliances
    Examples:
      | Description    | alianca | valor venda  | percentual |
      | Usuario master | bin     | R$ 55.400,00 | 21%        |

  # não tenho certeza se este teste está correto
  @TestCaseKey=LPDC-T106
  Scenario Outline: Compara agenda de recebimento da semana com a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then 'Home - Card agenda semana' será igual a API
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

  # TODO: confirmar a api
  @UsuárioComHierarquia
  @TestCaseKey=LPDC-T266
  Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado
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

  # TODO: confirmar a api
  @TestCaseKey=LPDC-T237
  Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado
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

  # não tenho certeza se este teste está correto
  @TestCaseKey=LPDC-T361
  Scenario Outline: Está trazendo todos os ECs no card Adiantamento igual a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then 'Home - Card Antecipação - ECs' são os mesmos que a API
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

  @TestCaseKey=LPDC-T437
  Scenario Outline: Validar seleção no checkbox de não mostrar novamente (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "marcada"
    Then Usuário estará com acesso e sessão foi salva
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

  @TestCaseKey=LPDC-T105
  Scenario Outline: conteúdo correto da Agenda de recebimentos da semana
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados
    @sicredi @alliances @_agenda
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances @_agenda
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances @_agenda
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances @_agenda
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T110
  Scenario Outline: destaque para as informações da agenda de recebimentos
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará o dia "hoje" destacado e os dias anteriores com valores verdes e os próximos com letras pretas
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

  @TestCaseKey=LPDC-T123
  Scenario Outline: Agenda de recebimentos da semana vazia
    Given open portal "<alianca>" and logon
    And não existir Agenda de recebimentos da semana para exibir
    Then Usuário verá em "Home - Agenda de recebimentos da semana - mensagem" o valor "Você não possui nenhum recebimento previsto para essa semana."
    And usuário visualizará um botão "Ver recebimentos detalhado"
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

