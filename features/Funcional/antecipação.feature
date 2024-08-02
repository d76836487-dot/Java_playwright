#language: en
Feature: Health Check Antecipação
  @ignore
  @Zephyr:ProjectKey=LPDC
  @Zephyr:Folder=/Portal_do_Cliente/Funcional/Health_Check
  @Zephyr:Status=Draft
  @Zephyr:Priority=Normal
  @Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Manual

Scenario: Health Check
  Given usuário está logado no Merchant Portal
  When usuário clica no menu Antecipação na lateral esquerda
  Then usuário será direcionado para a página de Antecipação

  Scenario: Acessar antecipação via card Antecipação
  Given usuário está logado no Merchant Portal
  When usuário clica no card “Antecipação”
  Then usuário será direcionado para a página de Antecipação


  Scenario: Acessar antecipação via dashboard Antecipação
  Given usuário está logado no Merchant Portal
  When usuário clica no “Ir para antecipação” do dashboard “Antecipação”
  Then usuário será direcionado para a página de Antecipação



  Scenario: Exibição do dashboard Antecipação com cliente com um EC flex
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto
  And botão “Ir para antecipação

  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e antecipação automática cadastrada
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, a mensagem “Antecipação automática contratada” na coluna Valor/Produto e uma seta no final da linha
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e com saldo disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, o valor que pode ser antecipado na coluna Valor/Produto e uma seta no final da linha
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e sem saldo disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, o valor zero reais na coluna Valor/Produto e uma seta no final da linha
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com três ECs sendo um EC padrão com saldo, um EC padrão com antecipação automática e um EC Flex
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará os ECs no dashboard na seguinte ordem: EC padrão (o número do estabelecimento na coluna Estabelecimento e o valor em reais na coluna Valor/Produto), EC padrão com antecipação automática (o número do estabelecimento na coluna Estabelecimento e a mensagem “Antecipação automática contratada” na coluna Valor/Produto) e o EC Flex (o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto) e uma seta no final da cada linha, respectivamente
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com três ECs sendo um EC padrão sem saldo, um EC padrão com antecipação automática e um EC Flex
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará os ECs no dashboard na seguinte ordem: EC padrão (o número do estabelecimento na coluna Estabelecimento e o valor de zero reais na coluna Valor/Produto), EC padrão com antecipação automática (o número do estabelecimento na coluna Estabelecimento e a mensagem “Antecipação automática contratada” na coluna Valor/Produto) e o EC Flex (o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto) e uma seta no final da cada linha, respectivamente
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo ao menos 3 ECs padrão com ou sem saldo
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará somente os 3 ECs padrão com ou sem saldo no dashboard (a ordem dos ECs são do maior saldo para o menor saldo) e uma seta no final da cada linha, respectivamente
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo 2 ECs padrão com ou sem saldo e 1 EC padrão com antecipação automática
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará somente os 2 ECs padrão com ou sem saldo no dashboard na primeira e na segunda linha (ordem decrescente por saldo); e na terceira linha o EC padrão com antecipação automática e uma seta no final da cada linha, respectivamente
  And botão “Ir para antecipação”

  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo 2 ECs padrão com ou sem saldo e todos os outros ECs flex
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  Then usuário visualizará somente os 2 ECs padrão com ou sem saldo no dashboard na primeira e na segunda linha (ordem decrescente por saldo); e na terceira linha o EC flex e uma seta no final da cada linha, respectivamente
  And botão "Ir para antecipação"

  Scenario: Exibição do nome do EC e CNPJ na página Antecipação
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  And usuário clica em qualquer EC
  Then usuário visualizará a página da Antecipação com o nome do estabelecimento, CNPJ do estabelecimento e o número do estabelecimento

  Scenario: Não exibir o botão “Trocar estabelecimento” quando não possuí outro estabelecimento
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  And usuário clica em qualquer EC
  Then usuário não deve visualizar o botão “Trocar estabelecimento”

  Scenario: Visualizar botão “Trocar estabelecimento” quando documento possuí mais de um estabelecimento
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  And usuário clica em qualquer EC
  Then usuário deve visualizar o botão “Trocar estabelecimento”

  Scenario: Clicar botão Trocar estabelecimento quando documento possuí outro estabelecimento
  Given usuário está logado no Merchant Portal
  When usuário visualiza o dashboard Antecipação
  And usuário clica em qualquer EC
  And usuário deseja trocar de estabelecimento
  Then usuário deve visualizar o modal “Selecionar estabelecimento comercial”


  Scenario: Trocar estabelecimento quando documento possuí outro estabelecimento
  Given usuário está logado no Merchant Portal
  When usuário acessa a página de Antecipação
  And usuário deseja trocar de estabelecimento
  And usuário seleciona o estabelecimento desejado
  Then usuário deve visualizar a página de antecipação com o estabelecimento escolhido
  #Obs.: Testar com diferentes tipos de estabelecimentos

  Scenario: Fechar modal “Selecionar estabelecimento comercial” quando documento possuí outro estabelecimento
  Given usuário está logado no Merchant Portal
  When usuário acessa a página de Antecipação
  And usuário deseja trocar de estabelecimento
  And usuário deseja fechar o modal
  Then usuário deve visualizar a página de antecipação com o estabelecimento anterior
  #Obs.: Testar com diferentes tipos de estabelecimentos



  Scenario: Mensagem título na página antecipação com plano Flex
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação
  Then usuário deve visualizar o subtítulo “Plano Flex”
  And usuário deve visualizar o texto “Você possui o plano de recebimento Flex, portanto irá receber suas vendas na modalidade débito em 1 dia útil e as vendas na modalidade crédito em <X> dias”
  #Obs.: O valor <X> depende do contrato de cada estabelecimento


  Scenario: Mensagem de texto na página antecipação com plano Flex
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação
  Then usuário deve visualizar o texto “Você possui o plano de recebimento de suas vendas garantido através do plano de recebimento Flex”


  Feature: Abrindo antecipação de um EC padrão com saldo para antecipar via dashboard

  Scenario: Abas Solicitar antecipação e Histórico na antecipação
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)

  Scenario: Valor disponível para antecipar na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar o valor disponível para antecipar igual ao apresentado no dashboard anteriormente

  Scenario: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  And usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
  Then usuário deve visualizar a seguinte mensagem: “O saldo disponível contempla o valor líquido das vendas”


  Scenario: Visualizar informações “Como funciona?” na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título “Como funciona?” e a mensagem “A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico”

  Scenario: Visualizar informações “Antecipação automática” na caixa Antecipação automática
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título “Antecipação automática” e a mensagem “Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa”

  Scenario: Visualizar botão “Solicitar antecipação automática” na caixa Antecipação automática
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação automática” na cor da aliança
  And o botão “Solicitar antecipação automática” na cor da aliança deve ser clicável

  Scenario: Visualizar informações “Antecipação eventual” na caixa Antecipação eventual
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título “Antecipação eventual” e a mensagem “Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais”

  Scenario: Visualizar botão “Solicitar antecipação eventual” na caixa Antecipação eventual
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação eventual” na cor da aliança
  And o botão “Solicitar antecipação eventual” na cor da aliança deve ser clicável

  Feature: Abrindo antecipação de um EC padrão sem saldo para antecipar via dashboard

  Scenario: Abas Solicitar antecipação e Histórico na antecipação
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)

  Scenario: Valor disponível para antecipar na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar a mensagem “Você não possui valor disponível para antecipar”


  Scenario: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  And usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
  Then usuário deve visualizar a seguinte mensagem: “O saldo disponível contempla o valor líquido das vendas”

  Scenario: Visualizar informações “Como funciona?” na caixa Valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título “Como funciona?” e a mensagem “A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico”

  Scenario: Visualizar informações “Antecipação automática” na caixa Antecipação automática
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título “Antecipação automática” e a mensagem “Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa”


  Scenario: Visualizar botão “Solicitar antecipação automática” na caixa Antecipação automática
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação automática” na cor da aliança
  And o botão “Solicitar antecipação automática” na cor da aliança deve ser clicável

  Scenario: Visualizar informações “Antecipação eventual” na caixa Antecipação eventual
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título “Antecipação eventual” e a mensagem “Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais”

  Scenario: Visualizar botão “Solicitar antecipação eventual” na caixa Antecipação eventual
  Given usuário está logado no Merchant Portal
  When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
  Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação eventual”
  And o botão “Solicitar antecipação eventual” não deve ser clicável

  Scenario: Informações no “Resumo da antecipação eventual” com saldo disponível
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  Then usuário deve visualizar no resumo da antecipação eventual as seguintes informações: texto: “A operação está sujeita à aprovação para solicitações aprovadas até 12h15 receba no mesmo dia”. Bandeira: Todas, Produto: Todos, Período Selecionado: Todo período, Valor solicitado igual ao disponível para antecipar, taxa: <número em porcento>, Valor descontado em reais e Valor a receber em reais

  Scenario: Não confirmar a antecipação eventual com saldo disponível
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And o portal apresenta um modal solicitando a confirmação com a frase
    And “Deseja confirmar a solicitação de antecipação?
    And Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
  And usuário não confirma a antecipação
  Then usuário deve visualizar a página anterior com a seleção feita

  Scenario: Confirmar a antecipação eventual com saldo disponível
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
    And o portal apresenta um modal solicitando a confirmação com a frase
    And “Deseja confirmar a solicitação de antecipação?
    And Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
  And usuário não confirma a antecipação
  Then usuário deve visualizar a página anterior com a seleção feita

  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  Scenario: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos Gives de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  Scenario: Antecipar eventualmente com saldo disponível entre 18:46 e 23:59
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  Scenario: Antecipar eventualmente com saldo disponível em dia não úteis
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  Scenario: Gerar comprovante de antecipação eventual com saldo disponível
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário gera o comprovante de antecipação
  Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)

  Feature: Antecipando eventualmente com personalização

  Scenario: Abrindo a personalização da antecipação eventual
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  Then usuário visualizará a caixa Personalizar solicitação de antecipação contendo: subcaixa “Composição dos valores a serem antecipados” (Bandeiras (Dropbox) e Produto (dropbox)), subcaixa “Configuração do período da antecipação” (Todo o período, Vencimento de (calendário) = dia da consulta, Até (calendário) = sem limite e subcaixa “Valor disponível para antecipar. Personalize o valor:” (Valor (textfield)) e uma mensagem “Valor disponível: R$” = valor disponível para antecipar
  And toda e qualquer personalização feita nesses campos deve refletir nos respectivos campos da seção “Resumo da antecipação eventual”

  Scenario: Personalizar a data de vencimento
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário seleciona uma outra data de vencimento futura data sendo que é menor do que a data de “até”
  Then usuário verá que o botão “Todo o período” está desligado

  Scenario: Personalizar a data de “até”
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário seleciona uma outra data anterior de “até” vencimento sendo que é maior do que a data de vencimento
  Then usuário verá que o botão “Todo o período” está desligado

  Scenario: Personalizar valor com valor superior ao valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário deseja alterar o valor para antecipar com um valor superior ao valor disponível para antecipar
  Then usuário verá dois textos na cor vermelha: “Valor disponível” = valor disponível para antecipar em reais e “Valor é superior ao saldo disponível para antecipar”

  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
  Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais

  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor mínimo
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
  Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais
  And usuário seleciona “Valos mínimo”
  Then esse será o valor preenchido no campo “Valor solicitado” do resumo da antecipação eventual
  And no modal “Deseja confirmar a solicitação de antecipação?”

  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor máximo
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
  Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais
  And usuário seleciona “Valos máximo”
  Then esse será o valor preenchido no campo “Valor solicitado” do resumo da antecipação eventual
  And no modal "Deseja confirmar a solicitação de antecipação?"

  Scenario: Deixar qualquer campo de personalização sem preencher
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário clica no botão Personalizar solicitação de antecipação
  And usuário não preenche um dos campos da personalização
  Then usuário não pode clicar no botão “Solicitar antecipação”

  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando por bandeira
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário seleciona a <bandeira>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  #Exemplos:
  #bandeira
  #Elo
  #Mastercard
  #Visa
  #Todas

  Scenario: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por bandeira
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário seleciona a <bandeira>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  #Exemplos:   bandeira   Elo   Mastercard   Visa   Todas

  Scenario: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por bandeira
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário seleciona a <bandeira>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  #Exemplos:   bandeira   Elo   Mastercard   Visa   Todas

  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por bandeira
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário seleciona a <bandeira>
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário gera o comprovante de antecipação
  Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = <bandeira>, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
  #Exemplos:   bandeira   Elo   Mastercard   Visa   Todas

  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando por produto
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza pelo <produto>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  # Exemplos:   Produto   Crédito a vista   Crédito parcelado   Todos

  Scenario: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por produto
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza pelo <produto>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  # Exemplos:   Produto   Crédito a vista   Crédito parcelado   Todos

  Scenario: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por produto
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza pelo <produto>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  #Exemplos:   Produto   Crédito a vista   Crédito parcelado   Todos

  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por produto
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário seleciona o <produto>
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário gera o comprovante de antecipação
  Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = <produto>, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
  # Exemplos:   Produto  Crédito a vista   Crédito parcelado   Todos

  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando período válido
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza um <período>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  # Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023

  Scenario: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por período válido
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza um <período>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  #Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023

  Scenario: Antecipar eventualmente com saldo disponível entre 18:46 e 23:59 personalizando por período válido
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza um <período>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  # Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023

  Scenario: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por período válido
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza um <período>
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
  And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio
  # Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023

  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por período válido
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário personaliza o <período>
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário gera o comprovante de antecipação
  Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos os produtos, período = <DD/MM/AAAA – DD/MM/AAAA> e canal de contratação = Portal do cliente)
  #Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023

  Scenario: Nova simulação após antecipar eventualmente
    Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário solicita uma Nova simulação
  Then usuário verá um pop-up com o seguinte texto: “Quer garantir o recebimento das suas próximas vendas?” “Contrate o nosso serviço de antecipação automática e garanta o recebimento imediato de suas próximas vendas” e o botão “X” e “fechar” e “ir para antecipação automática”


  Scenario:  Fechar a nova simulação após antecipar eventualmente
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário solicita uma Nova simulação
  And usuário clica no botão “X”
  Then usuário será direcionado para a página inicial da antecipação

  Scenario:  Fechar a nova simulação após antecipar eventualmente
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário solicita uma Nova simulação
  And usuário clica no botão “Fechar”
  Then usuário será direcionado para a página inicial da antecipação

  Scenario:  Ir para antecipação automática na nova simulação após antecipar eventualmente
  Given usuário está logado no Merchant Portal
  When usuário deseja antecipar eventualmente
  And usuário solicita a antecipação
  And usuário confirma a solicitação
  And usuário solicita uma Nova simulação
  And usuário clica no botão “Ir para antecipação automática”
  Then usuário será direcionado para a página inicial da antecipação automática


  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando bandeira, produto e todo o período
  Given usuário está logado no Merchant Portal
  And usuário possui saldo para antecipar eventualmente
  When usuário deseja antecipar eventualmente
  And usuário personaliza bandeira (Máster, Visa), produto (Todos) e todo o período
  And usuário solicita a antecipação
  And usuário confirma a antecipação
  Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
  And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = Máster e Visa, Produto = Todos, canal de contratação = Portal do cliente, Período = Antecipar todo o período até o momento
  And usuário visualizará a seguinte mensagem nos Gives de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

