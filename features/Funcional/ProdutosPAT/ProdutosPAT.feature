#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/ProdutosPAT/PAT
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: PAT

  @TestCaseKey=LPDC-T1797
  Scenario: Vendas Hoje Cartão Visa
    Given que o usuário possui um cartão válido VISA
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  @TestCaseKey=LPDC-T1808
  Scenario: Vendas Hoje Cartão Master
    Given que o usuário possui um cartão válido MASTER
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  @TestCaseKey=LPDC-T1800
  Scenario: Vendas Hoje Cartão Elo
    Given que o usuário possui um cartão válido Elo
    And que o terminal está devidamente habilitado Terminal 1
    When o usuário realiza uma venda
    And a venda deve ser aprovada no Portal do Cliente

  @TestCaseKey=LPDC-T1799
  Scenario: Vendas Hoje Estorno Master
    Given que o usuário realizou uma transação MASTER
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  @TestCaseKey=LPDC-T1820
  Scenario: Vendas Hoje Estorno Visa
    Given que o usuário realizou uma transação Visa
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  @TestCaseKey=LPDC-T1830
  Scenario: Vendas Hoje Estorno Elo
    Given que o usuário realizou uma transação Elo
    When o usuário realiza o estorno da transação
    And a transação deve ser apresentada como estornada no Portal do Cliente

  @TestCaseKey=LPDC-T1803
  Scenario: Vendas Hoje Exportar Arquivo Excel
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo Excel
    Then Arquivo deve ser estraido e Conter todos os dados

  @TestCaseKey=LPDC-T1798
  Scenario: Vendas Hoje Exportar Arquivo CSV
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo CSV
    Then Arquivo deve ser estraido e Conter todos os dados

  @TestCaseKey=LPDC-T1821
  Scenario: Vendas Hoje Busca Por Codigo de Autorizaçao
    Given usuario esta na aba Vendas Hoje
    When Buscar por um Codigo de Autorização Valido
    Then Ao Clicar na Lupa devera trazer a transação que condiz com aquele codigo de autorização

  @TestCaseKey=LPDC-T1813
  Scenario: Histórico de Vendas bandeira Visa modalidades Refeição, Alimentação e Cultura
    Given acesso a aba "Histórico de Vendas"
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações

  @TestCaseKey=LPDC-T1809
  Scenario: Historico de Vendas Exportar Arquivo Excel
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo Excel
    Then Arquivo deve ser estraido e Conter todos os dados

  @TestCaseKey=LPDC-T1822
  Scenario: Historico de Vendas Exportar Arquivo CSV
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo CSV
    Then Arquivo deve ser estraido e Conter todos os dados

  @TestCaseKey=LPDC-T1816
  Scenario: Historico de Vendas Exportar Arquivo PDF
    Given usuario esta na aba Vendas
    When Seleciona Para Extrair um Arquivo PDf
    Then Arquivo deve ser estraido e Conter todos os dados

  @TestCaseKey=LPDC-T1829
  Scenario: Historico de Vendas Busca Por Codigo de Autorizaçao
    Given usuario esta na aba Historico de Vendas
    When Buscar por um Codigo de Autorização Valido
    Then Ao Clicar na Lupa devera trazer a transação que condiz com aquele codigo de autorização

  @TestCaseKey=LPDC-T1814
  Scenario: Historico de Vendas - Detalhe de Venda
    Given usuario esta na aba Historico de Vendas
    When seleciona uma Venda de Voucher Master , Elo ou Visa
    Then deve se abrir um Modal com os Detalhes daquela Venda

  @TestCaseKey=LPDC-T1825
  Scenario: Historico de Vendas - Exportando Comprovante da Venda
    Given usuario esta em Detalhes daquela Venda
    When selecionar o Botão Exportar comprovante
    Then deve se abrir um comprovante Web Contendo todas as Informações daquela venda
    And tambem Exportar Arquivo PDF contendo as mesmas informações

  @TestCaseKey=LPDC-T1802
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

  @TestCaseKey=LPDC-T1817
  Scenario: Recebimentos Pagos - Exportar Comprovante
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    Then Clicando em Exportar comprovante devera baixar o mesmo contendo as informações

  @TestCaseKey=LPDC-T1824
  Scenario: Historico de Vendas pagas - Arquivo Excel
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    And em Historico de Pagamento clicar em ver detalhes
    Then ao selecionar o Botão Exportar devera baixar o arquivo Excel com as Informações das transações

  @TestCaseKey=LPDC-T1805
  Scenario: Historico de Vendas pagas - Arquivo CSV
    Given usuario esta em Recebimentos Pagos
    When selecionar em Historico de pagamentos > Meus Domicilios
    And selecionar um pagamento
    And em Historico de Pagamento clicar em ver detalhes
    Then ao selecionar o Botão Exportar devera baixar o arquivo CSV com as Informações das transações

  @TestCaseKey=LPDC-T1826
  Scenario: Menu Negocio - Meus Domicilios
    Given que o usuário está logado
    When acessa o menu Negócio > Meus Domicilios
    Then as bandeiras Visa, Mastercard e Elo na modalidade Voucher devem ser exibidas

  @TestCaseKey=LPDC-T1815
  Scenario: Menu Negocio - Taxas e Tarifas
    Given que o usuário está logado
    When ele acessa o menu Negócio > Taxas e tarifas
    Then visualizara as bandeiras Visa, Master, Elo Voucher com as suas respectivas taxas e prazo

  @TestCaseKey=LPDC-T1818
  Scenario: Verificar novos códigos de produto no menu Recebimentos
    Given acesso o menu Recebimentos
    When seleciono a aba Recebimentos Pagos
    Then os códigos de produto voucher devem estar visível

  @TestCaseKey=LPDC-T1801
  Scenario: Validar detalhes do pagamento para código de produto 202
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 202
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto        |
      | 2             | 53924548360      | 20251008         | 3800.4            | 341         | 001268        | 0000987654321       | 002               | Processada      | 250             | Pagamentos pelo EC | Enviado       | 003         | Visa         | 202        | Adq - VISA Voucher |

  @TestCaseKey=LPDC-T1827
  Scenario: Validar detalhes do pagamento para código de produto 203
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 203
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto          |
      | 3             | 53924548361      | 20251009         | 4200.5            | 341         | 001269        | 0000987654322       | 003               | Processada      | 251             | Pagamentos pelo EC | Enviado       | 004         | MasterCard   | 203        | Adq - Master Voucher |

  @TestCaseKey=LPDC-T1819
  Scenario: Validar detalhes do pagamento para código de produto 204
    Given acesso o menu Recebimentos
    And seleciono a aba Recebimentos Pagos
    When verifico os detalhes do pagamento para o código de produto 204
    Then os detalhes devem ser:
      | qtdTransacoes | numeroOrdemPagto | dataEfetivaPagto | valorPagtoLiquido | numeroBanco | numeroAgencia | numeroContaCorrente | codigoStatusPagto | descStatusPagto | codigoTipoPagto | descTipoPagto      | situacaoPagto | codBandeira | descBandeira | codProduto | descProduto        |
      | 4             | 53924548362      | 20251010         | 4500.6            | 341         | 001270        | 0000987654323       | 004               | Processada      | 252             | Pagamentos pelo EC | Enviado       | 005         | Amex         | 204        | Adq - Amex Voucher |

  @TestCaseKey=LPDC-T1823
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

  @TestCaseKey=LPDC-T1804
  Scenario: Verificar arranjos de pagamento na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  @TestCaseKey=LPDC-T1806
  Scenario: Validar a exibição de arranjos VCB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Cultura].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "VCB" com a descrição "Visa Voucher"

  @TestCaseKey=LPDC-T1828
  Scenario: Validar a exibição de arranjos MCB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Refeição].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "MCB" com a descrição "Mastercard Voucher "

  @TestCaseKey=LPDC-T1812
  Scenario: Validar a exibição de arranjos ECB na aba Agenda de Recebimentos UR ELO, MASTER e VISA [Alimentação].
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver o arranjo "ECB" com a descrição "Elo Voucher "

  @TestCaseKey=LPDC-T1831
  Scenario Outline: Validar os valores de arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os valores corretos para o arranjo "<arranjo>"
      | tipoSumarizacao | arranjo | descArranjo | quantidade | valorTotalBruto | valorTotal | valorTotalMDR | valorTotalDeducoes | valorTotalContrato | valorTotalLiquido | valorTotalAntecipacaoEventual | valorTotalAntecipacaoAutomatica | valoresPagos | valorTotalAjustesCredito | valorDescontoAntecipacao | valorTotalBloqueado |
    Examples:
      | Arranjo | Visa Beneficios       | 2 | 6000 | 5700.6 | 299.4 | 0 |
      | Arranjo | Mastercard Beneficios | 3 | 9000 | 8550.9 | 449.1 | 0 |
      | Arranjo | Elo Beneficios        | 1 | 3000 | 2850.3 | 149.7 | 0 |

  @TestCaseKey=LPDC-T1811
  Scenario: Validar perfis de acesso para visualizar arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos com perfil "Master"
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  @TestCaseKey=LPDC-T1796
  Scenario: Validar perfis de acesso para visualizar arranjos na aba de Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos com perfil "Operador"
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  @TestCaseKey=LPDC-T1810
  Scenario: Validar ausência de feature toggle para arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then não deve haver feature toggle para os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

  @TestCaseKey=LPDC-T1807
  Scenario: Validar alianças para arranjos na aba Agenda de Recebimentos UR
    Given acesso a plataforma de recebimentos
    When navego até a aba "Agenda de Recebimentos UR"
    Then devo ver as alianças Bin e Caixa para os arranjos de pagamento das bandeiras Voucher PAT (Elo, Visa e Master)

