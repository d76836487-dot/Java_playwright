#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Home Logada

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T16
  Scenario Outline: Banner de comunicação comercial
    Given Usuário acessou o Home
    Then Usuário verá mensagem "<descrição>"
    And Usuário verá botão com texto "<texto botão>"
    @pt-br
    Examples:
      | descrição                           | texto botão |
      | Veja as vantagens da sua maquininha | Confira     |

  @TestCaseKey=SMP-T19
  Scenario: Usuário será direcionado ao Vendas Hoje ao clicar em Ver Tudo da seção Vendas Hoje
    Given Usuário acessou o Home
    When usuário clica "na seção Vendas Hoje - Ver Tudo"
    Then será direcionado ao menu "Vendas Hoje"

  # TODO: fix to use anticipation linked to data-testid
  @MDRPadrão @PermiteAdiantamento
  @TestCaseKey=SMP-T17
  Scenario Outline: Usuário MDR Padrão verá card "Receba antes"
    Given Usuário acessou o Home
    Then Usuário verá card Antecipação
    And Usuário verá botão com texto "<texto botão>"
    @pt-br
    Examples:
      | texto botão         |
      | Ir para antecipação |

  # TODO: fix to use anticipation linked to data-testid
  # TODO: fix this: And Usuário não verá botão com texto "<texto botão>"
  @MDRPadrão @NaoPermiteAdiantamento
  @TestCaseKey=SMP-T18
  Scenario: Usuário MDR Padrão NÃO verá card "Receba antes"
    Given Usuário acessou o Home
    Then Usuário não verá card Antecipação

  # TODO: fix me when we have 'rebatedores'
  @ignore
  @TestCaseKey=SMP-T24
  Scenario Outline: Valor de vendas hoje e percentual no card Vendas Hoje do Home
    Given Usuário acessou o Home
    Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "<valor venda>"
    And Usuário verá em "Home - Card Vendas Hoje - Percentual Vendas Hoje" o valor "<percentual>"
    @pt-br
    Examples:
      | valor venda  | percentual |
      | R$ 55.400,00 | 21%        |

  @TestCaseKey=SMP-T26
  Scenario: Total de Recebimentos na Home deve ser igual ao de hoje de futuro previstos
    Given Usuário acessou o Home
    Then Total de Recebimentos será igual ao recebimento de hoje + futuro previsto

  Scenario: Valor de Vendas Hoje na Home é igual à API
    Given Usuário acessou o Home
    Then Total de "Home - Card Vendas Hoje - Valor Vendas Hoje" será igual à API

  # História não é testável...
  #*Dado* que eu faça o login no Portal
  #*Quando* abrir a tela principal “início”
  #*Então* devo visualizar a nova Home com todos os componentes de acordo com o Figma
  #https://www.figma.com/file/8CGYv8LIHXTkuQctMyemss/Merchant-Portal?node-id=13407%3A10749
  #
  # História não é testável...
  #*Dado* que eu faça o login no Portal
  #*Quando* abrir a tela principal “início”
  #*Então* devo visualizar a tabbar de acordo com o Figma (Frame 8364)
  #https://www.figma.com/file/8CGYv8LIHXTkuQctMyemss/Merchant-Portal?node-id=13407%3A10749
  # Será coberto por cada uma das opções, ex: VendasHoje testará o botão vendas
  #
  #*Dado* que eu faça o login no Portal
  #*Quando* abrir a tela principal “início”
  #*E* passar o mouse sobre os ícones do menu lateral (qualquer ícone)
  #*Então* o menu deve expandir para a direita sobrepondo os itens da come com os respectivos nomes (Frame 8364)
  #
  # Quais valores? O que são respectivos? História não é testável...
  #*Dado* que eu faça o login no Portal
  #*Quando* abrir a tela principal “início”
  #*E* tiver valores para exibir
  #*Então* devo visualizar valores nos respectivos boxes da home
  #
  #*Dado* que estou na tela “início” do Portal
  #*Quando* realizar vendas usando a minha máquina
  #*Então* devo visualizar as minhas últimas três vendas – limitado ao último mês - listadas com detalhes como bandeira, valor, modalidade, horário e parcelas se for pertinente
  #
  # não vamos testar mdf flex
  #*Dado* que loguei no Portal com um EC com plano de recebimento MDR FLEX
  #*Quando* estiver na tela “início”
  #*Então* não devo visualizar o card “Receba antes” e o botão antecipar
  #
  #{panel}
  #{panel:title=CENÁRIO DE TESTE|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=2}
  #h6. *CENÁRIOS: VALIDAÇÕES DE DIRECIONAMENTOS DOS BOXES DA HOME *
  #
  #*Dado* que eu faça login no Portal
  #*Quando* abrir a tela principal “início”
  #*E* clicar no ícone “notificações”
  #*Então* o Portal deve abrir as minhas notificações
  #
  #*Dado* que eu faça login no App e tenha mais de um EC vinculado ao meu documento
  #*Quando* abrir a tela principal “início”
  #*E* clicar no ícone “v” no boxe com o nome, CNPJ e EC
  #*Então* devo visualizar o modal “Alterar estabelecimento” com todos os ECs atrelados ao meu documento
  #
  #*Dado* que eu troquei o meu EC dentro do App
  #*Quando* as informações carregarem
  #*Então* devo visualizar os valores do EC selecionado
  #
  #*Dado* que sou um cliente MDR Flex
  #*Quando* estiver na tela “início” do Portal
  #*Então* não devo visualizar o carde de Antecipação
  #
  #*Dado* que sou um cliente MDR Padrão e estou na tela “início” do Portal
  #*Quando* eu tiver valores livres para antecipar
  #*Então* devo visualizá-los no card “Receba antes” e o botão “Antecipar” habilitado
  #
  #*Dado* que sou um cliente MDR Padrão e estou na tela “início” do Portal
  #*Quando* eu não tiver valores livres para antecipar
  #*Então* devo visualizar o card “Antecipação” com a mensagem “Você não possui valores disponíveis para antecipar” (Frame 8368)
  #
  #*Dado* que sou um cliente MDR Padrão e estou na tela “início” do Portal
  #*Quando* eu já tiver antecipação automática cadastrada
  #*Então* devo visualizar o card “Antecipação” com a mensagem “Você possui antecipação automática cadastrada” (Frame 8369)
  #
  #*Dado* que estou na tela “início” do Portal
  #*Então* devo visualizar uma espécie de carrossel com quatro funcionalidades “default” sendo elas “Antecipação”, “Relatórios”, “Documentos” e “Informe de rendimento”, respectivamente.
  @TestCaseKey=SMP-T20
  Scenario Outline: Abrir Modal Personalizar Acesso Rápido
    Given Usuário acessou o Home
    When clicar no botão "Personalizar"
    Then devo visualizar a um modal com demais <funcionalidades> para escolher
    @pt-br
    Examples:
      | funcionalidades                                                                             |
      | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |

