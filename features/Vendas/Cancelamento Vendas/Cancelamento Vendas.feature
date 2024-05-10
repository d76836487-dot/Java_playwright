#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Cancelamento_Vendas/Acesso_aos_menus_dentro_de_Vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
#noinspection CucumberUndefinedStep

@CancVds
Feature: Acesso aos menus dentro de Vendas
  Scenario:Visualização das opções adicionais ao acessar Vendas
    Given Usuário efetue logon
    When Usuário acessou página de Vendas
    Then ao clicar no menu lateral "Cancelamento de vendas"
    And verifica se a pagina  "Cancelamento de vendas" carregou com sucesso


#==========================================================================================================================================================
  @CancVds
  Scenario:Acesso ao Relatório de vendas
    Given Usuário efetue logon
    #When Usuário tenta logar na aplicação
    When Usuário acessou página de Vendas
    And ao clicar no menu lateral "Relatório de vendas"
  Then ele deve ver as informações de vendas atuais, incluindo abas para "Hoje", "Histórico de vendas", "Não efetivadas", "Pré autorizações" e "Voucher"


#==========================================================================================================================================================


  Scenario:Acesso ao Cancelamento de vendas
  Dado que o usuário está logado E está na seção de Vendas
  Quando ele clica em "Cancelamento de vendas"
  Então ele deve ser capaz de cancelar vendas realizadas, conforme necessário

#==========================================================================================================================================================

  Scenario:Cliente solicita cancelamento de transação
  Dado que o cliente está navegando no menu Histórico de vendas
  Quando o cliente clica sobre a transação que deseja cancelar
  Então um modal é aberto exibindo os detalhes da transação
  E há um botão "Solicitar cancelamento" disponível no modal

#==========================================================================================================================================================
  Scenario: Preenchimento do campo Valor para cancelamento parcial
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente preenche o campo Valor com um valor menor do que o valor original da transação
  Então o sistema entende que o cancelamento é parcial

 #==========================================================================================================================================================

  Scenario:Preenchimento do campo Valor para cancelamento total
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente preenche o campo Valor com um valor igual ao valor original da transação
  Então o sistema entende que o cancelamento é total

#==========================================================================================================================================================

  Scenario:Preenchimento do campo Valor com valor maior que o original
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente preenche o campo Valor com um valor maior do que o valor original da transação
  Então o sistema exibe a mensagem "O valor inserido é maior do que o valor original da transação. Por favor, insira um valor válido."

#==========================================================================================================================================================

  Scenario:Preenchimento do campo Valor com valor negativo
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente preenche o campo Valor com um valor negativo
  Então o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor positivo."

#==========================================================================================================================================================

  Scenario: Preenchimento do campo Valor com valor não numérico
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente preenche o campo Valor com um valor não numérico
  Então o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor numérico válido."

#==========================================================================================================================================================
  Scenario: Seleção de motivo para cancelamento
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente procura pelo campo Motivo
  Então o sistema exibe as seguintes opções para seleção:
  | Motivo                              |
  | Produto defeituoso                  |
  | Desistência da compra               |
  | Arrependimento                      |
  | Outro motivo                        |

#==========================================================================================================================================================
  Scenario: Seleção de "Outro motivo" e exibição do componente "Descreva brevemente o motivo"
  Dado que o cliente selecionou "Outro motivo" como motivo para cancelamento
  Quando o campo "Outro motivo" é selecionado
  Então o sistema exibe o componente "Descreva brevemente o motivo" com um contador regressivo de caracteres limitado a 40

#==========================================================================================================================================================
  Scenario: Fechamento do modal
  Dado que o cliente está visualizando os detalhes da transação no modal
  Quando o cliente clica no botão "x" ou "Fechar"
  Então o modal é fechado e o cliente é devolvido para o detalhe da venda anteriormente selecionada

#==========================================================================================================================================================
  Scenario: Registro do pedido de cancelamento
  Dado que o cliente preencheu todas as informações necessárias para o cancelamento da transação
  Quando o cliente clica no botão "Solicitar cancelamento"
  Então o sistema registra o pedido de cancelamen
