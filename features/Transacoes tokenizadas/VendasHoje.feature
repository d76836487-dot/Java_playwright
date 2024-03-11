#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Transacoes_tokenizadas/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep
Feature: Vendas Hoje


  Scenario: Consultar Valor bruto sem tooltip / Vendas Hoje
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    Then Usuário visualizara o Valor bruto sem o Tootip

  Scenario: Consultar Data e Horas / Personalizar Colunas / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And Usuário personaliza tabela com até 10 colunas contendo entre elas a Data da Venda
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a Data da Venda no formato: dia/mês/ano ás horas:minutos:segundos
    And Botão de Personalizar deve ficar na cor da inst na tela de Vendas Hoje

  Scenario: Consultar Cód de Referência do Cartão / Personalizar Colunas / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And Usuário personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão com 29 dígitos alfanuméricos
    And Botão de Personalizar deve ficar na cor da inst na tela de Vendas Hoje


  Scenario: Consultar Venda sem Cód. referência do cartão / Personalizar Colunas / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And Usuário personaliza tabela com até 10 colunas contendo entre elas Cód referência do Cartão
    And Clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas entre elas a coluna com Cód referência do Cartão com os campos preenchidos com “-“

  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo Excel / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And clica em Exportar
    And seleciona Arquivo Excel
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” com 29 dígitos alfanuméricos

  Scenario: Consultar Coluna sem Cód. referência do cartão / Arquivo Excel / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And clica em Exportar
    And seleciona Arquivo Excel
    And clica Botão Gerar arquivo
    Then será exportado arquivo Excel contendo a coluna “Cód. Ref. Cartão” com o símbolo “-“

  Scenario: Consultar Coluna Cód. referência do cartão / Arquivo CSV / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And clica em Exportar
    And seleciona o Arquivo CSV
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” com 29 dígitos alfanuméricos

  Scenario: Consultar Coluna sem Cód. referência do cartão / Arquivo CSV / Vendas Hoje

    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Vendas Hoje
    And clica em Exportar
    And seleciona Arquivo CSV
    And clica Botão Gerar arquivo
    Then será exportado arquivo CSV contendo a coluna “Cód. Ref. Cartão” com o símbolo “-“

