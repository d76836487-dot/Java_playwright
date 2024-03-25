#language: en
@playwright @api
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada_Conferindo_Com_Api_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home Logada Conferindo Com Api e Seleção EC

  @ignore # TODO: confirmar a api
  @UsuárioMaster
  @TestCaseKey=SMP-T287
  Scenario: Vendas HOJE com seleção de EC (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado

  @ignore # TODO: confirmar a api
  @UsuárioMaster
  @TestCaseKey=SMP-T290
  Scenario: Vendas HOJE com seleção de Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API do EC selecionado
    And 'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API do EC selecionado

