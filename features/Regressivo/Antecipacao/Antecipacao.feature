#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Atecipacao/Antecipação
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Antecipação

  ###################################################################################
  #  TESTE NO DASHBOARD TELA INICIAL
  ###################################################################################
  @TestCaseKey=LPDC-T574
  Scenario Outline: Dashboard antecipação drill down
    Given open portal "<alianca>" and logon
    And Usuário verá "Dashboard - Antecipação"
    And o número do estabelecimento "<nrestab>" na coluna Estabelecimento,
    #And a mensagem "Antecipação automática contratada" na coluna Valor/Produto
    And o valor que pode ser antecipado em "Dashboard - Valor Antecipação"
    And o usuário clica em "Dashboard - Ir para Antecipação"
    And Usuário verá "Dashboard - Antecipação"
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca | nrestab  |
      | usuário master | sicredi | EC 99990109 |

    @azulzinha @alliances @Antecipacao1
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances @Antecipacao1
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T586
  Scenario Outline: Dashboard Antecipação validação de valores
    Given open portal "<alianca>" and logon
    Given o usuário visualiza o dashboard Antecipação e salva o valor a antecipar
    Then o usuario vai para a pagina de antecipação
    Then o usuário deve visualizar o valor disponível para antecipar igual ao apresentado no dashboard
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T615
  Scenario Outline: Dashboard Antecipação sem saldo
    Given open portal "<alianca>" and logon
    When o usuário visualiza o dashboard Antecipação
    Then o valor zero reais na coluna Valor/Produto
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T576
  Scenario Outline: Dashboard Antecipação com EC flex
    Given open portal "<alianca>" and logon
    Given o usuário visualiza o dashboard Antecipação
    Then o usuário visualizará o número do estabelecimento na coluna Estabelecimento e a mensagem "Plano Flex contratado"
    And o usuário visualizará valor na coluna 'ValorProduto'
    And o usuário visualizará o botão "Ir para antecipação
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca     |
      | usuário master | sicrediflex |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  ###################################################################################
  #  TESTE NA TELA DE ANTECIPAÇÃO
  ###################################################################################
  @TestCaseKey=LPDC-T491
  Scenario Outline: Health Check Tela Antecipação
    Given open portal "<alianca>" and logon
    And o usuário acessou página de Antecipação
    And o texto "Antecipação" esta visivel na pagina de Antecipação
    And o texto "Valor disponível para antecipação" esta visivel na pagina de Antecipação
    And o texto "Como funciona?" esta visivel na pagina de Antecipação
    And o texto "Antecipação automática" esta visivel na pagina de Antecipação
    And o texto "Antecipação eventual" esta visivel na pagina de Antecipação
    And o usuário clica no link "Histórico"
    And o texto "Historico de antecipações eventuais" esta visivel na pagina de Antecipação Historico
    And o texto "Total de antecipações pagas" esta visivel na pagina de Antecipação Historico
    And o texto "Valor líquido pago" esta visivel na pagina de Antecipação Historico
    Then o usuário visualizará na página da Antecipação o nome do estabelecimento
    Then o usuário visualizará na CNPJ do estabelecimento
    Then o usuário visualizará o número do estabelecimento
    And logout
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

  #testes em revisao da webview
  @TestCaseKey=LPDC-T421
  Scenario Outline: Tela Antecipação - Troca de estabelecimento comercial
    Given open portal "<alianca>" and logon
    And o usuário acessou página de Antecipação
    When o usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    #Given o usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    #And o usuário selecionou um documento com maior número de ECs e clicar Acessar
    #And o usuário acessou página de Antecipação
    And Popup terá ECs do documento selecionado
    #And Popup terá nomes do documento selecionado
    And Popup será fechado ao clicar em Selecionar
    And logout
    @sicredi @alliances @HealthCheck @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

  @TestCaseKey=LPDC-T406
  Scenario Outline: Tela Antecipação troca de estabelecimento  EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And o usuário acessou página de Antecipação
    When o usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação
    Then Mostrará popup para selecionar estabelecimento
    And Popup terá mesmo ECs que o selecionado
    And Popup terá nomes do EC selecionado
    And Popup será fechado ao clicar em Selecionar
    #And Botão "Negócios - Popup Trocar - Botão selecionar" estará visível e desabilitado
    And logout
    @sicredi @alliances  @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

  @TestCaseKey=LPDC-T650
  Scenario Outline: Tela Antecipação com documento unico
    Given open portal "<alianca>" and logon
    And o usuário acessou página de Antecipação
    When o usuário troca o estabelecimento selecionando qualquer EC
    Then o usuário não deve visualizar o botão "Trocar estabelecimento"
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T587
  Scenario Outline: Tela Antecipação com mais de um documento
    Given open portal "<alianca>" and logon
    Given o usuário visualiza o dashboard Antecipação
    And o usuario guarda o Valor disponível para antecipação
    When o usuário troca o estabelecimento
    Then o usuário deve visualizar um Valor disponível para antecipação diferente
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T649
  Scenario Outline: Tela Antecipação verificação de Mensagens Plano Flex
    Given open portal "<alianca>" and logon
    Given o usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação
    Then o usuário deve visualizar o subtítulo "Plano Flex"
    And o usuário deve visualizar o texto "Você possui o plano de recebimento Flex, portanto irá receber suas vendas na modalidade débito em 1 dia útil e as vendas na modalidade crédito em <X> dias"
    Then o usuário deve visualizar o texto "Você possui o plano de recebimento de suas vendas garantido através do plano de recebimento Flex"
    #Obs.: O valor <X> depende do contrato de cada estabelecimento
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T654
  Scenario Outline: Tela Antecipação eventual cancelar
    Given open portal "<alianca>" and logon
    And o usuário possui saldo para antecipar eventualmente
    And o usuário deseja antecipar eventualmente
    And  usuário solicita a antecipação
    When o portal apresenta um modal solicitando a confirmação com a frase "Deseja confirmar a solicitação de antecipação?" e o usuário clica em voltar
    Then o usuário deve permanecer na pagina de antecipação e verificar o texto "Resumo da antecipação eventual
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T644
  Scenario Outline: Tela Antecipação eventual Personalizada
    Given open portal "<alianca>" and logon
    Given o usuário deseja antecipar eventualmente
    And o usuário clica no botão Personalizar solicitação de antecipação
    #Then o usuário visualizará a caixa Personalizar solicitação de antecipação contendo: subcaixa "Composição dos valores a serem antecipados" (Bandeiras (Dropbox) e Produto (dropbox)), subcaixa "Configuração do período da antecipação" (Todo o período, Vencimento de (calendário) = dia da consulta, Até (calendário) = sem limite e subcaixa "Valor disponível para antecipar. Personalize o valor:" (Valor (textfield)) e uma mensagem "Valor disponível: R$" = valor disponível para antecipar E toda e qualquer personalização feita nesses campos deve refletir nos respectivos campos da seção "Resumo da antecipação eventual"
    When Seleciona Bandeira "<bandeira>" produtos "<produtos>" vencimento de hoje ate hoje  data corrente e valor "<valor>"
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca | bandeira   | produtos | valor |
      | usuário master | sicredi | MasterCard | todos    | 10,00 |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T645
  Scenario Outline: Tela Antecipação eventual com saldo disponível efetivação
    Given open portal "<alianca>" and logon
    And o usuário possui saldo para antecipar eventualmente
    And o usuário deseja antecipar eventualmente
    And o usuário solicita a antecipação
    And o portal apresenta um modal solicitando a confirmação com a frase "Deseja confirmar a solicitação de antecipação? Deseja confirmar a solicitação de antecipação de R$ (VALOR)?" E o usuário não confirma a antecipação
    And o usuário gera o comprovante de antecipação
    Then o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: "Comprovante de solicitação de antecipação eventual", data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
    # Then o usuário deve visualizar a página anterior com a seleção feita
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

  @TestCaseKey=LPDC-T579
  Scenario Outline: Tela Antecipação de campos nulos
    Given open portal "<alianca>" and logon
    Given o usuário deseja antecipar eventualmente
    And o usuário clica no botão Personalizar solicitação de antecipação
    And o usuário não preenche um dos campos da personalização
    Then o usuário não pode clicar no botão "Solicitar antecipação"
    @sicredi @alliances @Antecipacao
    Examples:
      | Description    | alianca |
      | usuário master | sicredi |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | usuário master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | usuário master | bin     |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | usuário master | afinz   |

