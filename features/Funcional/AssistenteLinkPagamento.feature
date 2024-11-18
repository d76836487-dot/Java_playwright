#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Assistente_Link_Pagamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Assistente Link de Pagamento

  Scenário 1: Usuário Master faz login com sucesso

  Given usuário está na página de Login
  And tenha Doc e Senha validas
  When insere Doc e Senha
  And Clica no Botão Entrar
  Then deve ser direcionado para Home do Portal



  Scenário 2: Página de Informações Básicas

  Given usuário está Logado no Portal do Cliente
  When acessar página de Gestão de Acessos no menu no lateral esquerdo
  And clicar no Botão "Convidar novo usuário"
  Then devera abrir a página para preencher as informações básicas


  Scenario 3: Criando Secundário “Assistente de link de pagamento"


    Given Usuário preenche os Campos necessários do usuário como nome, e-mail etc.
    When selecionar o perfil "Assistente de link de pagamento" na lista de permissionamento
    And selecionar no Campo estabelecimento comercial todos ou apenas um
    And aceita os Termos e Condições
    And clica no botão Convidar
    Then aparecera um modal com a seguinte mensagem: Convite enviado com sucesso
  #Enviamos um convite para o e-mail informado para o usuário completar seu acesso.
  #Caso o usuário não tenha recebido o e-mail você pode solicitar o reenvio na página de convites pendente
    And Botão Entendi e X



  Scenário 4: Visualizando Secundário com o perfil "Assistente de link de pagamento"


    Given usuário criou um usuário Assistente Link de Pagamento
    And acessar a tela de Gestão de Acessos no menu na lateral esquerda
    When selecionar a aba Convites Pendentes
    Then usuário verá o perfil Assistente Link de Pagamento com status: Pendente



  Scenário 5: Primeiro Acesso Assistente Link de Pagamento


    Given usuário recebeu o email com usuário Assistente link de pagamento
    When usuário fizer o fluxo de primeiro acesso
    Then terá acesso ao Portal do Cliente


  Scenário 6: Fazendo Login com Assistente Link de pagamento


    Given usuário fez o fluxo de Primeiro Acesso
    When com novo usuário e senha ele fizer o Login
    Then irá acessar Acesso rápido do Perfil Assistente Link de Pagamento


  Scenário 7: Página Link de Pagamento


    Given usuário está na página Acesso rápido
    When Selecionar Link de Pagamento
    Then terá acesso a página de Criação de Link de Pagamento


  Scenário 8: Página Link de Pagamento através da Aba Serviços


    Given usuário esta na Pagina de Acesso rápido
    When Acessa o Menu Lateral esquerdo
    And Clica em Serviços > Link de Pagamento
    Then terá acesso a página de Criação de Link de Pagamento



  Scenário 9: Consultar Links Sem ter nenhum Link Criado


    Given usuário está na Página de Link de Pagamento
    When Selecionar a Aba Consultar Links
    Then terá acesso a página com a seguinte mensagem: Você ainda não tem criou nenhum link
  #Você não possui nenhum link de pagamento ativo. Crie seu primeiro link de pagamento para vender ainda mais.
    And o Botão Criar Link de pagamento


  Scenário 10: Consultar Links Com Link já criado


    Given usuário está na Página de Link de Pagamento
    When Selecionar a aba Consultar Links
    Then verá os links que foram criados na aba Todos


  Scenário 11: Acessando Com Ec sem Link de Pagamento


    Given usuário está na página de Login
    And tenha Doc e Senha validas
    When insere Doc e Senha
    And Clica no Botão Entrar
    Then deve ser direcionado para Home do Portal



  Scenário 12: Página de Informações Básicas Com Ec sem Link de Pagamento


    Given usuário está Logado no Portal do Cliente
    When acessar a tela de Gestão de Acessos no menu no lateral esquerdo
    And clicar no Botão "Convidar novo usuário"
    Then deverá abrir a página para preencher as informações básicas



  Scenario 13: Criando "Assistente de link de pagamento" Com Ec sem Link de Pagamento


    Given Usuário preenche os Campos necessários do usuário como nome, e-mail etc.
    When selecionar o perfil "Assistente de link de pagamento" na lista de permissionamento
    And selecionar no Campo estabelecimento comercial todos ou apenas um
    And aceita os Termos e Condições
    And clica no botão Convidar
    Then aparecera um modal com a seguinte mensagem: Convite enviado com sucesso
 # Enviamos um convite para o e-mail informado para o usuário completar seu acesso.
  #Caso o usuário não tenha recebido o e-mail você pode solicitar o reenvio na página de convites pendente
    And Botão Entendi e X


  Scenário 14: Primeiro Acesso Assistente Link de Pagamento Com EC sem Link de pagamento


    Given usuário recebeu o email com usuário Assistente link de pagamento
    When fizer o fluxo de primeiro acesso
    Then terá acesso ao Portal do Cliente



  Scenário 15: Login Acesso Assistente Link de Pagamento Com EC sem Link de pagamento


    Given usuário fez o fluxo de Primeiro Acesso
    When fizer o Login
    Then irá acessar Acesso rápido do Perfil Assistente Link de Pagamento



  Scenário 16: Acesso pela Aba Serviços com EC sem Link habilitado


    Given usuário está em Acesso rápido
    And Acessa o Menu Lateral esquerdo
    When Clicar em Serviços > Link de Pagamento
    Then terá acesso a página de Link de pagamento com a seguinte mensagem: Comece a vender!

  #Com o link de pagamento você consegue vender de qualquer lugar sem depender da maquininha! Entre em contato com a nossa equipe para saber mais e contratar o serviço.
  #Capitais e Regiões Metropolitanas
  #Segunda a Domingo das 08h00 às 22h00 (exceto feriados)
  #Telefone
  #3003 7828
  #Outras Localidades
  #Segunda a Domingo das 08h00 às 22h00 (exceto feriados)
  #Telefone
  #0800 728 7828




  Scenário 17: Acesso a Página Link de Pagamento com EC sem Link habilitado


    Given usuário está em Acesso Rápido
    When Selecionar Link de Pagamento
    Then terá acesso a página de Link de pagamento com a seguinte mensagem: Comece a vender!

  #Com o link de pagamento você consegue vender de qualquer lugar sem depender da maquininha! Entre em contato com a nossa equipe para saber mais e contratar o serviço.
  #Capitais e Regiões Metropolitanas
  #Segunda a Domingo das 08h00 às 22h00 (exceto feriados)
  #Telefone
  #3003 7828
  #Outras Localidades
  #Segunda a Domingo das 08h00 às 22h00 (exceto feriados)
  #Telefone
  #0800 728 7828



  Scenário 18: Perfil Assistente Link de Pagamento vê todos os Links criados anteriormente


    Given usuário está na Página de Link de Pagamento
    And Acessa a aba Consultar Links
    When seleciona um período anterior Exe: 01/10/2024 – 31/10/2024
    Then usuário verá os links antigos criados por outros usuários



  Scenário 19: Perfil Assistente Link de Pagamento / Operador Com F


    Given usuário com Perfil Operador Com F faz o Login com Usuário de Assistente Link de Pagamento
    And Acessar a Home Logada > Acesso Rápido
    When selecionar Link de Pagamento
    And clicar em "Solicitar link de pagamento único" ou “Recorrente”
    And fazer todo o fluxo para solicitar um link de pagamento
    And conseguir chegar até a tela de Resumo
    Then o botão "Gerar link de pagamento" deve ficar desabilitado




  Scenário 20: Perfil Assistente Link de Pagamento / Operador Com F através do Menu lateral


    Given usuário com Perfil Operador Com F faz o Login com Usuário de Assistente Link de Pagamento
    And Acessa serviços > Link de pagamento pela lateral esquerda
    When clicar em "Solicitar link de pagamento único" ou “Recorrente”
    And fazer todo o fluxo para solicitar um link de pagamento
    And conseguir chegar até a tela de Resumo
    Then o botão "Gerar link de pagamento" deve ficar desabilitado



  Scenário 21: Perfil Assistente Link de Pagamento / Operador Sem F

    Given usuário com Perfil Operador Sem F faz o Login com Usuário de Assistente Link de Pagamento
    And Acessar a Home Logada > Acesso Rápido
    When selecionar Link de Pagamento
    And clicar em "Solicitar link de pagamento único" ou “Recorrente”
    And fazer todo o fluxo para solicitar um link de pagamento
    And conseguir chegar até a tela de Resumo
    Then o botão "Gerar link de pagamento" deve ficar desabilitado


  Scenário 22: Perfil Assistente Link de Pagamento / Operador Sem F através do Menu lateral

    Given usuário com Perfil Operador Sem F faz o Login com Usuário de Assistente Link de Pagamento
    And Acessa serviços > Link de pagamento pela lateral esquerda
    When clicar em "Solicitar link de pagamento único" ou “Recorrente”
    And fazer todo o fluxo para solicitar um link de pagamento
    And conseguir chegar até a tela de Resumo
    Then o botão "Gerar link de pagamento" deve ficar desabilitado

