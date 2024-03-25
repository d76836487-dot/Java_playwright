#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ_com_API
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ com API

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa Vendas Hoje
    And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T151
  Scenario: Quantidade de vendas é igual a API
    Given Usuário acessou Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API

  @TestCaseKey=SMP-T154
  Scenario Outline: Estabelecimentos no filtro é igual a API
    Given Usuário abriu a opção "<accordion>" no filtro de Vendas Hoje
    Then Opções do filtro corresponderão aos ECs da API
    @pt-br
    Examples:
      | accordion           |
      | Estabelecimento (0) |

  @ignore
  @TestCaseKey=SMP-T163
  Scenario: Compara primeira página do histórico de venda hoje com API
    Given Usuário acessou Vendas Hoje
    Then Primeira página do histórico de venda hoje serão equivalentes com a API

  @ignore # TODO: confirmar a api desta tela...
  @UsuárioMaster
  @TestCaseKey=SMP-T288
  Scenario: Vendas HOJE com seleção de EC (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    When Usuário acessa Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

