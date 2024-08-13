#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/MFA
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: MFA


Scenario: Cliente sem dispositivo habilitado entrar
Given eu inseri um usuário e senha válido no Portal
And não  tenho o Token habilitado no App
When apertar o botão Entrar
Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario: Cliente sem dispositivo habilitado não tenho esse Token
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

Scenario: Cliente sem dispositivo habilitado voltar
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario: Cliente sem dispositivo habilitado redirecionar
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de baixar, acessar e habilitar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente sem dispositivo habilitado Informa código
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de baixar, acessar e habilitar o token no App
When clicar no botão Informar código
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente sem dispositivo habilitado não tenho o aplicativo
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

Scenario: Cliente sem dispositivo habilitado página de download no App Store
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão App store
Then será redirecionado para a página de download no App store

Scenario: Cliente sem dispositivo habilitado página de download no Google Play
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão Google Play
Then será redirecionado para a página de download no Google Play

Scenario: Cliente sem dispositivo habilitado você pode encontrar o Token
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario: Cliente sem dispositivo habilitado home logada
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then serei redirecionado para a home logada do Portal

Scenario: Cliente sem dispositivo habilitado token errado
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente sem dispositivo habilitado token expirado
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente sem dispositivo habilitado bloqueado por 30 minutos
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario: Cliente sem dispositivo habilitado nova tentativa dentro de 30 minutos
Given eu inseri um usuário e senha válido no Portal
And não tenho o Token habilitado no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Scenario: Cliente com um dispositivo habilitado personalize sua Visualização.
Given insira um documento (CNPJ ou CPF) ou usuário e senha
And clicar no botão entrar
When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

Scenario: Cliente com um dispositivo habilitado acessar
Given eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When apertar o botão Entrar
Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario :  Cliente sem token habilitado
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
When  apertar o botão Entrar
And não     tenho o Token habilitado no App
Then  vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario :  Cliente sem token habilitado  Não tenho esse Token
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

  Scenario :  Cliente sem token habilitado  Não tenho esse Token não acesso o canal
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario :  Cliente sem token habilitado clique x  redirecionado para a tela Informe o Token
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de baixar, acessar e habilitar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario : Cliente sem token habilitado  redirecionado para a tela Informe o Token
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de baixar, acessar e habilitar o token no App
When clicar no botão Informar código
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario :  Cliente sem token habilitado validação de texto
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

Scenario :  Cliente sem token habilitado download no App store
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não     tenho o Token habilitado no App
When  estiver na tela “Onde encontrar o Token”
When  Clicar no botão App store
Then  será redirecionado para a página de download no App store

Scenario :  Cliente sem token habilitado download no Google Play
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão Google Play
Then será redirecionado para a página de download no Google Play

Scenario :  Cliente sem token habilitado validação de texto 2
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario :  Cliente sem token habilitado home logada
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não  tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then  serei redirecionado para a home logada do Portal

Scenario : Cliente sem token habilitado  Código inválido
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente sem token habilitado  Código expirado
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When seguir passo a passo de baixar, acessar e habilitar o token no App
And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente sem token habilitado  bloqueado 30 minutos
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario :  Cliente sem token habilitado  bloqueado 3 vezes
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And não tenho o Token habilitado no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario :  Cliente sem token habilitado Personalize sua Visualização
#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Given insira um documento (CNPJ ou CPF) ou usuário e senha
And clicar no botão entrar
When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

Scenario :  Cliente com token habilitado validação texto 3
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When apertar o botão Entrar
Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario :  Cliente com token habilitado botões x
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When  estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

Scenario :  Cliente com token habilitado And não     acesso o canal
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario :  Cliente com token habilitado When  clicar no botão X
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario :  Cliente com token habilitado Token de 6 dígitos
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When  estiver na tela “Onde encontrar o Token”
And seguir    passo a passo de resgatar o token no App
When  clicar no botão Informar código
Then  serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario :  Cliente com token habilitado validação de texto 4
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”


Scenario :  Cliente com token habilitado botão App store
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão App store
Then será redirecionado para a página de download no App store

Scenario :  Cliente com token habilitado download no Google Play
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When  estiver na tela “Onde encontrar o Token”
When  Clicar no botão Google Play
Then  será redirecionado para a página de download no Google Play

Scenario :  Cliente com token habilitado Onde encontrar o Token
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario :  Cliente com token habilitado home logada
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When  seguir passo a passo de resgatar o token no App
And  inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then  serei redirecionado para a home logada do Portal

Scenario :  Cliente com token habilitado Código inválido
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When seguir passo a passo de resgatar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente com token habilitado Código expirado
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When seguir passo a passo de resgatar o token no App
And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente com token habilitado Número de tentativas excedido
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario :  Cliente com token habilitado ou expirado 3 vezes
Given  eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When  realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then  o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Scenario :  Cliente com token habilitado Personalize sua Visualização  aba documentos
Given insira um documento (CNPJ ou CPF) ou usuário e senha
And clicar no botão entrar
When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then  Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

