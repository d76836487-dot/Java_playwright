#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home Logada


@TestCaseKey=SMP-T10
@sicredi @Home
Scenario: Login com sucesso
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva


@TestCaseKey=SMP-T11
@sicredi @Home
Scenario: Usuário não encontrado no GA1 nem no GA2 e sem cadastro na Fiserv
  When Usuário tenta logar na aplicação com "81633816000210" e "Fiserv@123"
  Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"

@TestCaseKey=SMP-T13
@sicredi @Home
Scenario Outline: Usuário tenta logar com senha errada
  When Usuário loga com senha errada
  And Todas as requisições HTTP foram respondidas
  Then Usuário verá em "Login - mensagem de erro" o valor "<descrição>"
@pt-br
Examples:
  | descrição                                                                                           |
  | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |


@TestCaseKey=SMP-T16
@sicredi @Home
Scenario Outline: Banner de comunicação comercial
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  Then Usuário verá em "Home - Maquininha" o valor "<descrição>"
  And Usuário verá em "Home - Maquininha - Botão Confira" o valor "<texto botão>"
@pt-br
Examples:
  | descrição                           | texto botão |
  | Veja as vantagens da sua maquininha | Confira     |

@TestCaseKey=SMP-T19
@sicredi @Home
Scenario: Usuário será direcionado ao Vendas Hoje ao clicar em Ver Tudo da seção Vendas Hoje
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  When usuário clica "Home - Card Vendas Hoje - Ver Tudo"
  Then será direcionado ao menu "Vendas Hoje"

# TODO: fix to use anticipation linked to data-testid
@MDRPadrão @PermiteAdiantamento
@TestCaseKey=SMP-T17
@sicredi @Home
Scenario Outline: Usuário MDR Padrão verá card "Receba antes"
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  Then Usuário verá card Antecipação
  And Usuário verá em "Home - Card Antecipação - Botão Ir" o valor "<texto botão>"
@pt-br
Examples:
  | texto botão         |
  | Ir para antecipação |



@TestCaseKey=SMP-T26
@sicredi @Home
Scenario: Total de Recebimentos na Home deve ser igual ao de hoje de futuro previstos
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  Then Total de Recebimentos será igual ao recebimento de hoje + futuro previsto

@TestCaseKey=SMP-T148
@sicredi @Home
Scenario: Ocultar valores da Home
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  When usuário clica no "Ocultar Valores" no "Header"
  Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "R$ ••••"
  And Usuário verá em "Home - Card Recebimento - Total Recebimento" o valor "R$ ••••"
  And Usuário verá em "Home - Card Recebimento - Recebimento Hoje" o valor "R$ ••••"
  And Usuário verá em "Home - Card Recebimento - Recebimento Previsto" o valor "R$ ••••"
  And Usuário verá em todos os campos "Home - Card Últimas Vendas - Valor" o valor "R$ ••••" - se existir
  And Usuário verá em todos os campos "Home - Card Antecipação - Valor" o valor "R$ •••• /" - se existir
  And Usuário verá em "Home - Agenda Recebimento - Valor Segunda" o valor "R$ ••••" - se existir
  And Usuário verá em "Home - Agenda Recebimento - Valor Terça" o valor "R$ ••••" - se existir
  And Usuário verá em "Home - Agenda Recebimento - Valor Quarta" o valor "R$ ••••" - se existir
  And Usuário verá em "Home - Agenda Recebimento - Valor Quinta" o valor "R$ ••••" - se existir
  And Usuário verá em "Home - Agenda Recebimento - Valor Sexta" o valor "R$ ••••" - se existir




@PermiteAdiantamento
@TestCaseKey=SMP-T20
@sicredi @Home
Scenario Outline: Abrir Modal Personalizar Acesso Rápido (inclui Adiantamento)
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given Usuário acessou o Home
  When clicar no botão "Personalizar"
  Then devo visualizar a um modal com demais <funcionalidades> para escolher
@pt-br
Examples:
  | funcionalidades                                                                             |
  | Antecipação, Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |


@TestCaseKey=SMP-T152
@sicredi @Home
Scenario: recebimentos futuros existem
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  And Todas as requisições HTTP foram respondidas
  Given que estou na tela “início” do Portal
  And existem valores futuros a receber
  Then usuário verá em "Home - Card Recebimento - Recebimento Previsto" valor maior que 0,00




