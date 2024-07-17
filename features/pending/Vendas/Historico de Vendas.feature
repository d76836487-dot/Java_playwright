#language: en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Historico_de_Vendas/Historico_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Historico de Vendas

  @TestCaseKey=LPDC-T332
  Scenario: Personalizar colunas Com Data das Vendas
    Given Usuário esta Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Histórico de Vendas
    And Usuário personaliza tabela com até 10 colunas contendo entre elas a Data da Venda
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada 10 colunas entre elas a Data da Venda no formato dia/mês/ano ás horas minutos segundos
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=LPDC-T368
  Scenario: Personalizar colunas Com Cód de Referência do Cartão
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Histórico de Vendas
    And Usuário clica em Personalizar Colunas
    And personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=LPDC-T339
  Scenario: Personalizar colunas sem Cód de Referência do Cartão
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And Usuário clica em Personalizar Colunas
    And personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão com o símbolo "-"
    And Botão de Personalizar deve ficar na cor da inst na tela de Histórico de Vendas

  @TestCaseKey=LPDC-T440
  Scenario: Consultar Data e Hora no Detalhe da Venda
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal Data da venda no formato dia/mês/ano ás horas minutos segundos

  @TestCaseKey=LPDC-T336
  Scenario: Consultar Cód. referência do cartão no Detalhe da Venda
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal Cód. referência do cartão com 29 dígitos

  @TestCaseKey=LPDC-T348
  Scenario: Consultar Cód. referência do cartão no Detalhes da Venda Sem Informação
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda sem o Cód. referência do cartão
    Then Usuário visualiza no modal no campo Cód. referência do cartão o símbolo "-"

  @TestCaseKey=LPDC-T338
  Scenario: Consultar Tooltip no Detalhes da Venda Sem Informação
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda
    Then Usuário visualiza no modal o tooltip Com a mensagem Código relacionado ao número do cartão, também conhecido como PAR. Apenas algumas transações possuem este código.

  @TestCaseKey=LPDC-T370
  Scenario: Consultar Data e Hora no Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda com o Cód. referência do cartão
    And clica no Botão Emitir 2 Via no Modal
    Then será exportado um comprovante em PDF contendo Data da venda no formato dia/mês/ano ás horas minutos segundos

  @TestCaseKey=LPDC-T337
  Scenario: Consultar Venda com Cód. referência do cartão / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda com o Cód. referência do cartão
    And clica no Botão Emitir 2 Via no Modal
    Then será emitido um comprovante em PDF contendo Cód. referência do cartão com um Código de 29 dígitos

  @TestCaseKey=LPDC-T359
  Scenario: Consultar Venda sem Cód. referência do cartão / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And seleciona uma venda sem o Cód. referência do cartão
    And clica no Botão Emitir 2 via no Modal
    Then será emitido um comprovante em PDF com o campo Cód. referência do cartão com o símbolo "-"

  @TestCaseKey=LPDC-T405
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo Excel Simplificado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona Arquivo Excel Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=LPDC-T328
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo CSV Simplificado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo CSV Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=LPDC-T439
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo Excel Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo Excel Detalhado
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=LPDC-T355
  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo CSV Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And clica em Exportar
    And seleciona o Arquivo CSV Detalhado
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” Com 29 Dígitos alfanuméricos

  @TestCaseKey=LPDC-T365
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=LPDC-T343
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório Excel Detalhado
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=LPDC-T369
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel de Pagamentos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=LPDC-T354
  Scenario: Consultar  Coluna sem Cód. referência do cartão / Relatório Excel Pagamentos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=LPDC-T333
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório CSV Com 29 Digitos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “CSV” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=LPDC-T364
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório CSV Com Traço
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Vendas, Formato do Arquivo “CSV” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=LPDC-T344
  Scenario: Consultar Coluna Cód. referência do cartão / Relatório Excel COM 29 Digitos
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um código de 29 dígitos

  @TestCaseKey=LPDC-T327
  Scenario: Consultar Coluna sem Cód. referência do cartão / Relatório Excel Com Traço
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa menu Relatórios
    And clica em Gerar Relatório
    And seleciona Tipo de relatório Pagamentos, Formato do Arquivo “Excel” com um período
    And clica Botão Gerar relatório
    Then será gerado um relatório contendo a coluna “Cód. Ref. Cartão” com um símbolo "-"

  @TestCaseKey=LPDC-T366
  Scenario: Consultar Venda com Cód. referência do cartão no Periodo de Ontem
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Ontem no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=LPDC-T410
  Scenario: Consultar Venda com Cód. referência do cartão no Período de últimos 7 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Últimos 7 dias no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=LPDC-T331
  Scenario: Consultar Venda com Cód. referência do cartão no Período de Últimos 14 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Últimos 14 Dias no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

  @TestCaseKey=LPDC-T367
  Scenario: Consultar Venda com Cód. referência do cartão no Período Mês Atual
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas e deposis Histórico de Vendas
    And selecionar o Período Mês Atual no Calendário
    And clicar no Botão Aplicar
    Then será exibido vendas contendo Cód. referência do cartão preenchido.

