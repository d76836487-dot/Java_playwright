#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/UR/Master
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep

Feature:Agenda de recebimentos por UR


  Scenario:Acesso Menu lateral
    Given Usuário Master esta logado no Portal
    When Usuário acessa Menu Lateral
    And clica em Recebimentos
    And clica em Agenda de recebimentos por UR
    Then Usuário Visualizara Agenda de recebimentos por UR