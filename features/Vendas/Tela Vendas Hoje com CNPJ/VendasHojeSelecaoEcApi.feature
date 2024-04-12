#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ com API e Seleção EC

  @ignore # TODO: confirmar a api desta tela...
  @TestCaseKey=SMP-T288
  Scenario: Vendas HOJE com seleção de EC (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    When Usuário acessa Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

  @ignore # TODO: confirmar a api desta tela...
  @TestCaseKey=SMP-T291
  Scenario: Vendas HOJE com seleção de Documento (Usuário Master) terá mesma quantidade vendas
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento e clicar Acessar
    When Usuário acessa Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

  @TestCaseKey=SMP-T294
  Scenario Outline: Vendas HOJE com seleção de Documento (Usuário Master) terá mesmos estabelecimentos no filtro
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas Hoje
    And usuário clicou no "Vendas Hoje - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Vendas Hoje' terá somente o ECs do documento selecionado
    And A soma de todos valores Brutos é igual a "Vendas Hoje - Resumo - Valor Vendas"
    Examples:
      | formato |
      | Excel   |
      | CSV     |

  @TestCaseKey=SMP-T295
  Scenario Outline: Vendas HOJE com seleção de EC (Usuário Master) terá mesmos estabelecimentos no filtro
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Vendas Hoje
    And usuário clicou no "Vendas Hoje - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<formato>" 'Vendas Hoje' terá somente o ECs do documento selecionado
    And A soma de todos valores Brutos é igual a "Vendas Hoje - Resumo - Valor Vendas"
    Examples:
      | formato |
      | Excel   |
      | CSV     |

