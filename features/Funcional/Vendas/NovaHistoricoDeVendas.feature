#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/NovaHistoricoDeVendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: NovaHistoricoDeVendas


Scenario Outline: Exibir ou não a aba Histórico de vendas para diferentes tipos de usuário
    Given o usuário é do tipo "<tipo_usuario>"
    When o usuário verifica a presença da aba Histórico de vendas
    Then a aba Histórico de vendas <status>

    Examples:
      | tipo_usuario | status           |
      | Comum      | é exibida        |
      | franqueado    | não é exibida    |
      | franqueador   | não é exibida    |

Scenario: Exibir totalizadores por tipo de transação
    Given acesso a aba Histórico de vendas
    When visualiza os totalizadores de transação
    Then são exibidos os seguintes totalizadores:
      | Tipo de Transação        |
      | Total de vendas bruto    |
      | Total Pix                |
      | Total Voucher            |
      | Total não efetivados     |

Scenario: Verificar posição dos botões Filtrar e Período
    Given acesso a aba Histórico de vendas
    When visualiza os botões da aba
    Then os botões "Filtrar" e "Período" estão no topo da aba

Scenario: Exibir totalizadores por bandeira
    Given acesso a aba Histórico de vendas
    When visualiza os totalizadores por bandeira
    Then são exibidos os totalizadores por bandeira conforme as transações

Scenario: Abrir modal de totalizadores por bandeira e modalidade de pagamento
    Given acesso a aba Histórico de vendas
    When o usuário clica em "Ver tudo em totais por bandeira"
    Then é exibido um modal com as seguintes opções:
      | Opção                           |
      | Totalizadores por bandeira      |
      | Totalizadores por modalidade de pagamento |

Scenario: Buscar transações pelo código de autorização Valido
    Given acesso a aba Histórico de vendas
    When o usuário utiliza o campo "Buscar" com o código de autorização "123456"
    Then são exibidas as transações correspondentes ao código "123456"

Scenario: Buscar transações pelo código de autorização Invalido
    Given acesso a aba Histórico de vendas
    When o usuário utiliza o campo "Buscar" com o código de autorização "000000"
    Then é exibida uma mensagem de "Nenhuma transação encontrada"

Scenario: Exibir sumarizações por dia com informações completas
    Given acesso a aba Histórico de vendas
    When visualiza as sumarizações de dias
    Then cada sumarização exibe as seguintes informações:
      | Informação          |
      | Dia da semana      |
      | Dia data           |
      | Total de vendas    |
      | Valor bruto        |
      | Total Pix          |
      | Total Voucher      |
      | Total cancelado    |

Scenario: Expandir sumarização para visualizar transações do dia
    Given acesso a aba Histórico de vendas
    When o usuário clica em uma linha de sumarização de dia
    Then são exibidas as transações referentes a esse dia

Scenario: Exibir experiência vazia quando não há transações no período filtrado
    Given acesso a aba Histórico de vendas
    When o usuário filtra por um período sem transações
    Then é exibida a experiência vazia conforme o Figma

Scenario: Exibir colunas corretas na listagem de vendas
    Given acesso a aba Histórico de vendas
    When visualiza a listagem de vendas
    Then as colunas exibidas são:
      | Coluna               |
      | Horário              |
      | Bandeira             |
      | Modalidade           |
      | Código de retorno    |
      | Valor bruto          |
      | Status               |

Scenario: Verificar status das transações com cores corretas
    Given acesso a aba Histórico de vendas
    When visualiza o status das transações
    Then os status são exibidos com as cores conforme o Figma

Scenario: Verificar estado inicial dos filtros na aba Histórico de vendas
    Given acesso a aba Histórico de vendas
    Then visualizara os filtros que devem estar fechados por padrão

Scenario: Abrir accordion de filtro
    Given acesso a aba Histórico de vendas
    When clico no accordion "Modalidade"
    Then o accordion "Modalidade" deve-ra abrir

