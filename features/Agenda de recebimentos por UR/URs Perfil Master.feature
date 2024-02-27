#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR_Perfil_Master
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep
Feature: Agenda de recebimentos por UR Perfil Master

  O nome da Feature [Agenda de recebimentos por UR] devia ser igual ao nome do ultimo sub-folder listado na tag @Zephyr:Folder [Master], inclusive letras maiusculas e minusculas, exceto underline ('_'). (local [/builds/devsecops-brazil/qa/sqd-portal-do-cliente/portal-do-cliente/portal-do-cliente/features/Agenda de recebimentos por UR/URs Perfil Master.feature])

  @TestCaseKey=SMP-T168
  Scenario: Acesso Menu lateral
    Given Usuário Master esta logado no Portal
    When Usuário acessa Menu Lateral
    And clica em Recebimentos
    And clica em Agenda de recebimentos por UR
    Then Usuário Visualizara Agenda de recebimentos por UR

