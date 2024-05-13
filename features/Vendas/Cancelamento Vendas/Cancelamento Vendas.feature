#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Cancelamento_Vendas/Cancelamento_de_Vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Cancelamento de Vendas

  @HealthCheck
  @TestCaseKey=SMP-T361
  Scenario: Visualização das opções adicionais ao acessar Vendas
    Given Usuário efetue logon
    When Usuário acessou página de Vendas
    Then ao clicar no menu lateral "Cancelamento de vendas"
    And verifica se a pagina  "Cancelamento de vendas" carregou com sucesso

  #==========================================================================================================================================================
  @HealthCheck
  @TestCaseKey=SMP-T363
  Scenario: Health check Relatório de vendas
    Given Usuário efetue logon
    #When Usuário tenta logar na aplicação
    When Usuário acessou página de Vendas
    And ao clicar no menu lateral "Relatório de vendas"
    Then ele deve ver as informações de vendas atuais, incluindo abas para "Hoje", "Histórico de vendas", "Não efetivadas", "Pré autorizações" e "Voucher"

  #==========================================================================================================================================================
  @SmokeTest @HealthCheck
  @TestCaseKey=SMP-T362
  Scenario Outline: Health check Cancelamento de vendas
    Given que o usuário está logado e está na seção de Vendas
    When solicitar um cancelamento de uma venda em "Historico de vendas" informando o motivo "<motivos>"
    Then A solicitação de cancelamento deve estar listada em "Histórico de cancelamentos" no menu "Cancelamento de Vendas"
    Examples:
      | Motivos            |
      | Cobrança Duplicata |

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T368
  Scenario: Cliente solicita cancelamento de transação
    Given que o cliente está navegando no menu Histórico de vendas
    When o cliente clica sobre a transação que deseja cancelar
    Then um modal é aberto exibindo os detalhes da transação
    And há um botão "Solicitar cancelamento" disponível no modal

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T372
  Scenario: Preenchimento do campo Valor para cancelamento parcial
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor menor do que o valor original da transação
    Then o sistema entende que o cancelamento é parcial

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T367
  Scenario: Preenchimento do campo Valor para cancelamento total
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor igual ao valor original da transação
    Then o sistema entende que o cancelamento é total

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T366
  Scenario: Preenchimento do campo Valor com valor maior que o original
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor maior do que o valor original da transação
    Then o sistema exibe a mensagem "O valor inserido é maior do que o valor original da transação. Por favor, insira um valor válido."

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T373
  Scenario: Preenchimento do campo Valor com valor negativo
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor negativo
    Then o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor positivo."

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T374
  Scenario: Preenchimento do campo Valor com valor não numérico
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor não numérico
    Then o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor numérico válido."

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T369
  Scenario: Seleção de motivo para cancelamento
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente procura pelo campo Motivo
    Then o sistema exibe as seguintes opções para seleção:
      | Motivo                |
      | Produto defeituoso    |
      | Desistência da compra |
      | Arrependimento        |
      | Outro motivo          |

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T370
  Scenario: Seleção de "Outro motivo" e exibição do componente "Descreva brevemente o motivo"
    Given que o cliente selecionou "Outro motivo" como motivo para cancelamento
    When o campo "Outro motivo" é selecionado
    Then o sistema exibe o componente "Descreva brevemente o motivo" com um contador regressivo de caracteres limitado a 40

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T371
  Scenario: Fechamento do modal
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente clica no botão "x" ou "Fechar"
    Then o modal é fechado e o cliente é devolvido para o detalhe da venda anteriormente selecionada

  #==========================================================================================================================================================
  @TestCaseKey=SMP-T365
  Scenario: Registro do pedido de cancelamento
    Given que o cliente preencheu todas as informações necessárias para o cancelamento da transação
    When o cliente clica no botão "Solicitar cancelamento"
    Then o sistema registra o pedido de cancelamen