Scenario Outline: Selecionar filtros na aba Histórico de vendas
    Given acesso a aba Histórico de vendas
    When seleciono um dos filtros "<Filtro>"
    And aplico o filtro
    Then filtro "<Filtro>" deve estar destacado com a cor da Instituicao

    Examples:
      | Filtro                 |
      | Modalidade             |
      | Status                 |
      | Bandeira               |
      | Estabelecimento        |
      | Método de captura      |
      | Terminal               |
      | Código de autorização  |

Scenario: Selecionar múltiplos filtros e aplicar
    Given acesso a aba Histórico de vendas
    When seleciono os filtros:
      | Filtro       |
      | Status       |
      | Bandeira     |
      | Terminal     |
    And clico em "Mostrar resultados"
    Then os resultados devem refletir os filtros aplicados

Scenario: Limpar filtros selecionados
    Given acesso a aba Histórico de vendas
    And anteriormente selecionei os filtros:
      | Filtro        | Valor      |
      | Status        | Concluído  |
      | Bandeira      | Visa       |
    When clico em "Limpar filtros"
    Then todos os filtros devem estar desmarcados

Scenario: Aplicar filtros e verificar resumo ao reabrir filtros
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro            | Valor  |
      | Modalidade        | Credito a Vista|
      | Método de captura | LNK   |
    And clico em "Mostrar resultados"
    When clico em "Filtros" novamente
    Then o resumo dos filtros aplicados deve ser exibido
    And cada filtro no resumo deve ter um "x" para remoção

Scenario: Remover filtro através do resumo e aplicar
    Given acesso a aba Histórico de vendas
    And selecionei os seguintes filtros:
      | Filtro     | Valor    |
      | Modalidade | Online   |
      | Status     | Pendente |
    And clico em "Mostrar resultados"
    And abro os filtros
    When clico no "x" do filtro "Status"
    And clico em "Mostrar resultados"
    Then o filtro "Status" deve ser removido dos resultados

Scenario: Buscar terminais ao abrir o filtro Terminal
    Given acesso a aba Histórico de vendas
    When clico no accordion "Terminal"
    Then os terminais devem ser carregados da API

Scenario: Digitar código de autorização
    Given acesso a aba Histórico de vendas
    When clico no accordion "Código de autorização"
    And digito o código "ABC123"
    Then o filtro "Código de autorização" deve estar preenchido com "ABC123"

Scenario: Verificar destaque de filtros conforme aliança
    Given acesso a aba Histórico de vendas
    When seleciono o filtro "Bandeira" com valor "Mastercard"
    Then o filtro com "Bandeira" MasterCard deve estar com destaque na cor da aliança

Scenario: Verificar fechamento de accordions após seleção
    Given acesso a aba Histórico de vendas
    When seleciono o filtro "Status"
    And seleciono o filtro "Bandeira"
    Then todos os accordions devem permanecer fechados após seleção

Scenario: Aplicar filtros sem selecionar opções
    Given acesso a aba Histórico de vendas
    When clico em "Mostrar resultados" sem selecionar filtros
    Then todos os resultados devem ser exibidos sem filtros aplicados

Scenario: Verificar comportamento do botão "Mostrar resultados" sem filtros
    Given acesso a aba Histórico de vendas
    When clico em "Mostrar resultados" sem selecionar nenhum filtro
    Then a listagem deve exibir todas as vendas sem aplicar nenhum filtro

Scenario: Verificar reset de filtros após limpar
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro           | Valor      |
      | Modalidade       | Online     |
      | Método de captura| NFC        |
    When clico em "Limpar filtros"
    Then todos os filtros devem estar desmarcados
    And a listagem deve exibir todas as vendas sem filtros

Scenario: Verificar persistência de filtros após atualização da página
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro    | Valor    |
      | Status    | Completo |
      | Bandeira  | MasterCard|
    When atualizo a página
    Then os filtros selecionados devem permanecer aplicados

