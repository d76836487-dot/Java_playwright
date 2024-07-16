#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Home
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home

  OBJETIVO:
  Essa história tem como objetivo a criação de uma nova home logada para o cliente obter informações em real time quando
  se logar no Portal, além de navegar em uma jornada com novo Design Sistem.
  Essa demanda é para todas as alianças usuárias do App: Bin, FBD, Caixa, Afinz, Sicredi e Redepop.
  VISÃO DO USUÁRIO:
  *Eu como* usuário do Portal
  *Quero* visualizar uma nova Home logada
  *Para* ter acesso a informações real time com um novo Design Sistem
  TIPO DE MANUTENÇÃO:
  Criação
  ESCOPO:
  - Visualizar sessão “Acesso rápido” com botão “Personalizar” no canto direito
  - CLIENTE MDR PADRÃO - Visualizar quatro box que por default serão “Antecipação”, “Relatórios”, “Documentos” e “Informe de rendimento”, respectivamente.
  - CLIENTE MDR FLEX - Visualizar quatro box que por default serão “Meu negócio”, “Relatórios”, “Documentos” e “Informe de rendimento”, respectivamente.
  - Visualização de um modal quando o cliente clicar em “personalizar” com duas linhas, uma com os “Atalhos selecionados” e outra com “Outros serviços”
  - CLIENTE MDR PADRÃO - Devemos permitir que o cliente selecione Antecipação, Relatórios, Documentos, Informe de rendimento, Vendas, Detalhe de pagamentos, Meu negócio e solicitações.
  - CLIENTE MDR FLEX - Devemos permitir que o cliente selecione Meu negócio, Relatórios, Documentos, Informe de rendimento, Vendas, Detalhe de pagamentos e solicitações.

 # Background:
#    When Usuário loga na aplicação
 #   Then Usuário estará com acesso e sessão foi salva


  Scenario Outline: Antecipação na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Antecipação" está disponível na "Home - acesso rápido"
    When usuário clica no "item Antecipação" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Antecipação"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

  #  |Usuario secundario |https://bin.qa.portaldocliente.fiserv.com                |bressan@sec    |Fiserv@456   |
#colocar por yaml
   # |Usuario Com F      |https://bin.qa.portaldocliente.fiserv.com/operador       |bressan@sec    |Fiserv@456   |
   #|Usuario Com F      |https://afinz.qa.portaldocliente.fiserv.com/operador     |bressan@sec    |Fiserv@456   |
   # |Usuario Com F      |https://azulzinha.qa.portaldocliente.fiserv.com/operador |bressan@sec    |Fiserv@456   |
   # |Usuario Com F      |https://sicredi.qa.portaldocliente.fiserv.com/operador   |bressan@sec    |Fiserv@456   |
    #|Usuario Sem F      |https://sicredi.qa.portaldocliente.fiserv.com/externo    |bressan@sec    |Fiserv@456     |
    #|Usuario Sem F      |https://afinz.qa.portaldocliente.fiserv.com/externo      |bressan@sec    |Fiserv@456     |



  Scenario Outline:Relatórios na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Relatórios" está disponível na "Home - acesso rápido"
    When usuário clica no "item Relatórios" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Relatórios"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Documentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Documentos

  Scenario Outline:: Informe de rendimentos na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Informe de rendimento" está disponível na "Home - acesso rápido"
    When usuário clica no "item Informe de rendimento" na "Home - acesso rápido" e uma nova aba se abre
    Then será direcionado para a jornada de "Informe de rendimento" na nova aba
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline:: Vendas na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Vendas" está disponível na "Home - acesso rápido"
    When usuário clica no "item Vendas" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Vendas Hoje"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Detalhe de pagamentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Detalhe de pagamentos
  # TODO: aguardar corrigir o testId

  Scenario Outline: Negócio na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Meu negócio" está disponível na "Home - acesso rápido"
    When usuário clica no "item Meu negócio" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Negócio"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |




  Scenario Outline: Solicitações na Home
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And "item Solicitações" está disponível na "Home - acesso rápido"
    When usuário clica no "item Solicitações" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Solicitações"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

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






  Scenario Outline: Login com sucesso
    Given open portal "<alianca>" and logon
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  @alliances
  Scenario: Usuário não encontrado no GA1 nem no GA2 e sem cadastro na Fiserv
    When Usuário tenta logar na aplicação com "81633816000210" e "Fiserv@123"
    Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"



  Scenario Outline: Usuário tenta logar com senha errada
    When Usuário loga com senha errada
    And Todas as requisições HTTP foram respondidas
    Then Usuário verá em "Login - mensagem de erro" o valor "<descrição>"
    @pt-br
    Examples:
      | descrição                                                                                           |
      | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |



  Scenario Outline: Banner de comunicação comercial
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Usuário verá em "Home - Maquininha" o valor "<descrição>"
    And Usuário verá em "Home - Maquininha - Botão Confira" o valor "<texto botão>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |descrição                           | texto botão |
      |Usuario master     |sicredi  | Veja as vantagens da sua maquininha | Confira     |
    @afinz @alliances
    Examples:
      |Description        |alianca  |descrição                           | texto botão |
      |Usuario master     |afinz    | Veja as vantagens da sua maquininha | Confira     |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |descrição                           | texto botão |
      |Usuario master     |azulzinha| Veja as vantagens da sua maquininha | Confira     |
    @bin @alliances
    Examples:
      |Description        |alianca  |descrição                           | texto botão |
      |Usuario master     |bin      | Veja as vantagens da sua maquininha | Confira     |


  Scenario Outline: Usuário será direcionado ao Vendas Hoje ao clicar em Ver Tudo da seção Vendas Hoje
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    When usuário clica "Home - Card Vendas Hoje - Ver Tudo"
    Then será direcionado ao menu "Vendas Hoje"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
