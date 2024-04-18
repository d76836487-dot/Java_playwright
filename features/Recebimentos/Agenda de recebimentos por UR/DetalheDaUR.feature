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
    And Existem recebimentos listados

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
  Scenario: Confere Valor Total de Agenda de recebimentos por UR com exportação
    Given usuário clicou sobre um lote (bandeira e produto) da listagem apresentada
    And usuário foi redirecionado à tela "Agenda de recebimentos por UR > Detalhe da UR"
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

#    Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#    When Usuário vai em Meus Recebimentos
#    And seleciona um recebimento e Clica no Botão Exportar
#    Then arquivo será exportado com sucesso
#    And O Campo Valor Total deve ser exibido
#produto,
#botão Mostrar todos os detalhes
#  Scenario: Consultar Abas na Tela / Detalhe da UR
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#    And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
#    Then usuário visualizara as abas (Vendas vinculadas, Pagamentos, Créditos e deduções, Contratos)
