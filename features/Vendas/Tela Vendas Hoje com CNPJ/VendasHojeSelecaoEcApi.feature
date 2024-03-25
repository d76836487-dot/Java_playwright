#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ com API e Seleção EC

  @ignore # TODO: confirmar a api desta tela...
  @UsuárioMaster
  @TestCaseKey=SMP-T288
  Scenario: Vendas HOJE com seleção de EC (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    When Usuário acessa Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

  @ignore # TODO: confirmar a api desta tela...
  @UsuárioMaster
  @TestCaseKey=SMP-T291
  Scenario: Vendas HOJE com seleção de Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento e clicar Acessar
    When Usuário acessa Vendas Hoje
    Then Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado

