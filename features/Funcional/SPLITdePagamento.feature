#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SPLIT_de_Pagamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SPLIT de Pagamento

  Scenario: Adicionar opção "Valor original da venda" no grid personalizável
    Given O usuário está na página de histórico de vendas
    And O usuário selecionar personalizar coluna
    When O usuário seleciona a opção "Valor original da venda"
    Then A coluna "Valor original da venda" é adicionada ao grid de visualização
    And A informação exibida é o valor capturado pelo franqueado

  Scenario: Colunas padrão nos arquivos de Excel Simplificado
    Given O usuário está visualizando um arquivo de Excel ou CSV simplificado
    Then O arquivo contém a coluna "Valor original da venda" por padrão entre as colunas Canal e Valor bruto
    And A coluna "Nome do estabelecimento" após coluna Número do EC também por padrão
    And As demais colunas não necessitam de personalização e já são exibidas Data da venda, Cód. de autorização, Produto, Parcelas, Bandeira  , Canal, Valor original da venda, Valor bruto, Valor da taxa, Valor líquido, Valor cancelado, Status, Número do terminal,  Comprovante da venda, Cód. do pedido, Número do estabelecimento, Número do cartão  ,Cód. Ref. Cartão.

  Scenario: Colunas padrão nos arquivos de Excel Detalhado
    Given O usuário está visualizando um arquivo de Excel ou CSV detalhado
    Then O arquivo contém a coluna "Valor original da venda" por padrão entre as colunas Status e Valor bruto da transação
    And A coluna "Nome do estabelecimento" após a coluna Código do estabelecimento também por padrão
    And As demais colunas não necessitam de personalização e já são exibidas Data da venda, Hora da venda, Código de autorização, Código do estabelecimento, Nome do estabelecimento, Comprovante de venda, Código do pedido, Canal, Número do Terminal, Produto        Parcelas, Tipo de cartão, Bandeira, Status, Valor original da venda, Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Cartão pré pago, Data prevista de pagamento da venda, Status do pagamento da venda, Data efetiva do pagamento da venda, Código de pagamento, Cód. Ref. Cartão.

  Scenario: Colunas padrão nos arquivos de Csv Simplificado
    Given O usuário está visualizando um arquivo de Excel ou CSV simplificado
    Then O arquivo contém a coluna "Valor original da venda" por padrão
    And As demais colunas não necessitam de personalização e já são exibidas

  Scenario: Colunas padrão nos arquivos de CSV Detalhado
    Given O usuário está visualizando um arquivo de Excel ou CSV detalhado
    Then O arquivo contém a coluna "Valor original da venda" por padrão
    And A coluna "Nome do estabelecimento" também está presente por padrão
    And As demais colunas não necessitam de personalização e já são exibidas

  Scenario: Colunas personalizadas não afetam o arquivo PDF
    Given O usuário está visualizando um arquivo em formato PDF
    Then O arquivo não sofre alteração e mantém seu formato original ''Data da venda , codigo de autorização, valor bruto , canal , status ,numero do terminal, comprovante da venda , cod do pedido."
    And A coluna "Valor original da venda" não é exibida no PDF

  Scenario: Detalhes da Venda valor original da venda DIFERENTE do valor bruto PDF
    Given O usuário está visualizando o menu "Historico de vendas"
    When O usuário abrir detalhe da venda
    And  ''exportar comprovante''
    And acessar relatório em PDF
    Then O arquivo de PDF apresenta: No topo nome e número do estabelecimento AND em Informações gerais 'Data da venda , valor original da venda , valor bruto , canal , codigo de autorização, número do terminal, cod do pedido e comprovante da venda."
    And A informação "Valor original da venda" está presente no modal de detalhe da venda

  Scenario: Detalhes da Venda valor original da venda IGUAL a valor bruto PDF
    Given O usuário está visualizando o menu "Historico de vendas"
    When O usuário abrir detalhe da venda
    And  ''exportar comprovante''
    And acessar relatório em PDF
    Then O arquivo de PDF segue como é atualmente e apresenta: No topo nome e número do estabelecimento AND em Informações gerais 'Data da venda, valor bruto , canal, codigo de autorização, número do terminal, cod do pedido e comprovante da venda."
    And A informação "Valor original da venda" NÃO está presente no detalhe da venda

  Scenario: Detalhes da Venda valor original da venda igual a valor bruto
    Given O usuario abrir uma venda em Historico de venda
    When O usuario acessa Detalhe da venda
    Then o campo  valor original da venda não deve aparecer em Informações gerais

  Scenario: Detalhes da Venda valor original da venda diferente a valor bruto
    Given O usuario abrir uma venda em Historico de venda
    When O usuario acessa Detalhe da venda
    Then o campo  valor original da venda deve está em Informações gerais

  Scenario: Grid para franqueado
    Given O usuário FRANQUEADO está no menu Histórico de vendas
    When tiver personalizado para apresentar no Grid a opção "Valor original da venda" + "Valor bruto"
    Then o "Valor original da venda" será menor que o "Valor bruto" ( * ) O mesmo vale para os arquivos CSV e Excel exportados

  Scenario: Grid para franqueador
    Given O usuário FRANQUEADOR está no menu Histórico de vendas
    When tiver personalizado para apresentar no Grid a opção "Valor original da venda" + "Valor bruto"
    Then o "Valor original da venda" será menor que o "Valor bruto" ( * ) O mesmo vale para os arquivos CSV e Excel exportados

  Scenario: Grid para usuário sem modelo de franquia
    Given O usuário SEM MODELO FRANQUIA (cliente normal) está no menu Histórico de vendas
    When tiver personalizado para apresentar no Grid a opção "Valor original da venda" + "Valor bruto"
    Then o "Valor original da venda" será igual que o "Valor bruto" ( * ) O mesmo vale para os arquivos CSV e Excel exportados

  Scenario: Recebimentos pagos exportar comprovante PDF - tipo SIMPLIFICADO
    Given O usuario está no menu Recebimento pagos
    When O usuario exportar arquivo SIMPLIFICADO na modalidade PDF
    Then o pdf não deve conter alterações ,contém Informações gerais com as colunas: Dt. pagamento, bandeira, produto, banco, agencia, conta, tipo, EC, Cód Pagamento, V. pagamento e status.

  Scenario: Recebimentos pagos exportar comprovante PDF - tipo DETALHADO
    Given O usuario está no menu Recebimento pagos
    When O usuario exportar arquivo DETALHADO na modalidade PDF
    Then o pdf não deve conter alterações ,contém Informações gerais com as colunas: Dt. pagamento, Cod. pagamento, data venda, cod autorização, EC, bandeira, produto, parcelas, val bruto transação, val bruto parcela paga, valor taxa (MDR), valor liquido parcela/transação e numero cartão

  Scenario: Recebimentos pagos exportar CSV - tipo DETALHADO
    Given o usuário está no menu Recebimento Pagos,
    When o usuário exportar arquivo DETALHADO na modalidade CSV
    Then o CSV deve conter as colunas: Data de pagamento, Código de pagamento, Tipo de pagamento, Data da venda, Hora da venda, Número do estabelecimento, Nome do estabelecimento, Código de autorização, Comprovante da venda, Código do pedido, Canal, Número do terminal, Produto, Parcelas, Tipo de Cartão, Bandeira, Status da venda, Valor bruto da transação, Valor bruto da parcela paga, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Banco, Agência, Conta.

  Scenario: Recebimentos pagos exportar Excel- tipo SIMPLIFICADO
    Given o usuário está no menu Recebimento Pagos,
    When o usuário exportar arquivo SIMPLIFICADO na modalidade Excel
    Then o Excel NÃO deve conter nenhuma alteração, logo as colunas são: Data do pagamento, Bandeira, Produto, Banco, Agência, Conta, Tipo, EC, Cód. de pagamento, Valor pagamento, Status.

  Scenario: Recebimentos pagos exportar Excel tipo DETALHADO
    Given o usuário está no menu Recebimento Pagos,
    When o usuário exportar arquivo DETALHADO na modalidade Excel
    Then o CSV deve conter as colunas: Data de pagamento, Código de pagamento, Tipo de pagamento, Data da venda, Hora da venda, Número do estabelecimento, Nome do estabelecimento, Código de autorização, Comprovante da venda, Código do pedido, Canal, Número do terminal, Produto, Parcelas, Tipo de Cartão, Bandeira, Status da venda, Valor bruto da transação, Valor bruto da parcela paga, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Banco, Agência, Conta.

  Scenario: Recebimentos pagos exportar CSV- tipo SIMPLIFICADO
    Given o usuário abrir Recebimento Pagos,
    When o usuário exportar comprovante em Histórico de pagamento,
    Then o CSV NÃO deve conter nenhuma alteração, logo as colunas são: Data do pagamento, Bandeira, Produto, Banco, Agência, Conta, Tipo, EC, Cód. de pagamento, Valor pagamento, Status.

  Scenario: Meus relatórios de vendas Excel VENDAS
    Given o usuário acessar o relatório,
    When selecionar o tipo de relatório "VENDAS", preencher Estabelecimento comercial, Período e o Formato "Excel",
    And abrir o arquivo
    Then validar as colunas: Data da venda, Hora da venda, Código de autorização, Código do estabelecimento, Nome do estabelecimento, Comprovante de venda, Código do pedido, Canal, Número do Terminal, Produto, Parcelas, Tipo de cartão, Bandeira, Status, Valor original da venda, Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Cartão pré-pago, Data prevista de pagamento da venda, Status do pagamento da venda, Data efetiva do pagamento da venda, Código de pagamento, Cód. Ref. Cartão.

  Scenario: Meus relatórios de vendas Excel PAGAMENTO
    Given o usuário acessar o relatório,
    When selecionar o tipo de relatório "PAGAMENTO", preencher Estabelecimento comercial, Período e o Formato "Excel",
    And abrir o arquivo,
    Then validar as colunas: Data de pagamento, Código de pagamento, Tipo de pagamento, Data da venda, Hora da venda, Número do estabelecimento, Nome do estabelecimento, Código de autorização, Comprovante da venda, Código do pedido, Canal, Número do terminal, Produto, Parcelas, Tipo de Cartão, Bandeira, Status da venda, Valor bruto da transação, Valor bruto da parcela paga, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Banco, Agência, Conta.

  Scenario: Meus relatórios de vendas CSV VENDAS
    Given o usuário acessar o relatório,
    When selecionar o tipo de relatório "VENDAS", preencher Estabelecimento comercial, Período e o Formato "CSV",
    And abrir o arquivo,
    Then validar as colunas: Data da venda, Hora da venda, Código de autorização, Código do estabelecimento, Nome do estabelecimento, Comprovante de venda, Código do pedido, Canal, Número do Terminal, Produto, Parcelas, Tipo de cartão, Bandeira, Status, Valor original da venda, Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Cartão pré-pago, Data prevista de pagamento da venda, Status do pagamento da venda, Data efetiva do pagamento da venda, Código de pagamento, Cód. Ref. Cartão.

  Scenario: Meus relatórios de vendas CSV PAGAMENTO
    Given o usuário acessar o relatório,
    When selecionar o tipo de relatório "PAGAMENTO", preencher Estabelecimento comercial, Período e o Formato "CSV",
    And abrir o arquivo,
    Then validar as colunas: Data de pagamento, Código de pagamento, Tipo de pagamento, Data da venda, Hora da venda, Número do estabelecimento, Nome do estabelecimento, Código de autorização, Comprovante da venda, Código do pedido, Canal, Número do terminal, Produto, Parcelas, Tipo de Cartão, Bandeira, Status da venda, Valor bruto da transação, Valor bruto da parcela paga, Valor da taxa (MDR), Valor líquido da parcela/transação, Número do cartão, Banco, Agência, Conta.