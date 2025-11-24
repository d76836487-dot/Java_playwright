#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SplitPagamentos/SplitDePagamentoV2
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SplitDePagamentoV2

  @TestCaseKey=LPDC-T1510
  Scenario: Acessar a sub-aba "Alterações Programadas"
    Given que sou um franqueador logado no portal
    When eu clico no ícone da aba "Split de Pagamento"
    And seleciono a sub-aba "Alterações Programadas"
    Then eu devo ver uma lista de regras programadas com as seguintes colunas:
      | Nome e EC              |
      | Desconto da taxa (MDR) |
      | % do agente            |
      | Início da vigência     |
      | Status                 |
      | Editar                 |

  @TestCaseKey=LPDC-T1512
  Scenario: Editar uma Regra Programada
    Given que estou na sub-aba "Alterações Programadas" e vejo uma regra com status "Programada"
    When eu clico no ícone "Editar" da regra programada
    Then um modal deve aparecer com os campos para editar a regra
    And eu devo ver a opção "Cancelar alteração programada"

  @TestCaseKey=LPDC-T1516
  Scenario: Cancelar uma Regra Programada
    Given que estou no modal de edição de uma regra programada
    When eu clico no botão "Cancelar alteração programada"
    Then um modal de confirmação deve aparecer solicitando a confirmação do cancelamento

  @TestCaseKey=LPDC-T1513
  Scenario: Confirmar o Cancelamento de uma Regra Programada
    Given que o modal de confirmação de cancelamento está aberto
    When eu clico no botão "Cancelar alteração"
    Then o cancelamento deve ser efetivado via API
    And o modal deve ser fechado
    And uma mensagem "Alterações salvas com sucesso" deve aparecer na tela

  @TestCaseKey=LPDC-T1514
  Scenario: Aplicar Alterações em uma Regra Programada
    Given que estou no modal de edição de uma regra programada
    And preenchi os dados necessários no card "Alterar remuneração"
    When eu clico no botão "Aplicar"
    Then um modal de confirmação deve aparecer com os detalhes da edição

  @TestCaseKey=LPDC-T1527
  Scenario: Editar Múltiplas Regras Programadas
    Given que estou na sub-aba "Alterações Programadas"
    And selecionei várias regras programadas
    When eu clico no botão "Editar selecionados"
    Then um modal deve aparecer com todas as regras selecionadas para edição ou cancelamento

  @TestCaseKey=LPDC-T1519
  Scenario: Cancelar Múltiplas Regras Programadas
    Given que estou no modal de edição em massa de regras programadas
    When eu clico no botão "Cancelar alteração programada"
    Then um modal de confirmação deve aparecer para o cancelamento das regras selecionadas
    And se as taxas forem diferentes, o campo "% do agente" deve mostrar "Múltiplos"

  @TestCaseKey=LPDC-T1521
  Scenario: Nenhuma Regra Futura Programada
    Given que sou um franqueador logado no portal
    And não tenho nenhuma regra programada
    When eu acesso a sub-aba "Alterações Programadas"
    Then eu devo ver a mensagem "Você ainda não criou nenhuma alteração programada"

  @TestCaseKey=LPDC-T1530
  Scenario: Visualizar Regras com Status "Programada"
    Given que sou um franqueador logado no portal
    When eu acesso a sub-aba "Alterações Programadas"
    Then eu devo ver uma lista de regras com o status "Programada"
    And o status deve ser representado como "scheduled" na API GET Arrangements
    And o status deve aparecer na interface do usuário como "Programada"

  @TestCaseKey=LPDC-T1522
  Scenario: Visualizar Regras com Status "Substituído"
    Given que sou um franqueador logado no portal
    When eu acesso a aba "Regras"
    Then eu devo ver regras com o status "Substituído"
    And o status deve ser representado como "superseded" na API GET Arrangements
    And o status deve aparecer na interface do usuário com a cor vermelha e a descrição "Substituído"

  @TestCaseKey=LPDC-T1525
  Scenario: Acessar a aba "Split de Pagamento"
    Given que sou um franqueador logado no portal
    When eu clico no ícone da aba "Split de Pagamento"
    Then eu devo ver as sub-abas "Regras" e "Alterações Programadas"

  @TestCaseKey=LPDC-T1509
  Scenario: Visualizar Regras Atuais
    Given que estou na aba "Regras"
    Then eu devo ver uma lista de regras com as seguintes colunas:
      | Nome e EC              |
      | Desconto da taxa (MDR) |
      | % do agente            |
      | Início da vigência     |
      | Término                |
      | Status                 |
      | Editar                 |

  @TestCaseKey=LPDC-T1531
  Scenario Outline: Validar as cores e descrições dos statuses
    Given que existe uma regra com status "<Status>"
    When um franqueador visualiza a aba de alteração programada
    Then o status deve ser exibido com a cor "<Cor>"
    And a descrição deve ser "<Descrição>"
    Examples:
      | Status      | Cor      | Descrição   |
      | Ativo       | Verde    | Ativo       |
      | Suspenso    | Amarelo  | Suspenso    |
      | Terminado   | Vermelho | Terminado   |
      | Programada  | Amarelo  | Programada  |
      | Substituído | Vermelho | Substituído |

  @TestCaseKey=LPDC-T1529
  Scenario: Editar uma Regra Ativa
    Given que estou na aba "Regras" e vejo uma regra com status "Ativo"
    When eu clico no ícone "Editar" da regra
    Then um modal deve aparecer com os campos:
      | Nome e EC                              |
      | % do agente atual                      |
      | Taxa MDR                               |
      | Início da vigência                     |
      | Porcentagem de remuneração do agente   |
      | Quem arca com a taxa de desconto (MDR) |
    And eu vejo um calendário para escolher a data

  @TestCaseKey=LPDC-T1528
  Scenario: Aplicar Alterações em uma Regra
    Given que estou no modal de edição da regra
    When eu preencho os campos corretamente e seleciono uma data válida
    And eu clico no botão "Aplicar"
    Then um modal de confirmação deve aparecer
    And eu posso confirmar ou voltar para editar

  @TestCaseKey=LPDC-T1526
  Scenario: Editar Regras em Massa
    Given que estou na aba "Regras"
    When eu seleciono múltiplas regras ativas
    And clico no botão "Editar em massa"
    Then um modal específico para edição em massa deve aparecer com:
      | Porcentagem da remuneração do agente   |
      | Quem arca com a taxa de desconto (MDR) |
      | Início da vigência                     |
    And eu posso aplicar as alterações para todos os ECs selecionados

  @TestCaseKey=LPDC-T1517
  Scenario: Filtrar Regras
    Given que estou na aba "Regras"
    When eu aplico filtros para "Status" e "Taxa MDR"
    Then a lista de regras deve refletir os critérios de filtro selecionados

  @TestCaseKey=LPDC-T1515
  Scenario: Aplicar nova regra de royalties para um EC
    Given que sou um franqueador logado no portal
    And já estou na aba "Split de Pagamento"
    And tenho uma regra ativa para o EC "Franqueado A"
    When eu clico no ícone "Editar" da regra ativa do EC "Franqueado A"
    And eu preencho os seguintes campos no modal:
      | % do agente                            | 8            |
      | Taxa MDR                               | 2%           |
      | Início da vigência                     | "2023-11-01" |
      | Quem arca com a taxa de desconto (MDR) | "Agente"     |
    And eu clico no botão "Aplicar"
    Then um modal de confirmação deve aparecer com as informações:
      | Nome e EC          | "Franqueado A" |
      | % do agente        | 8%             |
      | Taxa MDR           | 2%             |
      | Início da vigência | "2023-11-01"   |
    When eu clico em "Confirmar"
    Then a nova regra de royalties deve ser salva e um pop-up de sucesso deve aparecer

  @TestCaseKey=LPDC-T1518
  Scenario: Editar regra em massa para múltiplos Ecs
    Given que estou na aba "Regras"
    And selecionei as regras ativas dos Ecs "Franqueado B" e "Franqueado C"
    When eu clico no botão "Editar em massa"
    And eu preencho os seguintes campos no modal:
      | % da remuneração do agente             | 10           |
      | Quem arca com a taxa de desconto (MDR) | "Vendedor"   |
      | Início da vigência                     | "2023-12-01" |
    And eu clico no botão "Aplicar"
    Then um modal de confirmação deverá aparecer com os seguintes detalhes:
      | Nome e EC                  | "Franqueado B, Franqueado C" |
      | % da remuneração do agente | 10%                          |
      | Início da vigência         | "2023-12-01"                 |
    When eu clico em "Confirmar"
    Then as novas regras de royalties para "Franqueado B" e "Franqueado C" devem ser salvas e um pop-up de sucesso deve aparecer

  @TestCaseKey=LPDC-T1520
  Scenario: Tentar aplicar uma regra com data de início inválida
    Given que estou na aba "Split de Pagamento"
    When eu clico no ícone "Editar" de uma regra
    And eu preencho o campo "Início da vigência" com uma data anterior a hoje
    And eu clico no botão "Aplicar"
    Then a mensagem "A data de início deve ser igual ou superior à data de hoje" deve aparecer
    And o botão "Aplicar" deve permanecer desabilitado

  @TestCaseKey=LPDC-T1511
  Scenario: Validar regra de royalties com status Ativo
    Given existe uma regra de royalties configurada como "Ativo" para um EC
    When um franqueador consulta a aba "Split de Pagamento"
    Then o status da regra deve ser exibido como "Ativo"
    And deve haver apenas uma regra ativa para esse EC

  @TestCaseKey=LPDC-T1523
  Scenario: Validar regra de royalties com status Terminado ou Suspenso
    Given existe uma regra de royalties configurada como "Terminado"
    When um franqueador consulta a aba "Split de Pagamento"
    Then o status da regra deve ser exibido como
      | Status | Terminado | Suspenso |
    And a regra não deve ser editável ou ativa

  @TestCaseKey=LPDC-T1524
  Scenario: Garantir que os status Terminado e Suspenso não são editáveis
    Given existe uma regra de royalties com status <Terminado> <Suspenso>
    When o franqueador tenta editar essa regra
    Then a edição deve esta inabilitada

  @TestCaseKey=LPDC-T1999
  Scenario: Visualização correta do campo "Nome e EC" para um split ativo
    Given que o usuário está logado no sistema
    When o usuário navega para a aba "Split de pagamento"
    And existe um registro de split de pagamento com o novo campo da API preenchido
    Then o valor exibido na coluna "Nome e EC" deve corresponder ao valor do novo campo da API

