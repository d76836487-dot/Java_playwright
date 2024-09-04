#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Health_Check_Antecipação
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Manual=Manual;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Health Check Antecipação

  @TestCaseKey=LPDC-T577
  Scenario: Health Check
    Given usuário está logado no Merchant Portal
    When usuário clica no menu Antecipação na lateral esquerda
    Then usuário será direcionado para a página de Antecipação

  @TestCaseKey=LPDC-T646
  Scenario: Acessar antecipação via card Antecipação
    Given usuário está logado no Merchant Portal
    When usuário clica no card “Antecipação”
    Then usuário será direcionado para a página de Antecipação

  @TestCaseKey=LPDC-T648
  Scenario: Acessar antecipação via dashboard Antecipação
    Given usuário está logado no Merchant Portal
    When usuário clica no “Ir para antecipação” do dashboard “Antecipação”
    Then usuário será direcionado para a página de Antecipação

  @TestCaseKey=LPDC-T639
  Scenario: Exibição do dashboard Antecipação com cliente com um EC flex
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto
    And botão “Ir para antecipação

  @TestCaseKey=LPDC-T598
  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e antecipação automática cadastrada
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, a mensagem “Antecipação automática contratada” na coluna Valor/Produto e uma seta no final da linha
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T588
  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e com saldo disponível para antecipar
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, o valor que pode ser antecipado na coluna Valor/Produto e uma seta no final da linha
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T651
  Scenario: Exibição do dashboard Antecipação com cliente com um EC padrão e sem saldo disponível para antecipar
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará o número do estabelecimento na coluna Estabelecimento, o valor zero reais na coluna Valor/Produto e uma seta no final da linha
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T608
  Scenario: Exibição do dashboard Antecipação com cliente com três ECs sendo um EC padrão com saldo, um EC padrão com antecipação automática e um EC Flex
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará os ECs no dashboard na seguinte ordem: EC padrão (o número do estabelecimento na coluna Estabelecimento e o valor em reais na coluna Valor/Produto), EC padrão com antecipação automática (o número do estabelecimento na coluna Estabelecimento e a mensagem “Antecipação automática contratada” na coluna Valor/Produto) e o EC Flex (o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto) e uma seta no final da cada linha, respectivamente
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T575
  Scenario: Exibição do dashboard Antecipação com cliente com três ECs sendo um EC padrão sem saldo, um EC padrão com antecipação automática e um EC Flex
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará os ECs no dashboard na seguinte ordem: EC padrão (o número do estabelecimento na coluna Estabelecimento e o valor de zero reais na coluna Valor/Produto), EC padrão com antecipação automática (o número do estabelecimento na coluna Estabelecimento e a mensagem “Antecipação automática contratada” na coluna Valor/Produto) e o EC Flex (o número do estabelecimento na coluna Estabelecimento e a mensagem “Plano Flex contratado” na coluna Valor/Produto) e uma seta no final da cada linha, respectivamente
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T617
  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo ao menos 3 ECs padrão com ou sem saldo
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará somente os 3 ECs padrão com ou sem saldo no dashboard (a ordem dos ECs são do maior saldo para o menor saldo) e uma seta no final da cada linha, respectivamente
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T578
  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo 2 ECs padrão com ou sem saldo e 1 EC padrão com antecipação automática
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará somente os 2 ECs padrão com ou sem saldo no dashboard na primeira e na segunda linha (ordem decrescente por saldo); e na terceira linha o EC padrão com antecipação automática e uma seta no final da cada linha, respectivamente
    And botão “Ir para antecipação”

  @TestCaseKey=LPDC-T604
  Scenario: Exibição do dashboard Antecipação com cliente com no mínimo quatro ECs sendo 2 ECs padrão com ou sem saldo e todos os outros ECs flex
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    Then usuário visualizará somente os 2 ECs padrão com ou sem saldo no dashboard na primeira e na segunda linha (ordem decrescente por saldo); e na terceira linha o EC flex e uma seta no final da cada linha, respectivamente
    And botão "Ir para antecipação"

  @TestCaseKey=LPDC-T597
  Scenario: Exibição do nome do EC e CNPJ na página Antecipação
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    And usuário clica em qualquer EC
    Then usuário visualizará a página da Antecipação com o nome do estabelecimento, CNPJ do estabelecimento e o número do estabelecimento

  @TestCaseKey=LPDC-T636
  Scenario: Não exibir o botão “Trocar estabelecimento” quando não possuí outro estabelecimento
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    And usuário clica em qualquer EC
    Then usuário não deve visualizar o botão “Trocar estabelecimento”

  @TestCaseKey=LPDC-T610
  Scenario: Visualizar botão “Trocar estabelecimento” quando documento possuí mais de um estabelecimento
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    And usuário clica em qualquer EC
    Then usuário deve visualizar o botão “Trocar estabelecimento”

  @TestCaseKey=LPDC-T621
  Scenario: Clicar botão Trocar estabelecimento quando documento possuí outro estabelecimento v1
    Given usuário está logado no Merchant Portal
    When usuário visualiza o dashboard Antecipação
    And usuário clica em qualquer EC
    And usuário deseja trocar de estabelecimento
    Then usuário deve visualizar o modal “Selecionar estabelecimento comercial”

  @TestCaseKey=LPDC-T630
  Scenario: Trocar estabelecimento quando documento possuí outro estabelecimento
    Given usuário está logado no Merchant Portal
    When usuário acessa a página de Antecipação
    And usuário deseja trocar de estabelecimento
    And usuário seleciona o estabelecimento desejado
    Then usuário deve visualizar a página de antecipação com o estabelecimento escolhido

  #Obs.: Testar com diferentes tipos de estabelecimentos
  @TestCaseKey=LPDC-T581
  Scenario: Fechar modal “Selecionar estabelecimento comercial” quando documento possuí outro estabelecimento
    Given usuário está logado no Merchant Portal
    When usuário acessa a página de Antecipação
    And usuário deseja trocar de estabelecimento
    And usuário deseja fechar o modal
    Then usuário deve visualizar a página de antecipação com o estabelecimento anterior

  #Obs.: Testar com diferentes tipos de estabelecimentos
  @TestCaseKey=LPDC-T602
  Scenario: Mensagem título na página antecipação com plano Flex
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação
    Then usuário deve visualizar o subtítulo “Plano Flex”
    And usuário deve visualizar o texto “Você possui o plano de recebimento Flex, portanto irá receber suas vendas na modalidade débito em 1 dia útil e as vendas na modalidade crédito em <X> dias”

  #Obs.: O valor <X> depende do contrato de cada estabelecimento
  @TestCaseKey=LPDC-T628
  Scenario: Mensagem de texto na página antecipação com plano Flex
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação
    Then usuário deve visualizar o texto “Você possui o plano de recebimento de suas vendas garantido através do plano de recebimento Flex”

  @TestCaseKey=LPDC-T589
  Scenario: Abas Solicitar antecipação e Histórico na antecipação v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)

  @TestCaseKey=LPDC-T655
  Scenario: Valor disponível para antecipar na caixa Valor disponível para antecipar v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar o valor disponível para antecipar igual ao apresentado no dashboard anteriormente

  @TestCaseKey=LPDC-T592
  Scenario: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar v2
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    And usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
    Then usuário deve visualizar a seguinte mensagem: “O saldo disponível contempla o valor líquido das vendas”

  @TestCaseKey=LPDC-T633
  Scenario: Visualizar informações “Como funciona?” na caixa Valor disponível para antecipar v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título “Como funciona?” e a mensagem “A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico”

  @TestCaseKey=LPDC-T635
  Scenario: Visualizar informações “Antecipação automática” na caixa Antecipação automática v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título “Antecipação automática” e a mensagem “Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa”

  @TestCaseKey=LPDC-T652
  Scenario: Visualizar botão “Solicitar antecipação automática” na caixa Antecipação automática v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação automática” na cor da aliança
    And o botão “Solicitar antecipação automática” na cor da aliança deve ser clicável

  @TestCaseKey=LPDC-T618
  Scenario: Visualizar informações “Antecipação eventual” na caixa Antecipação eventual v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título “Antecipação eventual” e a mensagem “Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais”

  @TestCaseKey=LPDC-T653
  Scenario: Visualizar botão “Solicitar antecipação eventual” na caixa Antecipação eventual
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação eventual” na cor da aliança
    And o botão “Solicitar antecipação eventual” na cor da aliança deve ser clicável

  @TestCaseKey=LPDC-T637
  Scenario: Abas Solicitar antecipação e Histórico na antecipação
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)

  @TestCaseKey=LPDC-T634
  Scenario: Valor disponível para antecipar na caixa Valor disponível para antecipar v3
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar a mensagem “Você não possui valor disponível para antecipar”

  @TestCaseKey=LPDC-T643
  Scenario: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar v4
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    And usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
    Then usuário deve visualizar a seguinte mensagem: “O saldo disponível contempla o valor líquido das vendas”

  @TestCaseKey=LPDC-T640
  Scenario: Visualizar informações “Como funciona?” na caixa Valor disponível para antecipar v2
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título “Como funciona?” e a mensagem “A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico”

  @TestCaseKey=LPDC-T631
  Scenario: Visualizar informações “Antecipação automática” na caixa Antecipação automática
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título “Antecipação automática” e a mensagem “Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa”

  @TestCaseKey=LPDC-T616
  Scenario: Visualizar botão “Solicitar antecipação automática” na caixa Antecipação automática v2
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação automática” na cor da aliança
    And o botão “Solicitar antecipação automática” na cor da aliança deve ser clicável

  @TestCaseKey=LPDC-T619
  Scenario: Visualizar informações “Antecipação eventual” na caixa Antecipação eventual
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título “Antecipação eventual” e a mensagem “Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais”

  @TestCaseKey=LPDC-T614
  Scenario: Visualizar botão “Solicitar antecipação eventual” na caixa Antecipação eventual v1
    Given usuário está logado no Merchant Portal
    When usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
    Then usuário deve visualizar na caixa de antecipação automática o botão “Solicitar antecipação eventual”
    And o botão “Solicitar antecipação eventual” não deve ser clicável

  @TestCaseKey=LPDC-T632
  Scenario: Informações no “Resumo da antecipação eventual” com saldo disponível v1
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    Then usuário deve visualizar no resumo da antecipação eventual as seguintes informações: texto: “A operação está sujeita à aprovação para solicitações aprovadas até 12h15 receba no mesmo dia”. Bandeira: Todas, Produto: Todos, Período Selecionado: Todo período, Valor solicitado igual ao disponível para antecipar, taxa: <número em porcento>, Valor descontado em reais e Valor a receber em reais

  @TestCaseKey=LPDC-T642
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

  @TestCaseKey=LPDC-T627
  Scenario: Confirmar a antecipação eventual com saldo disponível v1
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And o portal apresenta um modal solicitando a confirmação com a frase
    And “Deseja confirmar a solicitação de antecipação?
    And Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
    And usuário não confirma a antecipação
    Then usuário deve visualizar a página anterior com a seleção feita

  @TestCaseKey=LPDC-T629
  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a antecipação
    Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
    And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
    And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  @TestCaseKey=LPDC-T606
  Scenario: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a antecipação
    Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h” (essa mensagem deve permanecer na tela por 10 segundos)
    And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
    And usuário visualizará a seguinte mensagem nos Gives de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  @TestCaseKey=LPDC-T622
  Scenario: Antecipar eventualmente com saldo disponível entre 18:46 e 23:59
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a antecipação
    Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
    And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
    And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  @TestCaseKey=LPDC-T603
  Scenario: Antecipar eventualmente com saldo disponível em dia não úteis
    Given usuário está logado no Merchant Portal
    And usuário possui saldo para antecipar eventualmente
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a antecipação
    Then usuário deve visualizar a seguinte mensagem em uma caixa amarela “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h” (essa mensagem deve permanecer na tela por 10 segundos)
    And usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
    And usuário visualizará a seguinte mensagem nos dados de pagamento: “Consulte seus domicílios bancários no menu Negócio” e um link para acessar menu Negócio

  @TestCaseKey=LPDC-T623
  Scenario: Gerar comprovante de antecipação eventual com saldo disponível
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário gera o comprovante de antecipação
    Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)

  @TestCaseKey=LPDC-T582
  Scenario: Abrindo a personalização da antecipação eventual
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    Then usuário visualizará a caixa Personalizar solicitação de antecipação contendo: subcaixa “Composição dos valores a serem antecipados” (Bandeiras (Dropbox) e Produto (dropbox)), subcaixa “Configuração do período da antecipação” (Todo o período, Vencimento de (calendário) = dia da consulta, Até (calendário) = sem limite e subcaixa “Valor disponível para antecipar. Personalize o valor:” (Valor (textfield)) e uma mensagem “Valor disponível: R$” = valor disponível para antecipar
    And toda e qualquer personalização feita nesses campos deve refletir nos respectivos campos da seção “Resumo da antecipação eventual”

  @TestCaseKey=LPDC-T647
  Scenario: Personalizar a data de vencimento
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário seleciona uma outra data de vencimento futura data sendo que é menor do que a data de “até”
    Then usuário verá que o botão “Todo o período” está desligado

  @TestCaseKey=LPDC-T599
  Scenario: Personalizar a data de “até”
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário seleciona uma outra data anterior de “até” vencimento sendo que é maior do que a data de vencimento
    Then usuário verá que o botão “Todo o período” está desligado

  @TestCaseKey=LPDC-T600
  Scenario: Personalizar valor com valor superior ao valor disponível para antecipar
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário deseja alterar o valor para antecipar com um valor superior ao valor disponível para antecipar
    Then usuário verá dois textos na cor vermelha: “Valor disponível” = valor disponível para antecipar em reais e “Valor é superior ao saldo disponível para antecipar”

  @TestCaseKey=LPDC-T591
  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
    Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais

  @TestCaseKey=LPDC-T583
  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor mínimo
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
    Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais
    And usuário seleciona “Valos mínimo”
    Then esse será o valor preenchido no campo “Valor solicitado” do resumo da antecipação eventual
    And no modal “Deseja confirmar a solicitação de antecipação?”

  @TestCaseKey=LPDC-T609
  Scenario: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor máximo
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
    Then usuário verá um texto “Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:” e duas opções “Valor mínimo: R$” = valor em reais e “Valor máximo: R$” = valor em reais
    And usuário seleciona “Valos máximo”
    Then esse será o valor preenchido no campo “Valor solicitado” do resumo da antecipação eventual
    And no modal "Deseja confirmar a solicitação de antecipação?"

  @TestCaseKey=LPDC-T601
  Scenario: Deixar qualquer campo de personalização sem preencher
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário clica no botão Personalizar solicitação de antecipação
    And usuário não preenche um dos campos da personalização
    Then usuário não pode clicar no botão “Solicitar antecipação”

  @TestCaseKey=LPDC-T625
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
  @TestCaseKey=LPDC-T624
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
  @TestCaseKey=LPDC-T595
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
  @TestCaseKey=LPDC-T593
  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por bandeira
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário seleciona a <bandeira>
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário gera o comprovante de antecipação
    Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = <bandeira>, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)

  #Exemplos:   bandeira   Elo   Mastercard   Visa   Todas
  @TestCaseKey=LPDC-T596
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
  @TestCaseKey=LPDC-T611
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
  @TestCaseKey=LPDC-T613
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
  @TestCaseKey=LPDC-T626
  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por produto
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário seleciona o <produto>
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário gera o comprovante de antecipação
    Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = <produto>, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)

  # Exemplos:   Produto  Crédito a vista   Crédito parcelado   Todos
  @TestCaseKey=LPDC-T612
  Scenario: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando período válido v1
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
  @TestCaseKey=LPDC-T641
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
  @TestCaseKey=LPDC-T620
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
  @TestCaseKey=LPDC-T605
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
  @TestCaseKey=LPDC-T585
  Scenario: Gerar comprovante de antecipação eventual com saldo disponível filtrando por período válido
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário personaliza o <período>
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário gera o comprovante de antecipação
    Then usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: “Comprovante de solicitação de antecipação eventual”, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos os produtos, período = <DD/MM/AAAA – DD/MM/AAAA> e canal de contratação = Portal do cliente)

  #Exemplos:   Período   Vencimento de: Do dia corrente (dia da consulta) – 12/07/2023   Até: Sem limitação no calendário – 12/08/2023
  @TestCaseKey=LPDC-T607
  Scenario: Nova simulação após antecipar eventualmente v1
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário solicita uma Nova simulação
    Then usuário verá um pop-up com o seguinte texto: “Quer garantir o recebimento das suas próximas vendas?” “Contrate o nosso serviço de antecipação automática e garanta o recebimento imediato de suas próximas vendas” e o botão “X” e “fechar” e “ir para antecipação automática”

  @TestCaseKey=LPDC-T584
  Scenario: Fechar a nova simulação após antecipar eventualmente v3
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário solicita uma Nova simulação
    And usuário clica no botão “X”
    Then usuário será direcionado para a página inicial da antecipação

  @TestCaseKey=LPDC-T580
  Scenario: Fechar a nova simulação após antecipar eventualmente v4
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário solicita uma Nova simulação
    And usuário clica no botão “Fechar”
    Then usuário será direcionado para a página inicial da antecipação

  @TestCaseKey=LPDC-T638
  Scenario: Ir para antecipação automática na nova simulação após antecipar eventualmente v4
    Given usuário está logado no Merchant Portal
    When usuário deseja antecipar eventualmente
    And usuário solicita a antecipação
    And usuário confirma a solicitação
    And usuário solicita uma Nova simulação
    And usuário clica no botão “Ir para antecipação automática”
    Then usuário será direcionado para a página inicial da antecipação automática

  @TestCaseKey=LPDC-T594
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

  #======================================================================================================================
  #  ANTECIPACAO V2 - Entrega que desliga o BW e a antecipação passa a ser no Portal - 20/08/2024 - Bressan
  #======================================================================================================================
  @TestCaseKey=LPDC-T785
  Scenario: Antecipação V2 eventual com uma única Bandeira
    Given  usuário está logado no Portal do Cliente
    When  usuário seleciona Antecipação no menu lateral esquerdo
    And  usuário seleciona solicitar antecipação eventual
    And  seleciona personalizar solicitação de antecipação
    And seleciona no campo bandeiras uma única bandeira
    And  Seleciona um valor no campo Valor
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase "Deseja confirmar a solicitação de antecipação?  Deseja confirmar a solicitação de antecipação de R$ (VALOR)?"
    And  o usuário confirma a antecipação
    Then o usuário deve visualizar a seguinte mensagem: “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h.”

  @TestCaseKey=LPDC-T780
  Scenario: Antecipação V2  Eventual Valor Mínimo
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Eventual
    And  usuário seleciona Personalizar solicitação de antecipação
    And  seleciona personalizar solicitação de antecipação
    And  no Campo Valor selecionar um Valor
    And  abaixo selecionar um valor Mínimo
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
    And  usuário confirma a antecipação
    Then  usuário deve visualizar a seguinte mensagem: “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h.”

  @TestCaseKey=LPDC-T784
  Scenario: Antecipação V2 Eventual valor Máximo
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Eventual
    And  usuário seleciona Personalizar solicitação de antecipação
    And  seleciona personalizar solicitação de antecipação
    And  no Campo Valor selecionar um Valor
    And  abaixo selecionar um valor Máximo
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
    And  usuário confirma a antecipação
    Then  usuário deve visualizar a seguinte mensagem: “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h.”

  @TestCaseKey=LPDC-T779
  Scenario: Antecipação V2  eventual Parcial
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Eventual
    And  usuário seleciona Personalizar solicitação de antecipação
    And  seleciona personalizar solicitação de antecipação
    And  no Campo Valor selecionar um Valor
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação de R$ (VALOR)?”
    And  usuário confirma a antecipação
    Then  usuário deve visualizar a seguinte mensagem: “Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h.”

  @TestCaseKey=LPDC-T777
  Scenario: Antecipação V2 Automática
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Automática
    And  preenche os Campos, Bandeiras, Produtos, Frequência, Dia de recebimento
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação automática
    And  usuário clicar em confirmar a antecipação
    Then  usuário deve visualizar a seguinte mensagem: “Antecipação automática cadastrada com sucesso”

  @TestCaseKey=LPDC-T778
  Scenario: Antecipação V2 Automática Produtos com crédito a vista
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Automática
    And  preenche os Campo Produtos com crédito a vista
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação automática
    And  usuário clicar em confirmar a antecipação
    Then  usuário deve visualizar a seguinte mensagem: “Antecipação automática cadastrada com sucesso”

  @TestCaseKey=LPDC-T787
  Scenario: Antecipação V2 Automática Produto Parcelado
    Given  usuário está na aba Solicitar Antecipação
    When  usuário seleciona Antecipação Automática
    And  preenche os Campo Produtos com parcelado
    And  clica no Botão Solicitar antecipação
    And  o portal apresenta um modal solicitando a confirmação com a frase “Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação automática
    And  usuário clicar em confirmar a antecipação
    Then  usuário deve visualizar a seguinte mensagem:”Antecipação automática cadastrada com sucesso”

  @TestCaseKey=LPDC-T782
  Scenario: Antecipação V2 Histórico Antecipação com Toggle desligado V2
    #Premissa : (Inserir os passos de ligar e desligar o toggle)
    Given  usuário está na aba Antecipação
    When  usuário seleciona Histórico de Antecipações
    Then usuário acessara a aba histórico antecipação nativo via BW

  @TestCaseKey=LPDC-T775
  Scenario: Antecipação V2 Histórico Antecipação com Toggle ligado V2
    # Premissa : (Inserir os passos de ligar e desligar o toggle)
    Given  usuário está na aba Antecipação
    When  usuário seleciona Histórico de Antecipações
    Then  usuário acessara a aba histórico antecipação com o filtro por período

  @TestCaseKey=LPDC-T783
  Scenario: Antecipação V2 Histórico Com período até 29/08/2024
    Given  usuário está em Histórico de Antecipação
    When  usuário seleciona o período até dia 29/08/2024
    Then  usuário terá acesso a todas as antecipações que foram feitas pela mesa de recebíveis

  @TestCaseKey=LPDC-T788
  Scenario: Antecipação V2 Histórico Com período após 29/08/2024
    Given  usuário está em Histórico de Antecipação
    When  usuário seleciona o período após dia 29/08/2024
    Then  usuário terá acesso a todas as antecipações que foram feitas via BW

  @TestCaseKey=LPDC-T789
  Scenario: Antecipação V2 Histórico Antecipação com Toggle desligado V2 com periodo 7 dias
    Given  usuário está Histórico de Antecipação
    When  usuário seleciona um Período que por default deve vir 7 dias
    Then  usuário visualizara o calendário e abaixo a seguinte mensagem: “Caso não encontre lançamentos, consulte no filtro acima “até dia 29/08/2024”

  @TestCaseKey=LPDC-T786
  Scenario: Antecipação V2 Exportando Excel
    Given  usuário está Histórico de Antecipação
    When  usuário clica em Exportar
    And seleciona Excel
    Then  Devera baixar o arquivo Excel

  @TestCaseKey=LPDC-T781
  Scenario: Antecipação V2 Exportando CSV
    Given usuário está Histórico de Antecipação
    When usuário clica em Exportar
    And seleciona CSV
    Then Devera baixar o arquivo CSV