Scenario: Verificar a funcionalidade do botão "Limpar filtros" após aplicar filtros
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro    | Valor    |
      | Status    | Pendente |
      | Terminal  | Terminal1|
    When clico em "Mostrar resultados"
    And clico em "Limpar filtros"
    Then todos os filtros devem estar desmarcados
    And a listagem deve exibir todas as vendas sem filtros

Scenario: Verificar exibição correta dos filtros aplicados no resumo
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro    | Valor    |
      | Status    | Completo |
      | Método de captura | NFC |
    And clico em "Mostrar resultados"
    When abro os filtros novamente
    Then o resumo deve exibir:
      | Filtro              | Valor  |
      | Status              | Completo|
      | Método de captura   | NFC     |

Scenario: Verificar remoção de um filtro específico através do resumo
    Given acesso a aba Histórico de vendas
    And selecionei os filtros:
      | Filtro    | Valor    |
      | Status    | Completo |
      | Bandeira  | Visa     |
    And clico em "Mostrar resultados"
    When abro os filtros novamente
    And clico no "x" do filtro "Bandeira"
    And clico em "Mostrar resultados"
    Then o filtro "Bandeira" deve estar desmarcado
    And a listagem deve refletir apenas o filtro "Status" aplicado

Scenario: Verificar comportamento dos filtros após múltiplas aplicações e remoções
    Given acesso a aba Histórico de vendas
    When seleciono os filtros:
      | Filtro    | Valor    |
      | Status    | Pendente |
      | Bandeira  | MasterCard|
    And clico em "Mostrar resultados"
    And abro os filtros novamente
    And clico no "x" do filtro "Status"
    And clico em "Mostrar resultados"
    Then o filtro "Status" deve estar removido
    And apenas o filtro "Bandeira" deve estar aplicado na listagem


Scenario: Visualizar detalhes de venda por modalidade de Débito
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de débito
    Then a nova tela deve apresentar as informações específicas para Débito:
        | Campo                          | Valor esperado               |
        | Data e horário                 | data e hora da transação      |
        | Valor bruto                    | valor bruto da venda          |
        | Bandeira                       | bandeira do cartão            |
        | Status                         | status da autorização         |
        | Modalidade                     | Débito                        |
        | Método de captura              | método de captura             |
        | Número do terminal             | número do terminal            |
        | Estabelecimento                | nome do estabelecimento        |
        | Número do cartão               | número mascarado do cartão    |
        | Cód. de autorização            | código de autorização         |
        | CV                             | CV do cartão                  |
        | Código de referência do cartão | código de referência          |
        | Valor líquido                  | valor líquido da transação    |
        | Previsão de pagamento em       | data prevista para pagamento  |
        | Valor da taxa (MDR)            | valor da taxa MDR             |
        | Pago em                        | data em que foi pago          |

Scenario Outline: Visualizar detalhes de venda com valores nulos ou zerados
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de <Modalidade>
    Then a nova tela deve apresentar "-" para os campos com valores <Valor>

    Examples:
        | Modalidade          | Valor        |
        | Débito              | nulos         |
        | Crédito emissor     | zerados       |
        | Voucher             | nulos         |
        | Pré-Aut             | zerados       |

Scenario: Cancelar venda a partir da tela de detalhes
    Given o usuário está visualizando os detalhes de uma venda credito a vista ou parcelado
    When clicar no botão "Cancelar venda"
    Then o usuário deve ser redirecionado para a jornada de cancelamento de vendas existente

Scenario: Visualizar detalhes de venda por modalidade de Crédito - Parcelado lojista
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de crédito parcelado lojista
    Then a nova tela deve apresentar as informações específicas para Crédito - Parcelado lojista:
        | Campo                          | Valor esperado                                 |
        | Data e horário                 | data e hora da transação                        |
        | Valor bruto                    | valor bruto da venda                            |
        | Número de parcelas             | número de parcelas                              |
        | Bandeira                       | bandeira do cartão                              |
        | Status                         | status da autorização                           |
        | Modalidade                     | Crédito                    |
        | Produto                        | Parcelado lojista                          |
        | Método de captura              | POS                               |
        | Número do terminal             | PGWE08E2                              |
        | Estabelecimento                | nome do estabelecimento                          |
        | Número do cartão               | número mascarado do cartão                      |
        | Cód. de autorização            | código de autorização                           |
        | CV                             | CV do cartão                                    |
        | Código de referência do cartão | código de referência                            |
        | Valor líquido                  | valor líquido da transação                      |
        | Previsão de pagamento em       | data prevista para pagamento                    |
        | Valor da taxa (MDR)            | valor da taxa MDR                               |
        | Tabela de pagamentos           | relação de pagamentos das parcelas               |

