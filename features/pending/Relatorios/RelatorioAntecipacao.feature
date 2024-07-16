#language: en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Pending/Relatorios/Relatorio_Antecipacao
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Relatorio Antecipacao

  Given que o usuário esteja logado no Portal do Cliente
  And clicar no Menu Antecipação na lateral Esquerda
  And abrira o menu contendo as seguintes abas, Solicitar antecipação, Histórico de antecipações, Relatório de antecipações
  And Usuário acessou ao Menu Antecipação
  And Usuário selecionar a aba Relatório de antecipações

  @TestCaseKey=SMP-T404
  Scenario: Período dentro de Relatório de antecipações
    Then Usuário visualizara Período que vira com últimos 7 dias como default

  @TestCaseKey=SMP-T402
  Scenario: Valores dentro de Relatório de antecipações
    Then usuário visualizara Valor bruto das vendas, Valor líquido das vendas, Valor antecipado pago

  @TestCaseKey=SMP-T413
  Scenario: Busca por número da simulação
    Then usuário visualizara campo de busca por número da simulação

  @TestCaseKey=SMP-T412
  Scenario: Vendas vinculadas a antecipação
    Then usuário visualizara a antecipação de vendas
    And quando clicar na SOC para detalhar devera ser exibido as vendas que compõem a SOC

  @TestCaseKey=SMP-T403
  Scenario: Detalhamento das vendas
    Then usuário visualizara Filtros
    And quando clicar na SOC para detalhar devera ser exibido as vendas que compõem a SOC.

  @TestCaseKey=SMP-T407
  Scenario: Calendario Filtros Rapidos
    Then usuário visualizara nos Filtros rapidos Ontem, Últimos 7 dias: Ontem + últimos 6 dias passados,Últimos 14 dias: Ontem + últimos 13 dias passados,Mês passado: do dia primeiro ao último dia do mês passado fechado Range de busca:

  @TestCaseKey=SMP-T411
  Scenario: Filtros Fixos
    Then usuário visualizara Filtros
    And ao clicar em filtros apresentar de forma fixa as 6 bandeiras default (Masterdcard, Elo, Visa, Amex, Hipercard e Cabal)

  @TestCaseKey=SMP-T408
  Scenario: Filtros – Todos selecionados
    Then usuário visualizara Filtros
    And clicar no filtro Todos selecionados e clicar em mostrar resultados

  @TestCaseKey=SMP-T405
  Scenario: Filtros – Automática
    Then usuário visualizara Filtros
    And clicar no filtro Automática e clicar em mostrar resultados

  @TestCaseKey=SMP-T409
  Scenario: Filtros – Limpar filtros
    Then usuário visualizara Filtros
    And clicar no filtro Automática e clicar em limpar filtros
    And os filtros devem ser limpos

  @TestCaseKey=SMP-T406
  Scenario: Exportar Excel Relatório Simplificado Requisitos Excel
    Then usuário visualizara Exportar
    And escolha relatório simplificado
    And clicar em gerar arquivo
    And o arquivo excel devera ser baixado na maquina
    And abrir o arquivo e conferir as colunas Numero da simulação,Data da solicitação, Data do Pagamento, Valor bruto das vendas, valor desconto MDR,Valor Liquidi das vendas, valor desconto antecipação, valor pago e tipo
    And o excel devera Vir com filtro nas colunas da linha 13
    And  o excel devera Vir com Máscara (R$) nos valores
    And o excel devera Vir com Números serem passiveis de soma
    And  o excel devera Vir sempre nesse formato, canto superior e máximo a esquerda

  @TestCaseKey=SMP-T410
  Scenario: Exportar Excel Relatório Simplificado Conferir as colunas
    Then usuário visualizara Exportar
    And escolha relatório simplificado
    And clicar em gerar arquivo
    And o arquivo excel devera ser baixado na maquina
    And abrir o arquivo e conferir as colunas Numero da simulação,Data da solicitação, Data do Pagamento, Valor bruto das vendas, valor desconto MDR,Valor Liquidi das vendas, valor desconto antecipação, valor pago e tipo