@TestCaseKey=SMP-T118
@sicredi @Home
Scenario: Recebimentos Hoje no card Recebimentos é igual a API
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  Given Usuário acessou o Home
  Then Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API

@TestCaseKey=SMP-T139
@sicredi @Home
Scenario: Valor de Recebimentos Futuros Previstos na Home é igual à API
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  Given Usuário acessou o Home
  Then Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API

@TestCaseKey=SMP-T29
@sicredi @Home
Scenario: Valor de Vendas Hoje na Home é igual à API
  When Usuário loga na aplicação
  Then Usuário estará com acesso e sessão foi salva
  Given Usuário acessou o Home
  Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API




@TestCaseKey=SMP-T182
@sicredi @Home
Scenario: Busca de código EC valido aba Estabelecimento (Usuário Master)
  Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
  When Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'
  Then Dropdown irá filtrar e apresentar somente o EC correspondente
  And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"



@TestCaseKey=SMP-T186
@sicredi @Home
Scenario: Busca de código EC inválido aba Estabelecimento (Usuário Master)
  Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
  When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
  Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."

@TestCaseKey=SMP-T187
@sicredi @Home
Scenario: Busca de Documento (CNPJ ou CPF) inválido aba Estabelecimento (Usuário Master)
  Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
  When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
  Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."

@TestCaseKey=SMP-T188
@sicredi @Home
Scenario: Validar botão “X” no componente “Buscar por documento” na aba Documento na tela de personalize sua visualização (Usuário Master)
  Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
  When Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'
  Then Usuário poderá limpar a busca clicando no X

@TestCaseKey=SMP-T189
@sicredi @Home
Scenario: Busca de documento válido aba Documento (Usuário Master)
  Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
  When Usuário digitar um documento válido em 'Buscar por documento'
  Then Filtro apresentará somente a informação correspondente
  And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"

@TestCaseKey=SMP-T14
@sicredi @Home
Scenario: Usuário não existente no GA1 nem no GA2 e sem cadastro na Fiserv
  Given Usuário acessou o portal
  And Usuário clicou no botão esqueci minha senha
  When Usuário tenta recuperar senha com "81633816000210"
  Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"

  @TestCaseKey=SMP-T190
  @sicredi @Home
  Scenario: Busca de documento inválido aba Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário digitar um documento inválido em 'Buscar por documento'
    Then Usuário verá em "Trocar Estabelecimento - Nenhum resultado" o texto "Nenhum resultado encontrado."
#And Botão "Trocar Estabelecimento - Botão Acessar" estará visível e desabilitado
#And Botão "Trocar Estabelecimento - Marcar como Padrão" estará visível e desabilitado





#======================================================================================================================
#==testes falhando sicredi


@TestCaseKey=SMP-T183
Scenario: Validar Campos do Personalize sua Visualização aba Documento. (Usuário Master)
Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
When usuário clica no "Botão Todos Documentos" em "Trocar Estabelecimento"
Then Usuário verá em "Trocar Estabelecimento - Buscar documento" o placeholder "Buscar por documento ou nome"
And Usuário verá em "Trocar Estabelecimento - Botão Todos Documentos - Explicação" o texto "Essa visão irá agrupar todos os estabelecimentos abaixo do documento "
And Usuário verá em "Trocar Estabelecimento - Marcar como Padrão" o texto "Definir como padrão e não mostrar novamente"
And Usuário verá em "Trocar Estabelecimento - Texto Explicativo" o texto "Ao selecionar esse formato, as informações do Portal serão apresentadas de forma consolidada, agrupando os estabelecimentos abaixo do documento. Você poderá alterar a seleção a qualquer momento no portal."


@api
@TestCaseKey=SMP-T180
Scenario: Valida Nomes, CNPJ/CPFs, número EC e status com API
Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
When usuário clica "Header - Trocar Estabelecimento"
And usuário clica no "Botão selecionar por Estabelecimento" em "Trocar Estabelecimento"
Then Todos Nomes, CNPJ CPFs, número ECs e status são iguais a API


@TestCaseKey=SMP-T155
Scenario: abrir notificações
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
And Todas as requisições HTTP foram respondidas
Given Usuário acessou o Home
And Usuário tinha de mais de uma notificação
When usuário clica no "Notificações" na "Header"
Then o Portal deve abrir as "Minhas Notificações"

@TestCaseKey=SMP-T153
Scenario: recebimentos futuros não existem
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
And Todas as requisições HTTP foram respondidas
Given que estou na tela “início” do Portal
And não existem valores futuros para receber
Then Usuário verá em "Home - Card Recebimento - Recebimento Previsto" o valor "R$ 0,00"

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



