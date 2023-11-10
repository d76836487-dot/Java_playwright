# language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Consulta_de_Produtos/Consulta_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
Feature: Consulta de venda

  @TestCaseKey=SMP-T3
  Scenario: Acessar voucher via menu lateral
    * Dado usuário está logado no Merchant Portal utilizando o CPF
    * Quando usuário clica no menu Vendas na lateral esquerda
    * E usuário clica na aba Voucher
    * Então usuário será direcionado para a página de Voucher

  @Zephyr:Status=Draft
  @Zephyr:Priority=Normal
  @TestCaseKey=SMP-T2
  Scenario: Acessar voucher via dashboard Últimas Vendas 2
    Given usuário está logado no Merchant Portal utilizando o CPF
    When  usuário clica no “Ver tudo” do dashboard “Últimas Vendas”
    And usuário clica na aba Voucher
    Then usuário será direcionado para a página de Voucher

