#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Recebimentos_Resumo_Pago
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Recebimentos Resumo Pago

  @TestCaseKey=SMP-T308
  Scenario Outline: Valores tela Recebimentos - Pagos - deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Recebimentos - Pagos
    And Usuário seleciona Últimos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Recibos Pagos' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade recebido em 'Recibos Pagos' é igual ao exportado
    And Quantidade agendado em 'Recibos Pagos' é igual ao exportado
    And Quantidade cedido em 'Recibos Pagos' é igual ao exportado
    And Total recebido em 'Recibos Pagos' é igual ao exportado
    And Total agendado em 'Recibos Pagos' é igual ao exportado
    And Total cedido em 'Recibos Pagos' é igual ao exportado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |sicredi  | Excel Simplificado |
      |Usuario master     |sicredi  | CSV Simplificado |
    @afinz @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |afinz    |Excel Simplificado |
      |Usuario master     |afinz  | CSV Simplificado |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |azulzinha|Excel Simplificado |
      |Usuario master     |azulzinha  | CSV Simplificado |
    @bin @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |bin      |Excel Simplificado |
      |Usuario master     |bin  | CSV Simplificado |

  @TestCaseKey=SMP-T309
  Scenario Outline: Valores tela Recebimentos - Pagos - deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Recebimentos - Pagos
    And Usuário seleciona Últimos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Recibos Pagos' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade recebido em 'Recibos Pagos' é igual ao exportado
    And Quantidade agendado em 'Recibos Pagos' é igual ao exportado
    And Quantidade cedido em 'Recibos Pagos' é igual ao exportado
    And Total recebido em 'Recibos Pagos' é igual ao exportado
    And Total agendado em 'Recibos Pagos' é igual ao exportado
    And Total cedido em 'Recibos Pagos' é igual ao exportado
    @sicredi @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |sicredi  | Excel Simplificado |
      |Usuario master     |sicredi  | CSV Simplificado |
    @afinz @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |afinz    |Excel Simplificado |
      |Usuario master     |afinz  | CSV Simplificado |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |azulzinha|Excel Simplificado |
      |Usuario master     |azulzinha  | CSV Simplificado |
    @bin @alliances
    Examples:
      |Description        |alianca  |format             |
      |Usuario master     |bin      |Excel Simplificado |
      |Usuario master     |bin  | CSV Simplificado |


