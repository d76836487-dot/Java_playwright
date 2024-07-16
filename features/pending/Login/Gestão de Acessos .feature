#language: en
@playwright @UsuárioComHierarquia
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Pending/Login/Login_Gestao_de_Acessos
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Login Gestao de Acessos

  @TestCaseKey=SMP-T100
  Scenario: Consultar tela Gestão de Acessos
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no "Menu Lateral"
    Then será direcionado para a página de "Gestão de Acessos"
    And visualizará na tela de "Gestão de Acessos", logotipo da instituição, os ícones ocultar valores, ajuda, notificações e sair
    And visualizará abas de Usuários e Convites pendentes
    And visualizará campo Busca por usuário ou nome
    And visualizará botão Convidar novo usuáriogit checkout main

  @ignore
  @TestCaseKey=SMP-T62
  Scenario: Consultar com usuários cadastrados
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário deve visualizar a lista de usuários secundários cadastrados ao documento Master

  @ignore
  @TestCaseKey=SMP-T68
  Scenario: Consulta sem usuários cadastrados
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And usuário deve visualizar a mensagem “Nenhum usuário encontrado” com imagem com as cores da instituição.

  @ignore
  @TestCaseKey=SMP-T107
  Scenario: Consultar colunas na Aba Usuarios
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário visualizará na aba Usuarios, as colunas Nome, CPF, E-mail, Telefone, Permissão, assistente de operação ou assistente de consulta, Status: Ativo, secundário que acessa o portal, ou Inativo, secundário que não acessa o portal.

  @ignore
  @TestCaseKey=SMP-T92
  Scenario: Busca por nome ou usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário insere no campo "Busca por Usuario ou nome" um nome  inteiro ou parte dele
    And clica na lupa de busca
    Then usuário visualizará lista de usuários secundários, conforme foi selecionado na busca

  @ignore
  @TestCaseKey=SMP-T90
  Scenario: Busca por email de um Usuario secundario
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário insere no campo "Busca por Usuario ou nome" um nome o e-mail de um usuário secundário
    Then usuário visualizará lista de usuários secundários que contenham o email pesquisado

  @ignore
  @TestCaseKey=SMP-T110
  Scenario: Busca por usuário não cadastrado ou inválido
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário insere no campo "Busca por Usuario ou nome" um nome o e-mail invalido ou não cadastrado
    Then usuário visualizará a mensagem “Nenhum usuário encontrado”.

  @ignore
  @TestCaseKey=SMP-T112
  Scenario: Consultar campos no Detalhe do Usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  usuário Master clica em uma linha que tenha um usuário secundário cadastrado
    Then  usuário visualizará nome, cpf, email, telefone, permissão,Usuario, data de criação do perfil, criado por (razão social do EC), permissão de acesso, documento (CNPJ), estabelecimento comercial,
    And botão com usuario ativo ou inativo, tooltip com a mensagem “Usuários ativos acessam as funcionalidades e
    And Botões Editar e Excluir

  @ignore
  @TestCaseKey=SMP-T280
  Scenario: Ativando usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  seleciona um usuário secundário
    And  usuário clica no botão que estara inativo
    Then usuário visualizará mensagem de confirmação “Usuário ativo com sucesso”.

  @ignore
  @TestCaseKey=SMP-T78
  Scenario: Inativando usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And  seleciona um usuário secundário
    And  usuário clica no botão que estara ativo
    And  clica no modal no botão “Inativar Usuário?”
    Then usuário visualizará mensagem de confirmação “Usuário inativo com sucesso”.

  @ignore
  @TestCaseKey=SMP-T104
  Scenario: Acessando com usuário secundário com perfil inativo
    Given usuário Master inativou o acesso de um usuário secundário
    When usuário secundário tentar acessar o canal com usuário e senha
    Then usuário secundário não deve conseguir acessar o Portal
    And deve visualizar a mensagem “Você não tem permissão para fazer login neste momento. Por favor, tente novamente mais tarde”.

  @ignore
  @TestCaseKey=SMP-T283
  Scenario: Consultar Botoes no Modal de Exclusão de Usuario
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And   clica no botão "Excluir”
    Then  visualizará um modal com os Botoes, Excluir, Cancelar e o “X”, que fecham o modal e nenhuma ação é salva.

  @ignore
  @TestCaseKey=SMP-T77
  Scenario: Excluindo usuario
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And   clica no botão "Excluir”
    Then  visualizará uma solicitação para confirmar a ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”
    And clica no Botão Excluir
    Then visualizara a mensagem, "Usuario deletado com sucesso"

  @ignore
  @TestCaseKey=SMP-T282
  Scenario: Fechando Modal atraves do Botão Cancelar
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And   clica no botão "Excluir”
    Then  visualizará uma solicitação para confirmar a ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”
    And clica no Botão Cancelar
    Then Usuario retornara para a pagina que estava anteriormente

  @ignore
  @TestCaseKey=SMP-T284
  Scenario: Fechando Modal atraves do Botão X
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And   clica no botão "Excluir”
    Then  visualizará uma solicitação para confirmar a ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”
    And clica no Botão X
    Then Usuario retornara para a pagina que estava anteriormente

  @ignore
  @TestCaseKey=SMP-T89
  Scenario: Recebendo Mensagem de erro ao tentar “Excluir” usuario, quando o sistema estiver com indisponibilidade
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And usuário clica no botão "Excluir” no modal
    And ocorre inconsistência no sistema
    Then usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  @ignore
  @TestCaseKey=SMP-T105
  Scenario: Recebendo Mensagem de erro ao tentar “Inativar” usuario, quando o sistema estiver com indisponibilidade
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario na lista
    And usuário clica no botão para inativar um usuario
    And ocorre inconsistência no sistema
    Then usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  @ignore
  @TestCaseKey=SMP-T134
  Scenario: Recebendo Mensagem de erro ao tentar “Ativar” usuario, quando o sistema estiver com indisponibilidade
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario inativo na lista
    And usuário clica no botão para ativar
    And ocorre inconsistência no sistema
    Then usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  @ignore
  @TestCaseKey=SMP-T82
  Scenario: Consultando campos habilitados para edição
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um  usuario secundario
    And clica no botão "Editar”
    Then usuário visualizará os seguintes campos habiitados, e-mail, telefone, permissionamento habilitados para edição.

  @ignore
  @TestCaseKey=SMP-T96
  Scenario: Inserindo e-mail correto
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And seleciona botão "Editar”
    And insere um novo e-mail
    And no campo “Confirme o e-mail” insere novamente o e-mail
    And usuario seleciona botão "Salvar”
    Then usuário visualizará a mensagem “Alterações salvas com sucesso”.

  @ignore
  @TestCaseKey=SMP-T79
  Scenario: Inserindo e-mail incorreto
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And seleciona botão "Editar”
    And insere no campo email um e-mail incorreto
    And no campo “Confirme o e-mail” insere novamente o e-mail incorreto
    Then o Botão "salvar" não deve ficar habilitado para salvar

  @ignore
  @TestCaseKey=SMP-T136
  Scenario: Inserindo Emails diferentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And seleciona botão "Editar”
    And insere no campo email um e-mail correto
    And no campo “Confirme o e-mail” insere um diferente
    Then usuário visualizará a mensagem “Os e-mails não coincidem” no campo "Conmfirme o email"

  @ignore
  @TestCaseKey=SMP-T88
  Scenario: Inserindo telefone correto
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And seleciona botão "Editar”
    And insere no campo telefone um telefone correto
    And Clica no botão salvar
    Then usuário visualizará a mensagem “Usuario editado com sucesso”.

  @ignore
  @TestCaseKey=SMP-T72
  Scenario: Inserindo telefone incorreto
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And seleciona botão "Editar”
    And insere no campo telefone um telefone incorreto (pode ser faltando um numero)
    And Clica no botão salvar
    Then usuário visualizará a mensagem “Ops.. Ocorreu um erro, tente novamente"

  @ignore
  @TestCaseKey=SMP-T86
  Scenario: Editando usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And clica no botão "Editar”
    And no campo "permissão" ,clica na seta para selecionar, (assistente de consulta/ assistente de operação)
    When clica no botão "Salvar”
    Then visualizará a mensagem “usuario editado com sucesso”.

  @ignore
  @TestCaseKey=SMP-T99
  Scenario: Alterando campo “Qual documento o usuário poderá acessar?” – Cenário de massa com Hierarquia
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And  abre a tela de detalhe
    And usuário clica no botão "Editar”
    And seleciona Todos
    And  clica no botão "Salvar”
    Then usuário secundário terá permissão para visualizar todos os EC´s cadastrados no documento
    And usuário master visualizará a mensagem “Alterações salvas com sucesso”.

  @ignore
  @TestCaseKey=SMP-T74
  Scenario: Alterando campo “Qual documento o usuário poderá acessar?” – Cenário de outra com Hierarquia
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    Then será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And  abre a tela de detalhe
    And usuário clica no botão "Editar”
    And clica em Apenas um documento
    And usuário master seleciona qual EC o usuário secundário poderá visualizar
    When usuário clica no botão "Salvar”
    Then usuário secundário terá permissão para visualizar apenas o EC´s cadastrado no documento
    And o usuário master visualizará a mensagem “Alterações salvas com sucesso”.

  @ignore
  @TestCaseKey=SMP-T94
  Scenario: Alterando o campo “Qual documento o usuário poderá acessar?” – Cenário de massa com apenas um documento e um EC
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And  clica no botão "Editar”
    Then usuário não tera Opção edição de documento a fazer, pois a massa só possui um documento e um EC

  @ignore
  @TestCaseKey=SMP-T114
  Scenario: Alterando o campo “Qual documento o usuário poderá acessar?” – Cenário de massa com apenas um documento e X ECs
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And seleciona um usuario secundario
    And  clica no botão "Editar”
    Then usuário podera alterar o Estabelecimento comercial de acordo com a apresentação em tela dos ECs atrelados ao documento em questão

  @ignore
  @TestCaseKey=SMP-T133
  Scenario: Consultando Tela Convites pendentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    Then usuário visualizará a tela de Gestão de Acessos o logotipo da instituição,ícones ocultar valores, ajuda, notificações e sair, as abas de usuários e convites pendentes, campo Busca por usuário ou nome, botão Convidar novo usuário, campo de quantidade de exibição de usuários.

  @ignore
  @TestCaseKey=SMP-T135
  Scenario: Consultando colunas Tela Convites pendentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    Then usuário visualizará as colunas Nome, CPF, usuário, E-mail, Telefone, Permissão: assistente de operação ou assistente de consulta, Status: Pendente (único status para essa tela)

  @ignore
  @TestCaseKey=SMP-T73
  Scenario: Consultando componente de busca “Buscar por usuário ou nome” pelo nome
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And usuário insere na "Busca por usuario ou nome" nome ou parte do nome
    And clica na lupa de busca
    Then usuário visualizará o nome selecionado na Busca

  @ignore
  @TestCaseKey=SMP-T61
  Scenario: Consultando componente de busca “Buscar por usuário ou nome” pelo usuario
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And usuário insere na "Busca por usuario ou nome" usuario
    And clica na lupa de busca
    Then usuário visualizará o usuario selecionado na Busca

  @ignore
  @TestCaseKey=SMP-T98
  Scenario: Consultando componente de busca com usuário não cadastrado ou inválido
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And usuário insere na "Busca por usuario ou nome" invalidos
    And clica na lupa de busca
    Then usuário visualizará a mensagem “Nenhum usuário encontrado”.

  @ignore
  @TestCaseKey=SMP-T138
  Scenario: Detalhe do Usuário em Convites Pendentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And  usuário clica em um usuário secundário
    Then usuário visualizará nome, cpf, email, telefone, permissão, usuário, data de criação do perfil, criado por, permissão de acesso, documento (CNPJ), estabelecimento comercial, Status de Convite Pendente sinalizado em amarelo, botão Excluir e botão Reenviar e-mail

  @ignore
  @TestCaseKey=SMP-T75
  Scenario: Botão Excluir na tela Detalhe do usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And e seleciona um usuario secundario
    And clica no botão "Excluir”
    Then usuário visualizará o modal solicitando a confirmação da ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”

  @ignore
  @TestCaseKey=SMP-T65
  Scenario: Botão Reenviar e-mail na tela Detalhe do usuário
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And e seleciona um usuario secundario
    And clica no botão "Reenviar e-mail”
    Then usuário visualizará o modal com a mensagem: “Convite enviado com sucesso. Enviamos um convite para o e-mail informado para o usuário completar seu acesso. Caso o usuário não tenha recebido o e-mail, você pode solicitar o reenvio na página de convites pendentes.” E os botãos X e Entendi!

  @ignore
  @TestCaseKey=SMP-T285
  Scenario: Botão “Convidar novo usuário” em Convites pendentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And usuário está na tela “Convites Pendentes” e quer convidar um novo usuário secundário
    And clica em “Convidar novo usuário”
    Then usuario sera direcionado para a tela "Convidar novo usuario"

  @ignore
  @TestCaseKey=SMP-T81
  Scenario: Consultando os Campos na aba convites pendentes
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And  usuário clica em “Convites Pendentes”
    And usuário está na tela “Convites Pendentes” e quer convidar um novo usuário secundário
    And clica em “Convidar novo usuário”
    Then usuário visualizará os campos obrigatórios habilitados para preenchimento: Nome completo, CPF, E-mail, Confirme o e-mail, Permissão de acesso ao EC e box de confirmação de leitura e aceite dos Termos e Condições, botões Cancelar e Convidar

  @ignore
  @TestCaseKey=SMP-T97
  Scenario: Convidar Usuario inserindo e-mails incorretos
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And preenche o campo “Confirme o e-mail” com e-mail diferente do inserido no campo “E-mail”
    Then usuário visualizará a mensagem de erro “Os e-mails não coincidem”

  @ignore
  @TestCaseKey=SMP-T111
  Scenario: Convidar Usuario inserindo e-mail invalido
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And preenche o campo “Confirme o e-mail” com e-mail diferente do inserido no campo “E-mail”
    Then usuário visualizará a mensagem de erro “Os e-mails não coincidem”

  @ignore
  @TestCaseKey=SMP-T108
  Scenario: Convidar Usuario inserindo Telefone invalido
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And preenche o campo Telefone com um numero invalido ou faltando numero
    Then usuário visualizará a mensagem de erro “Telefone invalido”

  @ignore
  @TestCaseKey=SMP-T132
  Scenario: Convidar Usuario secundário ja cadastrado na base
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And usuário preenche o campo “Usuário”, com dados já cadastrados na base
    Then usuário visualizará a mensagem de erro “Este usuário já está em uso. Tente outro” , abaixo do campo Usuario

  @ignore
  @TestCaseKey=SMP-T95
  Scenario: Campo “permissionamento” com um EC e um documento, para assistente de operações
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    When usuário master seleciona a opção Assistente de operações no campo Permissão
    Then usuário visualizará a mensagem ao lado de permissionamento, “Quais funcionalidades o perfil tem acesso: Vendas, Recebimentos, Antecipação, Solicitações, Relatórios, Negócio e Ajuda”

  @ignore
  @TestCaseKey=SMP-T76
  Scenario: Secundário com perfil assistente de operações com permissão para acessar menu antecipação
    Given usuário com perfil Assistente de operações esta logado no Portal do Cliente
    When ele acessar o menu Antecipação do lado esquerdo
    Then ele deve conseguir navegar e contratar antecipação de recebíveis, porem não deve visualizar Aba Gestão de Acessos

  @ignore
  @TestCaseKey=SMP-T106
  Scenario: Campo “permissionamento” com um EC e um documento, para assistente de consulta
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    When usuário master seleciona a opção Assistente de consulta no campo Permissão
    Then usuário visualizará a mensagem ao lado de permissionamento, “Quais funcionalidades o perfil tem acesso, Vendas, Recebimentos, Solicitações, Relatórios, Negócio e Ajuda.

  @ignore
  @TestCaseKey=SMP-T83
  Scenario: Secundário com “permissionamento” de assistente de consulta
    Given usuário com perfil Assistente de consulta esta logado no Portal do Cliente
    When ele acessar o menu lateral esquerdo
    Then NÃO deve conseguir visualizar a aba Gestão de acessos, Antecipação no menu lateral nem como opção de acesso rápido nem no dash da home logada

  @ignore
  @TestCaseKey=SMP-T87
  Scenario: Consulta do campo “estabelecimento comercial (EC)” com mais de um EC todos documentos
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    Then visualiza na parte debaixo, “Qual documento o usuário poderá acessar?” se acessar Todos aparecera todos os documentos atrelados ao EC Master

  @ignore
  @TestCaseKey=SMP-T109
  Scenario: Consulta do campo “estabelecimento comercial (EC)” com mais de um EC e um documento
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And  visualiza “Quail documento o usuário poderá acessar?”
    And seleciona a opção de apenas 1 EC no campo “estabelecimento comercial (EC)”
    Then usuário visualizará o campo preenchido com o EC selecionado

  @ignore
  @TestCaseKey=SMP-T64
  Scenario: Consulta do campo “estabelecimentos comercial (EC)” com mais de um EC e mais de um documento
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And  visualiza “Qual documento o usuário poderá acessar?”
    And portal apresentará por default “Todos” selecionado
    Then usuário visualizará o nome do estabelecimento comercial e o documento pai da hierarquia
    And tooltip com a mensagem: “Ao selecionar o CNPJ raiz, o usuário terá acesso a todos os CNPJs abaixo dele.”

  @ignore
  @TestCaseKey=SMP-T131
  Scenario: Consulta campo “estabelecimento comercial (EC)” com mais de um EC e mais de 1 documento
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And será direcionado para a página de "Gestão de Acessos"
    And na aba usuarios clica em "Convidar novo usuario"
    And usuário master tem mais de um CNPJ e mais de um EC
    And usuário master seleciona a opção “Apenas um documento” no campo “Qual documento o usuário poderá acessar?”
    And seleciona um CNPJ no campo “Documento”
    Then o usuário visualizará no campo Estabelecimento comercial (EC) todos os Ec´s do documento selecionado, mas por default vira “Todos” preenchido

  @ignore
  @TestCaseKey=SMP-T93
  Scenario: link “Termos e condições”
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral
    And será direcionado para a página de "Gestão de Acessos"
    And clica em "Convidar novo usuário"
    Then o usuário visualizará o link “Termos e Condições” abaixo da tela

  @ignore
  @TestCaseKey=SMP-T71
  Scenario: Botão “Fechar” em “Termos e condições”
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral
    And será direcionado para a página de "Gestão de Acessos"
    And clica em "Convidar novo usuário"
    And clica em “Termos e condições”
    Then abrira um modal com os termos
    And clica no botão “Fechar” no canto inferior do modal
    And usuário será redirecionado para a tela anterior “Convidar novo usuário”

  @ignore
  @TestCaseKey=SMP-T281
  Scenario: Botão X em “Termos e condições”
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral
    And será direcionado para a página de "Gestão de Acessos"
    And clica em "Convidar novo usuário"
    And clica em “Termos e condições”
    Then abrira um modal com os termos
    And clica no botão X do modal
    And usuário será redirecionado para a tela anterior “Convidar novo usuário”

  @ignore
  @TestCaseKey=SMP-T102
  Scenario: Botão “Convidar”
    Given usuário Master está logado no Portal do Cliente
    When usuário clica em "Gestão de Acessos" no menu lateral
    And será direcionado para a página de "Gestão de Acessos"
    And clica em "Convidar novo usuário"
    And preencheu os campos Obrigatorios,Nome Completo, CPF,Email,Confirme o email,usuario,telefone, permissão ,e preenche a checkBox
    And usuário clica no botão “Convidar”
    Then usuário visualizará a mensagem: “Convite enviado com sucesso. Enviamos um convite para o e-mail informado para o usuário completar seu acesso. Caso o usuário não tenha recebido o e-mail, você pode solicitar o reenvio na página de convites pendentes. Entendi!”

  @ignore
  @TestCaseKey=SMP-T70
  Scenario: Consultando texto do convite enviado
    Given que o usuário master envio o convite para o usuário secundário
    When o usuário secundário recebe o e-mail com o conteúdo
    Then o usuário visualizará o texto: “Você foi convidado a acessar o Portal do Cliente! Olá, (nome completo do secundário). Você recebeu um convite de (nome fantasia/usuário adm) para acessar o Portal do Cliente. Utilize a credencial de acesso no campo usuário na página de Primeiro Acesso para cadastrar a sua senha. Usuário: (usuário). Acesse o link abaixo para ser direcionado para o Primeiro Acesso para finalizar seu cadastro. link”

