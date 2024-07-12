#language: en
@sicredi @bin003
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Exclusao_de_Conta/Exclusao_de_Conta
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Exclusao de Conta

  @TestCaseKey=SMP-T386
  Scenario Outline: Health check Minha Meu Perfil
    Given open portal "<alianca>" and logon
    When usuário clica "Header - Meu Perfil"
    And waiting
    And Usuário verá "Meu Perfil - Label Documento ou usuário"
    And Usuário verá "Meu Perfil - Label Endereço de e-mail"
    And Usuário verá "Meu Perfil - Label Celular"
    And Usuário verá "Meu Perfil - Label Configurações da conta"
    And Usuário verá "Meu Perfil - Label Excluir acesso digital"
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |

  @TestCaseKey=SMP-T388
  Scenario Outline: Popup Excluir acesso Digital
    Given open portal "<alianca>" and logon
    When usuário clica "Header - Meu Perfil"
    Then usuário clica "Meu Perfil - Label Excluir acesso digital"
    And Usuário verá "Excluir - Popup Excluir acesso digital"
  @sicredi @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |sicredi  |
  @afinz @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |afinz    |
  @azulzinha @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |azulzinha|
  @bin @alliances
    Examples:
      |Description        |alianca  |
      |Usuario master     |bin      |
