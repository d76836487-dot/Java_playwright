#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/HomeLogadaNubank
@Zephyr:Status=Approved
@Zephyr:Component=BDD
@Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: HomeLogadaNubank
 
  @TestCaseKey=LPDC-T1735
  Scenario: Verificar transações permitidas para a aliança Nubank
    Given que a aliança "Nubank" está configurada
    When verifico as transações permitidas
    Then apenas transações de "cartão presente" devem estar disponíveis
    And transações de "pix van" e "conta pix Fiserv" não devem estar disponíveis

  @TestCaseKey=LPDC-T1737
  Scenario: Verificar look & feel da aliança Nubank
    Given que a aliança "Nubank" está configurada
    When acesso a aliança "Nubank"
    Then o look & feel deve ser específico do Nubank
    And o ícone deve ser específico do Nubank
    And as cores devem ser específicas do Nubank

  @TestCaseKey=LPDC-T1734
  Scenario: Verificar produtos não disponíveis na aliança Nubank
    Given que a aliança "Nubank" está configurada
    When verifico os produtos disponíveis
    Then os produtos "Link de Pagamento e E-commerce", "Pix van" e "Pix Fiserv" não devem estar disponíveis

  @TestCaseKey=LPDC-T1738
  Scenario Outline: Testar acesso de diferentes perfis de usuário
    Given que a aliança "Nubank" está configurada
    When o usuário <perfil> acessa a aliança "Nubank"
    Then o usuário deve conseguir acessar a aliança com sucesso
    Examples:
      | perfil     |
      | Master     |
      | Secundário |
      | Operador   |

  @TestCaseKey=LPDC-T1732
  Scenario: Verificar cores dinâmicas da aliança Nubank
    Given que a aliança "Nubank" está configurada
    When acesso a aliança "Nubank"
    Then as cores dinâmicas devem estar configuradas conforme especificado no Figma

  @TestCaseKey=LPDC-T1739
  Scenario: Verificar ícone específico da aliança Nubank
    Given que a aliança "Nubank" está configurada
    When acesso a aliança "Nubank"
    Then o ícone deve ser específico do Nubank

  @TestCaseKey=LPDC-T1733
  Scenario: Verificar acesso de usuário Master
    Given que a aliança "Nubank" está configurada
    When o usuário Master acessa a aliança "Nubank"
    Then o usuário deve conseguir acessar a aliança com sucesso

  @TestCaseKey=LPDC-T1740
  Scenario: Verificar acesso de usuário Secundário
    Given que a aliança "Nubank" está configurada
    When o usuário Secundário acessa a aliança "Nubank"
    Then o usuário deve conseguir acessar a aliança com sucesso

  @TestCaseKey=LPDC-T1736
  Scenario: Verificar acesso de usuário Operador
    Given que a aliança "Nubank" está configurada
    When o usuário Operador acessa a aliança "Nubank"
    Then o usuário deve conseguir acessar a aliança com sucesso

