#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Relatorio_Recebimentos_Futuros
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Relatorio Recebimentos Futuros

  Scenario: Geração de Relatório em Excel de Pagamentos Futuros
    Given Usuário está logado no Portal do Cliente
    When acessa o menu "Relatórios" na Lateral esquerda
    And clica em "Gerar Relatório"
    And seleciona "Pagamentos Futuros" como Tipo de Relatório
    And escolhe o formato de arquivo Excel
    And seleciona um Estabelecimento Comercial (EC)
    And define um Período
    And clica em "Gerar Relatório"
    Then a mensagem "Relatório Solicitado com Sucesso!!" será exibida

  Scenario: Geração de Relatório em CSV de Pagamentos Futuros
    Given Usuário está logado no Portal do Cliente
    When acessa o menu "Relatórios" na Lateral esquerda
    And clica em "Gerar Relatório"
    And seleciona "Pagamentos Futuros" como Tipo de Relatório
    And escolhe o formato de arquivo CSV
    And seleciona um Estabelecimento Comercial (EC)
    And define um Período
    And clica em "Gerar Relatório"
    Then a mensagem "Relatório Solicitado com Sucesso!!" será exibida

  Scenario: Validando Arquivo Excel
    Given que o Usuário Solicitou um Arquivo Excel
    When ele abrir o arquivo
    Then deverá ver os seguintes campos:  Relatório de Recebimentos – Futuros, Periodo de Vendas, emitido em:, Estabelecimento Comercial: , Total de Vendas: , Valor liquido previsto:.
    And as seguintes colunas: Data prevista de pagamento, Data de venda, Cód de autorização, Produto, Parcelas, Bandeira, Valor bruto, Valor bruto parcela, Valor da taxa, Valor líquido, Número do terminal, Canal, Cód do pedido, Número do estabelecimento, Número do cartão.

  Scenario: Validando Arquivo CSV
    Given que o Usuário Solicitou um Arquivo CSV
    When ele abrir o arquivo
    Then deverá ver os seguintes campos:  Relatório de Recebimentos – Futuros, Periodo de Vendas, emitido em:, Estabelecimento Comercial: , Total de Vendas: , Valor liquido previsto:.
    And as seguintes colunas: Data prevista de pagamento, Data de venda, Cód de autorização, Produto, Parcelas, Bandeira, Valor bruto, Valor bruto parcela, Valor da taxa, Valor líquido, Número do terminal, Canal, Cód do pedido, Número do estabelecimento, Número do cartão.

  Scenario: Selecionando Pagamentos Futuros em Filtros
    Given Usuário está logado no Portal do Cliente
    And acessa o menu "Relatórios" na Lateral esquerda
    When já tenha gerado algum relatório de pagamentos futuros
    And clica em filtros
    And seleciona em Tipo de Arquivo “pagamentos futuros”
    And clica em Mostrar Resultados
    Then aparecera em Tipo de Arquivo os arquivos gerados de pagamentos futuros