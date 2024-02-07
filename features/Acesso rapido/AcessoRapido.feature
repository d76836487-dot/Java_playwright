#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Acesso_Rapido/Acesso_Rápido
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Acesso Rápido

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

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  @PermiteAdiantamento
  @TestCaseKey=SMP-T25
  Scenario: Antecipação no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Antecipação" está disponível na "Home - acesso rápido"
    When usuário clica no "item Antecipação" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Antecipação"

  @TestCaseKey=SMP-T27
  Scenario: Relatórios no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Relatórios" está disponível na "Home - acesso rápido"
    When usuário clica no "item Relatórios" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Relatórios"

  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Documentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Documentos
  @TestCaseKey=SMP-T28
  Scenario: Informe de rendimentos no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Informe de rendimento" está disponível na "Home - acesso rápido"
    When usuário clica no "item Informe de rendimento" na "Home - acesso rápido" e uma nova aba se abre
    Then será direcionado para a jornada de "Informe de rendimento" na nova aba

  @TestCaseKey=SMP-T30
  Scenario: Vendas no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Vendas" está disponível na "Home - acesso rápido"
    When usuário clica no "item Vendas" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Vendas Hoje"

  #*Dado* que estou na tela “início” do Portal
  #*Quando* clicar no item Detalhe de pagamentos no acesso rápido
  #*Então* devo ser direcionado para a jornada de Detalhe de pagamentos

  # TODO: aguardar corrigir o testId
  @ignore
  Scenario: Negócio no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Meu negócio" está disponível na "Home - acesso rápido"
    When usuário clica no "item Meu negócio" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Negócio"

  @TestCaseKey=SMP-T32
  Scenario: Solicitações no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Solicitações" está disponível na "Home - acesso rápido"
    When usuário clica no "item Solicitações" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Solicitações"

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
#*Dado* que estou na tela “início” do Portal
#*Quando* clicar no botão “Personalizar”
#*Então* devo visualizar a um modal com essas funcionalidades para escolher - Antecipação, Relatórios, Documentos, Informe de rendimento, Vendas, Detalhe de pagamentos, Meu negócio e solicitações. (Frame 5540)
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
#
