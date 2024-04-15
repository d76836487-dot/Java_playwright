#language: en
@playwright @api  @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Histórico_com_CNPJ_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Histórico com CNPJ com API e Seleção EC

  @TestCaseKey=SMP-T299
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de Documento
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
      | formato |
      | Excel   |
      | CSV     |

  @TestCaseKey=SMP-T298
  Scenario Outline: Valores tela Vendas - HISTÓRICO DE VENDAS deve bater com exportação - com seleção de EC
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
    Examples:
      | formato |
      | Excel   |
      | CSV     |
