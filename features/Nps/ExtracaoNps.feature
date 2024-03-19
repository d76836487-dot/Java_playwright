#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/NPS/Base_de_respostas_NPS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
#noinspection CucumberUndefinedStep
Feature: Base de respostas NPS

  @TestCaseKey=SMP-T120
  Scenario: Acesso a pesquisas NPS Com relatorio
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente" , clicar em NPS
    Then é exibido um quadro com as colunas, nome ,Tipo do arq, Periodo ,Baixar

  @TestCaseKey=SMP-T278
  Scenario: Acesso a pesquisas NPS Sem Relatorio
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente", clicar em NPS
    Then é exibido a mensagem "Nenhum resultado encontrado"

  @TestCaseKey=SMP-T45
  Scenario: Gerar Relatório por periodo
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente" , clicar em NPS
    And clica no Botão  Gerar relatorio
    And seleciona um periodo valido
    And Clica em Gerar relatorio
    Then sera gerado um relatorio com o periodo selecionado

  @TestCaseKey=SMP-T103
  Scenario: Sem permissão para extração de arquivo com data futura
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente" , clicar em NPS
    And clica no Botão  Gerar relatorio
    And seleciona um periodo com data futura
    Then não deve ser permitido gerar o arquivo

  @TestCaseKey=SMP-T36
  Scenario: Buscando relatórios NPS gerados anteriormente
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente" , clicar em NPS
    And pesquisa por um periodo anterior ao dia corrente
    Then exibido uma lista com relatórios  dentro do período selecionado

  @TestCaseKey=SMP-T129
  Scenario: Realizando download de relatório
    Given o usuário esteja logado no portal do cliente na Visão Operador
    When acessa o perfil admin
    And na area "Acessar area cliente" ,
    And clica em NPS
    And Usuário deseja exportar um relatório ,clicando em “Baixar”
    Then  Arquivo sera exportado com Sucesso

  @TestCaseKey=SMP-T48
  Scenario: Consultar se os dados no arquivo Excel está vindo corretamente
    Given Usuário exportou um arquivo
    When Usuario abre o arquivo exportado
    Then Usuario visualizara o Nome aliança_NPS_período , Data e hora de extração
    And na aba Sheet1 do arquivo vera as Colunas (Aliança, Data da resposta, Documento, Referência da pergunta, Nota, Evento, Comentário, Perfil do cliente)
    And na aba NPS vera as colunas , Promotores, Detratores, Neutros, Quantidade respostas, NPS ,dashboard com as porcentagens

  @TestCaseKey=SMP-T37
  Scenario: Consultando componente Itens
    Given o usuário esteja logado no portal do cliente Visão Operador
    When acessa o perfil admin
    And na area "Acessar area do cliente" ,clicar em NPS
    And tiver arquivos para baixar
    Then usuario devera visualizar 10 itens por default em "Exibindo Itens"

  @TestCaseKey=SMP-T35
  Scenario: Validando Cancelamento ao Gerar Relatório
    Given o usuário esteja logado no portal do cliente Visão Operador
    When acessa o perfil admin
    And na area "Acessar area do cliente" ,clicar em NPS
    And clica no Botão Gerar Relatório
    And clica no botão Cancelar
    Then Usuário deve ser redirecionado para a tela de NPS

  @TestCaseKey=SMP-T47
  Scenario: Validando fechar ao Gerar Relatorio
    Given o usuário esteja logado no portal do cliente Visão Operador
    When acessa o perfil admin
    And na area "Acessar area do cliente" ,clicar em NPS
    And clica no Botão Gerar Relatório
    And clica no botão X
    Then Usuário deve ser redirecionado para a tela de NPS

