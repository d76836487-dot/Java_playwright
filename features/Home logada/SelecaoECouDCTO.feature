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
    And Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou número do estabelecimento"
    And Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Selecione 1 estabelecimento para acessar. Você pode mudar a seleção a qualquer momento no portal."

  @TestCaseKey=SMP-T177
  Scenario: Validar expansão do dropdown na aba Estabelecimento. (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário expande primeiro dropdown
    Then O primeiro dropdown estará expandido
    And O dropdown conterá com as informações de Nome fantasia do EC
    And O dropdown conterá com as informações de número do EC
    And O dropdown conterá com as informações do status do EC no BW

  @api
  @TestCaseKey=SMP-T180
  Scenario: Valida Nomes, CNPJ/CPFs, número EC e status com API
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário clica "Header - Trocar Estabelecimento"
    And usuário clica no "Botão selecionar por Estabelecimento" em "Trocar Estabelecimento"
    Then Todos Nomes, CNPJ CPFs, número ECs e status são iguais a API

  @TestCaseKey=SMP-T183
  Scenario: Validar Campos do Personalize sua Visualização aba Documento. (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When usuário clica no "Botão Todos Documentos" em "Trocar Estabelecimento"
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento"
    And Usuário verá em "Trocar Estabelecimento - Botão Todos Documentos - Explicação" o texto "Essa visão irá agrupar todos os estabelecimentos abaixo do documento"
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Selecione 1 estabelecimento para acessar. Você pode mudar a seleção a qualquer momento no portal."

  @TestCaseKey=SMP-T182
  Scenario: Busca de código EC valido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente a informação correspondente
    And Botão Acessar estará habilitado após seleção de um EC

  @TestCaseKey=SMP-T184
  Scenario: Busca de Documento (CNPJ ou CPF) valido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente a informação correspondente
    And Botão Acessar estará habilitado após seleção de um EC

  @TestCaseKey=SMP-T186
  Scenario: Busca de código EC invalido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."