Scenario :  Cliente com mais de um dispositivo habilitado validação de texto
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When apertar o botão Entrar
Then vou visualizar a tela “Selecione o dispositivo que deseja informar o Token” contendo os dispositivos cadastrados (nome do aparelho), setinha induzindo ao clique e botão voltar

Scenario :  Cliente com mais de um dispositivo habilitado validação de texto 2
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Selecione o dispositivo que deseja informar o Token”
And selecionar  o dispositivo
Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario :  Cliente com mais de um dispositivo habilitado Onde encontrar o Token 1
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

Scenario :  Cliente com mais de um dispositivo habilitado não acesso o canal
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario :  Cliente com mais de um dispositivo habilitado botão X
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario :  Cliente com mais de um dispositivo Informar código
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão Informar código
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario :  Cliente com mais de um dispositivo Não tenho o aplicativo
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

Scenario :  Cliente com mais de um dispositivo download no App store
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
When Clicar no botão App store
Then será redirecionado para a página de download no App store

Scenario :  Cliente com mais de um dispositivo download no Google Play
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
When Clicar no botão Google Play
Then será redirecionado para a página de download no Google Play

Scenario :  Cliente com mais de um dispositivo Onde encontrar o Token
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario :  Cliente com mais de um dispositivo home logada do Portal
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When seguir passo a passo de resgatar o token no App
And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then serei redirecionado para a home logada do Portal

Scenario :  Cliente com mais de um dispositivo Código inválido
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When seguir passo a passo de resgatar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente com mais de um dispositivo Código expirado
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When seguir passo a passo de resgatar o token no App
And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario :  Cliente com mais de um dispositivo Número de tentativas excedido
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario :  Cliente com mais de um dispositivo Número de tentativas tentativa DENTRO DOS 30
Given eu inseri um documento (CNPJ ou CPF) e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario :  Cliente com mais de um dispositivo Personalize sua Visualização
#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Given insira um documento (CNPJ ou CPF) ou usuário e senha
And clicar no botão entrar
When  Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento







Scenario: Cliente com um dispositivo habilitado não tenho esse Token
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When  estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then  visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

Scenario: Cliente com um dispositivo habilitado voltar
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario: Cliente com um dispositivo habilitado When  clicar no botão X
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente com um dispositivo habilitado código
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão Informar código
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente com um dispositivo habilitado App store valida botões
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara   “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

Scenario: Cliente com um dispositivo habilitado app store
Given eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão App store
Then será redirecionado para a página de download no App store

  Scenario: Cliente com um dispositivo habilitado google play
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
When Clicar no botão Google Play
Then será redirecionado para a página de download no Google Play

Scenario: Cliente com um dispositivo habilitado encontrar o token
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara   os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario: Cliente com um dispositivo habilitado Informe home logada
Given eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When seguir passo a passo de resgatar o token no App
And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then  serei redirecionado para a home logada do Portal

Scenario: Cliente com um dispositivo habilitado código inválido
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When seguir passo a passo de resgatar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente com um dispositivo habilitado código expirado
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When seguir passo a passo de resgatar o token no App
And inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente com um dispositivo habilitado 30 minutos
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario: Cliente com um dispositivo habilitado ou expirado 30 minutos
Given  eu inseri um usuário e senha válido no Portal
And já tiver feito a jornada de habilitação de Token no App
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Scenario: Cliente com um dispositivo habilitado personalize sua visualização
Given insira um documento (CNPJ ou CPF) ou usuário e senha
And clicar no botão entrar
When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

Scenario: Cliente com mais de um dispositivo habilitado selecione um dispositivo
Given eu inseri um usuário e senha válido no Portal
And tenho   mais de um dispositivo com Token cadastrado
When apertar o botão Entrar
Then vou visualizar a tela “Selecione o dispositivo que deseja informar o Token” contendo os dispositivos cadastrados (nome do aparelho), setinha induzindo ao clique e botão voltar

Scenario: Cliente com mais de um dispositivo habilitado validação de textos
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Selecione o dispositivo que deseja informar o Token”
And selecionar o dispositivo
Then vou visualizar a tela ‘’Informe o Token de 6 Dígitos” o texto “Acesse o Token no aplicativo Bin Gestão e informe o código de 6 dígitos abaixo” e os Botões “voltar”, “Não tenho esse token”, e “Confirmar”

Scenario: Cliente com mais de um dispositivo habilitado não tenho esse Token
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Não tenho esse Token”
Then visualiza a tela Onde encontrar o Token? com os botões “x” e Informar código”

Scenario: Cliente com mais de um dispositivo habilitado voltar
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Informe o Token de 6 dígitos”
And clicar no botão “Voltar”
Then visualizo a tela Acesse sua conta
And não acesso o canal

