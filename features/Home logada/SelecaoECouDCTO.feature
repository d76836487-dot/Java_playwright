#language: en
@playwright @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Seleção_de_EC_ou_DCTO_-_Usuário_Master
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Seleção de EC ou DCTO - Usuário Master

  @TestCaseKey=SMP-T172
  Scenario: Redirecionamento Correto (Usuário Master) - o usuário verá modal Personalizar ao logar
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' desmarcada
    Then Usuário verá modal para selecionar EC ou DTCO

  Scenario: Validar Campos do Personalize sua Visualização aba default Estabelecimento. (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    Then Usuário visualizará a aba Estabelecimento por padrão
    And Usuário verá em "Header - Trocar Estabelecimento - Modal - Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou número do estabelecimento"
