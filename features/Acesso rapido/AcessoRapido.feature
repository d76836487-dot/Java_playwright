#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Acesso_Rapido/Acesso_Rápido
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
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
  @TestCaseKey=SMP-T84
  Scenario: Negócio no acesso rápido
    Given que estou na tela “início” do Portal
    And "item Meu negócio" está disponível na "Home - acesso rápido"
    When usuário clica no "item Meu negócio" na "Home - acesso rápido"
    Then será direcionado para a jornada de "Negócio"

  @PermiteSolicitações
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
