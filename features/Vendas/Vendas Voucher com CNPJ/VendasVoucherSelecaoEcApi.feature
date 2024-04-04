#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Voucher_com_CNPJ_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Voucher com CNPJ com API e Seleção EC

  @TestCaseKey=SMP-T306
  Scenario: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Voucher
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher é igual a Total de Vendas
    And A soma de vendas voucher é igual ao valor bruto autorizado

  @TestCaseKey=SMP-T307
  Scenario: Valores tela Vendas - Voucher - deve bater com exportação - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Voucher
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Voucher - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Voucher' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Voucher' terá exatamente os ECs selecionado no cabeçalho
    And A contagem de vendas voucher é igual a Total de Vendas
    And A soma de vendas voucher é igual ao valor bruto autorizado