Scenario: Visualizar detalhes de venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    Then vejo os detalhes da venda com os seguintes campos:
      | Campo                       |
      | Data e horario              |
      | Valor bruto                 |
      | Bandeira                    |
      | Status                      |
      | Modalidade                  |
      | Produto                     |
      | Status (Order ID)           |
      | Metodo de captura           |
      | Numero do terminal          |
      | Estabelecimento             |
      | Numero do cartao            |
      | Cod. de autorizacao         |
      | CV                          |
      | Codigo de referencia do cartao |
      | Valor liquido               |
      | Valor da taxa (MDR)         |
      | Previsao de pagamento em    |
      | Pago em                     |

Scenario: Verificar campo "Produto" em venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    Then o campo "Produto" deve exibir "Voucher"

Scenario: Verificar campo "Modalidade" em venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    Then o campo "Modalidade" deve exibir "Voucher"

Scenario: Gerar comprovante em PDF de venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    And gero o comprovante em PDF
    Then o comprovante deve conter os mesmos campos listados nos detalhes da venda

Scenario: Cancelar venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    And seleciono a opção de cancelar a venda
    Then a venda deve ser cancelada com sucesso

Scenario Outline: Verificar detalhes de venda de voucher PAT para diferentes bandeiras
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher da bandeira <bandeira>
    Then vejo os detalhes da venda com os seguintes campos:
      | Campo                       |
      | Data e horario              |
      | Valor bruto                 |
      | Bandeira                    |
      | Status                      |
      | Modalidade                  |
      | Produto                     |
      | Status (Order ID)           |
      | Metodo de captura           |
      | Numero do terminal          |
      | Estabelecimento             |
      | Numero do cartao            |
      | Cod. de autorizacao         |
      | CV                          |
      | Codigo de referencia do cartao |
      | Valor liquido               |
      | Valor da taxa (MDR)         |
      | Previsao de pagamento em    |
      | Pago em                     |
    Examples:
      | bandeira  |
      | Elo       |
      | Visa      |
      | Mastercard|

Scenario: Verificar ausência de mensagem em cinza em venda de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    Then não deve haver nenhuma mensagem em cinza no canto inferior da tela

Scenario: Manter botão e processo de cancelamento de vendas de voucher PAT
    Given acesso a aba "Histórico de vendas"
    When clico em uma venda de voucher das bandeiras Elo, Visa ou Mastercard
    Then o botão e o processo de cancelamento de vendas devem estar disponíveis