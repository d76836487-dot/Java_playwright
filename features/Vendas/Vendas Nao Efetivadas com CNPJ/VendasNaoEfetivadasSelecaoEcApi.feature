#language: en
@playwright @api  @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Não_Efetivadas_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Não Efetivadas com CNPJ

  @TestCaseKey=SMP-T301
  Scenario Outline: Valores tela Vendas - NÃO EFETIVADAS deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Não Realizadas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Não Efetivadas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Não Efetivadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no cabeçalho
    And A soma de vendas recusadas é igual a "Não Efetivadas - Recusadas"
    And A soma de vendas estornadas é igual a "Não Efetivadas - Estornadas"
    Examples:
      | format |
      | Excel  |
      | CSV    |

  @TestCaseKey=SMP-T302
  Scenario Outline: Valores tela Vendas - NÃO EFETIVADAS deve bater com exportação - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Não Realizadas
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Não Efetivadas - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Não Efetivadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no cabeçalho
    And A soma de vendas recusadas é igual a "Não Efetivadas - Recusadas"
    And A soma de vendas estornadas é igual a "Não Efetivadas - Estornadas"
    Examples:
      | format |
      | Excel  |
      | CSV    |