# TODO: fix to use anticipation linked to data-testid


  Scenario Outline: Usuário MDR Padrão verá card "Receba antes"
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Usuário verá card Antecipação
    And Usuário verá em "Home - Card Antecipação - Botão Ir" o valor "<texto botão>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |texto botão         |
      |Usuario master     |sicredi  | Ir para antecipação |
    @afinz @alliances
    Examples:
      |Description        |alianca  |texto botão         |
      |Usuario master     |afinz    | Ir para antecipação |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |texto botão         |
      |Usuario master     |azulzinha| Ir para antecipação |
    @bin @alliances
    Examples:
      |Description        |alianca  |texto botão         |
      |Usuario master     |bin      | Ir para antecipação |


  Scenario Outline: Total de Recebimentos na Home deve ser igual ao de hoje de futuro previstos
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    Then Total de Recebimentos será igual ao recebimento de hoje + futuro previsto
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


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
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |





  Scenario Outline: Abrir Modal Personalizar Acesso Rápido (inclui Adiantamento)
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas
    Given Usuário acessou o Home
    When clicar no botão "Personalizar"
    Then devo visualizar a um modal com demais <funcionalidades> para escolher
    @sicredi @alliances
    Examples:
      |Description        |alianca  | funcionalidades                                                                             |
      |Usuario master     |sicredi  | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @afinz @alliances
    Examples:
      |Description        |alianca  | funcionalidades                                                                             |
      |Usuario master     |afinz    | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  | funcionalidades                                                                             |
      |Usuario master     |azulzinha| Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @bin @alliances
    Examples:
      |Description        |alianca  | funcionalidades                                                                             |
      |Usuario master     |bin      | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |


  Scenario Outline: recebimentos futuros existem
    Given open portal "<alianca>" and logon
  #Then Usuário estará com acesso e sessão foi salva
  #And Todas as requisições HTTP foram respondidas
  #Given que estou na tela “início” do Portal
    And existem valores futuros a receber
    Then usuário verá em "Home - Card Recebimento - Recebimento Previsto" valor maior que 0,00
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |




  Scenario Outline: Recebimentos Hoje no card Recebimentos é igual a API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Valor de Recebimentos Futuros Previstos na Home é igual à API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Valor de Vendas Hoje na Home é igual à API
    Given open portal "<alianca>" and logon
    Then Usuário estará com acesso e sessão foi salva
    Given Usuário acessou o Home
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API

    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de código EC valido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente o EC correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de código EC inválido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de Documento (CNPJ ou CPF) inválido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Validar botão “X” no componente “Buscar por documento” na aba Documento na tela de personalize sua visualização (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário poderá limpar a busca clicando no X
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de documento válido aba Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento'
    Then Filtro apresentará somente a informação correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Usuário não existente no GA1 nem no GA2 e sem cadastro na Fiserv
    Given open portal "<alianca>" and logon
    And Usuário clicou no botão esqueci minha senha
    When Usuário tenta recuperar senha com "81633816000210"
    Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de documento inválido aba Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
#And Botão "Trocar Estabelecimento - Botão Acessar" estará visível e desabilitado
#And Botão "Trocar Estabelecimento - Marcar como Padrão" estará visível e desabilitado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |




#======================================================================================================================
#==testes falhando sicredi



  Scenario Outline: Validar Campos do Personalize sua Visualização aba Documento. (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When usuário clica no "Botão Todos Documentos" em "Trocar Estabelecimento"
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou nome"
    And Usuário verá em "Trocar Estabelecimento - Botão Todos Documentos - Explicação" o texto "Essa visão irá agrupar todos os estabelecimentos abaixo do documento "
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma consolidada, agrupando os estabelecimentos abaixo do documento. Você poderá alterar a seleção a qualquer momento no portal."
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |




  Scenario Outline: Valida Nomes, CNPJ/CPFs, número EC e status com API
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    And usuário clica no "Botão selecionar por Estabelecimento" em "Trocar Estabelecimento"
    Then Todos Nomes, CNPJ CPFs, número ECs e status são iguais a API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: abrir notificações
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And Usuário tinha de mais de uma notificação
    When usuário clica no "Notificações" na "Header"
    Then o Portal deve abrir as "Minhas Notificações"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

  Scenario Outline: recebimentos futuros não existem
    Given open portal "<alianca>" and logon
#Given que estou na tela “início” do Portal
    And não existem valores futuros para receber
    Then Usuário verá em "Home - Card Recebimento - Recebimento Previsto" o valor "R$ 0,00"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Redirecionamento Correto (Usuário Master) - o usuário verá modal Personalizar ao logar
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Validar Campos do Personalize sua Visualização aba Estabelecimento. (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento, ou número do estabelecimento ou nome"
    And Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma correspondente ao estabelecimento escolhido. Você poderá alterar a seleção a qualquer momento no portal."
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Compara últimas vendas na Home com a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    And encontrou o campo "Home - Card Últimas Vendas - Valor"
    Then 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: Validar não seleção no checkbox de não mostrar novamente (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: Validação do Botão Acessar (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Documento estará previamente selecionado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Abrir Modal Personalizar Acesso Rápido (exclui Adiantamento)
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    When clicar no botão "Personalizar"
    Then devo visualizar a um modal com demais <funcionalidades> para escolher

    @sicredi @alliances
    Examples:
      |Description        |alianca  |funcionalidades                                                                |
      |Usuario master     |sicredi  |Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @afinz @alliances
    Examples:
      |Description        |alianca  |funcionalidades                                                                |
      |Usuario master     |afinz    |Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |funcionalidades                                                                |
      |Usuario master     |azulzinha|Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |
    @bin @alliances
    Examples:
      |Description        |alianca  |funcionalidades                                                                |
      |Usuario master     |bin      |Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |


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
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: Busca de Documento (CNPJ ou CPF) válido aba Estabelecimento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente EC do documento correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

# TODO: fix to use anticipation linked to data-testid
# TODO: fix this: And Usuário não verá botão com texto "<texto botão>"


  Scenario Outline: Usuário MDR Padrão NÃO verá card "Receba antes"
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then Usuário não verá card Antecipação
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: Valor de vendas hoje e percentual no card Vendas Hoje do Home
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "<valor venda>"
    And Usuário verá em "Home - Card Vendas Hoje - Percentual Vendas Hoje" o valor "<percentual>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |valor venda  | percentual |
      |Usuario master     |sicredi  | R$ 55.400,00 | 21%        |
    @afinz @alliances
    Examples:
      |Description        |alianca  |valor venda  | percentual |
      |Usuario master     |afinz    | R$ 55.400,00 | 21%        |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |valor venda  | percentual |
      |Usuario master     |azulzinha| R$ 55.400,00 | 21%        |
    @bin @alliances
    Examples:
      |Description        |alianca  |valor venda  | percentual |
      |Usuario master     |bin      | R$ 55.400,00 | 21%        |

 # não tenho certeza se este teste está correto

  Scenario Outline: Compara agenda de recebimento da semana com a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then 'Home - Card agenda semana' será igual a API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
 # TODO: confirmar a api
  @UsuárioComHierarquia

  Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

# TODO: confirmar a api

  Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

 # não tenho certeza se este teste está correto

  Scenario Outline: Está trazendo todos os ECs no card Adiantamento igual a API
    Given open portal "<alianca>" and logon
    Given Usuário acessou o Home
    Then 'Home - Card Antecipação - ECs' são os mesmos que a API
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: Validar seleção no checkbox de não mostrar novamente (Usuário Master)
    Given open portal "<alianca>" and logon
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "marcada"
    Then Usuário estará com acesso e sessão foi salva
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: conteúdo correto da Agenda de recebimentos da semana
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados
    @sicredi @alliances @_agenda
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances @_agenda
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances @_agenda
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances @_agenda
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |



  Scenario Outline: destaque para as informações da agenda de recebimentos
    Given open portal "<alianca>" and logon
    #Given que estou na tela “início” do Portal
    And existir Agenda de recebimentos da semana para exibir
    When visualizar o box "Agenda de recebimentos da semana"
    Then usuário visualizará o dia "hoje" destacado e os dias anteriores com valores verdes e os próximos com letras pretas
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |


  Scenario Outline: Agenda de recebimentos da semana vazia
    Given open portal "<alianca>" and logon
    And não existir Agenda de recebimentos da semana para exibir
    Then Usuário verá em "Home - Agenda de recebimentos da semana - mensagem" o valor "Você não possui nenhum recebimento previsto para essa semana."
    And usuário visualizará um botão "Ver recebimentos detalhado"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
    @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
    @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |