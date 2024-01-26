#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Login

  Scenario: Login com sucesso
    When Usuário tenta logar na aplicacao
    Then Usuário estará com acesso
