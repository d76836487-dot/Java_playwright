#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/MFA.2.0
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: MFA.2.0

  Scenario: Cliente possui UM dispositivo móvel cadastrado
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  Then devo visualizar a tela “Informe o Token do aplicativo”  com ‘’Onde encontrar o Token’’ , ‘’Confirmar’’ e “Receber código por e-mail ou Sms’’

  Scenario: Cliente possui UM dispositivo móvel cadastrado código invalido ou expirado
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And inserir um código expirado/invalido
  Then devo visualizar poupup código invalido ou expirado

  Scenario: Cliente possui UM dispositivo móvel cadastrado código numero de tentativa excedido
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And inserir um código expirado/invalido após 5 tentativas incorretas
  Then devo visualizar poupup “Numero de tentativas excedido, tente novamente daqui a 30 minutos.

  Scenario: Cliente possui UM dispositivo móvel bloqueado após as tentativas (dentro dos 30 minutos)
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado e bloqueado pelas tentativas
  And inserir um código valido
  Then devo visualizar poupup “Numero de tentativas excedido, tente novamente daqui a 30 minutos.

  Scenario: Cliente possui UM dispositivo móvel cadastrado código Hierarquia
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And selecionar um dos dispositivos móveis cadastrados
  Then devo ser redirecionado para a tela de autenticação “Informe o Token do aplicativo”
  And Preencher com token corretamente
  And Direcionado para Personalize sua visualização.
  And selecione Documento/Estabelecimento.

  Scenario: Cliente possui MAIS DE UM dispositivo móvel cadastrado
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver mais de um dispositivo móvel cadastrado
  Then devo visualizar a tela “Selecione o dispositivo que deseja informar o Token”  com ‘’Onde encontrar o token” e “Receber código por e-mail ou Sms’’

  Scenario: Cliente possui 3 ou mais números e emails cadastrados Mostrando 2 por vez
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver dispositivo móvel cadastrado
  Then devo visualizar “Escolha por onde deseja receber seu código de acesso” com apenas dois itens ‘’ numero e/ou email’’  na tela e o scroll com os outros números e email’s abaixo.

  Scenario: Ordem do Telefone ou email mais utilizado
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver dispositivo móvel cadastrado
  Then o numero ou email mais utilizado deve ser o primeiro a ser exibido no topo. (deverá aparecer o ultimo que você mandou o token anteriomente)

  Scenario: Numero ou Email Alterado Recentemente
  Given que você adicionou um novo numero ou email
  And que acessei no portal
  When preencher givens de usuário e senha
  And tiver dispositivo móvel cadastrado
  Then o numero ou email deve ser apresentado no topo.

  Scenario: Cliente selecionou um dos dispositivos móveis cadastrados
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And selecionar um dos dispositivos móveis cadastrados
  Then devo ser redirecionado para a tela de autenticação “Informe o Token do aplicativo”
  And Preencher com token corretamente
  And Direcionado para a home Logada.

  Scenario: Onde encontrar esse token
  Given que acessei no portal com login e senha valido
  When clicar em ‘’ Onde encontrar esse token’’
  Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
  And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  Scenario: Cliente não possui NENHUM dispositivo móvel cadastrado seleção SMS
  Given que acessei no portal
  When preencher givens de usuário e senha
  And NÃO tiver nenhum dispositivo móvel cadastrado
  Then devo visualizar a tela “Escolha por onde deseja receber seu código de acesso censurada com *******  no email e Sms”
  And selecione SMS
  And Digite o código recebido
  And Redirecionado para home logada

  Scenario: Cliente não possui NENHUM dispositivo móvel cadastrado seleção email
  Given que acessei no portal
  When preencher givens de usuário e senha
  And NÃO tiver nenhum dispositivo móvel cadastrado
  Then devo visualizar a tela “Escolha por onde deseja receber seu código de acesso censurada com *******  no email e Sms”
  And selecione E-mail
  And Digite o código recebido e-mail
  And Redirecionado para home logada

  Scenario: Cliente selecionou um dos dispositivos móveis cadastrados
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And selecionar um dos dispositivos móveis cadastrados
  Then devo ser redirecionado para a tela de autenticação “Informe o Token do aplicativo”
  And Preencher com token corretamente
  And Direcionado para a home Logada.

  Scenario: Redirecionar App store
  Given que eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
  And não tenho o Token habilitado no App
  When estiver na tela “Onde encontrar o Token”
  When Clicar no botão App store
  Then será redirecionado para a página de download no App store

  Scenario: Redirecionar Google play
  Given que eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
  And não tenho o Token habilitado no App
  When estiver na tela “Onde encontrar o Token”
  When Clicar no botão Google Play
  Then será redirecionado para a página de download no Google Play

  Scenario: Cliente está na jornada de recebimento de token por SMS ou e-mail, mas selecionou “Receber código pelo aplicativo”
  Given usuário esteja na tela “Informe o Token do aplicativo”
  And clicar em com “Receber código por e-mail ou Sms’’
  And Redirecionar para ‘’Escolha por onde deseja receber seu código de acesso”
  When clicar em ‘’ Receber código pelo aplicativo’’
  And Visualizara a tela de “Informe o Token do aplicativo”
  And insere o Token Valido do app e clica em Continuar
  Then Visualiza o Dashboard do Portal.

  Scenario: Cliente inativo com 1 ou mais dispositivos
  Given que acessei no portal
  When preencher givens de usuário e senha
  And tiver um dispositivo móvel cadastrado
  And clique ‘’Onde encontrar o Token’’
  And clique em “sou usuário inativo’’
  Then é redirecionado para pagina acesse sua conta (Home deslogada)

  Scenario: Cliente inativo sem dispositivo
  Given que acessei no portal
  When preencher givens de usuário e senha
  And clique ‘’Receber tokem pelo aplicativo’’
  And clique em “sou usuário inativo’’
  Then é redirecionado para pagina acesse sua conta (Home deslogada)