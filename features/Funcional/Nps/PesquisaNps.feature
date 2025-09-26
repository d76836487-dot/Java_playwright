#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nps/PesquisaNps
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: PesquisaNps

  @TestCaseKey=LPDC-T1609
  Scenario Outline: Apresentar perguntas NPS após diferentes eventos
    Given o usuário está elegível para NPS
    When ocorre o evento "<evento>"
    Then são apresentadas as perguntas 1 e 2 do NPS
    Examples:
      | evento                                                                    |
      | contratação de uma antecipação                                            |
      | exportação de PDF no menu vendas > histórico de vendas > detalhe da venda |
      | exportação de PDF no menu Recebimentos > pagos > detalhe do pagamento     |
      | solicitação de relatório na aba Relatórios                                |
      | exportação de Excel no menu Vendas > hoje                                 |
      | exportação de Excel no menu Vendas > histórico de vendas                  |
      | exportação de Excel no menu Recebimentos > Pagos                          |
      | consulta na FAQ/Suporte através do Menu Ajuda                             |
      | abertura de chamados através do menu Solicitações                         |
      | clique em sair do Portal                                                  |

  @TestCaseKey=LPDC-T1615
  Scenario Outline: Não apresentar perguntas NPS quando o usuário não é elegível
    Given o usuário não está elegível para NPS
    When ocorre qualquer evento "<evento>"
    Then as perguntas do NPS não são apresentadas
    Examples:
      | evento                                                                    |
      | contratação de uma antecipação                                            |
      | exportação de PDF no menu vendas > histórico de vendas > detalhe da venda |
      | exportação de PDF no menu Recebimentos > pagos > detalhe do pagamento     |
      | solicitação de relatório na aba Relatório                                 |
      | exportação de Excel no menu Vendas > hoje                                 |
      | exportação de Excel no menu Vendas > histórico de vendas                  |
      | exportação de Excel no menu Recebimentos > Pagos                          |
      | consulta na FAQ/Suporte através do Menu Ajuda                             |
      | abertura de chamados através do menu Solicitações                         |
      | clique em sair do Portal                                                  |

  @TestCaseKey=LPDC-T1616
  Scenario Outline: Gerar relatório de NPS com filtro de canais
    Given acesso plataforma de relatórios de NPS
    When clico em "Gerar Relatório"
    And seleciono o canal "<Canal>"
    Then o relatório deve conter apenas dados do canal "<Canal>"
    Examples:
      | Canal  |
      | App    |
      | Portal |
      | Ambos  |

  @TestCaseKey=LPDC-T1610
  Scenario Outline: Verificar estrutura do relatório de NPS exportado
    Given exporto o relatório de NPS para "<Canal>"
    When abro o arquivo Excel gerado
    Then a primeira aba deve conter as colunas:
      | Canal             |
      | Aliança           |
      | Data de resposta  |
      | CNPJ              |
      | Documento         |
      | Referência        |
      | Nota              |
      | Evento            |
      | Comentário        |
      | Perfil do Cliente |
    Examples:
      | Canal  |
      | App    |
      | Portal |
      | Ambos  |

  @TestCaseKey=LPDC-T1618
  Scenario: Dados de NPS para aba 2 do Excel
    Given exporto o relatório de NPS
    When abro a segunda aba do Excel
    Then a aba deve conter as colunas:
      | Pergunta                |
      | Promotores              |
      | Neutros                 |
      | Detratores              |
      | Quantidade de Respostas |
      | NPS                     |
    And os dados devem ser apresentados corretamente conforme as regras

  @TestCaseKey=LPDC-T1614
  Scenario: Verificar NPS calculado corretamente
    Given exporto o relatório de NPS
    When calculo o NPS na aba 2
    Then o valor de NPS deve ser a subtração das porcentagens de promotores e detratores

  @TestCaseKey=LPDC-T1619
  Scenario: Exportar relatório de NPS para análise futura
    Given acesso plataforma de exportação de NPS
    When configuro os filtros e solicito a exportação
    Then o sistema deve salvar o relatório exportado para análise futura

  @TestCaseKey=LPDC-T1612
  Scenario: Verificar formatação correta das datas no relatório de NPS
    Given exporto o relatório de NPS
    When reviso a coluna "Data de resposta"
    Then todas as datas devem estar no formato "AAAA-MM-DD"

  @TestCaseKey=LPDC-T1620
  Scenario: Verificar a soma correta das respostas na aba 2
    Given exporto o relatório de NPS
    When calculo a "Quantidade de Respostas" na aba 2
    Then a soma deve ser igual ao total de respostas registradas

  @TestCaseKey=LPDC-T1617
  Scenario: Validar que todas as perguntas estão presentes na aba 2
    Given exporto o relatório de NPS
    When reviso a coluna "Pergunta" na aba 2
    Then devem existir "pergunta 1" e "pergunta 2"

  @TestCaseKey=LPDC-T1622
  Scenario: Validar ausência de dados quando não há respostas de NPS
    Given acesso plataforma de exportação de NPS
    When não há respostas de NPS registradas
    And solicito a exportação
    Then o relatório deve estar vazio ou conter uma mensagem informando ausência de dados

  @TestCaseKey=LPDC-T1621
  Scenario: Confirmar que o relatório exportado está no formato correto
    Given acesso plataforma de exportação de NPS
    When solicito a exportação dos dados de NPS
    Then o arquivo gerado deve estar no formato Excel (.xlsx)s

  @TestCaseKey=LPDC-T1625
  Scenario: Exportar relatório de NPS com múltiplas datas de resposta
    Given acesso plataforma de exportação de NPS
    When seleciono um intervalo de datas para "Data de resposta"
    And solicito a exportação
    Then o relatório deve conter apenas os dados dentro do intervalo de datas selecionado

  @TestCaseKey=LPDC-T1607
  Scenario: Validar que a coluna "Referência" mostra o número correto da pergunta
    Given acesso plataforma de exportação de NPS
    When exporto o relatório
    Then a coluna "Referência" deve indicar corretamente qual pergunta foi respondida (1 ou 2)

  @TestCaseKey=LPDC-T1624
  Scenario: Verificar que a exportação de NPS lida corretamente com caracteres especiais nos comentários
    Given acesso plataforma de exportação de NPS
    When exporto o relatório com comentários que contêm caracteres especiais
    Then os comentários devem ser exibidos corretamente no relatório

  @TestCaseKey=LPDC-T1611
  Scenario: Verificar que o relatório de NPS pode ser baixado múltiplas vezes sem erros
    Given acesso plataforma de exportação de NPS
    When exporto o relatório de NPS
    And realizo uma nova exportação imediatamente
    Then ambas as exportações devem ser concluídas com sucesso

  @TestCaseKey=LPDC-T1605
  Scenario: Verificar que o relatório de NPS está disponível para download após a geração
    Given acesso plataforma de exportação de NPS
    When exporto o relatório
    Then o link para download do relatório deve estar disponível imediatamente após a geração

  @TestCaseKey=LPDC-T1608
  Scenario: Garantir que o sistema mantém histórico das exportações de NPS
    Given acesso plataforma de exportação de NPS
    When exporto múltiplos relatórios
    Then o sistema deve manter um histórico com detalhes de todas as exportações realizadas

  @TestCaseKey=LPDC-T1606
  Scenario Outline: Garantir que o relatório de NPS pode ser filtrado por tipo de resposta
    Given acesso plataforma de exportação de NPS
    When seleciono o filtro por tipo de resposta "<TipoResposta>"
    And solicito a exportação
    Then o relatório deve conter apenas os dados do tipo de resposta "<TipoResposta>"
    Examples:
      | TipoResposta |
      | Promotor     |
      | Neutro       |
      | Detrator     |

  @TestCaseKey=LPDC-T1613
  Scenario Outline: Verificar que o relatório de NPS pode ser filtrado por aliança específica
    Given acesso plataforma de exportação de NPS
    When seleciono a aliança "<Aliança>"
    And solicito a exportação
    Then o relatório deve conter apenas os dados da aliança "<Aliança>"
    Examples:
      | Aliança |
      | Bin     |
      | Caixa   |
      | Afinz   |
      | Sicredi |

  @TestCaseKey=LPDC-T1623
  Scenario: Validar que o relatório de NPS pode ser visualizado antes do download
    Given acesso plataforma de exportação de NPS
    When solicito a exportação do relatório
    Then o sistema deve permitir visualizar uma prévia do relatório antes do download

