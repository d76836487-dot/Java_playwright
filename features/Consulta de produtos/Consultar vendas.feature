# language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Consulta_de_Produtos/Consulta_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
Feature: Validar Home Logada

  @TestCaseKey=SMP-T3
  Scenario: Fazer o login usuario bin 03
    * Acesso a url de login "acassoQa"
    * incluir login e senha
    * clicar no botão entrar
    * usuário será redirecionado para home logada

  @Zephyr:Status=Draft
  @Zephyr:Priority=Normal
  @TestCaseKey=SMP-T2
  Scenario: Acessar voucher via dashboard Últimas Vendas 2
    Given usuário está logado no Merchant Portal utilizando o CPF
    When  usuário clica no “Ver tudo” do dashboard “Últimas Vendas”
    And usuário clica na aba Voucher
    Then usuário será direcionado para a página de Voucher

  @Zephyr:Status=Draft
  @Zephyr:Priority=Normal
  @TestCaseKey=SMP-T4
  Scenario: Acessar Teste apagar depois
    Given usuário está logado no Merchant Portal utilizando o CPF
    When  usuário clica no “Ver tudo” do dashboard “Últimas Vendas”
    And usuário clica na aba Voucher
    Then usuário será direcionado para a página de Voucher

