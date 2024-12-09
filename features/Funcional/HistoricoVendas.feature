#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Historico_De_Vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Historico De Vendas

  Scenario: Acessando Aba Histórico de Vendas
    Given usuário tenha CNPJ ou CPF e senha
    When Logar no Portal do Cliente
    And pelo menu lateral esquerdo acessar página de “Vendas” > “Relatório de Vendas” > “Histórico de Vendas”
    Then usuário será direcionado para a página de “Histórico de Vendas”

  Scenario: Mensagem no rodapé da página
    Given usuário está na página de Histórico de Vendas
    When rolar o Scroll para o final da tela
    Then usuário visualizará a seguinte mensagem no rodapé “© [ano atual] Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados”

  Scenario: Mensagem de Resumo
    Given usuário selecionou no menu lateral esquerdo, Vendas , Relatorio de Vendas
    When selecionar a página Histórico de Vendas
    Then visualizará a seguinte mensagem: Visualize o histórico de todas as vendas, aprovadas nos últimos meses aplicando o filtro de data ao lado.E lembre-se, as vendas do dia são apresentadas no menu "Hoje".

  Scenario: Visualização dos Campos
    Given usuário selecionou no menu lateral esquerdo, Vendas , Relatorio de Vendas
    When selecionar a página Histórico de Vendas
    Then usuário visualizará os campos: Total de vendas, Valor Bruto, Valor líquido, Valor cancelado

  Scenario: Visualização Período
    Given usuário selecionou no menu lateral esquerdo, Vendas , Relatorio de Vendas
    When selecionar a página Histórico de Vendas
    Then usuário visualizará do lado direito da tela, o período que deve vir como default: Ontem

  Scenario: Período Últimos 7 dias
    Given usuário esta Histórico de Vendas
    When clicar em período
    And selecionar os últimos 7 dias
    And rolar o Scroll para baixo
    Then visualizará todas as transações com os ultimos 7 dias

  Scenario: Período Últimos 14 dias
    Given usuário esta Histórico de Vendas
    When clicar em período
    And selecionar os últimos 14 dias
    And rolar o Scroll para baixo
    Then visualizará todas as transações com os ultimos 14 dias

  Scenario: Período Mês atual
    Given usuário esta Histórico de Vendas
    When clicar em período
    And selecionar o mes atual
    And rolar o Scroll para baixo
    Then visualizará todas as transações do mes atual

  Scenario: Período entre 01/09/2024-23/10/2024
    Given usuário esta Histórico de Vendas
    When clicar em período
    And selecionar um periodo entre 01/09/2024-23/10/2024
    And clica no Botão Aplicar
    And rolar o Scroll para baixo
    Then visualizará todas as transações daquele período

  Scenario: Código de autorização Valido
    Given usuario esta Histórico de Vendas
    When usuário seleciona um código valido no campo Buscar por cód autorização
    And clica na lupa para buscar
    Then usuario visualizará a transação referente aquele Código de autorização

  Scenario: Código de autorização invalido
    Given usuario esta Histórico de Vendas
    When usuário seleciona um código invalido no campo Buscar por cód autorização
    And clica na lupa para buscar
    Then usuario visualizará a seguinte mensagem:
    #“Nenhum resultado encontrado.Tente filtrar por outros períodos ou parâmetros”

  Scenario: Status Aprovada
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona Status aprovada
    And rola o Scroll para baixo
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com os status:Aprovada
    And botão Filtros na cor da instituição
    And  volta no filtro Status tirando a seleção Aprovada
    And clica no Botão mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produto

  Scenario: Status Cancelada
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona Status Cancelada
    And rola o Scroll para baixo
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com os status:Cancelada
    And botão Filtros na cor da instituição
    And volta no filtro Status tirando a seleção Cancelada
    And clica no Botão mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produto
    # Lembrando que Status de Cancelada só vai aparecer se fizer o cancelamento

  Scenario: Status Cancelada parcial
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona Status Cancelada parcial
    And rola o Scroll para baixo
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com os status:Cancelada parcial
    And botão Filtros na cor da instituição
    And voltar no filtro Status e tirar a seleção Cancelada Parcial
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Status
    # Lembrando que Status de Cancelada parcial só vai aparecer se fizer o cancelamento

  Scenario: Produto Débito
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em produtos ,Débito
    And rola o Scroll para baixo
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com o Produto Débito
    And botão Filtros na cor da instituição
    And voltar no filtro Produto e tirar a seleção Débito
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produto

  Scenario: Produto Crédito a Vista
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em produtos , Crédito a Vista
    And rola o Scroll para baixo
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com o Produto Crédito a Vista
    And botão Filtros na cor da instituição
    And voltando no filtro Produto e tirar a seleção Crédito a Vista
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produto

  Scenario: Canal POS
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Canal seleciona POS
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com Canal POS
    And botão Filtros na cor da instituição
    And suário está em “Histórico de Vendas”
    When voltar no filtro Canal e tirar a seleção do POS
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Canal

  Scenario: Canal TEF
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Canal seleciona TEF
    And clica em mostrar Resultados
    Then usuário visualizará todas as vendas com Canal TEF
    And botão Filtros na cor da instituição
    And usuario volta no filtro Canal e tirar a seleção do TEF
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Canal

  Scenario: Bandeira Elo
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Bandeiras a Bandeira Elo
    And clica no Botão Mostrar Resultados
    Then usuário visualizará todas as vendas com a Bandeira Elo
    And botão Filtros na cor da instituição
    And usuario voltando no filtro Bandeiras retirando a seleção da Elo
    And clica em mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Bandeiras

  Scenario: Bandeira Master
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Bandeiras a Bandeira Master
    And clica no Botão Mostrar Resultados
    Then usuário visualizará todas as vendas com a Bandeira Master
    And botão Filtros na cor da instituição
    And usuario voltando no filtro Bandeiras retirando a seleção da Master
    And clica no Botão Mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Bandeiras

  Scenario: Valores
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em valores um valor de 200 até 600
    And clica no Botão Mostrar Resultados
    Then usuário visualizará todas as vendas naquele range de valores selecionado
    And botão Filtros na cor da instituição
    And usuario voltando no filtro valores selecionando Limpar Filtros
    And clica no Botão Mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Valores

  Scenario: Estabelecimento
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Estabelecimento um EC
    And clica no Botão Mostrar Resultados
    Then usuário visualizará todas as vendas que estiverem naquele EC
    And botão Filtros deve ficar na cor da instituição
    And usuario voltando no filtro Estabelecimento e selecionando Limpar Filtros
    And clica no Botão Mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de EC

  Scenario: Terminal
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    And seleciona em Terminal um PGW
    And clica no Botão Mostrar Resultados
    Then usuário visualizará todas as vendas que estiverem naquele Terminal
    And botão Filtros deve ficar na cor da instituição
    And usuario voltando no filtro Terminal e selecionando Limpar Filtros
    And clica no Botão Mostrar Resultados
    Then usuário devera visualizar todas as vendas sem restrição de Terminal

  Scenario: Botão X no Modal Filtros
    Given usuário está em “Histórico de Vendas”
    When clica em Filtros
    Then abre-se o Modal Filtros
    And Usuario Clicando no X , deve-se voltar a tela Historico de Vandas

  Scenario: Download Excel Simplificado
    Given usuário está em “Histórico de Vendas”
    When clica no Botão Exportar
    Then abre-se o Modal para selecionar o tipo do aqruivo
    And usuario selecionando Excel Simplificado
    And Clicando no Botão Gerar Relatorio
    Then deve-se baixar o Arquivo na maquina com o seguinte nome: Relatorio_de_Vendas_Historico_de_Vendas_03-12-2024_1453.xlsx

  Scenario: Download Excel Detalhado
    Given usuário está em “Histórico de Vendas”
    When clica no Botão Exportar
    Then abre-se o Modal para selecionar o tipo do aqruivo
    And usuario selecionando Excel Detalhado
    And Clicando no Botão Gerar Relatorio
    Then deve-se baixar o Arquivo na maquina com o seguinte nome: Relatorio_de_Vendas_Historico_de_Vendas_03-12-2024_1453.xlsx

  Scenario: Download CSV Simplificado
    Given usuário está em “Histórico de Vendas”
    When clica no Botão Exportar
    Then abre-se o Modal para selecionar o tipo do aqruivo
    And usuario selecionando CSV Simplificado
    And Clicando no Botão Gerar Relatorio
    Then deve-se baixar o Arquivo na maquina com o seguinte nome:Relatorio_de_Vendas_Historico_de_Vendas_03-12-2024_1457.csv

  Scenario: Download CSV Detalhado
    Given usuário está em “Histórico de Vendas”
    When clica no Botão Exportar
    Then abre-se o Modal para selecionar o tipo do aqruivo
    And usuario selecionando CSV Detalhado
    And Clicando no Botão Gerar Relatorio
    Then deve-se baixar o Arquivo na maquina com o seguinte nome:Relatorio_de_Vendas_Historico_de_Vendas_03-12-2024_1457.csv

  Scenario: Download Arquivo PDF
    Given usuário está em “Histórico de Vendas”
    When clica no Botão Exportar
    Then abre-se o Modal para selecionar o tipo do aqruivo
    And usuario selecionando PDF
    And Clicando no Botão Gerar Relatorio
    Then deve-se abrir uma nova janela no navegador contendo o arquivo PDF

  Scenario: Botão Mais Detalhes
    Given usuário está em “Histórico de Vendas”
    When clica em Mais detalhes ->
    Then abre-se o Modal com as seguintes informações: detalhes das vendas , Total de vendas , Valor Bruto , Valor liquido