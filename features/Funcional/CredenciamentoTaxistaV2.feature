#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Credenciamento_Taxista_V2
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Credenciamento Taxista V2

  Scenario: Acessando a Home
    Given usuário tenha CPF que ja tenha sido credenciado
    When acessar o link: https://azulzinha.qa.portaldocliente.fiserv.com/taxista/home
    Then ele visualizara a Home
    And Rolando o Scroll para baixo ele vera o Botão:  Quero minha azuzinha ,na cor laranja


  Scenario: Cliente Com CPF existente
    Given Usuário esta na Home
    When rolar o Scroll do mouse para baixo
    And Clicar no Botão: Quero Minha azuzinha
    Then ele sera Direcionado a tela: Para Começar seu cadastro


  Scenario: Cadastro Com CPF existente
    Given Usuario esta na Tela Para Começar seu Cadastro
    When preencher os campos Obrigatorios: Nome Completo, Data de Nascimento, Celular para contato,Email
    And Sobre seu negocio: preencher com CPF ja existente
    Then sera direcionado para uma proxima Tela aonde tera a mensagem
  #Você já possui uma conta na azulzinha!
  #Este CPF já está registrado em nosso sistema. Obrigado por se cadastrar e por fazer parte da nossa rede!
    And Botão X para fechar a Tela


  Scenario: Fechando Modal atraves do Botão X
    Given Usuario esta na Tela onde informa que ele ja possui conta
    When selecionar o Botão X
    Then sera Redirecionado para Tela Inicial


  #Sem CPF existente
  Scenario: Acessando a Home
    Given usuário tenha CPF que não tenha sido credenciado
    When acessar o link:https://azulzinha.qa.portaldocliente.fiserv.com/taxista/home
    Then ele visualizara a Home
    And Rolando o Scroll para baixo ele vera o Botão:  Quero minha azuzinha ,na cor laranja


  Scenario: Cliente Sem CPF existente
    Given Usuário esta na Home
    When rolar o Scroll do mouse para baixo
    And Clicar no Botão: Quero Minha azuzinha
    Then ele sera Direcionado a tela: Para Começar seu cadastro


  Scenario: Cadastro Sem CPF existente
    Given Usuario esta na Tela Para Começar seu Cadastro
    When preencher os campos Obrigatorios: Nome Completo, Data de Nascimento, Celular para contato,Email
    And Sobre seu negocio preencher com: CPF, Nome fantasia, Faturamento, Ticket Médio
    Then o Botão: Próximo Ficara habilitado para seguir a Jornada
