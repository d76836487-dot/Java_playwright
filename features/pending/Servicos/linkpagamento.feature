#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Servicos/Link_de_Pagamento
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Link de Pagamento

  @TestCaseKey=LPDC-T498
  Scenario: 1 - Acessar menu lateral Link de pagamento
    Given que esteja logado
    When clicar em seviços no menu lateral
    And selecionar Link de pagamento
    Then verifica em tela Link de pagamento

  @TestCaseKey=LPDC-T538
  Scenario: 2. Trocar Estabelecimento em Link de pagamento
    Given que esteja em link de pagamento
    When selecionar trocar estabelecimento
    Then Visualizara apenas ‘’ECs’’ que forem de Link de pagamento

  @TestCaseKey=LPDC-T541
  Scenario: 3. Cliente sem EC de Link de pagamento no documento selecionado
    Given que o cliente esteja navegando na visão documento e não possua EC de link de pagamento naquele documento
    When estiver na tela Link de pagamento
    Then Visualizara “Comece a vender! com o link de pagamento
    Then você consegue vender de qualquer lugar sem depender da
    Then maquininha! Entre em contato com a nossa equipe para saber
    Then mais e contratar o serviço.
    Then Capitais e Regiões Metropolitanas
    Then segunda a domingo das 08h00 as 22h00 (exceto feriados)
    Then Telefone 3003-7828 Demais Localidades
    Then segunda a domingo das 08h00 as 22h00 (execeto feriados) Telefone 0800 728 7828

  @TestCaseKey=LPDC-T496
  Scenario: 4. Trocar Estabelecimento no header
    Given usuário esteja na tela de Link de pagamento
    When usuário selecionar no Header Trocar estabelecimento
    Then com Link de pagamento
    Then Visualizara
    Then Alterar estabelecimento
    Then com o texto “
    Then Você será redirecionado para seu estabelecimento de link de
    Then pagamento para
    Then acessar o serviço. Deseja prosseguir? Nome fantasia , CNPJ e o
    Then botão alterar.

  #Ao alterar NÃO deve ser redirecionado para home
  @TestCaseKey=LPDC-T548
  Scenario: 5. Selecionar no header Ec que não seja de link de pagamento mas usuário tem EC de link de pagamento naquele documento vinculado ao EC
    Given usuário esteja em Link de pagamento
    When selecionar um Ec que não seja de link de pagamento mas para o documento daquele EC existe cadastro de link de pagamento
    Then Visualizara “ Selecione o EC de link de pagamento no topo
    Then da pagina “ “Para acessar todas as funcionalidades e detalhes
    Then dos links de pagamento no portal, é necessário realizar a troca
    Then do seu EC no topo da pagina, através do botão “
    Then Trocar
    Then estabelecimento”.

  @TestCaseKey=LPDC-T528
  Scenario: 6.Selecionar no header "todos os documentos" e ao menos um documento possuir EC de link de pagamento
    Given usuário esteja em Link de pagamento
    When selecionar "todos" na aba Documentos do header
    And ao menos um Documento tiver EC de link de pagamento
    Then Visualizara a jornada de link com o botão Trocar estabelecimento

  @TestCaseKey=LPDC-T549
  Scenario: 7.Selecionar no header "todos os documentos" e nenhum documento possui EC de link de pagamentos
    Given usuário esteja em Link de pagamento
    When selecionar "todos" na aba Documentos do header
    And nenhum Documento tiver EC de link de pagamento
    Then Visualizara “Comece a vender! com o link de pagamento
    Then você consegue vender de qualquer lugar sem depender da
    Then maquininha! Entre em contato com a nossa equipe para saber
    Then mais e contratar o serviço.
    Then Capitais e Regiões Metropolitanas
    Then segunda a domingo das
    Then 08h00 as
    Then 22h00 (exceto feriados)
    Then Telefone
    Then 3003-7828
    Then Demais Localidades
    Then segunda a domingo das 08h00 as 22h00
    Then (execeto
    Then feriados) Telefone 0800 728 7828

  @TestCaseKey=LPDC-T514
  Scenario: 8.Comportamento do botão Trocar estabelecimento
    Given que usuário esteja navegando com EC de link de pagamento
    When tiver apenas UM EC de link de pagamento
    Then o botão deve ser apresentado
    And ao clicar o modal apresenta o dado daquele único EC (ou seja, não existe cenário no qual o botão Trocar estabelecimento não seja apresentado)

  @TestCaseKey=LPDC-T502
  Scenario: 9.Layout do Link de pagamento aba Criar Link
    Given que esteja no menu Link de pagamento com EC de link de pagamento
    Then Visualizara “Para qual Loja? Nome Fantasia, CNPJ, Estabelecimento comercial , Trocar estabelecimento”
    Then Qual o tipo de link que deseja criar ?
    Then Link de pagamento único : Defina o valor total da venda e em
    Then quantas parcelas o cliente poderá parcelar a compra, assim como
    Then na maquininha.
    Then Botão Solicitar link de pagamento único.
    Then Link de pagamento recorrente : Defina o valor que sera debitado
    Then mensalmente na fatura do cliente, como uma prestação de
    Then serviço, assinatura etc.
    Then Botão Solicitar link de pagamento recorrente.

  @TestCaseKey=LPDC-T510
  Scenario: 10.Apresentar termos e condições
    Given usuário nunca deu o aceite aos termos e condições anteriormente (pelo App ou Portal)
    When selecionar alguma das opções Solicitar Link de pagamento unico ou Solicitar Link de pagamento recorrente
    Then visualizara o layout Termos e Condições

  @TestCaseKey=LPDC-T522
  Scenario: 11.Layout termos e condições
    Given usuário nunca deu o aceite aos termos e condições anteriormente (pelo App ou Portal)
    When estiver visualizando o modal Termos e condições
    Then visualizara o titulo Termos e condições, um sroll lateral, botão "x" no topo direito, botão Fechar no canto inferior e botão "Li e aceito" no canto inferior direito

  @TestCaseKey=LPDC-T507
  Scenario: 12.Fechar Termos e Condições
    Given usuário seleciona alguma das opções Solicitar Link de pagamento unico ou Solicitar Link de pagamento recorrente
    When visualizar layout Termos e Condições
    And usuário selecionar “Fechar” e/ou “X”
    Then Não devera seguir o Fluxo e Retornar para Pagina de Link de pagamento

  @TestCaseKey=LPDC-T519
  Scenario: 13.Aceite atraves da jornada de Link único
    Given usuário seleciona opção Solicitar Link de pagamento unico
    When visualizar layout Termos e Condições
    And clicar em "Li e aceito"
    Then seguira o Fluxo da criação do link
    And não será abordado novamente para novo aceite

  @TestCaseKey=LPDC-T534
  Scenario: 14.Aceite atraves da jornada de Link recorrente
    Given deu o aceite atraves da jornada de link recorrente
    When acessar novamente a jornada de link
    And clicar em Solicitar link de pagamento único
    Then não será abordado para novo aceite
    And acessara a jornada de criação do link diretamente

  @TestCaseKey=LPDC-T529
  Scenario: 15.Cliente deu aceite aos termos pelo App Gestão, portanto não apresentar novamente no Portal
    Given usuário já deu o aceite aos termos e condições pelo App
    When acessar o portal e selecionar alguma das opções Solicitar Link de pagamento unico ou Solicitar Link de pagamento recorrente
    Then não visualizara o modal de Termos e condições
    And acessara a jornada de criação do link diretamente

  @TestCaseKey=LPDC-T520
  Scenario: 16.Cliente deu aceite aos termos pelo Portal, portanto não apresentar novamente no App
    Given usuário já deu o aceite aos termos e condições pelo Portal
    When acessar o App e selecionar alguma das opções Solicitar Link de pagamento unico ou Solicitar Link de pagamento recorrente
    Then não visualizara o modal de Termos e condições
    And acessara a jornada de criação do link diretamente

  @TestCaseKey=LPDC-T493
  Scenario: 17.Termos e Condições li e aceito
    Given usuário seleciona alguma das opções
    Then Solicitar Link de pagamento unico ou Solicitar Link de pagamento recorrente
    When visualizar layout Termos e Condições
    And usuário selecionar “Li e aceito”
    Then Devera exibir a tela Dados da venda

  @TestCaseKey=LPDC-T501
  Scenario: 18.Layout link único pagamento a vista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas "crédito a vista"
    Then o botão "Continuar" ficará habilitado para dar sequencia na jornada

  @TestCaseKey=LPDC-T525
  Scenario: 19.Layout link único pagamento com parcelamento
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas (de 2x em diante)
    Then será apresentado o campo Tipo de Parcelamento com as opções parcelado lojista e parcelado emissor
    And apos seleção o botão "Continuar" ficará habilitado para dar sequencia na jornada

  @TestCaseKey=LPDC-T504
  Scenario: 20.Tooltip Parceldo lojista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas (de 2x em diante)
    And passar o mouse no tooltip "Parcelado lojista"
    Then visualizara a mensagem "Os juros serão pagos pelo lojista"

  @TestCaseKey=LPDC-T531
  Scenario: 21.Tooltip Parceldo emissor
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas (de 2x em diante)
    And passar o mouse no tooltip "Parcelado emissor"
    Then visualizara a mensagem "Os juros serão pagos pelo portador"

  @TestCaseKey=LPDC-T524
  Scenario: 22.Resumo da Venda Parcelado lojista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor, número de parcelas (de 2x em diante) e parcelado lojista
    And selecionar continuar
    Then Visualizara Resumo com Valor, Descrição, Pagamento (crédito parcelado), parcelas (número de vezes selecionado no step anterior com x ao lado, Tipo de pagamento (Parcelado lojista), botão editar, fechar e gerar link de pagamento e frase (Caso o
    Then pagamento não seja efetuado em 48h o link é expirado)

  @TestCaseKey=LPDC-T499
  Scenario: 23.Resumo da venda Parcelado emissor
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor, número de parcelas (de 2x em diante) e parcelado emissor
    And selecionar continuar
    Then Visualizara Resumo com Valor, Descrição, Pagamento (crédito parcelado), parcelas (número de vezes selecionado no step anterior com x ao lado, Tipo de pagamento (Parcelado emissor), botão editar, fechar e gerar link de pagamento e frase (Caso o
    Then pagamento não seja efetuado em 48h o link é expirado)

  @TestCaseKey=LPDC-T512
  Scenario: 24.Resumo Dados da Venda Crédito a Vista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas (crédito a vista)
    And selecionar continuar
    Then Visualizara Resumo com
    Then Valor, Descrição, Pagamento (Credito a vista), e os botões Editar, Gerar link de pagamento e ‘’X’’ (fechar)  ,(Caso o pagamento não seja efetuado em 48h o link é expirado)

  @TestCaseKey=LPDC-T530
  Scenario: 25.Gerar Link de pagamento único Parcelado emissor
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor, número de parcelas e selecionar parcelado emissor
    And clicar Gerar link de pagamento
    Then Link de pagamento criado com sucesso !

  @TestCaseKey=LPDC-T532
  Scenario: 26.Gerar Link de pagamento único Parcelado lojista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor, número de parcelas e selecionar parcelado lojista
    And clicar Gerar link de pagamento
    Then Link de pagamento criado com sucesso !

  @TestCaseKey=LPDC-T543
  Scenario: 27.Gerar link de pagamento único a vista
    Given usuário seleciona Solicitar link de pagamento único
    When Preencher Descrição, valor, número de parcelas (crédito a vista)
    And selecionar Gerar link de pagamento
    Then Link de pagamento criado com sucesso !

  @TestCaseKey=LPDC-T515
  Scenario: 28.Check box texto copiado
    Given Link de pagamento criado com sucesso !
    When Clicar no icone de copiar no Link gerado
    And Visualizara um um texto no topo do modal: “Texto copiado para área de transferência" e um ‘x’ para fechar o popup.
    And selecionar ‘x’ no popup.
    And selecionar ‘fechar’
    Then usuário visualiza tela link de pagamento.

  @TestCaseKey=LPDC-T526
  Scenario: 29.Check box texto copiado colando com sucesso
    Given Link de pagamento criado com sucesso !
    When Clicar no icone de copiar no Link gerado
    And colar em outra aba ou navegador
    Then usuário deve conseguir abrir o link copiado com sucesso

  @TestCaseKey=LPDC-T503
  Scenario: 30.Erro ao Salvar Gerar link
    Given usuário seleciona
    Then Solicitar link de pagamento único
    When Preencher Descrição, valor e número de parcelas, parcelado lojista ou emissor e selecionar continuar
    And selecionar Gerar link de pagamento
    Then Ops, ocorreu um erro Não foi possível finalizar sua solicitação. Tente novamente e se o erro persistir tente novamente mais tarde.

  @TestCaseKey=LPDC-T513
  Scenario: 31.Ver Link ativos
    Given Link de pagamento criado com sucesso !
    When usuário seleciona
    Then Ver links ativo
    Then usuário visualizara a aba de Consultar links

  @TestCaseKey=LPDC-T542
  Scenario: 32.layout Link de Pagamento recorrente
    Given usuário seleciona Solicitar link de pagamento recorrente
    When estiver na tela Dados da venda
    Then Visualizara os campos Descrição, Valor mensal, número de execuções (de 2 até 12), botão "Com termino" habilitado, botão Continuar desabilitado e "X"

  @TestCaseKey=LPDC-T523
  Scenario: 33.Link de Pagamento recorrente com Termino
    Given usuário seleciona Solicitar link de pagamento recorrente
    When Preencher Descrição, valor mensal e numero de execuções (de 2 até 12)
    And deixar a flag "Com termino" desligada e clicou em continuar
    Then Visualizara Resumo com Valor, Descrição, Pagamento, Mensalidade (recorrente), Execuções (numero selecionado no step anterior e x ao lado), Primeiro pagamento e Ultimo pagamento preenchidos (formato mês/ano / ago/2024 ), (e os botões Editar, Gerar link de pagamento e ‘’X’’ (fechar) . (Caso o pagamento não seja efetuado em 48h o link é expirado)

  @TestCaseKey=LPDC-T536
  Scenario: 34.Link de Pagamento recorrente sem Termino
    Given usuário seleciona Solicitar link de pagamento recorrente
    When estiver na tela Dados da venda
    Then Visualizara os campos Descrição, Valor mensal, número de execuções (de 2 até 12), botão "Com termino" habilitado, botão Continuar desabilitado e "X"

  @TestCaseKey=LPDC-T509
  Scenario: 35.Link de Pagamento recorrente sem Termino
    Given usuário seleciona Solicitar link de pagamento recorrente
    When Preencher Descrição, valor mensal, numero de execuções
    And flegar o botão "Com termino" para "Sem termino" e clicou em Continuar
    Then Visualizara Resumo com Valor, Descrição, Pagamento, Mensalidade, Execuções, Primeiro pagamento e Ultimo pagamento ("-"), (e os botões Editar, Gerar link de pagamento e ‘’X’’ (fechar). (Caso o pagamento não seja efetuado em 48h o link é expirado)

  @TestCaseKey=LPDC-T521
  Scenario: 36.Editar Link de Pagamento único Parcelado Lojista
    Given usuário esteja na tela de Resumo
    When Selecionar o botão ‘’Editar’’
    Then Visualizara os campos Descrição, valor, número de parcelas e parcelado lojista selecionado todos passiveis de edição na tela Dados da venda
    And alterar algum desses dados
    And visualizar o(s) dados(s) atualizado(s) na tela Resumo
    And selecionar gerar link de pagamento
    And visualizarar Link de pagamento criado com sucesso.

  @TestCaseKey=LPDC-T506
  Scenario: 37.Editar Link de Pagamento único Parcelado Emissor
    Given usuário esteja na tela de Resumo
    When Selecionar o botão ‘’Editar’’
    Then Visualizara os campos Descrição, valor, número de parcelas e parcelado emissor selecionado todos passiveis de edição na tela Dados da venda
    And alterar algum desses dados
    And visualizar o(s) dados(s) atualizado(s) na tela Resumo
    And selecionar gerar link de pagamento
    And visualizarar Link de pagamento criado com sucesso.

  @TestCaseKey=LPDC-T535
  Scenario: 38.Editar Link de Pagamento único Credito a vista
    Given usuário esteja na tela de Resumo
    When Selecionar o botão ‘’Editar’’
    Then Visualizara os campos Descrição, valor, número de parcelas todos passiveis de edição na tela Dados da venda
    And alterar algum desses dados
    And visualizar o(s) dados(s) atualizado(s) na tela Resumo
    And selecionar gerar link de pagamento
    And visualizarar Link de pagamento criado com sucesso.

  #Consultar Links
  @TestCaseKey=LPDC-T500
  Scenario: 39.Você ainda não criou um link
    Given usuário está na aba Consultar Link de pagamento
    When ainda não tiver criado nenhum link de pagamento
    Then visualizara texto ‘’Você ainda não criou nenhum link
    Then Você não possui nenhum link de pagamento ativo. Crie seu primeiro link de pagamento para vender ainda mais.”
    And selecionar Criar link de pagamento
    Then usuario sera direcionado para a aba “Criar link”

  @TestCaseKey=LPDC-T511
  Scenario: 40.Filtros rápidos
    Given usuário esteja em em Link de pagamentos
    When Selecionar a aba Consultar Links
    Then visualizara Todos selecionado Default, links únicos, Links recorrentes , Filtros , Periodo (últimos 7 dias Default)

  @TestCaseKey=LPDC-T518
  Scenario: 41.Filtros rápidos calendário
    Given usuário esteja na aba Consultar Links
    When clicar no componente do calendário
    Then visualizará os filtros rápido "últimos 7 dias" e "mês atual"

  @TestCaseKey=LPDC-T516
  Scenario: 42.Range do calendário
    Given usuário esteja na aba Consultar Links
    When clicar no componente do calendário
    Then conseguira buscar por no máximo 31 dias corridos

  @TestCaseKey=LPDC-T540
  Scenario: 43.Detalhe do link de pagamento (autorizado)
    Given usuário esteja na aba Consultar links
    When selecionar um link de pagamento com status Autorizado
    Then visualizara o modal Detalhe do link de pagamento com Informações gerais os campos Data de criação, Valor ,Descrição, data de expiração e status.
    And Texto abaixo ‘’Copie e cole o link abaixo para compartilhar com seu cliente’’ com a box e o link com botão de copiar e fechar.

  @TestCaseKey=LPDC-T517
  Scenario: 44.Detalhe do link de pagamento (autorizado)
    Given usuário esteja no modal detalhe do link de pagamento de um link com status autorizado
    When clicar no componente copiar do box que apresenta o link para pagamento
    Then deve conseguir colar o link em outra aba/ navegador

  @TestCaseKey=LPDC-T539
  Scenario: 45.Detalhe do link de pagamento (ativo)
    Given usuário esteja na aba Consultar links
    When selecionar um link de pagamento com status Ativo
    Then visualizara o modal Detalhe do link de pagamento com Informações gerais os campos Data de criação, Valor ,Descrição, data de expiração e status.
    And Texto abaixo ‘’Copie e cole o link abaixo para compartilhar com seu cliente’’ com a box e o link com botão de copiar e fechar.

  @TestCaseKey=LPDC-T545
  Scenario: 46.Detalhe do link de pagamento (ativo)
    Given usuário esteja no modal detalhe do link de pagamento de um link com status ativo
    When clicar no componente copiar do box que apresenta o link para pagamento
    Then deve conseguir colar o link em outra aba/ navegador

  @TestCaseKey=LPDC-T495
  Scenario: 47.Detalhe do link de pagamento (Expirado)
    Given usuário esteja em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar um link de pagamento com status Expirado
    Then visualizara Detalhe do link de pagamento com Informações gerais os campos , Data de criação, Valor , Descrição , data de expiração e status.
    And Texto informativo ‘’Links cujo o pagamento não seja efetuado em 48h são expirados. Voce pode replicar o link em gerar novo link.

  @TestCaseKey=LPDC-T494
  Scenario: 48.Detalhe do link de pagamento (Negado)
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar um link de pagamento com status Negado
    Then visualizara Detalhe do link de pagamento com Informações gerais os campos, Data de criação, Valor , Descrição , data de expiração e status.
    And Texto informativo ‘’Links cujo o pagamento não seja efetuado em 48h são expirados. Voce pode replicar o link em gerar novo link.

  @TestCaseKey=LPDC-T544
  Scenario: 49.Detalhe do link de pagamento (Estornado)
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar um link de pagamento com status Estornado
    Then visualizara Detalhe do link de pagamento com Informações gerais os campos Data de criação, Valor , Descrição , data de expiração e status.

  @TestCaseKey=LPDC-T547
  Scenario: 50.Detalhe do link de pagamento (pago)
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar um link de pagamento com status Pago
    Then visualizara Detalhe do link de pagamento com Informações gerais os campos , Data da criação, Valor , Descrição , data de expiração e status.
    And Pagamento e os campos data de pagamento , pagamento (Parcelado ou crédito à vista), parcelas, Bandeira , cod.de aut e nsu.
    And botões comprovante e fechar.

  @TestCaseKey=LPDC-T497
  Scenario: 51.Detalhe do link de pagamento (Agendado)
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar um link de pagamento com status Agendado
    Then visualizara Detalhe do link de pagamento com Informações gerais os campos Data de criação , Valor , Descrição, data de expiração, Mensalidade, Execuções e status.
    And Pagamento e os campos data de primeiro pagamento , Bandeira , cod.de aut , nsu
    And Pagamentos efetivados com as informações Parcela, Data de pagamento e Valor das parcelas pagas
    And Próximo pagamento com as informações Parcela, Data prevista de pagamento e Valor da próxima parcela que vai ser paga, que não necessariamente é a última
    And mensagem’’os pagamentos serão exibidos aqui próximo a data de pagamento’’ e botões comprovante e fechar.

  @TestCaseKey=LPDC-T505
  Scenario: 52.Comprovante de venda (pago)
    Given usuário esteja no Detalhe do link de pagameto
    When clicar em comprovante
    Then visualizara comprovante de venda com Razão social cnpj ,
    Then ec e Emitido em (dd/mm/aaaa as hh:mm) ,Informações gerais
    Then os campos , Valor , Descrição , data de criação , data de
    Then expiração e status.
    And Pagamento e os campos data de pagamento , pagamento
    Then , parcelas Bandeira , cod.de aut , nsu.

  @TestCaseKey=LPDC-T533
  Scenario: 53.Comprovante de venda (agendado)
    Given usuário esteja no Detalhe do link de pagameto
    When clicar em comprovante
    Then visualizara comprovante de venda com Razão social cnpj ,
    Then ec e Emitido em (dd/mm/aaaa as hh:mm) ,Informações gerais
    Then os campos pagamento com Informações gerais os campos ,
    Then Valor , Descrição , data de criação , data de expiração e status.
    And Pagamento e os campos data de pagamento , pagamento
    Then , parcelas Bandeira , cod.de aut , nsu , pagamento efetivado
    Then com parcela , data de pagamento , valor e próximos
    Then pagamentos com parcela , data prevista de pagamento e valor
    Then , nsu e próximos com os mesmos campos.

  @TestCaseKey=LPDC-T508
  Scenario: 54.Validar filtros
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And aplicar filtros Status , Valores , e Descrição
    Then Vizualizar que os filtros que foram aplicados estão
    Then retornando corretamente.

  @TestCaseKey=LPDC-T546
  Scenario: 55.Validar filtros rápido Links únicos
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar o filtro rapido "Links únicos"
    Then o portal deve apresentar somente resultados do tipo "link único"

  @TestCaseKey=LPDC-T537
  Scenario: 56.Validar filtros rápido Links recorrentes
    Given usuário esteja em em Link de pagamentos
    When Selecionar Consultar Links
    And selecionar o filtro rapido "Links recorrentes"
    Then o portal deve apresentar somente resultados do tipo "link recorrentes""

