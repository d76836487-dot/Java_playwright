#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Produtos_ALELO_Natal_Cultura_Multibeneficios_Todos_os_Perfis
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Produtos ALELO Natal Cultura Multibeneficios Todos os Perfis

  Scenario: Consultar filtro de produto Natal
  Given que o usuário esteja na aba Vendas Hoje
  When usuário clica em Filtros
  And clica em Produtos
  Then deve aparecer a opção Natal

  Scenario: Consultar filtro de produto Multibeneficios
  Given que o usuário esteja na aba Vendas Hoje
  When usuário clica em Filtros
  And clica em Produtos
  Then deve aparecer a opção Multibeneficios

  Scenario: Consultar filtro de produto Cultura
  Given que o usuário esteja na aba Vendas Hoje
  When usuário clica em Filtros
  And clica em Produtos
  Then deve aparecer a opção Cultura

  Scenario: Realizar busca com a opção Natal selecionada
  Given que o usuário esteja na aba Vendas Hoje
  When  usuário clica em Filtros
  And clica em Produtos
  And seleciona a opção Natal
  And  clica em Mostrar Resultados
  Then aparecera as transações com a coluna Produto > Natal

  Scenario: Realizar busca com a opção Multibenefícios selecionada
  Given que o usuário esteja na aba Vendas Hoje
  When usuário clica em Filtros
  And clica em Produtos
  And seleciona a opção Multibenefícios
  And  clica em Mostrar Resultados
  Then aparecera as transações com a coluna Produto > Multibenefícios

  Scenario: Realizar busca com a opção Cultura selecionada
  Given que o usuário esteja na aba Vendas Hoje
  When usuário clica em Filtros
  And clica em Produtos
  And seleciona a opção Cultura
  And clica em Mostrar Resultados
  Then aparecera as transações com a coluna Produto > Cultura

  Scenario: Exportar arquivo CSV do menu “Vendas Hoje”
  Given usuário esteja na aba Vendas Hoje
  When selecionou em Filtros > Produtos algum dos Produtos: Natal, Multibenefícios, Cultura
  And clicou em Mostrar Resultados
  And clica em Exportar
  And seleciona o tipo de arquivo CSV
  And clica em Gerar arquivo
  Then Arquivo será gerado com Sucesso

  Scenario: Validando Arquivo CSV
  Given Usuário exportou um arquivo CSV
  When ele abrir o Arquivo em sua máquina
  Then o arquivo deverá vir com as seguintes colunas: Data da venda, Cód de autorização, Comprovante, Produto, Parcelado, Bandeira, Canal, Terminal, Valor bruto, Status, Número do estabelecimento, Final do cartão, Cód Ref Cartão.
  And coluna Produto deverá vir com o Produto selecionado no Grid

  Scenario: Exportar arquivo Excel do menu “Vendas Hoje”
  Given usuário esteja na aba Vendas Hoje
  When selecionou em Filtros > Produtos algum dos Produtos: Natal, Multibenefícios, Cultura
  And clicou em Mostrar Resultados
  And clica em Exportar
  And seleciona o tipo de arquivo Excel
  And clica em Gerar arquivo
  Then Arquivo será gerado com Sucesso

  Scenario: Validando Arquivo Excel
  Given Usuário exportou um arquivo Excel
  When ele abrir o Arquivo em sua máquina
  Then arquivo devera vir com o seguinte cabeçalho: Relatório de vendas, Período de Venda, Emitido em, Estabelecimento Comercial, Total de vendas, Valor Bruto, Valor não efetivadas
  And com as seguintes colunas: Data da venda, Cód de autorização, Comprovante, Produto, Parcelado, Bandeira, Canal, Terminal, Valor bruto, Status, Número do estabelecimento, Final do cartão, Cód Ref. Cartão.
  And coluna Produto deverá vir com o Produto selecionado no Grid