@TestCaseKey=SMP-T31
Scenario: Compara últimas vendas na Home com a API
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
Given Usuário acessou o Home
And encontrou o campo "Home - Card Últimas Vendas - Valor"
Then 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API


@TestCaseKey=SMP-T196
Scenario: Validar não seleção no checkbox de não mostrar novamente (Usuário Master)
When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "desmarcada"
Then Usuário verá modal para selecionar EC ou DTCO


@TestCaseKey=SMP-T194
Scenario: Validação do Botão Acessar (Usuário Master)
Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
When Usuário selecionar um documento e clicar Acessar
Then Documento estará previamente selecionado


@NaoPermiteAdiantamento
@TestCaseKey=SMP-T169
Scenario Outline: Abrir Modal Personalizar Acesso Rápido (exclui Adiantamento)
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
And Todas as requisições HTTP foram respondidas
Given Usuário acessou o Home
When clicar no botão "Personalizar"
Then devo visualizar a um modal com demais <funcionalidades> para escolher
@pt-br
Examples:
| funcionalidades                                                                |
| Informe de Rendimento, Vendas, Recebimentos, Negócio, Relatórios, Solicitações |


@TestCaseKey=SMP-T177
Scenario: Validar expansão do dropdown na aba Estabelecimento. (Usuário Master)
Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
When Usuário expande primeiro dropdown
Then O primeiro dropdown estará expandido
And O dropdown conterá com as informações de Nome fantasia do EC
And O dropdown conterá com as informações de número do EC
And O dropdown conterá com as informações do status do EC no BW


@api
@TestCaseKey=SMP-T184
@sicredi @Home
Scenario: Busca de Documento (CNPJ ou CPF) válido aba Estabelecimento (Usuário Master)
Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
When Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'
Then Dropdown irá filtrar e apresentar somente EC do documento correspondente
And Usuário não verá nenhum "Trocar Estabelecimento - Nenhum resultado"


# TODO: fix to use anticipation linked to data-testid
# TODO: fix this: And Usuário não verá botão com texto "<texto botão>"
@MDRPadrão @NaoPermiteAdiantamento
@TestCaseKey=SMP-T18
Scenario: Usuário MDR Padrão NÃO verá card "Receba antes"
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
And Todas as requisições HTTP foram respondidas
Given Usuário acessou o Home
Then Usuário não verá card Antecipação

@rebatedor
@TestCaseKey=SMP-T24
Scenario Outline: Valor de vendas hoje e percentual no card Vendas Hoje do Home
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
And Todas as requisições HTTP foram respondidas
Given Usuário acessou o Home
Then Usuário verá em "Home - Card Vendas Hoje - Valor Vendas Hoje" o valor "<valor venda>"
And Usuário verá em "Home - Card Vendas Hoje - Percentual Vendas Hoje" o valor "<percentual>"
@pt-br
Examples:
| valor venda  | percentual |
| R$ 55.400,00 | 21%        |


@ignore # não tenho certeza se este teste está correto
@TestCaseKey=SMP-T146
Scenario: Compara agenda de recebimento da semana com a API
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
Given Usuário acessou o Home
Then 'Home - Card agenda semana' será igual a API


@ignore # TODO: confirmar a api
@UsuárioComHierarquia
@TestCaseKey=SMP-T287
Scenario: Vendas HOJE com seleção de EC (Usuário Master)
Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
When Usuário selecionar um EC e clicar Acessar
Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado

@ignore # TODO: confirmar a api
@UsuárioComHierarquia
@TestCaseKey=SMP-T290
Scenario: Vendas HOJE com seleção de Documento (Usuário Master)
Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
When Usuário selecionar um documento e clicar Acessar
Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado



@ignore # não tenho certeza se este teste está correto
@MDRPadrão @PermiteAdiantamento
@TestCaseKey=SMP-T162
Scenario: Está trazendo todos os ECs no card Adiantamento igual a API
When Usuário loga na aplicação
Then Usuário estará com acesso e sessão foi salva
Given Usuário acessou o Home
Then 'Home - Card Antecipação - ECs' são os mesmos que a API


@TestCaseKey=SMP-T195
Scenario: Validar seleção no checkbox de não mostrar novamente (Usuário Master)
When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' "marcada"
Then Usuário estará com acesso e sessão foi salva
