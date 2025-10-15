#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/OfertaCloverCapital
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: OfertaCloverCapital

  @TestCaseKey=LPDC-T1640
  Scenario: Exibir banner de elegibilidade quando usuário é elegível
    Given a feature toggle está ativado
    And o usuário pertence à aliança Bin
    And consulta a API de elegibilidade retorna elegível com valor pré-aprovado de R$5.000,00
    Then o banner de elegibilidade do Clover Capital deve ser exibido com o valor pré-aprovado de R$5.000,00

  @TestCaseKey=LPDC-T1631
  Scenario: Não exibir banner quando usuário não é elegível
    Given a feature toggle está ativado
    And o usuário pertence à aliança Bin
    And consulta a API de elegibilidade retorna não elegível
    Then o banner de elegibilidade do Clover Capital não deve ser exibido

  @TestCaseKey=LPDC-T1636
  Scenario Outline: Exibir banner com diferentes valores pré-aprovados
    Given a feature toggle está ativado
    And o usuário pertence à aliança Bin
    And consulta a API de elegibilidade retorna elegível com valor pré-aprovado de <valor>
    Then o banner de elegibilidade do Clover Capital deve ser exibido com o valor pré-aprovado de <valor>
    Examples:
      | valor       |
      | R$5.000,00  |
      | R$10.000,00 |

  @TestCaseKey=LPDC-T1639
  Scenario: Abrir modal ao clicar em "Saiba mais"
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    When o usuário clicar no botão "Saiba mais"
    Then um modal deve ser exibido com o valor pré-aprovado de R$5.000,00 e informações sobre o empréstimo
    And o modal deve conter o botão "Solicitar contato"

  @TestCaseKey=LPDC-T1644
  Scenario: Fechar modal ao clicar no "x"
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    When o usuário clicar no botão "x" do modal
    Then o modal deve ser fechado
    And o banner de elegibilidade deve continuar visível na home

  @TestCaseKey=LPDC-T1634
  Scenario: Solicitar contato através do modal
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    When o usuário clicar no botão "Solicitar contato"
    Then a API de registro de contato deve ser chamada com as informações do usuário
    And um modal de sucesso deve ser exibido confirmando o interesse do usuário

  @TestCaseKey=LPDC-T1632
  Scenario: Apresentar modal de erro quando a API de registro falha
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    And a API de registro de contato retorna erro
    When o usuário clicar no botão "Solicitar contato"
    Then um modal de erro deve ser exibido informando sobre a falha no registro

  @TestCaseKey=LPDC-T1633
  Scenario: Exibir mensagem de acompanhamento após solicitar contato
    Given a feature toggle está ativado
    And o usuário já solicitou contato anteriormente
    When o usuário visualizar o banner de elegibilidade
    Then o banner deve exibir a mensagem "Nosso time entrará em contato em até 24 horas"

  @TestCaseKey=LPDC-T1638
  Scenario Outline: Verificar comportamento com diferentes alianças
    Given a feature toggle está ativado
    And o usuário pertence à aliança <alianca>
    And consulta a API de elegibilidade retorna <status>
    Then o banner de elegibilidade do Clover Capital deve <acao>
    Examples:
      | alianca | status       | acao                                                |
      | Bin     | elegivel     | ser exibido com o valor pre-aprovado correspondente |
      | Bin     | nao elegivel | nao ser exibido                                     |
      | Outro   | elegivel     | nao ser exibido                                     |
      | Outro   | nao elegivel | nao ser exibido                                     |

  @TestCaseKey=LPDC-T1635
  Scenario: Banner não é exibido quando feature toggle está desativado
    Given a feature toggle está desativado
    And o usuário pertence à aliança Bin
    When o usuário acessar o portal do cliente
    Then o banner de elegibilidade do Clover Capital não deve ser exibido

  @TestCaseKey=LPDC-T1641
  Scenario: Modal atualizado após solicitar contato com sucesso
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    When o usuário clicar no botão "Solicitar contato"
    And a API de registro de contato é bem sucedida
    Then um modal de sucesso deve ser exibido com a mensagem de confirmação

  @TestCaseKey=LPDC-T1642
  Scenario: Modal atualizado após solicitar contato com falha
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    When o usuário clicar no botão "Solicitar contato"
    And a API de registro de contato falha
    Then um modal de erro deve ser exibido com a mensagem de falha no registro

  @TestCaseKey=LPDC-T1637
  Scenario: Reexibir modal sem valor pré-aprovado após solicitação
    Given a feature toggle está ativado
    And o usuário já solicitou contato anteriormente
    When o usuário clicar novamente no botão "Saiba mais"
    Then um modal deve ser exibido com a frase "Nosso time entrará em contato em até 24 horas" sem o valor pré-aprovado

  @TestCaseKey=LPDC-T1643
  Scenario: Manter banner após fechamento do modal
    Given a feature toggle está ativado
    And o usuário é elegível com valor pré-aprovado de R$5.000,00
    And o modal está aberto
    When o usuário fechar o modal
    Then o banner de elegibilidade do Clover Capital deve continuar visível na home

  @TestCaseKey=LPDC-T1776
  Scenario Outline: Verificar visibilidade da aba "Clover Capital" para usuários elegíveis
    Given que o usuário acessa o portal
    When o usuário demonstrou interesse na jornada do banner e clicou em "solicitar contato"
    Then a aba "Clover Capital" deve estar visível no menu lateral abaixo da opção "Negócio"
    Examples:
      | usuario              |
      | usuario elegivel     |
      | usuario nao elegivel |

  @TestCaseKey=LPDC-T1771
  Scenario: Verificar feature toggle por aliança
    Given que o usuário acessa o portal
    When a feature toggle está habilitada para a aliança "Bin"
    Then a aba "Clover Capital" deve estar visível no menu lateral abaixo da opção "Negócio"
    And quando a feature toggle está desabilitada para a aliança "Bin"
    Then a aba "Clover Capital" não deve estar visível no menu lateral

