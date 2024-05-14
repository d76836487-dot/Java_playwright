#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Transacoes_tokenizadas/Pre-autorizacoes
@Zephyr:Status=Approved
@Zephyr:Priority=Low
Feature: Pre-autorizacoes

  @TestCaseKey=SMP-T266
  Scenario: Consultar Total de vendas na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Total de vendas com vendas

  @TestCaseKey=SMP-T257
  Scenario: Consultar Total de vendas sem vendas  na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Total de vendas sem vendas

  @TestCaseKey=SMP-T248
  Scenario: Consultar Valor bruto autorizado na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Valor bruto autorizado com vendas

  @TestCaseKey=SMP-T221
  Scenario: Consultar Valor bruto autorizado sem vendas  na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Valor bruto autorizado sem vendas

  @TestCaseKey=SMP-T254
  Scenario: Consultar Valor bruto a confirmar na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Valor bruto a confirmar com vendas

  @TestCaseKey=SMP-T265
  Scenario: Consultar Valor bruto a confirmar sem vendas na Tela Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    Then Usuário visualizara Valor bruto a confirmar sem vendas

  @TestCaseKey=SMP-T239
  Scenario: Personalizar colunas com Data e Hora no Menu Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And Usuário personaliza tabela com até 10 colunas contendo entre elas a Data da Venda
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a Data da Venda no formato dia/mês/ano ás horas.minutos.segundos
    And Botão de Personalizar deve ficar na cor da inst na tela de Pré-Autotizações

  @TestCaseKey=SMP-T258
  Scenario: Personalizar colunas com Cód de Referência do Cartão no Menu Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And Usuário personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão contendo 29 dígitos
    And Botão de Personalizar deve ficar na cor da inst na tela de Pré-Autotizações

  @TestCaseKey=SMP-T251
  Scenario: Consultar Data e Hora / Detalhes da Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda
    Then Usuário visualiza no modal Data da venda no formato dia/mês/ano ás horas.minutos.segundos

  @TestCaseKey=SMP-T250
  Scenario: Consultar Cód. referência do cartão / Detalhes da Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda com Cód. referência do cartão
    Then Usuário visualiza no modal Cód. referência do cartão contendo 29 dígitos alfanuméricos

  @TestCaseKey=SMP-T228
  Scenario: Consultar Cód. referência do cartão sem informação / Detalhes da Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda sem o Cód. referência do cartão
    Then Usuário visualiza no modal no campo Cód. referência do cartão o símbolo  “- “

  @TestCaseKey=SMP-T219
  Scenario: Consultar Tooltip / Detalhes da Pré-Autorização
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda
    Then apresenta tooltip com a mensagem Código relacionado ao número do cartão, também conhecido como PAR. Apenas algumas transações possuem este código.

  @TestCaseKey=SMP-T227
  Scenario: Consultar Data e Hora no Menu Pré-Autorizações / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda
    And clica no Botão Emitir 2 via no Modal
    Then será emitido um comprovante em PDF contendo Data da venda no formato dia/mês/ano ás horas.minutos.segundos

  @TestCaseKey=SMP-T256
  Scenario: Consultar Cód. referência do cartão no Menu Pré-Autorizações / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda
    And clica no Botão Emitir 2 via no Modal
    Then será emitido um comprovante em PDF contendo Cód. referência do cartão com um Código de 29 dígitos

  @TestCaseKey=SMP-T223
  Scenario: Consultar Cód. referência do cartão sem token no Menu Pré-Autorizações / Comprovante PDF
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And seleciona uma venda
    And clica no Botão Emitir 2 via no Modal
    Then será emitido um comprovante em PDF com o campo Cód. referência do cartão com o símbolo “-“

  @TestCaseKey=SMP-T260
  Scenario: Consultar Coluna Cód. referência do cartão no Menu Pré-Autorização / Arquivo Excel
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And clica em Exportar
    And seleciona Arquivo Excel
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” com um Código de 29 dígitos alfanuméricos

  @TestCaseKey=SMP-T252
  Scenario: Consultar Coluna Cód. referência do cartão sem token no Menu Pré-Autorização / Arquivo Excel
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And clica em Exportar
    And seleciona Arquivo Excel Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” com símbolo “-“

  @TestCaseKey=SMP-T255
  Scenario: Consultar Coluna Cód. referência do cartão no Menu Pré-Autorização / Arquivo CSV
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Pré_Autorizações
    And clica em Exportar
    And seleciona o Arquivo CSV Simplificado
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” com um Código de 29 dígitos alfanumérico

  @TestCaseKey=SMP-T236
  Scenario: Consultar Coluna Cód. referência do cartão sem token no Menu Pré-Autorização / Arquivo CSV
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas - Pré_Autorizações
    And clica em Exportar
    And seleciona Arquivo CSV
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” com símbolo “-“

  @TestCaseKey=SMP-T242
  Scenario: Consultar Pre-autorizações com Cód. referência do cartão no Período de Hoje
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas - Pré-autorizações
    And selecionar o Período Hoje
    And clicar no Botão Aplicar
    Then será exibido vendas de hoje contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T264
  Scenario: Consultar Pre-autorizações com Cód. referência do cartão no Período de Ontem
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas - Pré-autorizações
    And selecionar o Período Ontem
    And clicar no Botão Aplicar
    Then será exibido vendas do dia anterior contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T247
  Scenario: Consultar Pre-autorizações com Cód. referência do cartão no Período dos Últimos 7 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas - Pré-autorizações
    And selecionar o Período Últimos 7 dias
    And clicar no Botão Aplicar
    Then será exibido vendas dos últimos 7 dias contendo Cód. referência do cartão preenchido.

  @TestCaseKey=SMP-T244
  Scenario: Consultar Pre-autorizações com Cód. referência do cartão no Período dos Últimos 14 dias
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas - Pré-autorizações
    And selecionar o Período Últimos 14 dias
    And clicar no Botão Aplicar
    Then será exibido vendas dos últimos 14 dias contendo Cód. referência do cartão preenchido.

