#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Negocio/Negocio
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Negocio

  @TestCaseKey=LPDC-T1351
  Scenario: Validar informacoes do estabelecimento
    Given que estou no portal
    When clico no menu Negocio
    Then devo ver o estabelecimento com o CNPJ
    And o botao Trocar Estabelecimento deve estar visivel
    And na aba Meus Terminais
    Then devo ver os terminais com suas datas de habilitação e valores de aluguel
    And na aba Taxas e Tarifas
    Then devo ver as bandeiras com suas respectivas taxas

