#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Dirf_Nativa_Url_Externa
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Dirf Nativa Url Externa

  @TestCaseKey=LPDC-T1063
  Scenario: Acessar Informe de Rendimento a partir da URL
    Given usuário acessa a URL
    When preencher os dados de CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then deve se carregar a lista com Ano, Número do EC e CNPJ que contêm Dirf para Baixar

  @TestCaseKey=LPDC-T1060
  Scenario: Validando Botão de Loading
    Given usuário acessou a URL
    When preencher os dados de CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then devera ser aplicado um Loading no Botão Buscar

  @TestCaseKey=LPDC-T1061
  Scenario: Arquivo PDF
    Given Usuário está na página Informe de Rendimentos
    When clicar em Baixar
    Then deve – se baixar o Arquivo PDF na máquina do usuário

  @TestCaseKey=LPDC-T1058
  Scenario: Validando nome do Arquivo PDF
    Given Usuário baixou o Arquivo PDF
    When Abrir o Arquivo
    Then o arquivo devera estar com o seguinte nome Informe_de_rendimento_ [ANO REFERÊNCIA]_[CNPJ]_[Número do EC]_[Data e hora do download]

  @TestCaseKey=LPDC-T1059
  Scenario: Sem Informe de Redimentos
    Given usuário acessa a URL
    When preencher os dados de CNPJ, Agência e Conta
    And não existir informe de Rendimentos
    Then o Usuario vera abaixo do Campo Conta a seguinte mensagem Nenhum resultado encontrado

  @TestCaseKey=LPDC-T1062
  Scenario: Usuário recebe mensagem de erro genérico ao submeter formulário com campo obrigatório vazio
    Given usuário acessa a URL
    When não preencher um dos campos CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then o sistema deve exibir uma mensagem de erro genérico "Ocorreu um erro. Por favor, tente novamente mais tarde."

  @TestCaseKey=LPDC-T1064
  Scenario: Botão fechar no modal de Erro
    Given usuário clica no Botão Buscar com dados inválidos
    When abrir o modal ocorreu um erro
    And clicar no Botão Fechar
    Then usuário deve retornar para a página de Informe de Rendimentos com o ano que havia escolhido

  @TestCaseKey=LPDC-T1065
  Scenario: Botão X no modal de Erro - Dirf Nativa Url Externa
    Given usuário clica no Botão Buscar com dados inválidos
    When abrir o modal ocorreu um erro
    And clicar no Botão X
    Then usuário deve retornar para a página de Informe de Rendimentos com o ano que havia escolhido

