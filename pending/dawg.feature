# language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Consulta_de_Produtos/Consulta_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
Feature: Validar Home Logada

  @TestCaseKey=SMP-T3
  Scenario: Fazer o login usuario bin 03
    * Acesso a url de login
    * incluir login e senha
    * clicar no botão entrar
    * usuário será redirecionado para home logada
