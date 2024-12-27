#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nao_Efetivadas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Nao Efetivadas

  @TestCaseKey=LPDC-T1116
  Scenario: Personalizar Colunas
    Given Usuário está Logado No Portal do Cliente
    When Usuário acessa a página Vendas > Nao Efetivadas
    And Usuário clica em Personalizar colunas
    And Seleciona no MAXIMO 10 check box com a coluna desejada e clica no Botão Aplicar
    Then Usuário visualizará a tabela personalizada contendo 10 colunas
    And Seleciona "voltar ao padrão"
    And Visualiza as 10 colunas padrão novamente , Data da venda, cod.de autorização, Comprovante de venda,Produto, Parcelas, Bandeira, Canal, Terminal, Valor bruto, Status.

  @TestCaseKey=LPDC-T1130
  Scenario: Busca pelo Codigo de autorização
    Given Usuário está na página Vendas > Nao Efetivadas
    When buscar pro codigo de autorização e clicar na lupa
    Then Lista a Venda não efetivada com aquele codigo de autorização
    And seleciona o "x"
    And Limpa o codigo de autenticação e aparece todas vendas não efetivadas

  @TestCaseKey=LPDC-T1115
  Scenario: Seleção do Periodos
    Given Usuário está na página Vendas > Nao Efetivadas
    When Periodo vem preenchido com "ontem" com vendas do dia de ontem
    And Selecionar periodo "ultimos 7 dias"
    And Visualiza Vendas nao Efetivadas dos ultimos 7 dias
    And Selecionar periodo "ultimos 14 dias"
    And Visualiza Vendas nao Efetivadas dos ultimos 14 dias
    Then Seleciona um periodo no calendario e Aplicar
    And Visualiza o Periodo com as datas selecionadas "dd/mm/aaaa" - "dd/mm/aaaa" e as Vendas nao Efetivadas do range selecionado

  @TestCaseKey=LPDC-T1139
  Scenario: Exportar CSV - Nao Efetivadas
    Given Usuário está na página Vendas > Nao Efetivadas
    When Clicar em exportar
    And baixa o Relatorio com nome no formato: Relatorio_de_Vendas_Nao_efetivadas _[dia-mes-ano_hora e minuto].csv
    Then Visualiza as colunas Data da venda,Cód. de autorização,Comprovante,Produto,Parcelado,Bandeira,Canal,Número Terminal,Valor bruto,Status,Número do estabelecimento,Final do cartão.
    And Visualiza os dados preenchidos em cada coluna

  @TestCaseKey=LPDC-T1117
  Scenario: Exportar Excel - Nao Efetivadas
    Given Usuário está na página Vendas > Nao Efetivadas
    When Clicar em exportar
    And baixa o Relatorio com nome no formato: Relatorio_de_Vendas_Nao_efetivadas _[dia-mes-ano_hora e minuto].csv
    Then Visualiza as colunas :Data da venda,Cód. de autorização,Comprovante,Produto,Parcelado,Bandeira,Canal,Número terminal,Valor bruto,Status,Número do estabelecimento,Final do cartão.
    And Visualiza os dados preenchidos em cada coluna

  @TestCaseKey=LPDC-T1113
  Scenario: Aplicar e validar filtros
    Given Usuário está na página Vendas > Nao Efetivadas
    When Apertar o botão "Filtro"
    And Marcar checkbox status , produtos , canal , bandeiras , valores , estabelecimento , terminal e seleciona mostrar resultados
    Then Visualiza os filtros aplicados corretamente.
    And Seleciona "Limpar filtros"
    And Filtros removidos e mostra todas vendas novamente

