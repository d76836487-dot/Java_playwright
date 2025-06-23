#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Antecipacao/AntecipacaoD0
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: AntecipacaoD0

  # Contratação D0 ou D1 via banner de topo no Portal
  @TestCaseKey=LPDC-T1361
  Scenario: Cliente elegivel entrando no fluxo de contratacao atraves do menu lateral
    Given usuario esta logado no Portal do cliente
    When Acessar o menu lateral esquerdo
    And selecionar a opcao Antecipacao
    Then entrara no Fluxo para Contratatacao de Antecipacao de no mesmo dia ou em 1 dia util

  @TestCaseKey=LPDC-T1360
  Scenario: Cliente elegivel entrando no fluxo contratacao atraves Acesso rapido
    Given usuario esta logado na Home
    When atraves do acesso rapido ele selecionar a opcao antecipacao
    Then entrara no Fluxo para Contratatacao de Antecipacao de no mesmo dia ou em 1 dia util

  @TestCaseKey=LPDC-T1357
  Scenario: Usuário elegível visualizando o banner de antecipação
    Given o usuário está logado no Portal do cliente
    And é elegível para antecipação D0 ou D1
    Then os banners dos novos planos de recebimento é exibido com o botão "Recebe já"

  @TestCaseKey=LPDC-T1379
  Scenario: Usuário clica no botão "Recebe já" e visualiza a tela de contratação
    Given o usuário está logado no Portal do cliente
    And é elegível para antecipação D0 ou D1
    When clicar no botão "Recebe já"
    Then a nova tela de contratação é carregada com o modal "Novos planos de recebimento chegaram"

  @TestCaseKey=LPDC-T1391
  Scenario: Modal de confirmação do plano D0 é exibido corretamente
    Given o usuário está na tela de contratação
    When o modal de contratação é exibido
    Then o modal apresenta a confirmação "Receba no mesmo dia"

  @TestCaseKey=LPDC-T1352
  Scenario: Modal de confirmação do plano D1 é exibido corretamente
    Given o usuário está na tela de contratação
    When o modal de contratação é exibido
    Then o modal apresenta a confirmação "Receba em um dia útil"

  @TestCaseKey=LPDC-T1398
  Scenario: Usuário fecha o modal utilizando o botão "X"
    Given o usuário está visualizando o modal de contratação
    When o usuário clica no botão "X"
    Then o modal é fechado
    And o banner dos novos planos será mostrado novamente na próxima seção

  @TestCaseKey=LPDC-T1354
  Scenario: Usuário fecha o modal utilizando o botão "Fechar"
    Given o usuário está visualizando o modal de contratação
    When o usuário clica no botão "Fechar"
    Then o modal é fechado
    And o banner dos novos planos será mostrado novamente na próxima seção

  @TestCaseKey=LPDC-T1388
  Scenario: Usuário observa a oferta dos planos após fechar o modal
    Given o usuário fechou o modal de contratação
    When navegar para outra seção do Portal
    Then a oferta dos planos de antecipação é apresentada novamente

  @TestCaseKey=LPDC-T1387
  Scenario: Usuário clica em "Ver taxas" e visualiza todas as taxas
    Given o usuário está na tela de contratação
    When clicar no link "Ver taxas"
    Then a tela com todas as taxas por método de pagamento e bandeira é exibida

  @TestCaseKey=LPDC-T1356
  Scenario Outline: Visualização das taxas dos planos D0 e D1
    Given o usuário está na tela de taxas
    When visualizara as taxas para o método de pagamento "<método>" e bandeira "<bandeira>"
    Then a taxa correspondente ao plano D"<dia>" é exibida corretamente
    Examples:
      | método  | bandeira         | dia |
      | Débito  | Visa             | 0   |
      | Crédito | MasterCard       | 1   |
      | Débito  | Elo              | 0   |
      | Crédito | American Express | 1   |

  @TestCaseKey=LPDC-T1378
  Scenario: Usuário seleciona o plano D0 e confirma a contratação
    Given o usuário está na tela de contratação
    When selecionar o plano "Receba no mesmo dia"
    And confirma a seleção
    Then um modal de confirmação "Receba no mesmo dia" é exibido

  @TestCaseKey=LPDC-T1353
  Scenario: Usuário visualiza corretamente as taxas
    Given o usuário esta logado no Portal do cliente
    When selecionar plano "Receba no mesmo dia"
    And selecionar ver taxas
    Then as taxas do plano D0 "Receba em um dia útil" é exibida corretamente

  @TestCaseKey=LPDC-T1392
  Scenario: Usuário seleciona o plano D1 e confirma a contratação
    Given o usuário está na tela de contratação
    When selecionar o plano "Receba em um dia útil"
    And confirma a seleção
    Then um modal de confirmação "Receba em um dia útil" é exibido

  @TestCaseKey=LPDC-T1369
  Scenario: Usuário visualiza corretamente as taxas por método de pagamento e bandeira
    Given o usuário esta logado no Portal do cliente
    When selecionar plano de recebimentos em D1
    And selecionar ver taxas
    Then as taxas do plano D1 "Receba em um dia útil" é exibida corretamente

  @TestCaseKey=LPDC-T1366
  Scenario: Usuário já possui um plano de antecipação automático contratado
    Given o usuário está logado no Portal do cliente
    And já tem um plano de antecipação automático
    When navegar para a tela de ofertas
    Then o "Plano atual" é exibido com as informações correspondentes

  @TestCaseKey=LPDC-T1359
  Scenario Outline: Exibição do plano atual baseado no código retornado
    Given o usuário possui um plano de antecipação automático com o código "<código>"
    When navegar para a tela de ofertas
    Then o "Plano atual" exibido corresponde a "<descrição>"
    Examples:
      | código | descrição                         |
      | 310    | Essencial - Recebimento semanal   |
      | 415    | Essencial - Recebimento quinzenal |
      | 720    | Essencial - Recebimento mensal    |

  @TestCaseKey=LPDC-T1404
  Scenario: Cliente elegível com contratacao D1 migra para plano D0
    Given cliente é elegível e possui o serviço de antecipação D1 contratado
    And possui saldo de antecipação
    When acessar a tela de migração de plano
    Then deve ser exibida a tela de migração de plano sem a opção de saldo disponível
    And deve existir a opção de confirmar a contratação
    When cliente clicar na confirmação
    Then canal deve exibir apenas o plano escolhido (D0) e o botão [Contratar]
    Then cliente clicar no botão [Contratar]
    Then deve ser direcionado para a tela de "Obrigada"

  @TestCaseKey=LPDC-T1381
  Scenario: Usuário tenta contratar antecipação fora do deadline
    Given o usuário está logado no Portal do cliente após 30/06
    When tenta contratar antecipação D0 ou D1
    Then a contratação não é permitida e uma mensagem de erro é exibida

  @TestCaseKey=LPDC-T1364
  Scenario: Usuário não elegível não vê os banners de antecipação
    Given o usuário está logado no Portal do cliente
    And não é elegível para antecipação D0 ou D1
    Then os banners dos novos planos de recebimento não é exibido

  @TestCaseKey=LPDC-T1380
  Scenario: Usuário Possui plano Flex
    Given o usuário está logado no Portal do cliente
    And possui plano Flex
    Then não visualizara os banners

  # Extrato Recebimentos Pagos
  @TestCaseKey=LPDC-T1397
  Scenario: Unificar sub abas na aba Recebimentos Pagos
    Given usuário está na aba "Recebimentos Pagos"
    When as sub abas "Meus Domicílios" e "Valores Cedidos" forem unificadas
    Then todas as informações devem estar concentradas na mesma aba "Recebimentos Pagos"

  @TestCaseKey=LPDC-T1382
  Scenario: Remover opção de personalizar colunas
    Given usuário está na aba "Recebimentos Pagos"
    When procurar pela opção "Personalizar colunas"
    Then a opção "Personalizar colunas" não deve estar disponível

  @TestCaseKey=LPDC-T1396
  Scenario Outline: Adicionar coluna "Contratos" na aba Recebimentos Pagos
    Given usuário está na aba "Recebimentos Pagos"
    When houver um pagamento <tipo_pagamento>
    Then a coluna "Contratos" deve exibir <resultado>
    Examples:
      | tipo_pagamento                 | resultado |
      | atrelado a cessão              | Cessao    |
      | atrelado a gravame             | Gravame   |
      | não atrelado a nenhum contrato | -         |

  @TestCaseKey=LPDC-T1358
  Scenario: Exibir "Sem recebimentos" quando não houver transações
    Given usuário filtra por um período sem transações
    When os resultados são carregados
    Then a mensagem "Sem recebimentos" deve ser exibida

  @TestCaseKey=LPDC-T1394
  Scenario: Visualizando os totalizadores
    Given usuário está na Aba Recebimentos Pagos
    When visualizara os totalizadores diários
    Then totalizador "Total cedido" deve estar presente

  @TestCaseKey=LPDC-T1390
  Scenario Outline: Aplicar filtros na aba Recebimentos Pagos
    Given usuário está na aba "Recebimentos Pagos"
    When aplicar os filtros:
      | Filtro    | Valor    |
      | <filtro1> | <valor1> |
      | <filtro2> | <valor2> |
    And Clicando em "Mostrar resultados"
    Then os resultados devem refletir os filtros aplicados
    Examples:
      | filtro1 | valor1     | filtro2 | valor2    |
      | Data    | 01/01/2024 | Status  | Pago      |
      | Tipo    | Cessão     | Aliança | Aliança A |

  @TestCaseKey=LPDC-T1395
  Scenario: Limpar todos os filtros aplicados
    Given usuário aplicou vários filtros na aba "Recebimentos Pagos"
    When clicar em "Limpar filtros"
    Then todos os filtros devem estar desmarcados

  @TestCaseKey=LPDC-T1402
  Scenario: Remover filtro individual a partir do resumo
    Given usuário abriu o modal de filtros com filtros aplicados
    When clicar no "x" de um filtro específico
    And clicar em "Mostrar resultados"
    Then filtro específico deve ser removido dos resultados

  @TestCaseKey=LPDC-T1367
  Scenario: Visualizar detalhes do pagamento com novo card
    Given usuário está na aba "Recebimentos Pagos"
    And seleciona um pagamento específico
    When aba "Detalhe do Pagamento" for exibida
    Then novo card "Detalhes do recebimento" deve ser apresentado
    And os cards "Pagamento" e "Domicílio Bancário" não devem estar presentes

  @TestCaseKey=LPDC-T1399
  Scenario: Exibir mensagem no histórico das vendas pagas
    Given usuário está visualizando o "Histórico das vendas pagas"
    When não houver histórico para o lote selecionado
    Then a mensagem "Veja abaixo as vendas pagas neste lote, já com o desconto de MDR aplicado em cada uma. Se houver desconto de antecipação, o valor aparecerá no topo em 'Detalhes de recebimento'." deve ser exibida

  @TestCaseKey=LPDC-T1401
  Scenario Outline: Arquivo Excel Com novas colunas
    Given usuario extraiu um arquivo Excel
    When abrir o arquivo em sua maquina
    Then as antigas "<coluna_antiga>" não devem existir
    And as novas colunas devem ser "<coluna_nova>"
    Examples:
      | coluna_antiga          | coluna_nova      |
      | Valor bruto da parcela | Bruto da parcela |
      | Valor líquido          | Líquido da venda |
      | Taxa                   | Desconto MDR     |

  @TestCaseKey=LPDC-T1375
  Scenario Outline: Arquivo CSV Com novas colunas
    Given usuario extraiu um arquivo CSV
    When abrir o arquivo em sua maquina
    Then as antigas "<coluna_antiga>" não devem existir
    And as novas colunas devem ser "<coluna_nova>"
    Examples:
      | coluna_antiga          | coluna_nova      |
      | Valor bruto da parcela | Bruto da parcela |
      | Valor líquido          | Líquido da venda |
      | Taxa                   | Desconto MDR     |

  @TestCaseKey=LPDC-T1372
  Scenario Outline: Verificar tooltips das colunas nas vendas pagas
    Given usuário está visualizando a coluna "<coluna>"
    When passar o mouse sobre o campo
    Then tooltip deve exibir "<tooltip_text>"
    Examples:
      | coluna           | tooltip_text                                            |
      | Parcela          | Referência da parcela paga x total de parcelas da venda |
      | Bruto da parcela | Valor bruto da parcela paga                             |
      | Líquido da venda | Valor líquido da parcela paga                           |

  @TestCaseKey=LPDC-T1370
  Scenario: Verificar coloração destacada dos filtros ao serem clicados
    Given usuário está na aba "Recebimentos Pagos"
    When usuário clicar em um filtro específico
    Then o filtro deve ficar com a coloração destacada de acordo com a aliança selecionada

  @TestCaseKey=LPDC-T1365
  Scenario: Verificar fechamento padrão dos accordions nos filtros
    Given usuário está na aba "Recebimentos Pagos"
    When os filtros são exibidos
    Then todos os accordions de filtros devem estar fechados por padrão

  @TestCaseKey=LPDC-T1389
  Scenario: Verificar aplicação de filtros através de botões
    Given usuário está na aba "Recebimentos Pagos"
    When usuário clicar nos botões de filtros
    Then os filtros devem ser aplicados conforme a seleção

  @TestCaseKey=LPDC-T1377
  Scenario Outline: Verificar visibilidade das colunas "Contratos"
    Given usuário está na aba "Recebimentos Pagos"
    When a coluna "Contratos" estiver visível
    And tiver algum pagamento atrelado a algum contrato de Cessao ou Gravame
    Then deve exibir "<conteúdo>"
    Examples:
      | conteúdo |
      | Cessão   |
      | Gravame  |
      | -        |

  @TestCaseKey=LPDC-T1385
  Scenario: Verificar ausência de colunas personalizadas após remover "Personalizar colunas"
    Given usuário está na aba "Recebimentos Pagos"
    When  acessar as opções de colunas
    Then apenas as colunas padrão devem estar disponíveis

  @TestCaseKey=LPDC-T1384
  Scenario: Validar exportação com coloração padrão das alianças
    Given usuário está exportando os dados na aba "Recebimentos Pagos"
    When escolher exportar por Excel ou CSV
    Then as colunas devem seguir a cor padrão da respectiva aliança no arquivo exportado

  @TestCaseKey=LPDC-T1393
  Scenario: Verificar mensagem "Sem recebimentos" para dias sem transações
    Given usuário está filtrando por um dia sem transações
    When os resultados são carregados na aba "Recebimentos Pagos"
    Then a mensagem "Sem recebimentos" deve ser exibida na tela

  @TestCaseKey=LPDC-T1363
  Scenario Outline: Validar totalizadores diários incluindo "Total cedido"
    Given usuário está na aba "Recebimentos Pagos"
    When visualizara os totalizadores diários
    Then totalizador "<totalizador>" deve estar presente
    Examples:
      | totalizador    |
      | Total cedido   |
      | Total recebido |
      | Total pago     |

  @TestCaseKey=LPDC-T1400
  Scenario: Verificar presença do resumo de filtros aplicados no modal
    Given usuário aplicou vários filtros na aba "Recebimentos Pagos"
    When abrir o modal de filtros novamente
    Then modal deve exibir um resumo com os filtros aplicados

  @TestCaseKey=LPDC-T1403
  Scenario Outline: Remoção de filtros através do resumo no modal
    Given o usuário aplicou os filtros:
      | Filtro   | Valor   |
      | <filtro> | <valor> |
    And usuário abriu o modal de filtros novamente
    When clicar no "x" do filtro "<filtro>"
    And clicar em "Mostrar resultados"
    Then o filtro "<filtro>" não deve estar aplicado nos resultados
    Examples:
      | filtro  | valor     |
      | Aliança | Aliança A |
      | Status  | Pago      |

