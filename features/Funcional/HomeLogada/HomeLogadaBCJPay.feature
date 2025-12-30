#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/HomeLogadaBCJPay
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: HomeLogadaBCJPay
 
  @TestCaseKey=LPDC-T1764
  Scenario: Verificar o look & feel da aliança BCJ Pay
    Given acesso no portal com a aliança BCJ Pay configurada
    When visualizo a página inicial da aliança
    Then o ícone específico da BCJ Pay é exibido
    And as cores específicas da BCJ Pay são exibidas

  @TestCaseKey=LPDC-T1761
  Scenario: Verificar produtos disponíveis na aliança BCJ Pay
    Given acesso ao portal com a aliança BCJ Pay e configurada
    When visualizo a lista de produtos disponíveis
    Then os produtos "Antecipaçao", "Link de Pagamento e E-commerce", "Pix van" e "Pix Fiserv" estão disponíveis

  @TestCaseKey=LPDC-T1760
  Scenario: Testar acesso com perfil Master
    Given acesso do portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil Master
    When tento acessar todas as funcionalidades
    Then todas as funcionalidades estão disponíveis para o perfil Master

  @TestCaseKey=LPDC-T1762
  Scenario: Testar acesso com perfil Secundário de Operação
    Given acesso via portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil Secundário de Operação
    When tento acessar funcionalidades de operação
    Then as funcionalidades de operação estão disponíveis para o perfil Secundário de Operação

  @TestCaseKey=LPDC-T1768
  Scenario: Testar acesso com perfil Secundário de Consulta
    Given acesso pelo portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil Secundário de Consulta
    When tento acessar funcionalidades de consulta
    Then as funcionalidades de consulta estão disponíveis para o perfil Secundário de Consulta

  @TestCaseKey=LPDC-T1767
  Scenario: Testar acesso com perfil Secundário de Link de Pagamento
    Given acesso com portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil Secundário de Link de Pagamento
    When tento acessar funcionalidades de link de pagamento
    Then as funcionalidades de link de pagamento estão disponíveis para o perfil Secundário de Link de Pagamento

  @TestCaseKey=LPDC-T1763
  Scenario: Testar acesso com perfil Operador F
    Given acesso portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil Operador F
    When tento acessar funcionalidades específicas de Operador F
    Then as funcionalidades específicas de Operador F estão disponíveis para o perfil Operador F

  @TestCaseKey=LPDC-T1766
  Scenario: Testar acesso com perfil Operador sem F
    Given acesso via portal com a aliança BCJ Pay configurado
    And faço login com um usuário de perfil Operador sem F
    When tento acessar funcionalidades específicas de Operador sem F
    Then as funcionalidades específicas de Operador sem F estão disponíveis para o perfil Operador sem F

  @TestCaseKey=LPDC-T1765
  Scenario Outline: Testar acesso com diferentes perfis
    Given acesso ao portal com a aliança BCJ Pay configurada
    And faço login com um usuário de perfil <perfil>
    When tento acessar funcionalidades específicas de <perfil>
    Then as funcionalidades específicas de <perfil> estão disponíveis para o perfil <perfil>
    Examples:
      | perfil                          |
      | Master                          |
      | Secundario de Operacao          |
      | Secundario de Consulta          |
      | Secundario de Link de Pagamento |
      | Operador F                      |
      | Operador sem F                  |

  @TestCaseKey=LPDC-T2000
  Scenario: Alteração de ícone do portal BCJ Pay
    Given que estou logado no portal
    And estou na página principal do portal BCJ
    And valido as imagens de logo da aliança BCJ Pay nas demais abas do portal
    Then os ícones das demais abas devem está no formanto esperado de acorodo com o Figma

