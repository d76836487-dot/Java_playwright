#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ_com_API
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ com API

  Background:
    Given Usuário logou na aplicação
    And Usuário acessa Vendas Hoje

  @TestCaseKey=SMP-T151
  Scenario: Quantidade de vendas é igual a API
    Given Usuário acessou Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API

  @TestCaseKey=SMP-T154
  Scenario Outline: Estabelecimentos no filtro é igual a API
    Given Usuário abriu a opção "<accordion>" no filtro de Vendas Hoje
    Then Opções do filtro correspondem aos ECs da API
    @pt-br
    Examples:
      | accordion           |
      | Estabelecimento (0) |

