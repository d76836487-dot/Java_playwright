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

  @TestCaseKey=LPDC-T1913
  Scenario: Validar transação de um "Novo credenciamento" "Gás do povo" com status "Aprovada" na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Aprovada"

  @TestCaseKey=LPDC-T1915
  Scenario: Validar transação de um "Novo credenciamento" "Gás do povo" com status "Aprovada" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Aprovada"

  @TestCaseKey=LPDC-T1914
  Scenario: Validar transação de um "Novo credenciamento" "Gás do povo" com status "Estornada" na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Estornada"

  @TestCaseKey=LPDC-T1916
  Scenario: Validar transação de um "Novo credenciamento" "Gás do povo" com status "Estornada" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Estornada"

  @TestCaseKey=LPDC-T1917
  Scenario: Validar transação de um "EC credenciado" "Gás do povo" com status "Aprovada" na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Aprovada"

  @TestCaseKey=LPDC-T1912
  Scenario: Validar transação de um "EC credenciado" "Gás do povo" com status "Aprovada" na aba "Histórico de vendas"
    Given acesso a aba "Histórico de vendas"
    When visualizo as transações passadas
    Then o tipo de transação deve ser "Gás do povo"
    And os valores das transações devem estar corretos
    And o produto e a modalidade devem ter a descrição e experiência como "Voucher"
    And o status deve estar como "Aprovada"

  @TestCaseKey=LPDC-T1935
  Scenario: Validar transação Pix na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações passadas
    Then o tipo de transação deve ser Pix

  @TestCaseKey=LPDC-T1934
  Scenario: Validar transação Tap on Phone na aba "Hoje"
    Given acesso a aba "Hoje"
    When visualizo as transações passadas
    Then deve apresentar uma transação Tap on Phone

  @TestCaseKey=LPDC-T1982
  Scenario: Verificar bandeiras na aba Voucher do menu de vendas antigo
    Given que estou na aba "Voucher" do menu de vendas antigo
    When faço uma requisição de bandeiras
    Then as bandeiras retornadas devem incluir:
      | Bandeira    |
      | Gas do povo |
      | Cabal       |
      | Banese      |
      | Ticket      |
      | Alelo       |
      | Sorocred    |
      | Banestes    |
      | Pluxee      |
      | VR          |
      | Softnex     |
      | Redecompras |
      | Fepas       |
      | Sodexo      |

  @TestCaseKey=LPDC-T1981
  Scenario: Validar resposta da API com a bandeira "Gás do povo"
    Given que estou na aba "Voucher" do menu de vendas antigo
    When faço uma requisição de bandeiras para a API
    Then a resposta da API deve conter a bandeira "Gás do povo"

  @TestCaseKey=LPDC-T1980
  Scenario: Verificar bandeira "Gás do povo" para EC credenciado (legado)
    Given que estou na aba "Voucher" do menu de vendas antigo
    And o EC está credenciado com os dados:
      | EC       | CNPJ           | Email        |
      | 91088751 | 15233795000155 | Fiserv@12345 |
    When faço uma requisição de bandeiras
    Then a bandeira "Gás do povo" deve estar presente na resposta

  @TestCaseKey=LPDC-T1983
  Scenario: Verificar bandeira "Gás do povo" para novo credenciamento
    Given que estou na aba "Voucher" do menu de vendas antigo
    And o EC está credenciado com os dados:
      | EC       | CNPJ           | Email        |
      | 91943342 | 09268929000170 | Fiserv@12345 |
    When faço uma requisição de bandeiras
    Then a bandeira "Gás do povo" deve estar presente na resposta

