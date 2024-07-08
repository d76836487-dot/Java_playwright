#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas histórico com CNPJ

  #Background:
  #  Given Usuário loga na aplicação
  #  And Usuário acessou com sucesso
  #  And Usuário acessou Vendas - Histórico de Vendas
  #  And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T157
  Scenario Outline: Rodapé de Vendas Hoje
    Given open portal "<alianca>" and logon
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @sicredi @alliances
    Examples:
      |Description        |alianca  |  descrição                                                                             |
      |Usuario master     |sicredi  |© %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @afinz @alliances
    Examples:
      |Description        |alianca   | descrição                                                                             |
      |Usuario master     |afinz    |© %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @azulzinha @alliances
    Examples:
      |Description        |alianca   | descrição                                                                             |
      |Usuario master     |azulzinha|© %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
    @bin @alliances
    Examples:
      |Description        |alianca   | descrição                                                                             |
      |Usuario master     |bin      |© %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |
  @TestCaseKey=SMP-T156
  Scenario Outline: Traz como padrão Ontem no filtro do período
    Given open portal "<alianca>" and logon
    Then Usuário verá em "Vendas - Histórico Vendas - Período - Descrição" o valor "<período>"
    @sicredi @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |sicredi  | Ontem   |
    @afinz @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |afinz    | Ontem   |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |azulzinha| Ontem   |
    @bin @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |bin      | Ontem   |
  @TestCaseKey=SMP-T167
  Scenario Outline: Ocultar valores de Vendas - Histórico de Vendas
    Given open portal "<alianca>" and logon
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Vendas - Histórico de Vendas - Resumo - Quantidade de vendas" o valor "••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor bruto" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor líquido" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor cancelado" o valor "R$ ••••"
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



  @TestCaseKey=SMP-T161
  Scenario Outline: Compara valores bruto, líquido e total de vendas com api
    Given open portal "<alianca>" and logon
    And Usuário acessou Vendas - Histórico de Vendas
    Given Usuário viu "<período>" em "Vendas - Histórico Vendas - Período - Descrição"
    Then Valor bruto será igual a API
    And Valor líquido será igual a API
    And Total de vendas será igual a API
     @sicredi @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |sicredi  |Ontem   |
    @afinz @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |afinz    |Ontem   |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |azulzinha|Ontem   |
    @bin @alliances
    Examples:
      |Description        |alianca  | período |
      |Usuario master     |bin      |Ontem   |




  @TestCaseKey=SMP-T299
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de Documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Histórico de Vendas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Histórico de Vendas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Histórico de Vendas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Histórico de Vendas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de todos valores Brutos é igual a "Vendas Histórico - Valor Bruto"
    And A soma de todos valores Líquidos é igual a "Vendas Histórico - Valor Líquido"
    And A soma de todos valores Cancelados é igual a "Vendas Histórico - Valor Cancelados"
    Examples:
      | formato            |
      | Excel Simplificado |
      | Excel Detalhado    |
      | CSV Simplificado   |
      | CSV Detalhado      |
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
  @TestCaseKey=SMP-T298
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Histórico de Vendas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Histórico de Vendas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Histórico de Vendas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Histórico de Vendas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de todos valores Brutos é igual a "Vendas Histórico - Valor Bruto"
    And A soma de todos valores Líquidos é igual a "Vendas Histórico - Valor Líquido"
    And A soma de todos valores Cancelados é igual a "Vendas Histórico - Valor Cancelados"
    @sicredi @alliances
    Examples:
      |Description        |alianca  |formato            |
      |Usuario master     |sicredi  |Excel Simplificado |
      |Usuario master     |sicredi  |Excel Detalhado    |
      |Usuario master     |sicredi  |CSV Simplificado   |
      |Usuario master     |sicredi  |CSV Detalhado      |
    @afinz @alliances
    Examples:
      |Description        |alianca  |formato            |
      |Usuario master     |afinz  |Excel Simplificado |
      |Usuario master     |afinz  |Excel Detalhado    |
      |Usuario master     |afinz  |CSV Simplificado   |
      |Usuario master     |afinz  |CSV Detalhado      |
    @azulzinha @alliances
    Examples:
      |Description        |alianca  |formato            |
      |Usuario master     |azulzinha  |Excel Simplificado |
      |Usuario master     |azulzinha  |Excel Detalhado    |
      |Usuario master     |azulzinha  |CSV Simplificado   |
      |Usuario master     |azulzinha  |CSV Detalhado      |
    @bin @alliances
    Examples:
      |Description        |alianca  | formato            |
      |Usuario master     |bin  |Excel Simplificado |
      |Usuario master     |bin  |Excel Detalhado    |
      |Usuario master     |bin  |CSV Simplificado   |
      |Usuario master     |bin  |CSV Detalhado      |