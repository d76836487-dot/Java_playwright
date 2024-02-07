#language: en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Validação_Tela_Gestão_de_Acessos/Validação_Tela_Gestão_de_Acessos_Secundarios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Validação Tela Gestão de Acessos Secundarios

  Scenario: Validação da tela e campos em Gestão de Acessos
    Given que o usuário Master está logado no Portal do Cliente
    When o usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And é direcionado para a página de Gestão de Acessos
    Then o usuário visualizará a tela de Gestão de Acessos o logotipo da instituição, os ícones ocultar valores, ajuda, notificações e sair, as abas de usuários e convites pendentes, campo Busca por usuário ou nome, botão Convidar novo usuário, campo de quantidade de exibição de usuários.

  Scenario: Validação da aba Usuários com usuários cadastrados
    Given que o usuário Master está logado no Portal do Cliente
    When o usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And é direcionado para a página de Gestão de Acessos
    Then o usuário deve visualizar a lista de usuários secundários cadastrados ao documento logado.

  Scenario: Validação da aba Usuários sem usuários cadastrados
    Given que o usuário Master está logado no Portal do Cliente
    When o usuário clica em "Gestão de Acessos" no menu lateral esquerdo
    And é direcionado para a página de Gestão de Acessos
    Then o usuário deve visualizar a mensagem “Nenhum usuário encontrado” com imagem com as cores da instituição.

  Scenario: Validação das colunas da aba Usuários com usuários cadastrados
    Given que o usuário Master está logado no Portal do Cliente
    When o usuário está em "Gestão de Acessos"
    Then o usuário visualizará as colunas Nome, CPF, E-mail, Telefone, Permissão: assistente de operação ou assistente de consulta, Status: Ativo, secundário que acessa o portal, ou Inativo, secundário que não acessa o portal.

  Scenario: Validação do componente de busca “Buscar por usuário ou nome” pelo nome
    Given que o usuário Master está em "Gestão de Acessos"
    When o usuário insere o nome do usuário secundário, inteiro ou parte do nome, ex: nome Maria Paula da Silva, insere somente Paula.
    And clica na lupa de busca
    Then o usuário visualizará lista de usuários secundários que contenham o nome inteiro e todos usuários que contenham parte do nome, exemplo: Maria Paula, Ana Paula, Paula, etc

  Scenario:Validação do componente de busca “Buscar por usuário ou nome” pelo usuário
    Given que o usuário Master está em "Gestão de Acessos"
    When o usuário insere o e-mail do usuário secundário
    Then o usuário visualizará lista de usuários secundários que contenham a palavra pesquisada

  Scenario:Validação do componente de busca “Buscar por usuário ou nome” pelo nome, com usuário não cadastrado ou inválido
    Given que o usuário Master está em "Gestão de Acessos"
    When o usuário insere o nome do usuário secundário
    Then usuário visualizará a mensagem “Nenhum usuário encontrado”.

  Scenario: Validação do Detalhe do Usuário
    Given que o usuário Master está em "Gestão de Acessos"
    When usuário Master clica na linha do usuário secundário
    Then usuário visualizará nome, cpf, email, telefone, permissão, usuário, data de criação do perfil, criado por (razão social do EC), permissão de acesso, documento (CNPJ), estabelecimento comercial, botões ativo/inativo, o tooltip com a mensagem “Usuários ativos acessam as funcionalidades e documentos/estabelecimentos com permissão”, editar, excluir

  Scenario:Validação do botão ativar e desativar usuários
    Given que o usuário Master está em "Gestão de Acessos"
    When usuário Master clica na linha do usuário secundário
    And abre a tela de detalhe do usuário secundário
    And clica no botão Usuário ativo para inativar o usuário secundário, que tem o perfil ativo por default
    Then usuário visualizará o modal solicitando a confirmação da ação com a mensagem: “Inativar usuário? Usuários inativos tem sua conta suspensa até você os ativar novamente. Você pode ativar a conta do usuário a qualquer momento. Essa ação é referente apenas ao acesso deste usuário”. E os botões Cancelar e Inativar.

  Scenario: Validação do botão Inativar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão Inativar do modal “Inativar Usuário?”
    Then o usuário visualizará a mensagem de confirmação da alteração do status de “Usuário inativo com sucesso”.

  Scenario: Validação do botão Ativar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão Ativar do modal “Ativar Usuário?”
    Then o usuário visualizará a mensagem de confirmação da alteração do status de “Usuário Ativo com sucesso”.

  Scenario: Validação do acesso do usuário secundário com seu perfil inativado
    Given que o usuário Master inativou o acesso de um usuário secundário
    When o usuário secundário tentar acessar o canal com usuário e senha
    Then o usuário secundário não deve conseguir acessar o Portal
    And deve visualizar a mensagem “Você não tem permissão para fazer login neste momento. Por favor, tente novamente mais tarde”.

  Scenario: Validação do botão Excluir na tela Detalhe do usuário na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Excluir”
    Then usuário visualizará o modal solicitando a confirmação da ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”, os botões Excluir, Cancelar e o “X”, que fecham o modal e nenhuma ação é salva.

  Scenario: Validação de Excluir usuário secundário no modal na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Excluir” no modal
    Then o usuário visualizará a mensagem de confirmação: “Usuário deletado com sucesso”

  Scenario: Validação de mensagem de erro em “Excluir” na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Excluir” no modal
    And ocorre inconsistência no sistema
    Then o usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  Scenario: Validação de mensagem de erro em “Inativar” na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Inativar” no modal
    And ocorre inconsistência no sistema
    Then o usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  Scenario: Validação de mensagem de erro em “Ativar” na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Ativar” no modal
    And ocorre inconsistência no sistema
    Then o usuário visualizará a mensagem de erro: “Ops. Ocorreu um erro, tente novamente”

  Scenario: Validação do botão Editar na tela Detalhe do usuário na aba USUÁRIOS
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    When o usuário clica no botão "Editar”
    Then o usuário visualizará os campos e-mail, telefone e permissionamento habilitados para edição.

  Scenario:Validação do campo e-mail correto na tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And insere o novo e-mail
    And o campo “Confirme o e-mail” fica habilitado para inserir novamente o e-mail
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Alterações salvas com sucesso”.

  Scenario: Validação de dado incorreto o campo e-mail tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And insere um novo e-mail inválido
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Email incorreto” em popup vermelho na tela.

  Scenario: Validação do campo “Confirme o e-mail” na tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And insere o novo e-mail
    And o campo “Confirme o e-mail” fica habilitado para inserir novamente o e-mail
    And insere o e-mail diferente para confirmação
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Os e-mails não coincidem”.

  Scenario: Validação do campo telefone correto na tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And insere o novo telefone válido
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Alterações salvas com sucesso”.

  Scenario: Validação do campo telefone incorreto na tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And insere um novo telefone inválido
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Telefone incorreto” em popup vermelho na tela.

  Scenario: Validação do campo permissionamento na tela Editar usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And clica na seta para selecionar a permissão, assistente de consulta/ assistente de operação
    When o usuário clica no botão "Salvar”
    Then o usuário visualizará a mensagem “Alterações salvas com sucesso”.

  Scenario: Validação do campo “Qual documento o usuário poderá acessar?” na tela Editar usuário – Cenário de massa com Hierarquia
    Given que o usuário Master está em "Gestão de Acessos"
    And abre a tela de detalhe do usuário secundário
    And o usuário clica no botão "Editar”
    And clica em Todos
    When o usuário clica no botão "Salvar”
    Then o usuário secundário terá permissão para visualizar todos os EC´s cadastrados no documento
    And o usuário master visualizará a mensagem “Alterações salvas com sucesso”.

  Scenario:Validação do campo “Qual documento o usuário poderá acessar?” na tela Editar usuário – Cenário de outra com Hierarquia
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário clica no botão "Editar”
    And clica em Apenas um documento
    And o usuário master seleciona qual EC o usuário secundário poderá visualizar
    When o usuário clica no botão "Salvar”
    Then o usuário secundário terá permissão para visualizar apenas o EC´s cadastrado no documento selecionado
    And o usuário master visualizará a mensagem “Alterações salvas com sucesso”.

  Scenario: Validação do campo “Qual documento o usuário poderá acessar?” na tela Editar usuário – Cenário de massa com apenas um documento e um EC
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário clica no botão "Editar”
    Then o usuário não tem edição de documento a fazer, pois a massa só possui um documento e um EC

  Scenario: Validação do campo “Qual documento o usuário poderá acessar?” na tela Editar usuário – Cenário de massa com apenas um documento e X ECs
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário clica no botão "Editar”
    Then o usuário pode alterar o Estabelecimento comercial de acordo com a apresentação em tela dos ECs atrelados ao documento em questão

  Scenario: Validação da tela Convites pendentes
    Given que o usuário Master está em "Gestão de Acessos"
    When o usuário clica em “Convites Pendentes”
    Then o usuário visualizará a tela de Gestão de Acessos o logotipo da instituição, os ícones ocultar valores, ajuda, notificações e sair, as abas de usuários e convites pendentes, campo Busca por usuário ou nome, botão Convidar novo usuário, campo de quantidade de exibição de usuários.

  Scenario: Validação das colunas da tela Convites pendentes com usuários cadastrados
    Given que o usuário Master está em "Gestão de Acessos"
    When o usuário está na tela “Convites Pendentes”
    Then o usuário visualizará as colunas Nome, CPF, usuário, E-mail, Telefone, Permissão: assistente de operação ou assistente de consulta, Status: Pendente (único status para essa tela)

  Scenario:Validação do componente de busca “Buscar por usuário ou nome” pelo nome
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes”
    When o usuário insere o nome do usuário secundário, inteiro ou parte do nome, ex: nome Maria Paula da Silva, insere somente Paula.
    And clica na lupa de busca
    Then o usuário visualizará lista de convites pendentes dos usuários secundários que contenham o nome inteiro e de todos usuários que contenham parte do nome, exemplo: Maria Paula, Ana Paula, Paula, etc

  Scenario:Validação do componente de busca “Buscar por usuário ou nome” pelo usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes”
    When o usuário insere o e-mail do usuário secundário
    Then o usuário visualizará lista de convites pendentes dos usuários secundários que contenham a palavra pesquisada

  Scenario: Validação do componente de busca “Buscar por usuário ou nome” pelo nome, com usuário não cadastrado ou inválido
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes”
    When o usuário insere o nome do usuário secundário que ainda não fez o primeiro acesso
    Then usuário visualizará a mensagem “Nenhum usuário encontrado”.

  Scenario:Validação do Detalhe do Usuário em Convites Pendentes
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes”
    When usuário Master clica na linha do usuário secundário
    Then usuário visualizará nome, cpf, email, telefone, permissão, usuário, data de criação do perfil, criado por, permissão de acesso, documento (CNPJ), estabelecimento comercial, Status de Convite Pendente sinalizado em amarelo, botão Excluir e botão Reenviar e-mail


  Scenario:Validação do botão Excluir na tela Detalhe do usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes” e quer excluir o convite pendente de um usuário secundário
    When o usuário clica no botão "Excluir”
    Then usuário visualizará o modal solicitando a confirmação da ação com a mensagem: “Excluir usuário? Tem certeza que deseja excluir o usuário (nome do usuário secundário)? Essa ação não poderá ser desfeita”

  Scenario: Validação do botão Reenviar e-mail na tela Detalhe do usuário
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes” e quer reenviar o email de convite para o usuário secundário
    When o usuário clica no botão "Reenviar e-mail”
    Then usuário visualizará o modal com a mensagem: “Convite enviado com sucesso. Enviamos um convite para o e-mail informado para o usuário completar seu acesso. Caso o usuário não tenha recebido o e-mail, você pode solicitar o reenvio na página de convites pendentes.” E o botão Entendi!

  Scenario: Validação do botão “Convidar novo usuário”
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convites Pendentes” e quer convidar um novo usuário secundário
    When o usuário clica em “Convidar novo usuário”
    Then o usuário visualizará os campos obrigatórios habilitados para preenchimento: Nome completo, CPF, E-mail, Confirme o e-mail, Permissão de acesso ao EC e box de confirmação de leitura e aceite dos Termos e Condições, botões Cancelar e Convidar

  Scenario: Validação do botão “Convidar” com um EC e um documento, e e-mail incorreto
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário preenche o campo “Confirme o e-mail” com e-mail diferente do e-mail inserido no campo “E-mail”
    Then o usuário visualizará a mensagem de erro “Os e-mails não coincidem”

  Scenario: Validação do botão “Convidar” com um EC e um documento, e e-mail invalido
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário preenche o campo “E-mail” com um e-mail invalido
    Then o usuário visualizará a mensagem “Email incorreto” em popup vermelho na tela.

  Scenario: Validação do botão “Convidar” com um EC e um documento, e e-telefone invalido
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário preenche o campo “Telefone” com um número invalido
    Then o usuário visualizará a mensagem “Telefone incorreto” em popup vermelho na tela.

  Scenario: Validação do botão “Convidar” com um EC e um documento, e usuário secundário cadastrado na base
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário preenche o campo “Usuário”, com dados para acessar o portal de, no mínimo, 3 caracteres e @, já cadastrados na base em outra instituição, ou na mesma instituição
    Then o usuário visualizará a mensagem de erro “Este usuário já está em uso. Tente outro”

  Scenario: Validação do campo “permissionamento” com um EC e um documento, para assistente de operações
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário master seleciona a opção Assistente de operações no campo Permissão
    Then o usuário visualizará a mensagem: “Quais funcionalidades o perfil tem acesso: Vendas, Recebimentos, Antecipações, Solicitações, Relatórios, Negócio e Ajuda”

  Scenario: Validação da navegação de um secundário com “permissionamento” de assistente de operações
    Given que o usuário secundário com perfil Assistente de operações acessou o Portal
    When ele acessar o menu Antecipação
    Then ele deve conseguir navegar e contratar antecipação de recebíveis

  Scenario: Validação do campo “permissionamento” com um EC e um documento, para assistente de consulta
    Given que o usuário Master está em "Gestão de Acessos"
    And o usuário está na tela “Convidar novo usuário”
    When o usuário master seleciona a opção Assistente de Consulta no campo Permissão
    Then o usuário visualizará a mensagem: “Quais funcionalidades o perfil tem acesso: Vendas, Recebimentos, Solicitações, Relatórios, Negócio e Ajuda”
    And visualizará o documento (CNPJ) e o EC cadastrado

  Scenario: Validação da navegação de um secundário com “permissionamento” de assistente de consulta
    Given que o usuário secundário com perfil Assistente de consulta acessou o Portal
    Then ele NÃO deve conseguir visualizar o menu Antecipação no menu lateral, como opção de acesso rápido ou no dash da home logada

  Scenario: Validação do campo “estabelecimento comercial (EC)” com mais de um EC e um documento
    Given que o usuário Master está em "Convidar novo usuário"
    When ele visualiza a parte “Quais estabelecimentos o usuário poderá acessar?”
    Then o portal apresentará por default “Todos” no campo “estabelecimento comercial (EC)”
    And ao clicar no Accordion visualizara a listagem de ECs relacionados ao documento em questão

  Scenario: Validação do campo “estabelecimento comercial (EC)” com mais de um EC e um documento
    Given que o usuário Master está em "Convidar novo usuário"
    When ele visualiza a parte “Quais estabelecimentos o usuário poderá acessar?”
    And seleciona a opção de apenas 1 EC no campo “estabelecimento comercial (EC)”
    Then o usuário visualizará o campo preenchido com o EC selecionado

  Scenario: Validação do campo “estabelecimento comercial (EC)” com mais de um EC e mais de um documento
    Given que o usuário Master está em "Convidar novo usuário"
    And usuário master tem mais de um CNPJ e mais de um EC
    When ele visualiza a parte “Qual documento o usuário poderá acessar?”
    And o portal apresentará por default “Todos” selecionado
    Then o usuário visualizará o nome do estabelecimento comercial e o documento pai da hierarquia
    And o tooltip com a mensagem: “Ao selecionar o CNPJ raiz, o usuário terá acesso a todos os CNPJs abaixo dele.”

  Scenario: Validação do campo “estabelecimento comercial (EC)” com mais de um EC e mais de um documento
    Given que o usuário Master está em "Convidar novo usuário"
    And usuário master tem mais de um CNPJ e mais de um EC
    When o usuário master seleciona a opção “Apenas um documento” no campo “Qual documento o usuário poderá acessar?”
    And seleciona um CNPJ no campo “Documento”
    Then o usuário visualizará no campo Estabelecimento comercial (EC) todos os Ec´s do documento selecionado, mas por default vira “Todos” preenchido

  Scenario: Validação do campo “estabelecimento comercial (EC)” com mais de um EC e mais de um documento
    Given que o usuário Master está em "Convidar novo usuário"
    And usuário master tem mais de um CNPJ e mais de um EC
    And o usuário master selecionou “Apenas um documento” no campo “Qual documento o usuário poderá acessar?”
    And selecionou apenas um EC da listagem deste CNPJ
    Then o usuário máster visualizará o campo Estabelecimento comercial (EC) preenchido com o EC selecionado

  Scenario: : Validação do link “Termos e condições”
    Given que o usuário Master está em "Convidar novo usuário"
    When o usuário master clica em “Termos e condições”
    Then o usuário visualizará o modal com o texto “Termos de uso e condições”

  Scenario: Validação do botão “Fechar” em “Termos e condições”
    Given que o usuário Master está em "Convidar novo usuário"
    When o usuário master está em “Termos e condições”
    And clica no botão “Fechar” no canto inferior do modal
    Then o usuário será direcionado para a tela “Convidar novo usuário”

  Scenario: Validação do botão “Convidar” habilitado
    Given que o usuário Master está em "Convidar novo usuário"
    When o usuário já preencheu todos os campos obrigatórios
    And usuário clicou no box “Eu li e aceito os “Termos e Condições” para criação dos usuários
    Then o botão “Convidar” será habilitado

  Scenario: Validação do botão “Convidar”
    Given que o usuário Master está em "Convidar novo usuário"
    When o usuário clica no botão “Convidar”
    Then o usuário visualizará a mensagem: “Convite enviado com sucesso. Enviamos um convite para o e-mail informado para o usuário completar seu acesso. Caso o usuário não tenha recebido o e-mail, você pode solicitar o reenvio na página de convites pendentes. Entendi!”

  Scenario: Validação do texto do convite enviado
    Given que o usuário master envio o convite para o usuário secundário
    When o usuário secundário recebe o e-mail com o conteúdo
    Then o usuário visualizará o texto: “Você foi convidado a acessar o Portal do Cliente! Olá, (nome completo do secundário). Você recebeu um convite de (nome fantasia/usuário adm) para acessar o Portal do Cliente. Utilize a credencial de acesso no campo usuário na página de Primeiro Acesso para cadastrar a sua senha. Usuário: (usuário). Acesse o link abaixo para ser direcionado para o Primeiro Acesso para finalizar seu cadastro. link”



















