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

  @TestCaseKey=SMP-T174
  Scenario: Validar Campos do Personalize sua Visualização aba default Estabelecimento. (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    Then Usuário visualizará a aba Estabelecimento por padrão
    And Usuário verá em "Header - Trocar Estabelecimento - Modal - Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou número do estabelecimento"
    And Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento
    And Usuário verá em "Header - Trocar Estabelecimento - Modal - Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Header - Trocar Estabelecimento - Modal - Texto Explicativo" o texto "Selecione 1 estabelecimento para acessar. Você pode mudar a seleção a qualquer momento no portal."

  Scenario: Validar expansão do dropdown na aba Estabelecimento. (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    And usuário clica "Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento"
    And Expande primeiro dropdown
    Then O primeiro dropdown estará expandido
    And O dropdown conterá com as informações de Nome fantasia do EC
    And O dropdown conterá com as informações de número do EC
    And O dropdown conterá com as informações do status do EC no BW

