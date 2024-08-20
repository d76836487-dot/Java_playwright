#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/MFA
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: MFA

  @TestCaseKey=LPDC-T774
  Scenario: Criar usuário secundário a partir de um Cliente com token habilitado com mais de um device
    Given criar um usuário secundário consulta
    And Percorrer toda a jornada de ativação
    And logar com usuário secundário com primeira jornada
    And realizar o primeiro acesso
    And selecionar o device
    When estiver na tela “Informe o Token de 6 dígitos”
    And Informar o token
    Then visualizo a tela de inicio do portal

  @TestCaseKey=LPDC-T683
  Scenario: Cliente sem token habilitado validação de texto
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Não tenho esse token”
    Then visualizara na caixa “Onde encontrar o Token?” Caso ainda não tenha o aplicativo instalado, busque por Máquina de cartões do Sicredi e baixe através da sua loja (Play Store ou App Store):”
    And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza para acessar o portal.
    And 2. Logo que acessar será apresentado a jornada de habilitação de Token para seu dispositivo!  3.  Ao finalizar o cadastro siga o tutorial ao lado:

  @TestCaseKey=LPDC-T762
  Scenario: Cliente sem token habilitado validação de texto 2
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token?”
    Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And 1.Você pode encontrar o Token na área de acesso e no menu de Serviços.
    And 2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.
    And e o botão com fundo branco e letra verde "Sou usuario inativo"
    And e o botão com fundo ver e letra branca "Informar o Código"

  @TestCaseKey=LPDC-T752
  Scenario: Cliente sem token habilitado  redirecionado para a tela Informe o Token
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Não tenho esse token” e clicar
    And Sera direcionado a seguir passo a passo de baixar, acessar e habilitar o token no App
    When clicar no botão Informar código
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T699
  Scenario: Cliente sem token habilitado
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    When apertar o botão Entrar
    And não tenho o Token habilitado no App
    Then vou visualizar a tela ‘Acesse o Token no aplicativo Máquina de cartões do Sicredi e informe o código de 6 dígitos abaixo:
    And ” e os Botões “Continuar”, “Não tenho esse token

  #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
  @TestCaseKey=LPDC-T712
  Scenario: Cliente sem token habilitado Personalize sua Visualização
    Given insira um documento (CNPJ ou CPF) ou usuário e senha
    And clicar no botão entrar
    When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T697
  Scenario: Cliente sem token habilitado  Não tenho esse Token
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then visualiza a tela Onde encontrar o Token? com os botões “x” ,  Informar código , sou usuário inativo”

  @TestCaseKey=LPDC-T726
  Scenario: Cliente sem token habilitado home logada
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não  tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T677
  Scenario: Cliente sem dispositivo habilitado entrar
    Given eu inseri um usuário e senha válido no Portal
    And não  tenho o Token habilitado no App
    When apertar o botão Entrar
    Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

  @TestCaseKey=LPDC-T679
  Scenario: Cliente sem dispositivo habilitado não tenho esse Token
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

  @TestCaseKey=LPDC-T701
  Scenario: Cliente sem dispositivo habilitado voltar
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T685
  Scenario: Cliente sem dispositivo habilitado redirecionar
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de baixar, acessar e habilitar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T686
  Scenario: Cliente sem dispositivo habilitado Informa código
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de baixar, acessar e habilitar o token no App
    When clicar no botão Informar código
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T704
  Scenario: Cliente sem dispositivo habilitado não tenho o aplicativo
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
    And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.”
    And “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  @TestCaseKey=LPDC-T696
  Scenario: Cliente sem dispositivo habilitado página de download no App Store
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão App store
    Then será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T678
  Scenario: Cliente sem dispositivo habilitado página de download no Google Play
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão Google Play
    Then será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T687
  Scenario: Cliente sem dispositivo habilitado você pode encontrar o Token
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

  @TestCaseKey=LPDC-T682
  Scenario: Cliente sem dispositivo habilitado home logada
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then não serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T695
  Scenario: Cliente sem dispositivo habilitado token errado
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T720
  Scenario: Cliente sem dispositivo habilitado token expirado
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T730
  Scenario: Cliente sem dispositivo habilitado bloqueado por 30 minutos
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T747
  Scenario: Cliente sem dispositivo habilitado nova tentativa dentro de 30 minutos
    Given eu inseri um usuário e senha válido no Portal
    And não tenho o Token habilitado no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
  @TestCaseKey=LPDC-T709
  Scenario: Cliente com um dispositivo habilitado personalize sua Visualização.
    Given insira um documento (CNPJ ou CPF) ou usuário e senha
    And clicar no botão entrar
    When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T737
  Scenario: Cliente com um dispositivo habilitado acessar
    Given eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When apertar o botão Entrar
    Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

  @TestCaseKey=LPDC-T690
  Scenario: Cliente sem token habilitado  Não tenho esse Token não acesso o canal
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T691
  Scenario: Cliente sem token habilitado clique x  redirecionado para a tela Informe o Token
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de baixar, acessar e habilitar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T751
  Scenario: Cliente sem token habilitado download no App store
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não     tenho o Token habilitado no App
    When  estiver na tela “Onde encontrar o Token”
    When  Clicar no botão App store
    Then  será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T702
  Scenario: Cliente sem token habilitado download no Google Play
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão Google Play
    Then será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T698
  Scenario: Cliente sem token habilitado  Código inválido
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos”

  @TestCaseKey=LPDC-T764
  Scenario: Cliente sem token habilitado  Código expirado
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When seguir passo a passo de baixar, acessar e habilitar o token no App
    And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T718
  Scenario: Cliente sem token habilitado  bloqueado 30 minutos
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T733
  Scenario: Cliente sem token habilitado  bloqueado 3 vezes
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And não tenho o Token habilitado no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T739
  Scenario: Cliente com token habilitado validação texto 3
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When apertar o botão Entrar
    Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

  @TestCaseKey=LPDC-T714
  Scenario: Cliente com token habilitado botões x
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When  estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

  @TestCaseKey=LPDC-T729
  Scenario: Cliente com token habilitado And não acesso o canal
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T717
  Scenario: Cliente com token habilitado When  clicar no botão X
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T722
  Scenario: Cliente com token habilitado Token de 6 dígitos
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When  estiver na tela “Onde encontrar o Token”
    And seguir    passo a passo de resgatar o token no App
    When  clicar no botão Informar código
    Then  serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T693
  Scenario: Cliente com token habilitado validação de texto 4
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
    And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.”
    And “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  @TestCaseKey=LPDC-T745
  Scenario: Cliente com token habilitado botão App store
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão App store
    Then será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T750
  Scenario: Cliente com token habilitado download no Google Play
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When  estiver na tela “Onde encontrar o Token”
    When  Clicar no botão Google Play
    Then  será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T681
  Scenario: Cliente com token habilitado Onde encontrar o Token
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “681” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

  @TestCaseKey=LPDC-T731
  Scenario: Cliente com token habilitado home logada
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When  seguir passo a passo de resgatar o token no App
    And  inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then  serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T694
  Scenario: Cliente com token habilitado Código inválido
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When seguir passo a passo de resgatar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T772
  Scenario: Cliente com token habilitado Código expirado
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When seguir passo a passo de resgatar o token no App
    And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T767
  Scenario: Cliente com token habilitado Número de tentativas excedido
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T724
  Scenario: Cliente com token habilitado ou expirado 3 vezes
    Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When  realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then  o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
  @TestCaseKey=LPDC-T707
  Scenario: Cliente com token habilitado Personalize sua Visualização  aba documentos
    Given insira um documento (CNPJ ou CPF) ou usuário e senha
    And clicar no botão entrar
    When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then  Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T708
  Scenario: Cliente com mais de um dispositivo habilitado validação de texto
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When apertar o botão Entrar
    Then vou visualizar a tela “Selecione o dispositivo que deseja informar o Token” contendo os dispositivos cadastrados (nome do aparelho), setinha induzindo ao clique e botão voltar

  @TestCaseKey=LPDC-T742
  Scenario: Cliente com mais de um dispositivo habilitado validação de texto 2
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Selecione o dispositivo que deseja informar o Token”
    And selecionar  o dispositivo
    Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

  @TestCaseKey=LPDC-T719
  Scenario: Cliente com mais de um dispositivo habilitado Onde encontrar o Token 1
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

  @TestCaseKey=LPDC-T758
  Scenario: Cliente com mais de um dispositivo habilitado não acesso o canal
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T759
  Scenario: Cliente com mais de um dispositivo habilitado botão X
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T757
  Scenario: Cliente com mais de um dispositivo Informar código
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão Informar código
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T748
  Scenario: Cliente com mais de um dispositivo Não tenho o aplicativo
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
    And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.”
    And “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  @TestCaseKey=LPDC-T703
  Scenario: Cliente com mais de um dispositivo download no App store
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão App store
    Then será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T746
  Scenario: Cliente com mais de um dispositivo download no Google Play
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão Google Play
    Then será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T771
  Scenario: Cliente com mais de um dispositivo Onde encontrar o Token
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

  @TestCaseKey=LPDC-T725
  Scenario: Cliente com mais de um dispositivo home logada do Portal
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When seguir passo a passo de resgatar o token no App
    And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T688
  Scenario: Cliente com mais de um dispositivo Código inválido
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When seguir passo a passo de resgatar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T766
  Scenario: Cliente com mais de um dispositivo Código expirado
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When seguir passo a passo de resgatar o token no App
    And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T723
  Scenario: Cliente com mais de um dispositivo Número de tentativas excedido
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T736
  Scenario: Cliente com mais de um dispositivo Número de tentativas tentativa DENTRO DOS 30
    Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T706
  Scenario: Cliente com mais de um dispositivo Personalize sua Visualização
    #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
    Given insira um documento (CNPJ ou CPF) ou usuário e senha
    And clicar no botão entrar
    When  Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T711
  Scenario: Cliente com um dispositivo habilitado não tenho esse Token
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When  estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar' código”

  @TestCaseKey=LPDC-T753
  Scenario: Cliente com um dispositivo habilitado voltar
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T680
  Scenario: Cliente com um dispositivo habilitado When  clicar no botão X
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T738
  Scenario: Cliente com um dispositivo habilitado código
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão Informar código
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T756
  Scenario: Cliente com um dispositivo habilitado App store valida botões
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
    And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.”
    And “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  @TestCaseKey=LPDC-T754
  Scenario: Cliente com um dispositivo habilitado app store
    Given eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão App store
    Then será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T692
  Scenario: Cliente com um dispositivo habilitado google play
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão Google Play
    Then será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T749
  Scenario: Cliente com um dispositivo habilitado encontrar o token
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

  @TestCaseKey=LPDC-T768
  Scenario: Cliente com um dispositivo habilitado Informe home logada
    Given eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When seguir passo a passo de resgatar o token no App
    And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then  serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T713
  Scenario: Cliente com um dispositivo habilitado código inválido
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When seguir passo a passo de resgatar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T740
  Scenario: Cliente com um dispositivo habilitado código expirado
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When seguir passo a passo de resgatar o token no App
    And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T765
  Scenario: Cliente com um dispositivo habilitado 30 minutos
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T689
  Scenario: Cliente com um dispositivo habilitado ou expirado 30 minutos
    Given  eu inseri um usuário e senha válido no Portal
    And já tiver feito a jornada de habilitação de Token no App
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
  @TestCaseKey=LPDC-T732
  Scenario: Cliente com um dispositivo habilitado personalize sua visualização
    Given insira um documento (CNPJ ou CPF) ou usuário e senha
    And clicar no botão entrar
    When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T761
  Scenario: Cliente com mais de um dispositivo habilitado selecione um dispositivo
    Given eu inseri um usuário e senha válido no Portal
    And tenho   mais de um dispositivo com Token cadastrado
    When apertar o botão Entrar
    Then vou visualizar a tela “Selecione o dispositivo que deseja informar o Token” contendo os dispositivos cadastrados (nome do aparelho), setinha induzindo ao clique e botão voltar

  @TestCaseKey=LPDC-T705
  Scenario: Cliente com mais de um dispositivo habilitado validação de textos
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Selecione o dispositivo que deseja informar o Token”
    And selecionar o dispositivo
    Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

  @TestCaseKey=LPDC-T721
  Scenario: Cliente com mais de um dispositivo habilitado não tenho esse Token
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Não tenho esse Token”
    Then visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

  @TestCaseKey=LPDC-T716
  Scenario: Cliente com mais de um dispositivo habilitado voltar
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Informe o Token de 6 dígitos”
    And clicar no botão “Voltar”
    Then visualizo a tela Acesse sua conta
    And não acesso o canal

  @TestCaseKey=LPDC-T755
  Scenario: Cliente com mais de um dispositivo habilitado onde encontrar o Token 2
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão X
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T743
  Scenario: Cliente com mais de um dispositivo habilitado onde resgatar o token
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    And seguir passo a passo de resgatar o token no App
    When clicar no botão Informar código
    Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

  @TestCaseKey=LPDC-T744
  Scenario: Cliente com mais de um dispositivo habilitado onde encontrar o Token 3
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
    And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.”
    And “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

  @TestCaseKey=LPDC-T684
  Scenario: Cliente com mais de um dispositivo habilitado página de download
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão App store
    Then será redirecionado para a página de download no App store

  @TestCaseKey=LPDC-T715
  Scenario: Cliente com mais de um dispositivo habilitado google play
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    When Clicar no botão Google Play
    Then será redirecionado para a página de download no Google Play

  @TestCaseKey=LPDC-T763
  Scenario: Cliente com mais de um dispositivo habilitado validação de textos 2
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When estiver na tela “Onde encontrar o Token”
    Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
    And visualizara os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

  @TestCaseKey=LPDC-T700
  Scenario: Cliente com mais de um dispositivo habilitado home logada
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When seguir passo a passo de resgatar o token no App
    And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then serei redirecionado para a home logada do Portal

  @TestCaseKey=LPDC-T770
  Scenario: Cliente com mais de um dispositivo habilitado código inválido
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When seguir passo a passo de resgatar o token no App
    And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T741
  Scenario: Cliente com mais de um dispositivo habilitado código expirado
    Given  eu inseri um usuário e senha válido no Portal
    And  tenho mais de um dispositivo com Token cadastrado
    When  seguir passo a passo de resgatar o token no App
    And  inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
    And clicar em Confirmar
    Then  o portal apresentará a mensagem “Código inválido ou expirado.”

  @TestCaseKey=LPDC-T769
  Scenario: Cliente com mais de um dispositivo habilitado código expirado 3 vezes
    Given  eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    Then serei bloqueado por 30 minutos para novas tentativas
    And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  @TestCaseKey=LPDC-T734
  Scenario: Cliente com mais de um dispositivo habilitado código expirado 30 minutos
    Given eu inseri um usuário e senha válido no Portal
    And tenho mais de um dispositivo com Token cadastrado
    When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
    And estiver bloqueado
    When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
    Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

  #para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
  @TestCaseKey=LPDC-T727
  Scenario: Cliente com mais de um dispositivo habilitado personalize sua visualização
    Given insira um usuário e senha válido no Portal
    And clicar no botão entrar
    When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
    And Seleciona o dispositivo
    And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
    And Preenche o Token e clica no Botão “Confirmar”
    Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

  @TestCaseKey=LPDC-T735
  Scenario: Cliente com mais de um dispositivo habilitado bloqueado 3 tentativas
    Given eu inseri um usuário e senha válido no Portal
    And estou bloquedo pois inseri 3 tokens incorretos consecutivamente
    When tento acessar o App com o dispositivo que “bloqueei a jornada”
    Then não será possível realizar login por 30 minutos

  @TestCaseKey=LPDC-T710
  Scenario: Cliente com mais de um dispositivo habilitado canais digitais
    Given eu sou um cliente que nunca acessou os canais digitais (App e Portal)
    When acessar a jornada de primeiro acesso através do Portal
    Then devo conseguir realizar com sucesso a jornada

  @TestCaseKey=LPDC-T728
  Scenario: Cliente com mais de um dispositivo habilitado app
    Given eu sou um cliente que nunca acessou os canais digitais (App e Portal)
    When realizar a jornada de primeiro acesso através do Portal com sucesso
    And inserir  documento e senha
    And clicar em Entrar
    Then devo ser impactado pela jornada de inclusão de Token

  @TestCaseKey=LPDC-T760
  Scenario: Cliente com mais de um dispositivo habilitado portal
    Given eu sou um cliente que já acessou os canais digitais (App e Portal)
    When realizar a jornada de esqueci minha senha com sucesso
    And inserir  documento e senha atualizados
    And clicar em Entrar
    Then devo ser impactado pela jornada de inclusão de Token

