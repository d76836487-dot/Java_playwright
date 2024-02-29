#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Ajuda/WhatsApp
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Validação componente Whatsapp nas instituições BIN 003 ou 007

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas

  Scenario: Visualização do componente Whatsapp
    Given que estou na tela “início” do Portal
    When usuário clica "Header - Ajuda"
    Then usuário visualiza o componente WhatsApp na cor azul no canto inferior à direita da tela

  Scenario: Validação da flutuação do componente Whatsapp
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente Whatsapp acompanhando a rolagem da tela
