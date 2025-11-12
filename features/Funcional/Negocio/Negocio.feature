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

  @TestCaseKey=LPDC-T1990
  Scenario: Verificar mensagem de ausência de informações quando nenhuma bandeira está ativa
    Given acesso o menu "Negócio"
    And acesso o card "Taxas e tarifas"
    When a API não retorna status "ATIVO" para nenhuma bandeira
    Then deve ser exibida a mensagem "Sem informações a serem apresentadas."

  @TestCaseKey=LPDC-T1991
  Scenario Outline: Verificar acesso ao card "Taxas e tarifas" por diferentes perfis de usuário
    Given acesso o menu "Negócio"
    When o usuário tem o perfil <perfil>
    And o card "Taxas e tarifas" deve estar acessível
    When a API retorna status "ATIVO" para qualquer bandeira
    Then todas as bandeiras (Elo, Visa, Mastercard, Amex e Cabal) devem ser exibidas
    Examples:
      | perfil     |
      | Master     |
      | Secundario |
      | Operador   |

