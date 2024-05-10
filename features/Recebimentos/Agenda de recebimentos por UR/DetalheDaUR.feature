#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Detalhe_da_UR
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Detalhe da UR

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And existem recebimentos listados

  @TestCaseKey=SMP-T319
  Scenario: Direcionamento
    When usuário clica sobre um lote (bandeira e produto) da listagem apresentada
    Then usuário será direcionado à tela "Agenda de recebimentos por UR > Detalhe da UR"

  @TestCaseKey=SMP-T320
  Scenario: Consultar Layout da seção Resumo
    When usuário clica sobre um lote (bandeira e produto) da listagem apresentada
    Then usuário será direcionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And usuário visualizará no título do Resumo da UR a data no formato "dd/MM/yyyy"
    And Usuário verá em "Detalhe da UR - Botão Exportar" o texto "Exportar"
    And Usuário verá no card da seção Resumo a imagem da bandeira, seguido do nome da bandeira
    And Usuário verá no card da seção Resumo o Valor total, Total atualizado da UR, Valor pago, Total de deduções

  @TestCaseKey=SMP-T321
  Scenario: Seção Resumo Botão Mostrar todos os detalhes
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica no "Botão Mostrar todos os detalhes" em "Detalhe da UR - Resumo"
    Then usuário verá na seção resumo os elementos
    """
    Total bruto, Total taxa MDR, Total antecipação eventual, Total antecipação automática, Total deduções,
    Total ajuste crédito, Total contratos
    """

  @TestCaseKey=SMP-T323
  Scenario Outline: Confere Valor Total de Agenda de recebimentos por UR com exportação
    Given usuário clicou sobre o lote <numero lote> (bandeira e produto) da listagem apresentada
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When Usuário clica em Exportar como Excel
    And usuário clica em "Mostrar todos os detalhes" no "Detalhe da UR - Resumo"
    Then "Valor total" do Detalhe da UR será igual ao "Valor total" do Excel
    And "Valor Atualizado da UR" do Detalhe da UR será igual ao "Total atualizado de UR" do Excel
    And "Valor Pago" do Detalhe da UR será igual ao "Valor pago" do Excel
    And "Total de Deduções" do Detalhe da UR será igual ao "Total de deduções" do Excel
    And "Total bruto valor" do Detalhe da UR será igual ao "Total bruto" do Excel
    And "Total taxa MDR valor" do Detalhe da UR será igual ao "Total taxa MDR" do Excel
    And "Total antecipação eventual valor" do Detalhe da UR será igual ao "Total antecipação eventual" do Excel
    And "Total antecipação automática valor" do Detalhe da UR será igual ao "Total antecipação automática" do Excel
    And "Total deduções valor" do Detalhe da UR será igual ao "Total deduções" do Excel
    And "Total ajuste crédito valor" do Detalhe da UR será igual ao "Total ajustes crédito" do Excel
    And "Total contratos valor" do Detalhe da UR será igual ao "Total contratos" do Excel
    Examples:
      | numero lote |
      | 0           |
      | 1           |
      | 2           |

  @TestCaseKey=SMP-T335
  Scenario: Consultar Pagamentos da UR (Status Pago)
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha valor pago maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica "Detalhe da UR - Visualizar Pagamentos"
    Then Usuário visualizar status pago com bolinha na cor verde

  @TestCaseKey=SMP-T350
  Scenario: Consultar Pagamentos da UR (Status Programado)
    Given Usuário seleciona Próximos 14 Dias
    And usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    When usuário clica "Detalhe da UR - Visualizar Pagamentos"
    Then Usuário visualizar status programado com bolinha na cor amarelo

  #produto,
  #botão Mostrar todos os detalhes
  #  Scenario: Consultar Abas na Tela / Detalhe da UR
  #    Given Usuário está logado Agenda de recebimentos por UR
  #    When Clicar sobre um lote (bandeira e produto) da listagem apresentada
  #    And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
  #    Then usuário visualizara as abas (Vendas vinculadas, Pagamentos, Créditos e deduções, Contratos)
  @TestCaseKey=SMP-T358
  Scenario: Nome das colunas do Arquivo Excel
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When Usuário clica em Exportar como Excel
    Then Nome do arquivo será "Relatório_simplificado_Agenda_de_recebimentos_por_UR_" seguido de data e hora padrão "dd_MM_yyyy_HHmm"
    And Terá campo com um dos valores ou formatações abaixo na aba Resumo
      | campo                        | valor                                    | tipo validação |
      | Bandeira                     | Mastercard,ELO,Visa,Hipercard,Amex,Cabal | csv            |
      | Produto                      | Crédito,Débito                           | csv            |
      | Valor total                  | valor monetário                          | formato        |
      | Total atualizado de UR       | valor monetário                          | formato        |
      | Valor pago                   | valor monetário                          | formato        |
      | Total de deduções            | valor monetário                          | formato        |
      | Total bruto                  | valor monetário                          | formato        |
      | Total taxa MDR               | valor monetário                          | formato        |
      | Total antecipação eventual   | valor monetário                          | formato        |
      | Total antecipação automática | valor monetário                          | formato        |
      | Total taxa de antecipação    | valor monetário                          | formato        |
      | Total deduções               | valor monetário                          | formato        |
      | Total ajustes crédito        | valor monetário                          | formato        |
      | Total contratos              | valor monetário                          | formato        |
    And Terá as colunas abaixo na aba "Vendas vinculadas" em Detalhe UR
    """
    Produto ,Bandeira,Data prevista de liquidação,Data da venda,Cód. de autorização,Tipo do Produto,Parcela,Valor bruto,
    Valor bruto da parcela,Valor líquido,Valor da taxa,NSU,Canal,Terminal,Estabelecimento,Data efetiva de pagamento
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Pagamentos" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,CPF/CNPJ do beneficiário,Data do pagamento, Valor ,Situação,
    Domicílio bancário,CPF/CNPJ do títular ,Tipo de conta,Agência ,Conta
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Créditos e Deduções" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,Tipo de evento,Data do evento,NSU,Order ID ,Valor,Valor da venda,
    Valor líquido do cancelamento,Valor deduzido da UR,Código de autorização,UR de origem da venda,Data da UR de origem
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação
    And Terá as colunas abaixo na aba "Contratos" em Detalhe UR
    """
    Produto,Bandeira,Data prevista de liquidação,Situação,CPF/CNPJ do beneficiário,Razão Social do beneficiario ,
    Identificador do contrato,Tipo de contrato,Prioridade de Contrato,Valor comprometido,Valor pago / a pagar,
    Data do pagamento,Domicílio bancário,CPF/CNPJ do titular da conta,Tipo de conta,Agência,Conta
    """
    And Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação

  @TestCaseKey=SMP-T359
  Scenario: Detalhe Venda
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
    And Todas as barras de carregamento sumiram
    When usuário clica "Detalhe da UR - Venda - Data Venda 0"
    Then Usuário verá "Detalhe da UR - Popup"
    And Valores da popup da UR da venda tem mesmas informações que listagem
    And Popup da UR da venda será fechada após usuário clicar no botão Fechar