Scenario: Visualizar detalhes de venda por modalidade de Crédito - Parcelado emissor
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de crédito parcelado emissor
    Then a nova tela deve apresentar as informações específicas para Crédito - Parcelado emissor:
        | Campo                          | Valor esperado                                 |
        | Data e horário                 | data e hora da transação                        |
        | Valor bruto                    | valor bruto da venda                            |
        | Número de parcelas             | número de parcelas                              |
        | Bandeira                       | bandeira do cartão                              |
        | Status                         | status da autorização                           |
        | Modalidade                     | Crédito - Parcelado emissor                      |
        | Produto                        | produto da transação                            |
        | Método de captura              | método de captura                               |
        | Número do terminal             | número do terminal                              |
        | Estabelecimento                | nome do estabelecimento                          |
        | Número do cartão               | número mascarado do cartão                      |
        | Cód. de autorização            | código de autorização                           |
        | CV                             | CV do cartão                                    |
        | Código de referência do cartão | código de referência                            |
        | Valor líquido                  | valor líquido da transação                      |
        | Previsão de pagamento em       | data prevista para pagamento                    |
        | Valor da taxa (MDR)            | valor da taxa MDR                               |
        | Tabela de pagamentos           | relação de pagamentos das parcelas               |

Scenario: Visualizar detalhes de venda por modalidade de Voucher
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de voucher
    Then a nova tela deve apresentar as informações específicas para Voucher:
        | Campo                          | Valor esperado                                 |
        | Data e horário                 | data e hora da transação                        |
        | Valor                          | valor da transação                              |
        | Bandeira                       | bandeira do cartão                              |
        | Status da autorização          | status da autorização                           |
        | Modalidade                     | Voucher                                         |
        | Produto                        | Alimentacao                           |
        | Método de captura              | POS                               |
        | Número do terminal             | número do terminal                              |
        | Estabelecimento                | nome do estabelecimento                          |
        | Número do cartão               | número mascarado do cartão                      |
        | Cód de autorização             | código de autorização                           |
        | CV                             | CV do cartão                                    |
        | Código de referência do cartão | código de referência                            |

Scenario: Visualizar detalhes de venda por modalidade de Pré-Autorização
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de pré-autorização
    Then a nova tela deve apresentar as informações específicas para Pré-Autorização:
        | Campo                          | Valor esperado                                 |
        | Data e horário de captura       | data e hora da captura                          |
        | Data alvo da pré-autorização    | data alvo da pré-autorização                    |
        | Valor                          | valor da transação                              |
        | Valor confirmado                | valor confirmado da transação                   |
        | Data da confirmação             | data da confirmação                             |
        | Bandeira                       | bandeira do cartão                              |
        | Status da autorização          | status da autorização                           |
        | Produto                        | produto da transação                            |
        | Método de captura              | método de captura                               |
        | Número do terminal             | número do terminal                              |
        | Estabelecimento                | nome do estabelecimento                          |
        | Número do cartão               | número mascarado do cartão                      |
        | Cód de autorização             | código de autorização                           |
        | CV                             | CV do cartão                                    |
        | Código de referência do cartão | código de referência                            |

