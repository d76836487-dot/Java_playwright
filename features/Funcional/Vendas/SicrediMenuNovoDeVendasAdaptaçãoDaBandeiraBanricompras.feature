#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/SicrediMenuNovoDeVendasAdaptaçãoDaBandeiraBanricompras
@Zephyr:Status=Approved
@Zephyr:Component=BDD&Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SicrediMenuNovoDeVendasAdaptaçãoDaBandeiraBanricompras

  @TestCaseKey=LPDC-T2051
  Scenario: Mapeamento de parcelas para débito parcelado na aba "Hoje"
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Hoje" no menu de vendas antigo
    Then o campo "Parcelas" deve retornar a quantidade de parcelas da transação realizada

  @TestCaseKey=LPDC-T2052
  Scenario: Exportação de vendas "Hoje" com transações de débito parcelado
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Hoje" no menu de vendas antigo
    And exporto os dados de vendas em formato Excel
    Then o campo "Parcelas" deve estar presente nos dados exportados
    And a quantidade de parcelas deve ser correspondente à transação

  @TestCaseKey=LPDC-T2053
  Scenario: Exportação de vendas "Hoje" com transações de débito parcelado (CSV)
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Hoje" no menu de vendas antigo
    And exporto os dados de vendas em formato CSV
    Then o campo "Parcelas" deve estar presente nos dados exportados
    And a quantidade de parcelas deve ser correspondente à transação

  @TestCaseKey=LPDC-T2056
  Scenario: Mapeamento de parcelas para débito parcelado na aba "Voucher/Van"
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Voucher/Van" no menu de vendas antigo
    Then o campo "Parcelas" deve retornar a quantidade de parcelas da transação realizada

  @TestCaseKey=LPDC-T2060
  Scenario: Exportação de vendas "Voucher/Van" com transações de débito parcelado
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Voucher/Van" no menu de vendas antigo
    And exporto os dados de vendas em formato Excel
    Then o campo "Parcelas" deve estar presente nos dados exportados
    And a quantidade de parcelas deve ser correspondente à transação

  @TestCaseKey=LPDC-T2061
  Scenario: Exportação de vendas "Voucher/Van" com transações de débito parcelado (CSV)
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito parcelado" na aba "Voucher/Van" no menu de vendas antigo
    And exporto os dados de vendas em formato CSV
    Then o campo "Parcelas" deve estar presente nos dados exportados
    And a quantidade de parcelas deve ser correspondente à transação

  @TestCaseKey=LPDC-T2057
  Scenario: Evidenciar transação de débito pré-datado na aba vendas "Hoje"
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito pré-datado" na aba "Hoje" no menu de vendas antigo
    Then a transação deve ser registrada corretamente para visualização

  @TestCaseKey=LPDC-T2058
  Scenario: Evidenciar transação de débito pré-datado na aba vendas "Voucher/Van"
    Given a plataforma está adaptada para a bandeira Banricompras
    And a aliança é Sicredi
    When realizo uma transação de "Débito pré-datado" na aba "Voucher/Van" no menu de vendas antigo
    Then a transação deve ser registrada corretamente para visualização

  @TestCaseKey=LPDC-T2059
  Scenario: Verificar transação de débito parcelado Banricompras na aba "Hoje"
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo uma venda de "Débito parcelado" Banricompras na aba "Hoje"
    Then o campo "Modalidade" deve exibir o valor "Débito parcelado x2"

  @TestCaseKey=LPDC-T2065
  Scenario: Verificar exibição de parcelas nas vendas Banricompras
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo uma venda de "Débito parcelado" Banricompras na aba "Hoje"
    Then o campo de valor deve exibir o formato "R$ valor x De Parcelas"
    And os campos “Modalidade” e “Produto” devem exibir a informação "Débito", "Débito parcelado"

  @TestCaseKey=LPDC-T2063
  Scenario: Exibir mensagem de consulta para vendas Banricompras
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo uma venda de "Débito parcelado" Banricompras na aba "Hoje"
    Then deve aparecer a mensagem "Para consultar os valores líquidos ou cancelar a venda acesse o portal da bandeira"

  @TestCaseKey=LPDC-T2062
  Scenario: Exportar comprovante de autorização em PDF, Excel e CSV
    Given eu acesso a plataforma como um perfil Sicredi
    When eu exporto o comprovante de autorização para uma venda de "Débito parcelado" Banricompras
    Then o arquivo PDF deve conter a informação "Débito parcelado x2"
    And o arquivo Excel deve conter a informação "Débito parcelado x2"
    And o arquivo CSV deve conter a informação "Débito parcelado x2"

  @TestCaseKey=LPDC-T2067
  Scenario: Verificar transação de débito parcelado Banricompras na aba "Histórico"
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo uma venda de "Débito parcelado" Banricompras na aba "Histórico"
    Then o campo "Modalidade" deve exibir o valor "Débito parcelado x2"

  @TestCaseKey=LPDC-T2064
  Scenario: Exportar dados de transações de débito parcelado Banricompras na aba "Histórico"
    Given eu acesso a plataforma como um perfil Sicredi
    When eu exporto dados de transações da aba "Histórico" para Excel e CSV
    Then os arquivos devem incluir a informação "Débito parcelado x2"

  @TestCaseKey=LPDC-T2066
  Scenario: Adaptar detalhes de venda de débito pré-datado Banricompras na aba "Hoje"
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo o detalhe de uma venda de "Débito pré-datado" Banricompras na aba "Hoje"
    Then o card de “Recebimentos” não deve ser exibido
    And a mensagem "Para consultar os valores líquidos ou cancelar a venda acesse o portal da bandeira" deve ser apresentada

  @TestCaseKey=LPDC-T2068
  Scenario: Adaptar detalhes de venda de débito pré-datado Banricompras na aba "Histórico"
    Given eu acesso a plataforma como um perfil Sicredi
    When eu visualizo o detalhe de uma venda de "Débito pré-datado" Banricompras na aba "Histórico"
    Then o card de “Recebimentos” não deve ser exibido
    And a mensagem "Para consultar os valores líquidos ou cancelar a venda acesse o portal da bandeira" deve ser apresentada

  @TestCaseKey=LPDC-T2054
  Scenario Outline: Validar transações Banricompras para diferentes perfis
    Given eu acesso a plataforma como um perfil <Perfil>
    When eu visualizo uma venda de "Débito parcelado" Banricompras na aba "Hoje"
    Then o campo "Modalidade" deve exibir o valor "Débito parcelado x2"
    Examples:
      | Perfil     |
      | Master     |
      | Secundario |
      | Operador   |

  @TestCaseKey=LPDC-T2055
  Scenario Outline: Exportar dados de vendas Banricompras na aba "Hoje"
    Given eu acesso a plataforma como um perfil <Perfil>
    When eu exporto dados de transações da aba "Hoje" para Excel e CSV
    Then os arquivos devem incluir a informação "Débito parcelado x2"
    Examples:
      | Perfil     |
      | Master     |
      | Secundario |
      | Operador   |