#Este teste não eh elegivel de automção
#Scenario Outline: Abas Solicitar antecipação e Histórico na antecipação
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)
#Teste de validação de valor será colocado o passo em teste similar acima
#Scenario Outline: Valor disponível para antecipar na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar o valor disponível para antecipar igual ao apresentado no dashboard anteriormente
#Não elegivel a automação
#Scenario Outline: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#And o usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
#Then o usuário deve visualizar a seguinte mensagem: "O saldo disponível contempla o valor líquido das vendas"
#Scenario Outline: Visualizar informações "Como funciona?" na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título "Como funciona?" e a mensagem "A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico"
#Scenario Outline: Visualizar informações "Antecipação automática" na caixa Antecipação automática
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título "Antecipação automática" e a mensagem "Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa"
#Scenario Outline: Visualizar botão "Solicitar antecipação automática" na caixa Antecipação automática
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar na caixa de antecipação automática o botão "Solicitar antecipação automática" na cor da aliança
#And o botão "Solicitar antecipação automática" na cor da aliança deve ser clicável
#Scenario Outline: Visualizar informações "Antecipação eventual" na caixa Antecipação eventual
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título "Antecipação eventual" e a mensagem "Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais"
#Scenario Outline: Visualizar botão "Solicitar antecipação eventual" na caixa Antecipação eventual
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão com saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar na caixa de antecipação automática o botão "Solicitar antecipação eventual" na cor da aliança
#And o botão "Solicitar antecipação eventual" na cor da aliança deve ser clicável
#Teste duplicado
#Scenario Outline: Abas Solicitar antecipação e Histórico na antecipação
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar duas abas: Solicitar antecipação (selecionada com a cor da aliança) e Histórico (sem estar selecionada)
#Testes quadrupicado
#Scenario Outline: Valor disponível para antecipar na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar a mensagem "Você não possui valor disponível para antecipar"
#Scenario Outline: Visualizar tooltip Valor disponível para antecipar na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#And o usuário passa o mouse sobre o tooltip do Valor disponível para antecipar
#Then o usuário deve visualizar a seguinte mensagem: "O saldo disponível contempla o valor líquido das vendas"
#Teste duplicado
#Scenario Outline: Visualizar informações "Como funciona?" na caixa Valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações: ícone circular com o ponto de interrogação, título "Como funciona?" e a mensagem "A antecipação é o recebimento adiantado das vendas feitas no crédito à vista ou parcelado. Nessa jornada você criará uma solicitação de antecipação, que passará por análises e poderá ser acompanhada na aba Histórico"
#Teste duplicado
#Scenario Outline: Visualizar informações "Antecipação automática" na caixa Antecipação automática
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações na caixa de antecipação automática: ícone, título "Antecipação automática" e a mensagem "Ao contratar o serviço você define uma frequência de recebimento e automaticamente os recebíveis com cartão de crédito serão antecipados e creditados na conta de sua empresa. É a maneira mais simples de gerenciar suas vendas e seu fluxo de caixa"
#Teste duplicado
#Scenario Outline: Visualizar botão "Solicitar antecipação automática" na caixa Antecipação automática
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar na caixa de antecipação automática o botão "Solicitar antecipação automática" na cor da aliança
#And o botão "Solicitar antecipação automática" na cor da aliança deve ser clicável
#Teste duplicado
#Scenario Outline: Visualizar informações "Antecipação eventual" na caixa Antecipação eventual
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar as seguintes informações na caixa de antecipação eventual: ícone, título "Antecipação eventual" e a mensagem "Sempre que precisar você poderá solicitar a antecipação dos valores das vendas realizadas por cartão de crédito na própria máquina de cartão ou pelos canais digitais"
#Teste duplicado
#Scenario Outline: Visualizar botão "Solicitar antecipação eventual" na caixa Antecipação eventual
#Given open portal "<alianca>" and logon
#Given o usuário acessa a antecipação de um EC padrão sem saldo para antecipar pelo dashboard Antecipação
#Then o usuário deve visualizar na caixa de antecipação automática o botão "Solicitar antecipação eventual"
#And o botão "Solicitar antecipação eventual" não deve ser clicável
#Teste coberto no health check
#Scenario Outline: Informações no "Resumo da antecipação eventual" com saldo disponível
#Given open portal "<alianca>" and logon
#When o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#Then o usuário deve visualizar no resumo da antecipação eventual as seguintes informações: texto: "A operação está sujeita à aprovação para solicitações aprovadas até 12h15 receba no mesmo dia". Bandeira: Todas, Produto: Todos, Período Selecionado: Todo período, Valor solicitado igual ao disponível para antecipar, taxa: <número em porcento>, Valor descontado em reais e Valor a receber em reais
#Não elegivel a automação
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos) E o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento E o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h" (essa mensagem deve permanecer na tela por 10 segundos) E o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento E o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 18:46 e 23:59
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos) E o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento E o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Scenario Outline: Antecipar eventualmente com saldo disponível em dia não úteis
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos) E o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento E o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste embutido na antecipação com saldo
#Scenario Outline: Gerar comprovante de antecipação eventual com saldo disponível
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário gera o comprovante de antecipação
#Then o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: "Comprovante de solicitação de antecipação eventual", data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
#Teste sera embutido em antecipação parcial
#Scenario Outline: Personalizar a data de vencimento
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário seleciona uma outra data de vencimento futura data sendo que é menor do que a data de "até"
#Then o usuário verá que o botão "Todo o período" está desligado
#Scenario Outline: Personalizar a data de "até"
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário seleciona uma outra data anterior de "até" vencimento sendo que é maior do que a data de vencimento
#Then o usuário verá que o botão "Todo o período" está desligado
# Scenario Outline: Personalizar valor com valor superior ao valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário deseja alterar o valor para antecipar com um valor superior ao valor disponível para antecipar
#Then o usuário verá dois textos na cor vermelha: "Valor disponível" = valor disponível para antecipar em reais e "Valor é superior ao saldo disponível para antecipar"
#Scenario Outline: Personalizar valor com valor inferior ao valor disponível para antecipar
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
#Then o usuário verá um texto "Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:" e duas opções "Valor mínimo: R$" = valor em reais e "Valor máximo: R$" = valor em reais
#Scenario Outline: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor mínimo
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
#Then o usuário verá um texto "Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:" e duas opções "Valor mínimo: R$" = valor em reais e "Valor máximo: R$" = valor em reais
#And o usuário seleciona "Valos mínimo"
#Then esse será o valor preenchido no campo "Valor solicitado" do resumo da antecipação eventual
#And no modal "Deseja confirmar a solicitação de antecipação?"
#Scenario Outline: Personalizar valor com valor inferior ao valor disponível para antecipar e selecionar o valor máximo
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário clica no botão Personalizar solicitação de antecipação
#And o usuário deseja alterar o valor para antecipar com um valor inferior ao valor disponível para antecipar
#Then o usuário verá um texto "Com base em suas seleções, conseguimos chegar em dois valores mínimo e máximo. Seleciona a opção desejada:" e duas opções "Valor mínimo: R$" = valor em reais e "Valor máximo: R$" = valor em reais
#And o usuário seleciona "Valos máximo"
#Then esse será o valor preenchido no campo "Valor solicitado" do resumo da antecipação eventual
#And no modal "Deseja confirmar a solicitação de antecipação?"
#teste nao elegivel a automação
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando por bandeira
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário seleciona a <bandeira>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por bandeira
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário seleciona a <bandeira>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Scenario Outline: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por bandeira
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário seleciona a <bandeira>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = <bandeira>, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Gerar comprovante de antecipação eventual com saldo disponível filtrando por bandeira
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário seleciona a <bandeira>
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário gera o comprovante de antecipação
#Then o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: "Comprovante de solicitação de antecipação eventual", data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = <bandeira>, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando por produto
#Given open portal "<alianca>" and logon
#And  o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza pelo <produto>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por produto
#Given open portal "<alianca>" and logon
#And  o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza pelo <produto>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por produto
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza pelo <produto>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = <produto>, canal de contratação = Portal do cliente, Período = antecipar todo o período até o momento
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Gerar comprovante de antecipação eventual com saldo disponível filtrando por produto
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário seleciona o <produto>
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário gera o comprovante de antecipação
#Then o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: "Comprovante de solicitação de antecipação eventual", data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = <produto>, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando período válido
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza um <período>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 12:16 e 18:45 personalizando por período válido
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza um <período>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 10h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 18:46 e 23:59 personalizando por período válido
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza um <período>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then  o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Antecipar eventualmente com saldo disponível em dia não úteis personalizando por período válido
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza um <período>
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#Then o usuário deve visualizar a seguinte mensagem em uma caixa amarela "Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no próximo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#And o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = todas as bandeiras, Produto = todos os produtos, canal de contratação = Portal do cliente, Período = <DD/MM/AAAA – DD/MM/AAAA>
#And o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
#Teste sera embutido em antecipação parcial
#Scenario Outline: Gerar comprovante de antecipação eventual com saldo disponível filtrando por período válido
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário personaliza o <período>
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário gera o comprovante de antecipação
#Then o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: "Comprovante de solicitação de antecipação eventual", data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais (valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos os produtos, período = <DD/MM/AAAA – DD/MM/AAAA> e canal de contratação = Portal do cliente)
#Teste sera embutido em antecipação parcial
#Scenario Outline: Nova simulação após antecipar eventualmente
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário solicita uma Nova simulação
#Then o usuário verá um pop-up com o seguinte texto: "Quer garantir o recebimento das suas próximas vendas?" "Contrate o nosso serviço de antecipação automática e garanta o recebimento imediato de suas próximas vendas" e o botão "X" e "fechar" e "ir para antecipação automática"
#Não elegivel a automação
#Scenario Outline:  Fechar a nova simulação após antecipar eventualmente
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário solicita uma Nova simulação
#And o usuário clica no botão "X"
#Then o usuário será direcionado para a página inicial da antecipação
#Scenario Outline:  Fechar a nova simulação após antecipar eventualmente
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário solicita uma Nova simulação
#And o usuário clica no botão "Fechar"
#Then o usuário será direcionado para a página inicial da antecipação
#Scenario Outline:  Ir para antecipação automática na nova simulação após antecipar eventualmente
#Given open portal "<alianca>" and logon
#Given o usuário deseja antecipar eventualmente
#And o usuário solicita a antecipação
#And o usuário confirma a solicitação
#And o usuário solicita uma Nova simulação
#And o usuário clica no botão "Ir para antecipação automática"
#And o usuário será direcionado para a página inicial da antecipação automática
#Scenario Outline: Antecipar eventualmente com saldo disponível entre 00:00 e 12:15 personalizando bandeira, produto e todo o período
#Given open portal "<alianca>" and logon
#And o usuário possui saldo para antecipar eventualmente
#Given o usuário personaliza bandeira (Máster, Visa), produto (Todos) e todo o período
#And o usuário solicita a antecipação
#And o usuário confirma a antecipação
#And Então o usuário deve visualizar a seguinte mensagem em uma caixa amarela
#"Sua solicitação de antecipação se encontra em análise. Em caso de aprovação, o pagamento ocorrerá no mesmo dia útil até às 16h" (essa mensagem deve permanecer na tela por 10 segundos)
#E o usuário verá as informações gerais contendo: Valor bruto solicitado em reais, Taxa, Valor desconto em reais, Valor líquido a receber, status em andamento, bandeiras = Máster e Visa, Produto = Todos, canal de contratação = Portal do cliente, Período = Antecipar todo o período até o momento
#E o usuário visualizará a seguinte mensagem nos dados de pagamento: "Consulte seus domicílios bancários no menu Negócio" e um link para acessar menu Negócio
