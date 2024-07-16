#language: en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Pending/Historico_de_Vendas/Historico_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Historico de Vendas

  @TestCaseKey=SMP-T262
  Scenario: Personalizar colunas Com Data das Vendas
    Given Usuário esta Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Histórico de Vendas
    And Usuário personaliza tabela com até 10 colunas contendo entre elas a Data da Venda
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada 10 colunas entre elas a Data da Venda no formato dia/mês/ano ás horas minutos segundos
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=SMP-T261
  Scenario: Personalizar colunas Com Cód de Referência do Cartão
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Histórico de Vendas
    And Usuário clica em Personalizar Colunas
    And personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=SMP-T229
  Scenario: Personalizar colunas sem Cód de Referência do Cartão
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And Usuário clica em Personalizar Colunas
    And personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão com o símbolo "-"
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=SMP-T253
  Scenario: Consultar Data e Hora no Detalhe da Venda
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal Data da venda no formato dia/mês/ano ás horas minutos segundos

  @TestCaseKey=SMP-T240
  Scenario: Consultar Cód. referência do cartão no Detalhe da Venda
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal Cód. referência do cartão com 29 dígitos

  @TestCaseKey=SMP-T224
  Scenario: Consultar Cód. referência do cartão no Detalhes da Venda Sem Informação
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda sem o Cód. referência do cartão
    Then Usuário visualiza no modal no campo Cód. referência do cartão o símbolo "-"

  @TestCaseKey=SMP-T238
  Scenario: Consultar Tooltip no Detalhes da Venda Sem Informação
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal o tooltip Com a mensagem Código relacionado ao número do cartão, também conhecido como PAR. Apenas algumas transações possuem este código.

  @TestCaseKey=SMP-T222
  Scenario: Consultar Data e Hora no Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda com o Cód. referência do cartão
    And clica no Botão Emitir 2 Via no Modal
    Then será exportado um comprovante em PDF contendo Data da venda no formato dia/mês/ano ás horas minutos segundos

  @TestCaseKey=SMP-T263
  Scenario: Consultar Venda com Cód. referência do cartão / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda com o Cód. referência do cartão
    And clica no Botão Emitir 2 Via no Modal
    Then será emitido um comprovante em PDF contendo Cód. referência do cartão com um Código de 29 dígitos

  @TestCaseKey=SMP-T234
  Scenario: Consultar Venda sem Cód. referência do cartão / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda sem o Cód. referência do cartão
    And clica no Botão Emitir 2 via no Modal
    Then será emitido um comprovante em PDF com o campo Cód. referência do cartão com o símbolo "-"

  @TestCaseKey=SMP-T235
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo Excel Simplificado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona Arquivo Excel Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=SMP-T230
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo CSV Simplificado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo CSV Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=SMP-T246
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo Excel Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo Excel Detalhado
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=SMP-T233
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo CSV Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo CSV Detalhado
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=SMP-T232
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=SMP-T249
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório Excel Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=SMP-T226
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel de Pagamentos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=SMP-T220
  Scenario: Consultar  Coluna sem Cód. referência do cartão / Relatório Excel Pagamentos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=SMP-T245
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório CSV Com 29 Digitos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “CSV” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=SMP-T225
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório CSV Com Traço
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “CSV” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=SMP-T231
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel COM 29 Digitos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=SMP-T267
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório Excel Com Traço
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=SMP-T259
  Scenario: Consultar Venda com Cód. referência do cartão no Periodo de Ontem
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Ontem no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T237
  Scenario: Consultar Venda com Cód. referência do cartão no Período de últimos 7 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Últimos 7 dias no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T243
  Scenario: Consultar Venda com Cód. referência do cartão no Período de Últimos 14 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Últimos 14 Dias no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T241
  Scenario: Consultar Venda com Cód. referência do cartão no Período Mês Atual
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Mês Atual no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

