#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Voucher
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Voucher

  @TestCaseKey=SMP-T306
  Scenario Outline: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Voucher
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher do excel é igual a Total de Vendas da tela
    And A soma de vendas voucher é igual ao valor bruto autorizado
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
  @TestCaseKey=SMP-T307
  Scenario Outline: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Voucher
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher do excel é igual a Total de Vendas da tela
    And A soma de vendas voucher é igual ao valor bruto autorizado
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
