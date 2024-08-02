#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Context/RefreshToken/Refresh_Token
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Refresh Token



  @TestCaseKey=LPDC-T557
  Scenario Outline: Refresh Token verificacao em minutos de inatividade

    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    And waiting time
   And aguarde o tempo de "<minutos>" minutos e mexa o mouse "<mouse>"
    And Check empty session
    #When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    #And waiting time "<minutos>"
    #When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    #And waiting time "<minutos>"
    #And Check empty session
    #When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    #And waiting time "<minutos>"
    #And Check empty session
    And logout
    @refreshtokenS
    Examples:
      | Description    | alianca | menu    |submenu|thirdmenu|minutos|mouse|
      #| Usuario master | sicredi | Negócio |       |         |5      ||
      #| Usuario master | sicredi | Negócio |       |         |14     ||
      | Usuario master | sicredi | Negócio |       |         |16     |S   |



  Scenario Outline: Refresh Token verificacao em minutos de inatividade sem mexer o mouse
    Given open portal "<alianca>" and logon
    When click on menu "<menu>" "<submenu>" "<thirdmenu>"
    And aguarde o tempo de "<minutos>" minutos e mexa o mouse "<mouse>"
    And Check empty session
    And logout
    @refreshtokenN
    Examples:

      | Description    | alianca | menu    |submenu  |thirdmenu   |minutos  |mouse|
      | Description    | alianca | menu    | submenu  | thirdmenu | minutos |S    |
      | Usuario master | sicredi | Negócio |          |           | 5       |S    |
      | Usuario master | sicredi | Negócio |          |           | 14      |S    |
      | Usuario master | sicredi | Negócio |          |           |16       |N   |


