#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/ProdutosPAT/PAT
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature:PAT

  Scenario: Vendas Hoje Cartão Visa
    Given que o usuário possui um cartão válido VISA
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  Scenario: Vendas Hoje Cartão Master
    Given que o usuário possui um cartão válido MASTER
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  Scenario: Vendas Hoje Cartão Elo
    Given que o usuário possui um cartão válido Elo
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  Scenario: Vendas Hoje Estorno Master
    Given que o usuário realizou uma transação MASTER
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  Scenario: Vendas Hoje Estorno Visa
    Given que o usuário realizou uma transação Visa
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  Scenario: Vendas Hoje Estorno Elo
    Given que o usuário realizou uma transação Elo
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  Scenario: Vendas Hoje Exportar Arquivo Excel
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo Excel
    Then Arquivo deve ser estraido e Conter todos os dados

  Scenario: Vendas Hoje Exportar Arquivo CSV
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo CSV
    Then Arquivo deve ser estraido e Conter todos os dados

  Scenario: Vendas Hoje Busca Por Codigo de Autorizaçao
    Given usuario esta na aba Vendas Hoje
    When Buscar por um Codigo de Autorização Valido
    Then Ao Clicar na Lupa devera trazer a transação que condiz com aquele codigo de autorização

  Scenario: Histórico de Vendas bandeira Visa modalidades Refeição, Alimentação e Cultura
    Given acesso a aba "Histórico de Vendas"
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações

  Scenario: Historico de Vendas Exportar Arquivo Excel
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo Excel
    Then Arquivo deve ser estraido e Conter todos os dados

  Scenario: Historico de Vendas Exportar Arquivo CSV
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo CSV
    Then Arquivo deve ser estraido e Conter todos os dados

  Scenario: Historico de Vendas Exportar Arquivo PDF
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo PDf
    Then Arquivo deve ser estraido e Conter todos os dados

  Scenario: Historico de Vendas Busca Por Codigo de Autorizaçao
    Given usuario esta na aba Historico de Vendas
    When Buscar por um Codigo de Autorização Valido
    Then Ao Clicar na Lupa devera trazer a transação que condiz com aquele codigo de autorização

  Scenario: Historico de Vendas - Detalhe de Venda
    Given usuario esta na aba Historico de Vendas
    When seleciona uma Venda de Voucher Master , Elo ou Visa
    Then deve se abrir um Modal com os Detalhes daquela Venda

  Scenario: Historico de Vendas - Exportando Comprovante da Venda
    Given usuario esta em Detalhes daquela Venda
    When selecionar o Botão Exportar comprovante
    Then deve se abrir um comprovante Web Contendo todas as Informações daquela venda
    And tambem Exportar Arquivo PDF contendo as mesmas informações

  Scenario: Recebimentos Pagos
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    Then devera aparecer as informações Gerais contendo <Tipo> <Bandeira> <Produto>
      | Tipo                | Bandeira | Produto |
      | Liquidacao de Venda | Visa     | Voucher |
      | Liquidacao de Venda | Elo      | Voucher |
      | Liquidacao de Venda | Master   | Voucher |
    And selecionar um desses pagamentos
    And selecionando Histórico das vendas pagas devera aparecer os dados das Vendas

  Scenario: Recebimentos Pagos - Exportar Comprovante
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    Then Clicando em Exportar comprovante devera baixar o mesmo contendo as informações

  Scenario: Historico de Vendas pagas - Arquivo Excel
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    And em Historico de Pagamento clicar em ver detalhes
    Then ao selecionar o Botão Exportar devera baixar o arquivo Excel com as Informações das transações

  Scenario: Historico de Vendas pagas - Arquivo CSV
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    And em Historico de Pagamento clicar em ver detalhes
    Then ao selecionar o Botão Exportar devera baixar o arquivo CSV com as Informações das transações

  Scenario: Menu Negocio - Meus Domicilios
    Given que o usuário está logado
    When acessa o menu Negócio > Meus Domicilios
    Then as bandeiras Visa, Mastercard e Elo na modalidade Voucher devem ser exibidas

  Scenario: Menu Negocio - Taxas e Tarifas
    Given que o usuário está logado
    When ele acessa o menu Negócio > Taxas e tarifas
    Then visualizara as bandeiras Visa, Master, Elo Voucher com as suas respectivas taxas e prazo

  Scenario: Verificar novos códigos de produto no menu Recebimentos
    Given acesso o menu Recebimentos
    When seleciono a aba Recebimentos Pagos
    Then os códigos de produto voucher devem estar visível

  Scenario: Validar detalhes do pagamento para código de produto 202
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 202
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto        |
      | 2             | 53924548360      | 20251008         | 3800.4            | 341         | 001268        | 0000987654321       | 002               | Processada      | 250             | Pagamentos pelo EC | Enviado       | 003         | Visa         | 202        | Adq - VISA Voucher |

  Scenario: Validar detalhes do pagamento para código de produto 203
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 203
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto          |
      | 3             | 53924548361      | 20251009         | 4200.5            | 341         | 001269        | 0000987654322       | 003               | Processada      | 251             | Pagamentos pelo EC | Enviado       | 004         | MasterCard   | 203        | Adq - Master Voucher |

  Scenario: Validar detalhes do pagamento para código de produto 204
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 204
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto        |
      | 4             | 53924548362      | 20251010         | 4500.6            | 341         | 001270        | 0000987654323       | 004               | Processada      | 252             | Pagamentos pelo EC | Enviado       | 005         | Amex         | 204        | Adq - Amex Voucher |

  Scenario: Validar acesso de diferentes perfis ao menu Recebimentos
    Given acesso o menu Recebimentos com perfil Master
    When seleciono a aba Recebimentos Pagos
    Then devo visualizar os códigos de produto 202, 203 e 204
    Given acesso o menu Recebimentos com perfil Secundário
    When seleciono a aba Recebimentos Pagos
    Then devo visualizar os códigos de produto 202, 203 e 204
    Given acesso o menu Recebimentos com perfil Operador
    When seleciono a aba Recebimentos Pagos
    Then devo visualizar os códigos de produto 202, 203 e 204

  Scenario: Verificar arranjos de pagamento na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  Scenario: Validar a exibição de arranjos VCB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Cultura].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "VCB" com a descrição "Visa Voucher"

  Scenario: Validar a exibição de arranjos MCB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Refeição].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "MCB" com a descrição "Mastercard Voucher "

  Scenario: Validar a exibição de arranjos ECB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Alimentação].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "ECB" com a descrição "Elo Voucher "

  Scenario Outline: Validar os valores de arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os valores corretos para o arranjo "<arranjo>"
      | tipoSumarizacao | arranjo | descArranjo | quantidade | valorTotalBruto | valorTotal | valorTotalMDR | valorTotalDeducoes | valorTotalContrato | valorTotalLiquido | valorTotalAntecipacaoEventual | valorTotalAntecipacaoAutomatica | valoresPagos | valorTotalAjustesCredito | valorDescontoAntecipacao | valorTotalBloqueado |
    Examples:
      | Arranjo | Visa Beneficios       | 2 | 6000 | 5700.6 | 299.4 | 0 | 0 | 0 | 0 | 0 | 5700.6 | 0 | 0 | 0 |
      | Arranjo | Mastercard Beneficios | 3 | 9000 | 8550.9 | 449.1 | 0 | 0 | 0 | 0 | 0 | 8550.9 | 0 | 0 | 0 |
      | Arranjo | Elo Beneficios        | 1 | 3000 | 2850.3 | 149.7 | 0 | 0 | 0 | 0 | 0 | 2850.3 | 0 | 0 | 0 |

  Scenario: Validar perfis de acesso para visualizar arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos com perfil "Master"
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  Scenario: Validar perfis de acesso para visualizar arranjos na aba de Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos com perfil "Operador"
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  Scenario: Validar ausência de feature toggle para arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then não deve haver feature toggle para os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  Scenario: Validar alianças para arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver as alianças Bin e Caixa para os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)
