#language: en
@playwright @api @UsuárioComHierarquia
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas

  @TestCaseKey=SMP-T303
  Scenario Outline: Valores tela Vendas - PRÉ-AUTORIZADAS deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Pré Autorizações
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Pré Autorizações - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Pré Autorizadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Pré Autorizadas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de vendas autorizadas (confirmadas) é igual ao valor bruto autorizado
    And A soma de vendas pré-autorizadas é igual ao valor bruto a confirmar
    And A contagem de vendas pré-autorizadas é igual a Total de Vendas
    Examples:
      | format |
      | Excel  |
      | CSV    |

  @TestCaseKey=SMP-T304
  Scenario Outline: Valores tela Vendas - PRÉ-AUTORIZADAS deve bater com exportação - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas - Pré Autorizações
    And Usuário seleciona Últimos 14 Dias
    And usuário clicou no "Vendas - Pré Autorizações - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Pré Autorizadas' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Pré Autorizadas' terá exatamente os ECs selecionado no cabeçalho
    And A soma de vendas autorizadas (confirmadas) é igual ao valor bruto autorizado
    And A soma de vendas pré-autorizadas é igual ao valor bruto a confirmar
    And A contagem de vendas pré-autorizadas é igual a Total de Vendas
    Examples:
      | format |
      | Excel  |
      | CSV    |

