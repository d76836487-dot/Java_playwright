#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Exportar_Relatorio
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Exportar Relatorio

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios

  @TestCaseKey=SMP-T275
  Scenario: Relatório Arquivo em CSV contém Transações Parceladas
    Given Existem relatórios já extraídos do tipo "Vendas", no formato ".csv", disponíveis para download
    When Usuário baixa um relatório do tipo "Vendas", formato ".csv"
    Then Usuário visualizará no arquivo baixado a coluna "Parcelas", contendo as parcelas das vendas

  @api
  @TestCaseKey=SMP-T276
  Scenario Outline: Validar Arquivo de Relatório de Vendas
    Given Existem relatórios já extraídos do tipo "Vendas", no formato "<arquivo>", disponíveis para download
    When Usuário baixa um relatório do tipo "Vendas", formato "<arquivo>"
    Then Usuário visualizará no "<arquivo>" baixado, as colunas
    """
    Data da venda, Hora da venda, Código de autorização, Código do estabelecimento, Comprovante de venda,
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
  @TestCaseKey=SMP-T277
  Scenario Outline: Validar Arquivo de Relatório de Pagamentos
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

  Scenario Outline: Colunas do excel possuem formatações corretas
    Given Existem relatórios já extraídos do tipo "<tipo>", no formato ".xlsx", disponíveis para download
    When Usuário baixa um relatório do tipo "<tipo>", formato ".xlsx"
    Then Os valores das colunas do excel baixado terão mesma formatação
    Examples:
      | tipo       |
      | Pagamentos |
      | Vendas     |
