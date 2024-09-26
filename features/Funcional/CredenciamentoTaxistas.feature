#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Credenciamento_de_Taxistas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=None;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo

Feature: Credenciamento de Taxistas

 Scenario: CPF com Cnae de Taxista
   Given usuário tenha um CPF com Cnae de Taxista
   When ele acessar o link
   Then deve entrar no fluxo de Preenchimento do Formulário

 Scenario: Primeira Página do Formulário: Cenário Positivo
  Given Usuário com Cnae de Taxista esteja na tela para começar seu cadastro
  When Usuário colocar nome Completo, Data de Nascimento, Celular para contato, e Email
  And preencher os dados: Sobre seu negócio, CPF, Nome Fantasia, Faturamento anual, Ticket Médio
  Then o Botão Próximo ficara habilitado

 Scenario: Primeira Página do Formulário: Cenário de erro dos dados Nome, data de nascimento e CPF
  Given Usuário com Cnae de Taxista esteja na tela para começar seu cadastro
  When Usuário preencher “sobre você” e “Sobre seu negócio”
  And Nome, data de nascimento e/ou CPF não darem “match”
  When cliente clicar em “Próximo”
  Then apresentaremos um modal com a mensagem “Os dados CPF, nome ou data de nascimento estão inválidos.”.

 Scenario: Primeira Página do Formulário: Cenário de erro validação da formatação do e-mail
  Given Usuário com Cnae de Taxista esteja na tela para começar seu cadastro
  When Usuário preencher “sobre você” e “Sobre seu negócio”
  And coloca um e-mail sem a estrutura válida de e-mail
  When cliente clicar em “Próximo”
  Then apresentaremos um modal com a mensagem “E-mail inválido”

 Scenario: Primeira Página do Formulário: Cenário cliente clicou no botão “seja azulzinha”
  Given Usuário (com ou sem CNAE taxista) esteja na tela para começar seu cadastro
  When Usuário clica no botão “seja azulzinha”
  Then devemos abrir a URL https://www.azulzinhadacaixa.com.br/peca-azulzinha na mesma aba de navegação

 Scenario: Primeira Página do Formulário: Cenário validação do faturamento anual
  Given Usuário com Cnae de Taxista esteja na tela para começar seu cadastro
  When Usuário preencher um faturamento anual maior de R$ 120.000,00 no campo “faturamento anual”
  And clicou em “próximo”
  Then devemos apresentar a tela “Estamos sem ofertas para você” com o botão voltar

 Scenario: Primeira Página do Formulário: Cenário validação do faturamento anual – botão voltar
  Given Usuário tenha preenchido faturamento anual maior que R$ 120.000,00
  When Usuário estiver na tela “Estamos sem ofertas para você”
  And clicar no botão “voltar”
  Then deve voltar para a tela inicial do formulário

 Scenario: Com Oferta para Usuário com Cnae de Taxista
  Given Usuário preencheu a primeira fase do formulário
  When Usuário clicar no Botão Próximo
  Then abrira a página de Produtos azulzinha com: azuzinha pro e azuzinha aproxima selecionados por default para o cliente
  And menu na lateral direita com os dados de Negócio e Dados pessoais que foram preenchidos na tela anterior

 Scenario: Validando botões em Produtos azulzinha
  Given usuário esteja na aba Produtos azulzinha
  When usuário visualizara os botões para inclusão das tecnologias que estarão ativados
  And clicando sobre um deles
  Then desabilitara a tecnologia desejada

 Scenario: Validando botão Detalhe de taxas
  Given usuário esteja na aba Produtos azulzinha
  When clicar no botão “Detalhe de taxas”
  Then visualizara um modal com duas abas, 1° azulzinha pro e 2° azulzinha aproxima

 Scenario: Validando bandeiras no modal Taxas e prazo de recebimento – aba azulzinha pro
  Given usuário esteja no modal Taxas e prazo de recebimento
  When estiver na aba azulzinha pro
  Then visualizara as bandeiras Visa, Mastercard, Elo, Hipercard, Amex e Cabal

 Scenario: Validando bandeiras no modal Taxas e prazo de recebimento – aba azulzinha aproxima
  Given usuário esteja no modal Taxas e prazo de recebimento
  When estiver na aba azulzinha aproxima
  Then visualizara as bandeiras Visa, Mastercard e Elo

 Scenario: Botão X Modal Taxas e prazo de recebimento
  Given usuário esteja no modal Taxas e prazo de recebimento
  When ele clicar no Botão X
  Then ele voltara para aba Produtos azulzinha

 Scenario: Botão Fechar no Modal Taxas e prazo de recebimento
  Given usuário esteja no modal Taxas e prazo de recebimento
  When ele clicar no Botão Fechar
  Then ele voltara para aba Produtos azulzinha

 Scenario: Usuário escolheu apenas azulzinha pro
  Given usuário selecionou a azulzinha pro
  When clicar no botão próximo
  Then abrira uma nova tela para preencher o endereço
  And no checkout lateral será apresentado apenas a azulzinha pro

 Scenario: Usuário escolheu a azulzinha aproxima
  Given usuário selecionou a azulzinha aproxima
  When clicar no botão próximo
  Then abrira uma nova tela para preencher o endereço
  And no checkout lateral será apresentado apenas a azulzinha aproxima

 Scenario: Usuário escolheu a azulzinha pro e a azulzinha aproxima
  Given usuário selecionou a azulzinha pro e a azulzinha aproxima
  When clicar no botão próximo
  Then abrira uma nova tela para preencher o endereço
  And no checkout lateral será apresentado a azulzinha pro e a azulzinha aproxima

 Scenario: Preenchendo os dados de endereço com correspondência
  Given usuário está na tela Endereço
  When ele colocar o CEP
  Then os Demais dados serão autopreenchidos

 Scenario: Preenchendo os dados de endereço sem correspondência
  Given usuário está na tela Endereço
  When ele colocar o CEP que a API não identifique endereço correspondente
  Then os Demais dados podem ser preenchidos manualmente pelo cliente

 Scenario: Preenchendo os dados de endereço de estados que não sejam RIO DE JANEIRO
  Given usuário está na tela Endereço
  When ele colocar o CEP que não corresponda ao estado do Rio de Janeiro
  And clicar em próximo
  Then será apresentado um modal com a frase “CEP não elegível para essa campanha”

 Scenario: Preenchendo os dados de endereço de estados que não sejam RIO DE JANEIRO – modal Informar outro CEP
  Given usuário está na tela Endereço
  When informar um CEP de outro estado que não o Rio
  And visualizar o modal “CEP não elegível para essa campanha”
  When clicar no botão Informar outro CEP
  Then visualizara novamente a tela de Endereço

 Scenario: Preenchendo os dados de endereço de estados que não sejam RIO DE JANEIRO – modal Seja azulzinha
  Given usuário está na tela Endereço
  When informar um CEP de outro estado que não o Rio
  And visualizar o modal “CEP não elegível para essa campanha”
  When clicar no botão Seja azulzinha
  Then direcionaremos o cliente para a URL https://www.azulzinhadacaixa.com.br/peca-azulzinha

 Scenario: Clicando em voltar da tela “Para começar meu cadastro”
  Given que o usuário esteja na tela “Para começar meu cadastro”
  When clicar em Voltar
  Then deve retornar a página principal

 Scenario: Clicando em voltar da tela “Endereço”
  Given que o usuário esteja na tela “Endereço”
  When clicar em Voltar
  Then deve retornar a página “Produtos azulzinha”

 Scenario: Clicando em voltar da tela “Produtos azulzinha”
  Given que o usuário esteja na tela “Produtos azulzinha”
  When clicar em Voltar
  Then deve retornar a página “Para começar meu cadastro”

 Scenario: Clicando em voltar da tela “Conta de recebimento”
  Given que o usuário esteja na tela “Conta de recebimento”
  When clicar em Voltar
  Then deve retornar a página “Endereço”

 Scenario: Validando Detalhes de taxas
  Given usuário esteja na aba Produtos azulzinha
  When usuário selecionar detalhes de taxas
  Then abrira um modal com as taxas e prazo de recebimento

 Scenario: Taxista Selecionar azulzinha pro
  Given Usuário esteja na aba Produtos azulzinha
  When Usuário selecionar azulzinha pro
  Then habilitara a maquininha para transacionar

 Scenario: Primeira Página do Formulário: Sobre Você Cenário Negativo
  Given Usuário sem Cnae de Taxista esteja na tela para começar seu cadastro
  When Usuário colocar nome Completo,Data de Nascimento, Celular para contato, e Email
  And preencher os dados: Sobre seu negócio, CPF, Nome Fantasia, Faturamento anual, Tcket Médio
  Then o Botão Próximo ficara habilitado

 Scenario: Sem Oferta para Usuário sem Cnae de Taxista
  Given Usuário preencheu a primeira fase do formulário
  When Usuário clicar no Botão Próximo
  Then aparecera uma mensagem para ele: Estamos sem ofertas para você Agradecemos seu interesse em ter uma azuzinha! No momento estamos sem ofertas disponíveis para o seu perfil de negócio (só apresenta essa tela quando o faturamento preenchido for maior que 120.000,00 mil.)

 Scenario: Botão “Alterar” da Aba Negócio
  Given que o usuário esteja na tela “Conta de recebimento”
  And o usuário clicar na aba “Negócio”
  When o usuário clicar em “Alterar”
  Then será exibida a tela “Para começar seu cadastro”

 Scenario: Botão “Alterar” da Aba Dados Pessoais
  Given que o usuário esteja na tela “Conta de recebimento”
  And o usuário clicar na aba “Dados Pessoais”
  When o usuário clicar em “Alterar”
  Then será exibida a tela “Para começar seu cadastro”

 Scenario: Botão “Alterar” da Aba Endereço
  Given que o usuário esteja na tela “Conta de recebimento”
  And o usuário clicar na aba “Endereço”
  When o usuário clicar em “Alterar”
  Then será exibida a tela “Endereço”