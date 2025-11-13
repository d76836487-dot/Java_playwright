#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Recebimentos/RelatorioRecebimentosFuturos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: RelatorioRecebimentosFuturos

  @TestCaseKey=LPDC-T981
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

  @TestCaseKey=LPDC-T979
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

  @TestCaseKey=LPDC-T980
  Scenario: Validando Arquivo Excel - Recebimentos Futuros
    Given que o Usuário Solicitou um Arquivo Excel
    When ele abrir o arquivo
    Then deverá ver os seguintes campos  Relatório de Recebimentos – Futuros, Periodo de Vendas, emitido em:, Estabelecimento Comercial: , Total de Vendas: , Valor liquido previsto:.
    And as seguintes colunas Data prevista de pagamento, Data de venda, Cód de autorização, Produto, Parcelas, Bandeira, Valor bruto, Valor bruto parcela, Valor da taxa, Valor líquido, Número do terminal, Canal, Cód do pedido, Número do estabelecimento, Número do cartão.

  @TestCaseKey=LPDC-T976
  Scenario: Validando Arquivo CSV - Recebimentos Futuros
    Given que o Usuário Solicitou um Arquivo CSV
    When ele abrir o arquivo
    Then deverá ver os seguintes campos  Relatório de Recebimentos – Futuros, Periodo de Vendas, emitido em:, Estabelecimento Comercial: , Total de Vendas: , Valor liquido previsto:.
    And as seguintes colunas Data prevista de pagamento, Data de venda, Cód de autorização, Produto, Parcelas, Bandeira, Valor bruto, Valor bruto parcela, Valor da taxa, Valor líquido, Número do terminal, Canal, Cód do pedido, Número do estabelecimento, Número do cartão.

  @TestCaseKey=LPDC-T982
  Scenario: Selecionando Pagamentos Futuros em Filtros
    Given Usuário está logado no Portal do Cliente
    And acessa o menu "Relatórios" na Lateral esquerda
    When já tenha gerado algum relatório de pagamentos futuros
    And clica em filtros
    And seleciona em Tipo de Arquivo “pagamentos futuros”
    And clica em Mostrar Resultados
    Then aparecera em Tipo de Arquivo os arquivos gerados de pagamentos futuros

  @TestCaseKey=LPDC-T1993
  Scenario: Verificar soma de recebimentos futuros previstos por estabelecimento na Home inicial logada
    Given acesso a plataforma a alianca
    When consulto recebimentos futuros na Home inicial para múltiplos estabelecimentos
    Then a soma dos recebimentos futuros previstos é exibida corretamente

  @TestCaseKey=LPDC-T1994
  Scenario Outline: Verificar recebimentos futuros previstos para diferentes datas
    Given acesso a plataforma com <alianca> x
    When consulto o endpoint de recebimentos futuros previstos para cada <alianca>
    Then os dados de recebimentos futuros previstos para cada <alianca> são exibidos corretamente
    Examples:
      | alianca |
      | Nubank  |
      | BCJ     |
      | Sicredi |
      | Bin     |
      | Caixa   |

