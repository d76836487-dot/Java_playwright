#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/NPS/Extração_da_base_de_respostas_NPS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep
Feature: Extração da base de respostas NPS

  @TestCaseKey=SMP-T120
  Scenario: Acessar as pesquisas NPS
    Given usuario perfil admin
    When acessa a area cliente
    And clica na caixa de NPS
    Then  exibe quadro coluna nome ,tipo do arq, periodo

  @TestCaseKey=SMP-T36
  Scenario: Busca por período de relatórios NPS gerados anteriormente
    Given usuário está na Tela NPS
    When Usuário clica no componente período
    And Usuário seleciona datas anteriores a dia corrente
    Then é exibida a lista com os relatórios identificados dentro do período selecionando

  @TestCaseKey=SMP-T129
  Scenario: Fazer o download de um relatório
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar”
    Then usuário Exportara o Arquivo com Sucesso

  @TestCaseKey=SMP-T48
  Scenario: Validar se o nome do arquivo Excel está vindo corretamente
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar
    Then é baixado um arquivo Excel

  @TestCaseKey=SMP-T42
  Scenario: Validar que o arquivo Excel está vindo com as colunas corretamente
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar”
    Then Usuário abre o Arquivo e verifica se seguintes Colunas Corretas (Aliança, Data da resposta, Documento, Referência da pergunta, Nota, Evento, Comentário, Perfil do cliente)

  @TestCaseKey=SMP-T45
  Scenario: Validando Botão Gerar Relatório
    Given Usuário está na tela NPS
    When Usuário solicita um relatório NPS clicando no botão “Gerar relatório”
    Then visualizar os componentes Período (passível de preenchimentos), tipo de entrega (já preenchido com “Portal do cliente”), um botão X, um cancelar e outro gerar relatório desabilitado.

  @TestCaseKey=SMP-T103
  Scenario: Validar se é bloqueado ao tentar escolher uma data futura
    Given Usuário está na tela NPS
    When Usuário Deseja baixar um relatório selecionando data Futura
    Then não deve permitir

  @TestCaseKey=SMP-T37
  Scenario: Validar se o componente de paginação está vindo com 10 de default
    Given Usuário está na Página NPS
    When Usuário clica paginação
    Then deve aparecer 10 Itens Por Default

  @TestCaseKey=SMP-T35
  Scenario: Validar botão Cancelar do modal de Gerar Relatório
    Given Usuário está na Tela de NPS
    When Usuário clica no Botão Gerar Relatório
    And Usuário clica no botão Cancelar
    Then Usuário deve ser direcionado para a tela inicial de NPS

  @TestCaseKey=SMP-T47
  Scenario: Validar botão X do modal de Gerar Relatório
    Given Usuário está na Tela de NPS
    When Usuário clica no Botão Gerar Relatório
    And Usuário clica no botão X
    Then Usuário deve ser direcionado para a tela inicial de NPS