Scenario: Cliente com mais de um dispositivo habilitado onde encontrar o Token 2
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão X
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente com mais de um dispositivo habilitado onde resgatar o token
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
And seguir passo a passo de resgatar o token no App
When clicar no botão Informar código
Then serei redirecionado para a tela “Informe o Token de 6 dígitos”

Scenario: Cliente com mais de um dispositivo habilitado onde encontrar o Token 3
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Não tenho o aplicativo” o texto Caso ainda não tenha o aplicativo instalado, busque por Bin Gestão e baixe da sua loja (Play Stone ou APP Store): dois botões da App Store e da Play Store
And visualizara “1. Ao acessar o aplicativo você deverá inserir o mesmo usuário e senha que utiliza no portal.” “2. Logo que acessar será apresentado a jornada de habilitação de token para o dispositivo!” “3. Ao finalizar o cadastro siga o tutorial ao lado:”

Scenario: Cliente com mais de um dispositivo habilitado página de download
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
When Clicar no botão App store
Then será redirecionado para a página de download no App store

Scenario: Cliente com mais de um dispositivo habilitado google play
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
When Clicar no botão Google Play
Then será redirecionado para a página de download no Google Play

Scenario: Cliente com mais de um dispositivo habilitado validação de textos 2
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When estiver na tela “Onde encontrar o Token”
Then visualizara na caixa “Já tenho o aplicativo e o Token” o texto “Acesse no seu celular aplicativo Bin Gestão. Busque por “token”:
And visualizara os textos “1. Você pode encontrar o Token na área de acesso e no menu de Serviços.” “2. Ao clicar será exibido um código válido por 30 segundos, esse é o código que precisa ser informado sempre que realizar uma antecipação no portal.” e um botão Informar código.

Scenario: Cliente com mais de um dispositivo habilitado home logada
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When seguir passo a passo de resgatar o token no App
And inserir  o token VÁLIDO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then serei redirecionado para a home logada do Portal

Scenario: Cliente com mais de um dispositivo habilitado código inválido
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When seguir passo a passo de resgatar o token no App
And inserir  o token ERRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente com mais de um dispositivo habilitado código expirado
Given  eu inseri um usuário e senha válido no Portal
And  tenho mais de um dispositivo com Token cadastrado
When  seguir passo a passo de resgatar o token no App
And  inserir  o token EXPIRADO de 6 dígitos na tela “Informe o Token de 6 dígitos”
And clicar em Confirmar
Then  o portal apresentará a mensagem “Código inválido ou expirado.”

Scenario: Cliente com mais de um dispositivo habilitado código expirado 3 vezes
Given  eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
Then serei bloqueado por 30 minutos para novas tentativas
And o portal apresentará a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

Scenario: Cliente com mais de um dispositivo habilitado código expirado 30 minutos
Given eu inseri um usuário e senha válido no Portal
And tenho mais de um dispositivo com Token cadastrado
When inserir qualquer código ERRADO ou EXPIRADO 3 vezes consecutivas na tela “Informe o Token de 6 dígitos”
And estiver bloqueado
When realizar uma nova tentativa DENTRO DOS 30 MINUITOS DE BLOQUEIO
Then o portal apresentará novamente a mensagem “Número de tentativas excedido, tente novamente daqui 30 minutos.”

#para esse cenário a seguir (deve ser feito com um documento quAnd não     marcou a checkbox, definir como padrão)
Scenario: Cliente com mais de um dispositivo habilitado personalize sua visualização
Given insira um usuário e senha válido no Portal
And clicar no botão entrar
When Visualiza a tela ‘Selecione o dispositivo que deseja informar o Token” com seus dispositivos cadastrados
And Seleciona o dispositivo
And Visualiza a tela ‘’Informe o Token de 6 Dígitos”
And Preenche o Token e clica no Botão “Confirmar”
Then Visualiza a Tela de Personalize sua Visualização com as abas documentos e estabelecimento

Scenario: Cliente com mais de um dispositivo habilitado bloqueado 3 tentativas
Given eu inseri um usuário e senha válido no Portal
And estou bloquedo pois inseri 3 tokens incorretos consecutivamente
When tento acessar o App com o dispositivo que “bloqueei a jornada”
Then não será possível realizar login por 30 minutos

Scenario: Cliente com mais de um dispositivo habilitado canais digitais
Given eu sou um cliente que nunca acessou os canais digitais (App e Portal)
When acessar a jornada de primeiro acesso através do Portal
Then devo conseguir realizar com sucesso a jornada

Scenario: Cliente com mais de um dispositivo habilitado app
Given eu sou um cliente que nunca acessou os canais digitais (App e Portal)
When realizar a jornada de primeiro acesso através do Portal com sucesso
And inserir  documento e senha
And clicar em Entrar
Then devo ser impactado pela jornada de inclusão de Token

Scenario: Cliente com mais de um dispositivo habilitado portal
Given eu sou um cliente que já acessou os canais digitais (App e Portal)
When realizar a jornada de esqueci minha senha com sucesso
And inserir  documento e senha atualizados
And clicar em Entrar
Then devo ser impactado pela jornada de inclusão de Token


