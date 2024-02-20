#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Esqueci_Minha_Senha
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Esqueci Minha Senha

  Background:
    Given Usuário acessou o portal
    And Usuário clicou no botão esqueci minha senha

  @TestCaseKey=SMP-T14
  Scenario: Usuário não existente no GA1 nem no GA2 e sem cadastro na Fiserv
    When Usuário tenta recuperar senha com "71633816000210"
    Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"

