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
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO

  @TestCaseKey=SMP-T174
  Scenario: Validar Campos do Personalize sua Visualização aba Estabelecimento. (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento, ou número do estabelecimento ou nome"
    And Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma correspondente ao estabelecimento escolhido. Você poderá alterar a seleção a qualquer momento no portal."

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
    Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou nome"
    And Usuário verá em "Trocar Estabelecimento - Botão Todos Documentos - Explicação" o texto "Essa visão irá agrupar todos os estabelecimentos abaixo do documento "
    And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
    And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma consolidada, agrupando os estabelecimentos abaixo do documento. Você poderá alterar a seleção a qualquer momento no portal."

  @TestCaseKey=SMP-T182
  Scenario: Busca de código EC valido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente a informação correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"

  @TestCaseKey=SMP-T184
  Scenario: Busca de Documento (CNPJ ou CPF) válido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'
    Then Dropdown irá filtrar e apresentar somente a informação correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"

  @TestCaseKey=SMP-T186
  Scenario: Busca de código EC inválido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."

  @TestCaseKey=SMP-T187
  Scenario: Busca de Documento (CNPJ ou CPF) inválido aba Estabelecimento (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."

  @TestCaseKey=SMP-T188
  Scenario: Validar botão “X” no componente “Buscar por documento” na aba Documento na tela de personalize sua visualização (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
    Then Usuário poderá limpar a busca clicando no X

  @TestCaseKey=SMP-T189
  Scenario: Busca de documento válido aba Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento válido em 'Buscar por documento'
    Then Filtro apresentará somente a informação correspondente
    And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"

  @TestCaseKey=SMP-T190
  Scenario: Busca de documento inválido aba Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
    And Botão "Trocar Estabelecimento - Botão Acessar" estará visível e desabilitado
    And Botão "Trocar Estabelecimento - Marcar como Padrão" estará visível e desabilitado

  @TestCaseKey=SMP-T194
  Scenario: Validação do Botão Acessar (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Documento estará previamente selecionado

  @TestCaseKey=SMP-T195
  Scenario: Validar seleção no checkbox de não mostrar novamente (Usuário Master)
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "marcada"
    Then Usuário estará com acesso e sessão foi salva

  @TestCaseKey=SMP-T196
  Scenario: Validar não seleção no checkbox de não mostrar novamente (Usuário Master)
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
    Then Usuário verá modal para selecionar EC ou DTCO

