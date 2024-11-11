#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Vendas Hoje

  @TestCaseKey=LPDC-T923
  Scenario: Acessar Vendas Hoje via menu lateral
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    Then usuário será direcionado para a página de “Vendas Hoje”

  @TestCaseKey=LPDC-T922
  Scenario: Acessar Vendas Hoje via dashboard Vendas
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário localiza o dashboard Vendas Hoje
    And usuário clica no link “Ver tudo”
    Then usuário será direcionado para a página de “Vendas Hoje”

  @TestCaseKey=LPDC-T913
  Scenario: Validando Mensagem no rodapé
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    Then usuário visualizará a seguinte mensagem no rodapé: “© [ano atual] Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados”

  @TestCaseKey=LPDC-T911
  Scenario: Mensagem de resumo de vendas
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    Then usuário visualizará a seguinte mensagem: “Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia”

  @TestCaseKey=LPDC-T974
  Scenario: Visualização do campo “Resumo de vendas”
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    Then usuário visualizará no campo “Resumo de vendas”: Total de vendas, Valor bruto das vendas autorizadas

  @TestCaseKey=LPDC-T928
  Scenario: Visualização da tabela “Histórico de vendas”
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    Then usuário visualizará por default dez colunas abaixo de Histórico de Vendas data da venda, código de autorização, comprovante de venda, produto, parcelas, bandeira, canal, terminal, valor bruto e status.

  @TestCaseKey=LPDC-T955
  Scenario: Personalizar com até 10 colunas
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário deseja personalizar a visualização das colunas abaixo de Histórico de Vendas
    Then usuário clicara em personalizar colunas
    And selecionara as 10 colunas que deseja visualizar
    And clicara em Aplicar
    And usuário verá as 10 colunas que selecionou abaixo de Histórico de Vendas

  @TestCaseKey=LPDC-T932
  Scenario: Voltar a personalização para o padrão
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    And usuário já personalizou a visualização das Colunas no Vendas Hoje
    When usuário seleciona o Personalizar colunas novamente
    And clica no Botão Voltar ao Padrão
    Then deverá voltar ao padrão de seleção das colunas

  @TestCaseKey=LPDC-T939
  Scenario: Personalizar com mais de 10 colunas
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário deseja personalizar a visualização das colunas com mais de 10 Opções
    Then usuário não conseguirá selecionar mais de 10 Opções

  @TestCaseKey=LPDC-T929
  Scenario: Busca por Cod de autorização
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário seleciona Buscar por código de autorização
    And insere um Código valido
    And clica na lupa para buscar
    Then usuário visualizará os dados na tabela referente aquele Código de autorização

  @TestCaseKey=LPDC-T954
  Scenario: Busca por autorização de venda hoje não existente
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário seleciona Buscar por código de autorização
    And insere um Código Invalido
    And clica na lupa para buscar
    Then usuário visualizará a seguinte mensagem na tela: “Nenhum resultado encontrado. Tente filtrar por outros períodos ou parâmetros”

  @TestCaseKey=LPDC-T921
  Scenario: Busca por código de autorização com caracteres inválidos
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário seleciona Buscar por código de autorização
    And insere caracteres inválidos
    And clica na lupa para buscar
    Then usuário visualizará a seguinte mensagem na tela: “Nenhum resultado encontrado. Tente filtrar por outros períodos ou parâmetros”

  @TestCaseKey=LPDC-T969
  Scenario: Filtrar vendas hoje com todos os status
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status Seleciona Tudo
    And clica em mostrar resultados
    Then usuário visualizará as vendas com todos os status
    And usuário visualizará o botão Filtro com cor da instituição

  @TestCaseKey=LPDC-T953
  Scenario: Filtrar vendas hoje com status autorizado
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status Seleciona o status autorizada
    And clica em mostrar resultados
    Then usuário visualizará apenas vendas com status autorizada
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T950
  Scenario: Limpar filtro com status de autorizado das vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status tira a seleção do status autorizada
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de status

  @TestCaseKey=LPDC-T924
  Scenario: Filtrar vendas hoje com status Recusada
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status Seleciona o status Recusada
    And clica em mostrar resultados
    Then usuário visualizará apenas vendas com status Recusada
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T947
  Scenario: Limpar filtro de status de Recusada das vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status tira a seleção do status Recusada
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de status

  @TestCaseKey=LPDC-T945
  Scenario: Filtrar vendas hoje com status estornado
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status Seleciona o status estornado
    And clica em mostrar resultados
    Then usuário visualizará apenas vendas com status estornado
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T917
  Scenario: Limpar filtro de status de estornado das vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Status tira a seleção do status estornado
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de status

  @TestCaseKey=LPDC-T920
  Scenario: Filtrar vendas hoje por todos os produtos
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona tudo
    And clica em mostrar resultados
    Then usuário visualizará todos os Produtos que estiverem ativos
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T973
  Scenario: Limpar filtro de todos os Produtos em vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos tira a seleção de tudo
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produtos

  @TestCaseKey=LPDC-T914
  Scenario: Filtrar vendas hoje pelo produto débito
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona débito
    And clica em mostrar resultados
    Then usuário visualizará o produto débito
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T927
  Scenario: Limpar filtro de débito em Produtos
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos tira a seleção débito
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produtos

  @TestCaseKey=LPDC-T919
  Scenario: Filtrar vendas hoje pelo produto Crédito
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona Crédito
    And clica em mostrar resultados
    Then usuário visualizará o produto Crédito a Vista e Crédito Parcelado
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T941
  Scenario: Limpar filtro de Crédito em Produtos
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos tira a seleção Crédito
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Produtos

  @TestCaseKey=LPDC-T935
  Scenario: Filtrar vendas hoje por todos os canais
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona em canais todos
    And clica em mostrar resultados
    Then usuário visualizará todos os canais
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T926
  Scenario: Filtrar vendas hoje pelo canal POS
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona em canal POS
    And clica em mostrar resultados
    Then usuário visualizará na coluna canal POS
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T951
  Scenario: Limpar filtro do canal POS em vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em canal tira a seleção POS
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Canal POS

  @TestCaseKey=LPDC-T966
  Scenario: Filtrar vendas hoje pelo e-commerce
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona em canal e-commerce
    And clica em mostrar resultados
    Then usuário visualizará na coluna canal e-commerce
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T936
  Scenario: Limpar filtro do canal e-commerce em vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em canal tira a seleção e-commerce
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Canal e-commerce

  @TestCaseKey=LPDC-T933
  Scenario: Filtrar vendas hoje pelo link de pagamento
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em Produtos Seleciona em canal Link de Pagamento
    And clica em mostrar resultados
    Then usuário visualizará na coluna canal Link de Pagamento
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T912
  Scenario: Limpar filtro do canal link de pagamento das vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em canal tira a seleção Link de Pagamento
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas sem restrição de Canal Link de Pagamento

  @TestCaseKey=LPDC-T943
  Scenario: Filtrar vendas hoje por todas as bandeiras
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras selecionar tudo
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações com as bandeiras que foram passadas as transações
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T938
  Scenario: Filtrar vendas hoje pela bandeira Elo
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras selecionar bandeira Elo
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações com a bandeira Elo
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T916
  Scenario: Limpar filtro bandeira Elo
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras tira a seleção da bandeira Elo
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas com todas as bandeiras

  @TestCaseKey=LPDC-T940
  Scenario: Filtrar vendas hoje pela bandeira Master
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras selecionar bandeira Master
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações com a bandeira Master
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T942
  Scenario: Limpar filtro bandeira Master
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras tira a seleção da bandeira Master
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas com todas as bandeiras

  @TestCaseKey=LPDC-T925
  Scenario: Filtrar vendas hoje pela bandeira Visa
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras selecionar bandeira Visa
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações com a bandeira Visa
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T952
  Scenario: Limpar filtro bandeira Visa
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em bandeiras tira a seleção da bandeira Visa
    And clica em mostrar resultados
    Then usuário devera visualizar todas as vendas com todas as bandeiras

  @TestCaseKey=LPDC-T918
  Scenario: Filtrar valores em Vendas Hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And seleciona em valores um valor de 200 até 800
    And clica em Mostrar Resultados
    Then usuário devera visualizar todas as transações dentro do range de valor que ele selecionou
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T970
  Scenario: Limpar filtro Valores
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje”, pelo menu lateral esquerdo
    And clica em Filtros
    And em clica em Limpar Filtros
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações sem range de valor

  @TestCaseKey=LPDC-T937
  Scenario: Filtrar por estabelecimento em vendas hoje
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje”, pelo menu lateral esquerdo And clica em Personalizar colunas
    And Personaliza com Estabelecimento
    And clica em aplicar
    And clica em Filtros
    And seleciona um estabelecimento
    And clica em Mostrar Resultados
    Then usuário devera visualizar todas as transações que foram feitas com aquele estabelecimento selecionado
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T915
  Scenario: Filtrar vendas hoje por terminal POS
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    And usuário possui mais de um terminal
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário clica em Filtros
    And em Terminal seleciona POS
    And clica em Mostrar Resultados
    Then usuário visualizará todas as transações com o Terminal POS
    And usuário visualizará o botão Filtro com a borda e escrita colorida de acordo com a instituição

  @TestCaseKey=LPDC-T930
  Scenario: Limpar filtro Terminal
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And clica em Filtros
    And em clica em Limpar Filtros
    And clica em mostrar resultados
    Then usuário devera visualizar todas as transações com todos os terminais disponíveis

  @TestCaseKey=LPDC-T971
  Scenario: Fazer download do arquivo CSV
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário clica em Exportar
    And usuário seleciona o arquivo CSV
    And clica em Gerar arquivo
    Then usuário verá a seguinte mensagem: “Arquivo exportado com sucesso”

  @TestCaseKey=LPDC-T946
  Scenario: Fazer download do arquivo Excel
    Given usuário está logado no Portal do Cliente utilizando o CNPJ
    When usuário acessa a página de “Vendas” > “Relatório de Vendas” > “Hoje” ,pelo menu lateral esquerdo
    And usuário clica em Exportar
    And usuário seleciona o arquivo Excel
    And clica em Gerar arquivo
    Then usuário verá a seguinte mensagem: “Arquivo exportado com sucesso”

  @TestCaseKey=LPDC-T977
  Scenario: Validando Nome do arquivo Excel de Vendas Hoje
    Given Usuario fez o Download do arquivo Excel
    When ele abrir o arquivo
    Then o arquivo deve vir com o nome Relatorio_de_Vendas_Hoje_25-10-2024_1433.xlsx

  @TestCaseKey=LPDC-T984
  Scenario: Validando Nome do arquivo CSV de Vendas Hoje
    Given Usuario fez o Download do arquivo CSV
    When ele abrir o arquivo
    Then o arquivo deve vir com o nome Relatorio_de_Vendas_Hoje_25-10-2024_1433.csv

  @TestCaseKey=LPDC-T983
  Scenario: Validando Colunas no arquivo Excel
    Given Usuario fez o Download do arquivo Excel
    When ele abrir o arquivo
    Then o arquivo deve ter as seguintes colunas: Comprovante da venda, Produto    Parcelado, Bandeira, Canal, Terminal, Valor bruto, Status, Número do estabelecimento, Final do cartão e Cód. Ref. Cartão
    And a soma da coluna Valor Bruto deve bater com a soma que esta no campo Valor Bruto na Tela Vendas Hoje
    And o Total de Vendas na parte de cima do Arquivo deve bater com o Total de Vendas na Tela Vendas Hoje

  @TestCaseKey=LPDC-T978
  Scenario: Validando Colunas no arquivo CSV
    Given Usuario fez o Download do arquivo CSV
    When ele abrir o arquivo
    Then o arquivo deve ter as seguintes colunas: Data da venda, Cód. de autorização, Comprovante, Produto, Parcelado, Bandeira, Canal, Terminal, Valor bruto, Status, Número do Estabelecimento, Final do cartão e Cód. Ref. Cartão
    And a soma da coluna Valor Bruto deve bater com a soma que esta no campo Valor Bruto na Tela Vendas Hoje
    And o Total de Vendas na parte de cima do Arquivo deve bater com o Total de Vendas na Tela Vendas Hoje

