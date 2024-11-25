#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Dirf_Nativa_Url_Externa
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Dirf Nativa Url Externa


  Scenario: Acessar Informe de Rendimento a partir da URL

    Given usuário acessa a URL
    When preencher os dados de: CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then deve se carregar a lista com: Ano, Número do EC e CNPJ que contêm Dirf para Baixar



  Scenario: Validando Botão de Loading

    Given usuário acessou a URL
    When preencher os dados de: CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then devera ser aplicado um Loading no Botão Buscar



  Scenario: Arquivo PDF

    Given Usuário está na página Informe de Rendimentos
    When clicar em Baixar
    Then deve – se baixar o Arquivo PDF na máquina do usuário



  Scenario: Validando nome do Arquivo PDF

    Given Usuário baixou o Arquivo PDF
    When Abrir o Arquivo
    Then o arquivo devera estar com o seguinte nome: Informe_de_rendimento_ [ANO REFERÊNCIA]_[CNPJ]_[Número do EC]_[Data e hora do download]



  Scenario: Sem Informe de Redimentos

    Given usuário acessa a URL
    When preencher os dados de: CNPJ, Agência e Conta
    And não existir informe de Rendimentos
    Then o Usuario vera abaixo do Campo Conta a seguinte mensagem: Nenhum resultado encontrado



  Scenario: Usuário recebe mensagem de erro genérico ao submeter formulário com campo obrigatório vazio

    Given usuário acessa a URL
    When não preencher um dos campos: CNPJ, Agência e Conta
    And clica no Botão Buscar
    Then o sistema deve exibir uma mensagem de erro genérico "Ocorreu um erro. Por favor, tente novamente mais tarde."



  Scenario: Botão fechar no modal de Erro

    Given usuário clica no Botão Buscar com dados inválidos
    When abrir o modal ocorreu um erro
    And clicar no Botão Fechar
    Then usuário deve retornar para a página de Informe de Rendimentos com o ano que havia escolhido



  Scenario: Botão X no modal de Erro

    Given usuário clica no Botão Buscar com dados inválidos
    When abrir o modal ocorreu um erro
    And clicar no Botão X
    Then usuário deve retornar para a página de Informe de Rendimentos com o ano que havia escolhido