#language: en
@playwright @api @UsuárioComHierarquia
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Recebimentos_Resumo_Futuro
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Recebimento Resumo Futuro

  @TestCaseKey=SMP-T311
  Scenario: Valores tela Recebimentos - Futuros - deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Recebimentos - Futuros
    And Usuário seleciona Próximos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Recibos Futuros' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Futuros' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade vendas em 'Recibos Futuros' é igual ao exportado
    And Total líquido em 'Recibos Futuro' é igual ao exportado

  @TestCaseKey=SMP-T310
  Scenario: Valores tela Recebimentos - Futuros - deve bater com exportação - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Recebimentos - Futuros
    And Usuário seleciona Próximos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Recibos Futuros' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Futuros' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade vendas em 'Recibos Futuros' é igual ao exportado
    And Total líquido em 'Recibos Futuro' é igual ao exportado

