#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/GasDoPovo/Gas_do_Povo
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Gas do Povo

  @TestCaseKey=LPDC-T1837
  Scenario: Validar transação "Gás do povo" na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações do dia
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"

  @TestCaseKey=LPDC-T1836
  Scenario: Gerar comprovante PDF da transação "Gás do povo" na aba "Hoje"
    Given acesso a aba "Hoje"
    When seleciono uma transação "Gás do povo"
    Then deve ser gerado um comprovante PDF da transação

  @TestCaseKey=LPDC-T1838
  Scenario Outline: Gerar relatório arquivo <arquivo> com dados "Gás do povo" na aba "Hoje"
    Given acesso a aba "Hoje"
    When seleciono a opção de exportar dados
    Then deve ser gerado um relatório arquivo <arquivo> com os dados "Gás do povo"
    Examples:
      | arquivo |
      | Excel   |
      | CSV     |

  @TestCaseKey=LPDC-T1839
  Scenario: Validar transação "Gás do povo" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"

  @TestCaseKey=LPDC-T1841
  Scenario: Gerar comprovante PDF da transação "Gás do povo" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When seleciono uma transação "Gás do povo"
    Then deve ser gerado um comprovante PDF da transação

  @TestCaseKey=LPDC-T1840
  Scenario Outline: Gerar relatório <relatorio> arquivo <arquivo> com dados "Gás do povo" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When seleciono a opção de exportar dados <relatorio>
    Then deve ser gerado um relatório <relatorio> arquivo <arquivo> com os dados "Gás do povo"
    Examples:
      | arquivo | relatorio    |
      | Excel   | Simplificado |
      | Excel   | Detalhado    |
      | CSV     | Simplificado |
      | CSV     | Detalhado    |
      | PDF     | Simplificado |
      | PDF     | Detalhado    |

