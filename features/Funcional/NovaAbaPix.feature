#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nova_Aba_Pix
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Nova Aba Pix

  Scenario: Acessando a Aba Pix
    Given Usuario Acessa Portal do Cliente com Documento e Senha que contenha transações de Pix
    When Seleciona pelo menu lateral esquerdo a aba Vandas > Relatorio de Vendas
    Then visualizara aba Pix logo após aba Voucher

  Scenario: Validando Itens na aba Pix
    Given Usuario esta na aba Pix
    When visualizara , Banco e chave pix mascarada, Periodo , Valor Total de vendas, Total de vendas, filtros, Busca por cod de autorização
    And campos dia, total de transações, valor bruto abaixo de Filtros.
    Then Botão Exportar na Cor da Instituição

  Scenario: Buscar por Código de Autorização Valido
    Given usuário está na aba Pix
    When Buscar por um Código de autorização Valido
    And clicar na lupa
    Then sera exibida a transação com aquele Código de Autorização

  Scenario: Buscar por Código de Autorização Invalido
    Given usuário está na aba Pix
    When Buscar por um Código de autorização Invalido
    And clicar na lupa
    Then sera exibida a seguinte mensagem Nenhum resultado encontrado, Tente filtrar por outros periodos ou parâmetros

  Scenario: Filtrar por Status
    Given usuario clicou em Filtros
    When selecionar um dos Status "Aprovado", "Cancelado", "Negado", QR Code Expirado
    And clicar no Botão "Mostrar Resultados"
    And aparecera somente as transações com os status selecionados na lista de resultados.
    And voltando em Status e Limpar selecionados
    And clicando no Botão "Mostrar Resultados" novamente
    Then trara todas as transações sem restrição de Status

  Scenario: Filtrar por Terminal
    Given usuário clicou em Filtros
    When selecionar um ou todos os terminais
    And clicar no Botão "Mostrar Resultados"
    And aparecera somente as transações com os terminais selecionados na lista de resultados.
    And voltando em Status e Limpar selecionados
    And clicando no Botão "Mostrar Resultados" novamente
    Then trara todas as transações sem restrição de Terminal

  Scenario: Filtrar por Estabelecimento Comercial (EC)
    Given usuário clicou em Filtros
    When selecionar um ou todos os ECS
    And clicar no Botão "Mostrar Resultados"
    And aparecera somente as transações com os ECs selecionados na lista de resultados.
    And voltar em Status e Limpar filtros
    And clicar no Botão "Mostrar Resultados" novamente
    Then trara todas as transações sem restrição de EC

  Scenario: Periodo especifico
    Given usuario clicou em Periodo
    When selecionar um periodo especifico
    And clicar em Aplicar
    Then aparecera as transações que estiverem dentro Periodo selecionado

  Scenario: Periodo com Limite de 3 meses
    Given usuario clicou em Periodo
    When selecionar um periodo com no maximo 3 meses
    And clicar em Aplicar
    Then aparecera as transações que estiverem dentro Periodo selecionado

  Scenario: Periodo com mais de 3 meses
    Given usuario clicou em Periodo
    When selecionar um periodo com mais de 3 meses
    And clicar em Aplicar
    Then aparecera uma mensagem Selecione um período entre " " e " "

  Scenario: Campos ao selecionar uma transação
    Given usuário está na aba Pix
    When clicou no botão do lado direito abaixo do Botão Exportar, para abrir todas as transações
    Then visualizara os seguintes campos data e hora da venda, código de autorização, valor bruto, terminal, código do ec, e o status final da venda.

  Scenario: Detalhes da Transação
    Given usuário clicou sobre uma transação
    When aparecera um modal com as seguintes informações data e hora da venda, código de autorização, valor bruto, terminal, EC, status, domicílio bancário e chave pix mascarada.
    And Botão emitir segunda 2 via Comprovante
    Then Botão X para Fechar o modal

  Scenario: Emitindo 2 via
    Given usuário clicou sobre uma transação
    When abrir o Modal
    And clicar sobre o Botão Emitir 2 via comprovante
    Then sera gerado um PDF com nome do EC, CNPJ, numero EC, Emitido em com data e hora
    And em informações gerais data e hora da venda, código de autorização, valor bruto, terminal, EC, status, domicílio bancário e chave pix mascarada.

  Scenario: Botão Exportar
    Given clicar em Exportar
    When aparecera um modal com os Botões X, Exportar, Cancelar
    Then caixinha para selecionar Excel ou CSV

  Scenario: Exportando Arquivos Excel ou CSV
    Given usuario click no Botão Exportar
    When selecione Excel ou CSV
    And click em Gerar arquivo
    Then arquivo deve ser baixado na sua maquina

  Scenario: Botão X
    Given usuario esta no Modal para Exportar um arquivo
    When clicar no Botão X
    Then voltara para aba do Pix

  Scenario: Botão Cancelar
    Given usuario esta no Modal para Exportar um arquivo
    Then clicar no Botão Cancelar
    When voltara para aba do Pix

  Scenario: Validando Arquivo Excel - Pix
    Given usuario abrir o arquivo
    When arquivo devera vir com o seguinte nome Relatorio_de_Vendas_Pix_DD-MM-AAAA_HHMM
    And as seguintes informações relatorio de vandas Pix, Periodo de Venda DD-MM-AAAA à DD-MM-AAAA,
    Then emitido em DD-MM-AAAA HHMMSS,Estabelecimento Comercial,
    And Total de Vendas aprovadas,Total de vendas não efetivadas, Valor total de vendas aprovadas, Valor total de vendas não efetivadas
    And campos Data da venda, Cód de autorização, Valor bruto, Terminal, Número do estabelecimento, Status.

  Scenario: Validando Arquivo CSV - Pix
    Given usuario abrir o arquivo
    Then arquivo devera vir com o seguinte nome Relatorio_de_Vendas_Pix_DD-MM-AAAA_HHMM
    Then campos Data da venda, Cód de autorização, Valor bruto, Terminal, Número do estabelecimento, Status.