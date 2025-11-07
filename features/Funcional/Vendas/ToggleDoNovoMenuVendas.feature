#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/ToggleDoNovoMenuVendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: ToggleDoNovoMenuVendas

Scenario: Verificar toggle por aliança para diferentes perfis
    Given acesso a plataforma de vendas como "Master"
    When seleciono a opção de histórico de vendas
    And escolho a aliança "Caixa"
    Then o histórico de vendas é exibido apenas para a aliança "Caixa"

    Given acesso a plataforma de vendas como "Secundário"
    When seleciono a opção de histórico de vendas
    And escolho a aliança "Caixa"
    Then o histórico de vendas é exibido apenas para a aliança "Caixa"

    Given acesso a plataforma de vendas como "Operador"
    When seleciono a opção de histórico de vendas
    And escolho a aliança "Caixa"
    Then o histórico de vendas é exibido apenas para a aliança "Caixa"

Scenario Outline: Verificar histórico de vendas para diferentes alianças
    Given acesso a plataforma de vendas
    When seleciono a opção de histórico de vendas
    And escolho a aliança "<alianca>"
    Then o histórico de vendas é exibido apenas para a alianca "<alianca>"
    Examples:
      | alianca  |
      | Caixa    |
      | Sicredi  |
      | Bin      |

Scenario Outline: Verificar ausência de histórico de vendas para alianças não selecionadas
    Given acesso a plataforma de vendas
    When seleciono a opção de histórico de vendas
    And escolho a aliança "alianca"
    Then o histórico de vendas não é exibido para a aliança "alianca"
    And o histórico de vendas não é exibido para a aliança "alianca"
    Examples:
      | alianca |
      | Caixa   |
      | Sicredi |
      | Bin     |

Scenario Outline: Verificar persistência da seleção de aliança
    Given acesso a plataforma de vendas
    When seleciono a opção de histórico de vendas
    And escolho a aliança "alianca"
    And navego para outra página
    And retorno à página de histórico de vendas
    Then a aliança "alianca" deve permanecer selecionada
    Examples:
    | alianca  |
    | Caixa    |
    | Sicredi  |
    | Bin      |

Scenario Outline: Verificar toggle por aliança após logout e login
    Given acesso a plataforma de vendas
    When seleciono a opção de histórico de vendas
    And escolho a aliança "alianca"
    And faço logout
    And faço login novamente
    Then a aliança "alianca" deve permanecer selecionada
    Examples:
    | alianca |
    | Caixa   |
    | Sicredi |
    | Bin     |
