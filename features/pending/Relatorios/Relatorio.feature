#language: en
@playwright
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Relatorios/Relatorios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Pending=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Relatorios

  # TODO: fix all scenarios when we have data-testid for side menu
  @TestCaseKey=LPDC-T13
  Scenario: O menu expande quando o usuário passa o mouse
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When Usuário passa o mouse sobre "Menu Lateral - Relatórios"
    Then O menu lateral expandiu contendo "Relatórios"

  @TestCaseKey=LPDC-T14
  Scenario: O usuário acessa a página de relatórios pelo menu lateral
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário não está na página de Relatórios
    When Usuário acessa página de Relatórios através do menu lateral
    Then será direcionado para a jornada de Relatórios

  @TestCaseKey=LPDC-T391
  Scenario Outline: Rodapé de Relatórios
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=LPDC-T289
  Scenario: Visualização de mensagem informativa
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    Then Usuário verá em "Relatórios - Texto Descritivo" o valor
      | Caso já tenha gerado um relatório, aguarde o processamento de até 1 dia para o mesmo ser exibido para baixar na tabela. |

  @TestCaseKey=LPDC-T346
  Scenario Outline: Colunas dos relatórios na tela inicial
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos
    Then Usuário visualizará as <colunas> na tabela
    @pt-br
    Examples:
      | colunas                                                                    |
      | Nome Do Arquivo, Documento/EC, Tipo do Arq, Solicitado em, Período, Baixar |

  #  Por motivos de performance do teste, o passo "Usuário visualizará a listagem do relatório com valores corretos"
  #  aplica as seguintes validações:
  #  - Usuário visualizará o nome do relatório sendo NOMEALIANÇA_TipoDoArquivo_dd-mm-yyyy_dd-mm-yyyy
  #  - Usuário visualizará a coluna Documento/EC contendo o documento CNPJ, CPF ou EC
  #  - Usuário visualizará a coluna Tipo de Arquivo contendo Vendas ou Pagamentos
  #  - Usuário visualizará a coluna Solicitado Em contendo a data no formato dia/mês/ano
  #  - Usuário visualizará a coluna Período contendo a data de início no formato dia/mês/ano e a data de final no formato dia/mês/ano
  @api
  @TestCaseKey=LPDC-T29
  Scenario: Colunas nome do arquivo
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos
    Then Usuário visualizará a listagem do relatório com valores corretos

  @TestCaseKey=LPDC-T33
  Scenario: Coluna baixar
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos disponíveis para download
    Then botão download possui ícone com seta para baixo

  @TestCaseKey=LPDC-T25
  Scenario: Fazer download do arquivo de relatório
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos disponíveis para download
    When tenta baixar o primeiro relatório ao clicar no ícone de download
    Then o download do relatório começará
    And o nome do arquivo baixado seguirá o da listagem (primeiro relatório da lista)

  #==>
  @TestCaseKey=LPDC-T12
  Scenario: Componente Período não deve permitir mais que 12 meses
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário clica no "Select Período" em "Modal Gerar Relatórios"
    And usuário seleciona um período maior que um ano e tenta gerar o relatório
    Then Usuário verá em "Relatórios - Notificação de Falha" o texto
      | O intervalo da seleção deve ser menor ou igual a 12 meses |

  @TestCaseKey=LPDC-T357
  Scenario: Componente Período permite data anterior a data de hoje
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"

  @TestCaseKey=LPDC-T23
  Scenario: Validar rótulos dos campos na geração de relatórios
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then Usuário verá em "Modal Gerar Relatórios - Título" o valor "Gerar relatório"
    And Usuário verá em "Modal Gerar Relatórios - Descrição" o texto
      | Solicite relatórios com informações de vendas ou pagamentos, ajuste o período conforme suas preferências. |
    And Usuário verá em "Modal Gerar Relatórios - Select EC Label" o rótulo "Estabelecimento comercial (EC)"
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Label" o rótulo "Tipo de relatório"
    And Usuário verá em "Modal Gerar Relatórios - Select Período Label" o rótulo "Período"
    And Usuário verá em "Modal Gerar Relatórios - Select Formato Arquivo Label" o rótulo "Formato do arquivo"
    And Usuário verá em "Modal Gerar Relatórios - Título Informativo" o texto "Tipo de entrega"
    And Usuário verá em "Modal Gerar Relatórios - Valor Informativo" o texto "Portal do cliente"
    And Usuário verá em "Modal Gerar Relatórios - Mensagem sobre prazo" o texto
      | O relatório leva até 24 horas para ser exibido para download. |

  @TestCaseKey=LPDC-T353
  Scenario Outline: Validar botões de fechar tela Gerar Relatórios
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given usuário clica no "Botão Gerar Relatório" em "Relatórios"
    When usuário clica no <botão_cancelar>
    Then "Modal Gerar Relatórios" não mais estará visível
    Examples:
      | botão_cancelar                                 |
      | "Ícone Fechar (X)" em "Modal Gerar Relatórios" |
      | "Botão Cancelar" em "Modal Gerar Relatórios"   |

  @api
  @TestCaseKey=LPDC-T30
  Scenario: Validar campos na geração de relatórios
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then usuário visualizará o modal de geração de relatórios contendo nome do cliente, junto de seu CPF ou CNPJ
    And usuário visualizará opção para selecionar um EC ou "Todos os estabelecimentos"
    And "Todos os estabelecimentos" estará selecionado por padrão, caso haja mais de um
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Opções" as opções Pagamentos, Vendas
    And Usuário verá em "Modal Gerar Relatórios - Select Formato Arquivo Opções" as opções .XLSX (Excel), .CSV

  @api
  @TestCaseKey=LPDC-T448
  Scenario: Validar Cliente com Apenas 1 Estabelecimento Comercial Vinculado
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then usuário verá no campo Estabelecimento Comercial o número deste único estabelecimento já selecionado

  @api
  @TestCaseKey=LPDC-T443
  Scenario: Validar Cliente com 2 ou Mais Estabelecimentos Comerciais Vinculados
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given usuário possui mais que um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário clica no "Campo Select EC" no "Modal Gerar Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções de EC disponíveis

  @api
  @TestCaseKey=LPDC-T389
  Scenario Outline: Gerar Relatório Cliente com Apenas Um Estabelecimento Comercial Vinculado e Tipo de Relatório de Vendas
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário verifica que este Estabelecimento Comercial está selecionado
    And usuário seleciona o tipo de relatório como "<tipo>"
    And usuário seleciona o formato de arquivo como "<formatoArquivo>"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"
    And usuário verá uma nova linha na listagem de relatórios com o novo relatório solicitado e o ícone relógio na coluna baixar
    Examples:
      | formatoArquivo | tipo       |
      | .csv           | vendas     |
      | .csv           | pagamentos |
      | .xlsx-(excel)  | vendas     |

  @api
  @TestCaseKey=LPDC-T21
  Scenario Outline: Gerar Relatório em arquivo CSV Cliente com Mais que Um Estabelecimento Comercial Vinculado
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given usuário possui mais que um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário seleciona algum de seus Estabelecimentos Comerciais
    And usuário seleciona o tipo de relatório como "<tipo>"
    And usuário seleciona o formato de arquivo como "<formatoArquivo>"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"
    And usuário verá uma nova linha na listagem de relatórios com o novo relatório solicitado e o ícone relógio na coluna baixar
    Examples:
      | formatoArquivo | tipo       |
      | .csv           | pagamentos |
      | .csv           | vendas     |
      | .xlsx-(excel)  | vendas     |

  # TODO: não possível no momento @rebatedor
  #  43.    Cenário: Validar mensagem de erro Sistema Indisponível
  #  Dado que o usuário está logado no Merchant Portal
  #  E o usuário está no modal Relatórios
  #  E o usuário preencheu todos os campos obrigatórios
  #  Quando o usuário clica no botão Gerar Relatórios
  #  E o sistema está indisponível
  #  Então usuário visualizará o popup de erro com a mensagem “Sua solicitação não foi concluída! Refaça a solicitação do seu relatório”, e os botões “Fechar” e “X”
  #==>
  @TestCaseKey=LPDC-T11
  Scenario: Opções de Filtros Disponíveis
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Filtros" em "Relatórios"
    And usuário clica no "Accordion Tipos de Arquivo" em "Filtros de relatório"
    And usuário clica no "Accordion Período" em "Filtros de relatório"
    And usuário clica no "Accordion Documentos" em "Filtros de relatório"
    Then usuário verá no filtro "Filtros de relatório - Item Tipos de Arquivo" as opções Vendas, Pagamentos
    And usuário visualizará em "Filtros de relatório" o "Item Período"
    And usuário verá no filtro um ou mais documentos

  @api
  @TestCaseKey=LPDC-T15
  Scenario: Opções de Filtros Exibem Todos os documentos
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Filtros" em "Relatórios"
    And usuário clica no "Accordion Documentos" em "Filtros de relatório"
    And usuário verá no filtro todos os seus documentos

  @TestCaseKey=LPDC-T307
  Scenario Outline: Filtro por tipo de relatório
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios já extraídos do tipo "<tipo>", no formato "<formatoDeArquivo>", disponíveis para download
    When usuário clica no "Botão Filtros" em "Relatórios"
    And Usuário filtra por "<tipo>" nos "Filtros de relatório" de "Tipos de Arquivo"
    Then serão filtrados apenas os relatórios do tipo "<tipo>"
    Examples:
      | tipo       | formatoDeArquivo |
      | Vendas     | .csv             |
      | Pagamentos | .csv             |

  @TestCaseKey=LPDC-T378
  Scenario: Filtro de relatório por data
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios extraídos em datas diferentes
    When usuário clica no "Botão Filtros" em "Relatórios"
    And usuário filtra por uma data
    Then serão exibidos apenas relatórios extraídos da mesma data

  @TestCaseKey=LPDC-T19
  Scenario: Limpar filtros
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios de vendas e pagamentos extraídos
    And usuário clicou no "Botão Filtros" em "Relatórios"
    And Usuário filtrou por "Vendas" nos "Filtros de relatório" de "Tipos de Arquivo"
    When usuário limpa os filtros de relatório
    Then Usuário voltará a visualizar ambos relatórios de vendas e pagamentos

  #==>>
  @TestCaseKey=LPDC-T6
  Scenario: Relatório Arquivo em CSV contém Transações Parceladas
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios já extraídos do tipo "Vendas", no formato ".csv", disponíveis para download
    When Usuário baixa um relatório do tipo "Vendas", formato ".csv"
    Then Usuário visualizará no arquivo baixado a coluna "Parcelas", contendo as parcelas das vendas

  @api
  @TestCaseKey=LPDC-T24
  Scenario Outline: Validar Arquivo de Relatório de Vendas
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios já extraídos do tipo "Vendas", no formato "<arquivo>", disponíveis para download
    When Usuário baixa um relatório do tipo "Vendas", formato "<arquivo>"
    Then Usuário visualizará no "<arquivo>" baixado, as colunas
    """
    Data da venda, Hora da venda, Código de autorização, Código de estabelecimento, Comprovante de venda,
    Código do pedido, Canal, Número do Terminal, Produto, Parcelas, Tipo de cartão, Bandeira, Status,
    Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação,
    Número do cartão, Cartão pré pago, Data prevista de pagamento da venda, Status do pagamento da venda,
    Data efetiva do pagamento da venda, Código de pagamento, Cód. Ref. Cartão
    """
    Examples:
      | arquivo |
      | .csv    |
      | .xlsx   |

  @api
  @TestCaseKey=LPDC-T380
  Scenario Outline: Validar Arquivo de Relatório de Pagamentos
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios já extraídos do tipo "Pagamentos", no formato "<arquivo>", disponíveis para download
    When Usuário baixa um relatório do tipo "Pagamentos", formato "<arquivo>"
    Then Usuário visualizará no "<arquivo>" baixado, as colunas
    """
    Data de pagamento, Código de pagamento, Tipo de pagamento, Data da venda, Hora da venda, Número do estabelecimento,
    Código de autorização, Comprovante da venda, Código do pedido, Canal, Número do terminal, Produto, Parcelas,
    Tipo de Cartão, Bandeira, Status da venda, Valor bruto da transação, Valor bruto da parcela paga,
    Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Banco, Agência, Conta
    """
    Examples:
      | arquivo |
      | .csv    |
      | .xlsx   |

  @TestCaseKey=LPDC-T387
  Scenario Outline: Colunas do excel possuem formatações corretas
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios
    Given Existem relatórios já extraídos do tipo "<tipo>", no formato ".xlsx", disponíveis para download
    When Usuário baixa um relatório do tipo "<tipo>", formato ".xlsx"
    Then Os valores das colunas do excel baixado terão mesma formatação
    Examples:
      | tipo       |
      | Pagamentos |
      | Vendas     |

  @TestCaseKey=LPDC-T16
  Scenario: Valores tela Relatórios - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções de EC disponíveis

  @TestCaseKey=LPDC-T31
  Scenario: Valores tela Relatórios - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário terá apenas um EC disponível para seleção

