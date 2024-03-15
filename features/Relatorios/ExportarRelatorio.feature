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
  Scenario Outline: Validar Arquivo de Relatório de Vendas com 1 Estabelecimento Comercial
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    And Existem relatórios já extraídos do tipo "Vendas", no formato "<arquivo>", disponíveis para download
    When Usuário baixa um relatório do tipo "Vendas", formato "<arquivo>"
    Then Usuário visualizará no "<arquivo>" baixado, as colunas
    """
    Data da venda, Hora da venda, Data do ajuste, Número do Estabelecimento, Código de Autorização,
    Comprovante da venda, Código do pedido, Canal, Número do Terminal, Produto, Parcelas, Tipo de cartão, Bandeira,
    Status, Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação,
    Número do Cartão, NSU, Data prevista de pagamento da venda, Status do pagamento da venda, Data efetiva do pagamento da venda
    """
    Examples:
    | arquivo |
    | .csv    |
    | .xlsx   |
