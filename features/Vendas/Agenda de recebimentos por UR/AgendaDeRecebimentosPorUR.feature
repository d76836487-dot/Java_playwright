#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Agenda_de_recebimentos_por_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR

#  Background:
#    When Usuário tenta logar na aplicação
#    Then Usuário estará com acesso e sessão foi salva
#    And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T300
  Scenario: Acesso a Agenda de recebimentos por UR Com apenas um Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionar um documento e clicar Acessar
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário não verá em "Agenda de recebimentos por UR" opção de Alterar Documento

  Scenario: Acesso a Agenda de recebimentos por UR Com vários Documentos
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessou o Home
    When Usuário passa o mouse sobre "Menu Lateral - Recebimentos"
    And usuário clica em "Agenda de Recebimentos UR" no "Menu Lateral"
    Then usuário verá em "Agenda de recebimentos por UR" opção de Alterar Documento
    And selecionando o Documento no Header o Usuário visualizara o Respectivo Documento selecionado