Scenario: Visualizar detalhes de venda por modalidade de Pix Van e Fiserv
    Given o usuário está na aba Histórico de vendas
    When clicar no detalhe de uma autorização de Pix Van e Fiserv
    Then a nova tela deve apresentar as informações específicas para Pix Van e Fiserv:
        | Campo                          | Valor esperado                                 |
        | Data e horário                 | data e hora da transação                        |
        | Valor                          | valor da transação                              |
        | Status da autorização          | status da autorização                           |
        | Modalidade                     | Pix Van e Fiserv                                |
        | Método de captura              | método de captura                               |
        | Cód de autorização             | código de autorização                           |
        | CV                             | CV do cartão                                    |
        | Recebimento (banco)            | banco de recebimento                            |
    And se o Pix for do próprio PSP Fiserv
    Then deve exibir um botão "Consultar detalhes da chave" que redireciona para a aba "Conta Pix" |

Scenario: Verificar redirecionamento ao clicar no botão "Consultar detalhes da chave" para Pix Fiserv
    Given o usuário está visualizando os detalhes de uma transação Pix Fiserv
    When clicar no botão "Consultar detalhes da chave"
    Then o usuário deve ser redirecionado para a aba "Conta Pix"

Scenario: Validar tabela de pagamentos para Crédito - Parcelado emissor
    Given o usuário está visualizando os detalhes de uma venda de Crédito - Parcelado emissor ou Parcelado Lojista
    Then a tabela de pagamentos deve exibir corretamente:
        | Número da parcela | Valor líquido | Previsão de pagamento em | Pago em | Código de pagamento | Status |
        | 1                  | valor1        | data1                      | data pago1 | código1             | status1 |
        | 2                  | valor2        | data2                      | data pago2 | código2             | status2 |
        | ...                | ...           | ...                        | ...       | ...                 | ...     |

Scenario: Exportar comprovante de venda em PDF na aba Histórico de vendas
    Given Cliente acessa a aba "Histórico de vendas"
    When solicita a exportação do comprovante de venda em PDF
    Then PDF deve ser gerado com sucesso

Scenario Outline: Verificar informações comprovante de venda em PDF
    Given que realizei uma exportação de comprovante de venda
    When abro o PDF gerado
    Then PDF deve conter <Elemento> <Informação> <Tipo de Transação>

    Examples:
      | Elemento          | Informação                          | Tipo de Transação |
      | Logo da Aliança   | Presente                            | Débito             |
      | Data e hora       | Data e hora da exportação           | Crédito – Parcelado Lojista |
      | CNPJ              | CNPJ da empresa                     | Crédito – Parcelado Emissor |
      | EC da transação   | Código da transação                 | Pré-autorização |

Scenario: Exportar comprovante de venda parcelado lojista com detalhes dos pagamentos
    Given que exista uma transação "Crédito – Parcelado Lojista" com os seguintes pagamentos
      | Parcela | Valor    | Data de Vencimento |
      | 1       | R$100,00 | 2024-05-01         |
      | 2       | R$100,00 | 2024-06-01         |
      | 3       | R$100,00 | 2024-07-01         |
    When exporto o comprovante de venda em PDF
    Then o comprovante deve listar todas as parcelas com seus respectivos valores e datas

Scenario Outline: Validar exportação de comprovantes para diferentes bandeiras Van
    Given que exista uma transação da bandeira Van "<Bandeira>"
    When exporto o comprovante de venda em PDF
    Then o comprovante deve exibir a bandeira "<Bandeira>" corretamente

    Examples:
      | Bandeira  |
      | Banrisul  |
      | Itaucard  |
      | Visa      |
      | MasterCard|

Scenario: Exportar comprovante de pré-autorização em PDF
    Given que realizei uma pré-autorização na plataforma
    When exporto o comprovante de pré-autorização em PDF
    Then o comprovante deve conter todas as informações pertinentes à pré-autorização

Scenario: Exportar comprovante de voucher em PDF
    Given que utilizei um voucher para uma transação
    When exporto o comprovante de venda em PDF
    Then o comprovante deve incluir os detalhes do voucher utilizado

Scenario: Exportar comprovante de Pix Fiserv em PDF
    Given que realizei uma transação através do Pix Fiserv
    When exporto o comprovante de venda em PDF
    Then o comprovante deve mostrar as informações específicas da transação Pix Fiserv

