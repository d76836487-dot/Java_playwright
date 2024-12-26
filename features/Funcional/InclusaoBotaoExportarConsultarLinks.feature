#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Inclusao_do_Botao_Exportar_para_aba_Consultar_links
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Inclusao do Botao Exportar para aba Consultar links

  Scenario: Login EC Link de Pagamento / Com Links já criado
    Given usuário fizer Login com Doc e Senha
    When pelo menu lateral esquerdo acessar as abas Serviços, Link de pagamento
    And Selecionar a aba Consultar Links
    Then visualizara o Botão Exportar abaixo do card Período na Cor da Instituição

  Scenario: Login EC Link de Pagamento / Sem Link criado
    Given usuário fizer Login com Doc e Senha
    When Selecionar a aba Consultar Links
    Then visualizara a seguinte mensagem Nenhum resultado encontrado Tente filtrar por outros períodos ou parâmetros.

  Scenario: Modal para seleção de Arquivo
    Given usuário está na aba Consultar Links
    When clicar no Botão Exportar
    Then aparecera um Modal Exportar com as Opções CSV ou EXCEL
    And Botões Gerar arquivo, Cancelar, X

  Scenario: Exportando Arquivo CSV
    Given usuário selecionou arquivo CSV
    When clicar no botão Gerar arquivo
    Then deverá baixar o arquivo CSV
    And acima da tela aparecera uma mensagem na cor verde dizendo Arquivo Exportado Com Sucesso, e Botão X, junto a mensagem

  Scenario: Validando Arquivo CSV
    Given usuário baixou o arquivo CSV
    When ele abrir o arquivo
    Then ele deve estar com o seguinte nome Relatorio_de_consulta_link_de_pagamento_DD-MM-AA_HHMM.
    And com as seguintes Colunas Data de criação, Tipo, Descrição, Valor, Status

  Scenario: Exportando Arquivo Excel
    Given usuário selecionou arquivo Excel
    When clicar no botão Gerar arquivo
    Then deverá baixar o arquivo Excel
    And acima da tela aparecera uma mensagem na cor verde dizendo Arquivo Exportado Com Sucesso, e Botão X, junto a mensagem

  Scenario: Validando Arquivo Excel
    Given usuário baixou o arquivo Excel
    When ele abrir o arquivo
    Then ele deve estar com o seguinte nome Relatorio_de_consulta_link_de_pagamento_DD-MM-AA_HHMM.
    And conterá as seguintes informações Relatório de Consulta Link de Pagamento, Período de Consulta DD/MM/AA à DD/MM/AA , Emitido em DD/MM/AA HHMMSS Estabelecimento comercial
    And abaixo as colunas Data de criação, Tipo, Descrição, Valor, Status

# Estudar como vamos executar esse Cenário #
  Scenario: Erro ao tentar exportar arquivos
    Given usuário selecionou arquivo Excel ou CSV
    When clicar no botão Gerar arquivo
    Then aparecer a seguinte mensagem Ops... Ocorreu um erro, tente novamente mais tarde, Botão X ao fim da mensagem

  Scenario: Fechando Modal pelo Botão X
    Given usuário está no Modal para Baixar os Arquivos
    When selecionar o Botão X
    Then ele deve voltar para a Tela de Consultar Links

  Scenario: Fechando Modal pelo Botão Cancelar
    Given usuário está no Modal para Baixar os Arquivos
    When selecionar o Botão Cancelar
    Then ele deve voltar para a Tela de Consultar Links