#
#
#*Dado* que estou na tela “início” do Portal
#*Quando* realizar vendas usando a minha máquina
#*Então* devo visualizar as últimas três vendas listadas com detalhes como bandeira, valor, modalidade, horário e número de parcelas se pertinente
#
#*Dado* que estou na tela “início” do Portal
#*Quando* eu tiver valores a receber ou recebidos no dia
#*Então* devo visualizá-los no boxe Recebimentos > “Recebimentos de hoje”
#
#*Dado* que estou na tela “início” do Portal
#*Quando* eu não tiver valores a receber ou recebidos no dia
#*Então* devo visualizar R$ 0,00 no boxe Recebimentos > “Recebimentos de hoje”
#
#*Dado* que estou na tela “início” do Portal
#*Quando* eu tiver valores futuros a receber
#*Então* devo visualizá-los no boxe Recebimentos > “Recebimentos futuros previstos”
#
#*Dado* que estou na tela “início” do Portal
#*Quando* não tiver valores futuros para receber
#*Então* devo visualizar 0,00 no boxe Recebimentos > “Recebimentos futuros previstos”
#
#*Dado* que estou na tela “início” do Portal
#*Quando* não tiver agenda de recebimentos da semana para exibir
#*Então* devo visualizar a mensagem “Você não possui nenhum recebimento previsto para essa semana”
#*E* um botão “Ver recebimentos detalhado”
#
#{panel}
#h2. INFORMAÇÕES ADICIONAIS
#{panel:title=SISTEMAS ENVOLVIDOS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1} Preencher lista de sistemas
#{panel}
#{panel:title=CANAIS ENVOLVIDOS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1} Portal
#{panel}
#{panel:title=FORA DO ESCOPO|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#Mudanças nas jornadas que decorrem do botão “ver tudo”
#{panel}
#{panel:title=TECNOLOGIAS ENVOLVIDAS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1} Preencher lista de sistemas
#{panel}
#{panel:title=ARTEFATOS GERADOS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#FIGMA https://www.figma.com/file/8CGYv8LIHXTkuQctMyemss/Merchant-Portal?node-id=13407%3A10749
#{panel}
#{panel:title=INTEGRAÇÕES|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#integração com API do BW
#{panel}
#{panel:title=TELAS/PROTÓTIPOS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#https://www.figma.com/file/8CGYv8LIHXTkuQctMyemss/Merchant-Portal?node-id=13407%3A10749
#{panel}
#{panel:title=TAQUEAMENTO|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#Solicito tagueamento da jornada end to end conforme PPT anexado na story.
#{panel}
#{panel:title=SISTEMA CROSS|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#integração com BW
#{panel}
#{panel:title=LIGA/DESLIGA|borderStyle=solid|borderColor=#000|titleBGColor=#e3e3e3|bgColor=#f4f4f4|borderWidth=1}
#Sim. Necessário desenvolver todos os cards com feature toggle.
#{panel}
