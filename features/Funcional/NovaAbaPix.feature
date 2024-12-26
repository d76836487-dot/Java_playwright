#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nova_Aba_Pix
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Nova Aba Pix

  Scenario: Acessando a Aba Pix
    * Usuario Acessa Portal do Cliente com Documento e Senha que contenha transações de Pix
    * Seleciona pelo menu lateral esquerdo a aba Vandas > Relatorio de Vendas
    * visualizara aba Pix logo após aba Voucher

  Scenario: Validando Itens na aba Pix
    * Usuario esta na aba Pix
    * visualizara , Banco e chave pix mascarada, Periodo , Valor Total de vendas, Total de vendas, filtros, Busca por cod de autorização
    * campos: dia, total de transações, valor bruto abaixo de Filtros.
    * Botão Exportar na Cor da Instituição

  Scenario: Buscar por Código de Autorização Valido
    * usuário está na aba Pix
    * Buscar por um Código de autorização Valido
    * clicar na lupa
    * sera exibida a transação com aquele Código de Autorização

  Scenario: Buscar por Código de Autorização Invalido
    * usuário está na aba Pix
    * Buscar por um Código de autorização Invalido
    * clicar na lupa
    * sera exibida a seguinte mensagem:Nenhum resultado encontrado, Tente filtrar por outros periodos ou parâmetros

  Scenario: Filtrar por Status
    * usuario clicou em Filtros
    * selecionar um dos Status "Aprovado", "Cancelado", "Negado", QR Code Expirado
    * clicar no Botão "Mostrar Resultados"
    * aparecera somente as transações com os status selecionados na lista de resultados.
    * voltando em Status e Limpar selecionados
    * clicando no Botão "Mostrar Resultados" novamente
    * trara todas as transações sem restrição de Status
    # fazer com os tres Status

  Scenario: Filtrar por Terminal
   * usuário clicou em Filtros
   * selecionar um ou todos os terminais
   * clicar no Botão "Mostrar Resultados"
   * aparecera somente as transações com os terminais selecionados na lista de resultados.
   * voltando em Status e Limpar selecionados
   * clicando no Botão "Mostrar Resultados" novamente
   * trara todas as transações sem restrição de Terminal

  Scenario: Filtrar por Estabelecimento Comercial (EC)
    * usuário clicou em Filtros
    * selecionar um ou todos os ECS
    * clicar no Botão "Mostrar Resultados"
    * aparecera somente as transações com os ECs selecionados na lista de resultados.
    * voltar em Status e Limpar filtros
    * clicar no Botão "Mostrar Resultados" novamente
    * trara todas as transações sem restrição de EC

  Scenario: Periodo especifico
    * usuario clicou em Periodo
    * selecionar um periodo especifico
    * clicar em Aplicar
    * aparecera as transações que estiverem dentro Periodo selecionado

  Scenario: Periodo com Limite de 3 meses
    * usuario clicou em Periodo
    * selecionar um periodo com no maximo 3 meses
    * clicar em Aplicar
    * aparecera as transações que estiverem dentro Periodo selecionado

  Scenario: Periodo com mais de 3 meses
    * usuario clicou em Periodo
    * selecionar um periodo com mais de 3 meses
    * clicar em Aplicar
    * aparecera uma mensagem: Selecione um período entre " " e " "

  Scenario: Campos ao selecionar uma transação
    * usuário está na aba Pix
    * clicou no botão do lado direito abaixo do Botão Exportar, para abrir todas as transações
    * visualizara os seguintes campos:data e hora da venda, código de autorização, valor bruto, terminal, código do ec, e o status final da venda.

  Scenario: Detalhes da Transação
    * usuário clicou sobre uma transação
    * aparecera um modal com as seguintes informações:data e hora da venda, código de autorização, valor bruto, terminal, EC, status, domicílio bancário e chave pix mascarada.
    * Botão: emitir segunda 2 via Comprovante
    * Botão X para Fechar o modal

  Scenario: Emitindo 2 via
    * usuário clicou sobre uma transação
    * abrir o Modal
    * clicar sobre o Botão: Emitir 2 via comprovante
    * sera gerado um PDF com: nome do EC, CNPJ, numero EC, Emitido em: com data e hora
    * em informações gerais: data e hora da venda, código de autorização, valor bruto, terminal, EC, status, domicílio bancário e chave pix mascarada.

  Scenario: Botão Exportar
    * clicar em Exportar
    * aparecera um modal com os Botões: X, Exportar, Cancelar
    * caixinha para selecionar Excel ou CSV

  Scenario: Exportando Arquivos Excel ou CSV
    * usuario click no Botão Exportar
    * selecione Excel ou CSV
    * click em Gerar arquivo
    * arquivo deve ser baixado na sua maquina

  Scenario: Botão X
    * usuario esta no Modal para Exportar um arquivo
    * clicar no Botão X
    * voltara para aba do Pix

  Scenario: Botão Cancelar
    * usuario esta no Modal para Exportar um arquivo
    * clicar no Botão Cancelar
    * voltara para aba do Pix

  Scenario: Validando Arquivo Excel
    * usuario abrir o arquivo
    * arquivo devera vir com o seguinte nome: Relatorio_de_Vendas_Pix_DD-MM-AAAA_HHMM
    * as seguintes informações:relatorio de vandas Pix, Periodo de Venda: DD-MM-AAAA à DD-MM-AAAA,
    * emitido em: DD-MM-AAAA HH:MM:SS,Estabelecimento Comercial:,
    * Total de Vendas aprovadas,Total de vendas não efetivadas, Valor total de vendas aprovadas, Valor total de vendas não efetivadas
    * campos: Data da venda, Cód de autorização, Valor bruto, Terminal, Número do estabelecimento, Status.

  Scenario: Validando Arquivo CSV
    * usuario abrir o arquivo
    * arquivo devera vir com o seguinte nome: Relatorio_de_Vendas_Pix_DD-MM-AAAA_HHMM
    * campos: Data da venda, Cód de autorização, Valor bruto, Terminal, Número do estabelecimento, Status.




