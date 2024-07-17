#language:en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Cancelamento_de_Vendas/Cancelamento_de_Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Cancelamento de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T249
  Scenario: Cliente solicita cancelamento de transação
    Given que o cliente está navegando no menu Histórico de vendas
    When o cliente clica sobre a transação que deseja cancelar
    Then um modal é aberto exibindo os detalhes da transação
    And há um botão "Solicitar cancelamento" disponível no modal

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T291
  Scenario: Preenchimento do campo Valor para cancelamento parcial
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor menor do que o valor original da transação
    Then o sistema entende que o cancelamento é parcial

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T244
  Scenario: Preenchimento do campo Valor para cancelamento total
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor igual ao valor original da transação
    Then o sistema entende que o cancelamento é total

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T373
  Scenario: Preenchimento do campo Valor com valor maior que o original
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor maior do que o valor original da transação
    Then o sistema exibe a mensagem "O valor inserido é maior do que o valor original da transação. Por favor, insira um valor válido."

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T271
  Scenario: Preenchimento do campo Valor com valor negativo
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor negativo
    Then o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor positivo."

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T447
  Scenario: Preenchimento do campo Valor com valor não numérico
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente preenche o campo Valor com um valor não numérico
    Then o sistema exibe a mensagem "O valor inserido é inválido. Por favor, insira um valor numérico válido."

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T261
  Scenario: Seleção de motivo para cancelamento
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente procura pelo campo Motivo
    Then o sistema exibe as seguintes opções para seleção:
      | Motivo                |
      | Produto defeituoso    |
      | Desistência da compra |
      | Arrependimento        |
      | Outro motivo          |

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T281
  Scenario: Seleção de "Outro motivo" e exibição do componente "Descreva brevemente o motivo"
    Given que o cliente selecionou "Outro motivo" como motivo para cancelamento
    When o campo "Outro motivo" é selecionado
    Then o sistema exibe o componente "Descreva brevemente o motivo" com um contador regressivo de caracteres limitado a 40

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T371
  Scenario: Fechamento do modal
    Given que o cliente está visualizando os detalhes da transação no modal
    When o cliente clica no botão "x" ou "Fechar"
    Then o modal é fechado e o cliente é devolvido para o detalhe da venda anteriormente selecionada

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T480
  Scenario: Registro do pedido de cancelamento
    Given que o cliente preencheu todas as informações necessárias para o cancelamento da transação
    When o cliente clica no botão "Solicitar cancelamento"
    Then o sistema registra o pedido de cancelamen

  #==========================================================================================================================================================
  # adicionado Demetrios
  @TestCaseKey=LPDC-T262
  Scenario: Acessando os Menus
    Given que o usuário está logado no Portal
    When o usuário clica na seção Vendas no menu lateral esquerdo
    Then usuário deve visualizar as opções: "Relatório de vendas" e "Cancelamento de vendas"

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T400
  Scenario: Acesso ao menu Cancelamento de vendas
    Given que o usuário está logado no Portal
    When o usuário clica na seção Vendas no menu lateral esquerdo
    And seleciona "Cancelamento de vendas"
    Then ele deve ser direcionado para a aba de Cancelamento de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T268
  Scenario: Campo valor com saldo maior que o Valor total da venda
    Given que esteja Modal Detalhes da venda
    When o usuário “Solicitar o cancelamento” da venda
    And preencher o campo valor com um valor maior que o valor total da venda
    Then Visualizara a mensagem: “O Valor digitado excede o valor total da venda”

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T466
  Scenario: Mensagem de obrigatoriedade com outro motivo
    Given que o usuário esteja em cancelamento da venda
    When selecionar Outro Motivo
    And Não descrever nada
    Then devera exibir a mensagem Campo obrigatório

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T398
  Scenario: Modal de Resumo com as informações do cancelamento
    Given que o usuário esteja em cancelamento da venda
    When preencher o campo valor com um valor parcial e Motivo
    And selecionar o Botão: solicitar o cancelamento
    Then visualizara um modal de Resumo com Valor a ser cancelado , Cancelamento , Motivo , Valor total da venda , Codigo de autorização , Produto , Cartão , Data da venda , uma mensagem de analize e os botões “Fechar” e “Confirmar Solicitação de Cancelamento”

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T463
  Scenario: Confirmar solicitação de Cancelamento
    Given que o usuário esteja em Resumo do cancelamento
    When confirmar a solicitação de cancelamento
    Then será exibida a mensagem: “Sua solicitação de cancelamento de venda foi criada com sucesso e já está em análise”

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T247
  Scenario Outline: Solicitando Cancelamento
    Given que o usuário esteja o cancelamento da venda
    When preencher os campos valor com um valor parcial e “Motivo”
    And selecionar solicitar o cancelamento
    And  Confirmar solicitação de cancelamento
    Then será exibida a mensagem: "Sua solicitação de cancelamento de venda foi criada com sucesso e já está em análise'
    Examples:
      | Motivo                  | Produto           | Valor         |
      | Cobrança duplicada      | Crédito a vista   | Valor Parcial |
      | Desistiu da Compra      | Parcelado emissor | Valor Parcial |
      | Devolução de Mercadoria | Parcelado emissor | Valor Total   |
      | Modalidade incorreta    | Parcelado Lojista | Valor Total   |
      | Valor incorreto         | Parcelado Lojista | Valor Parcial |
      | Outro Motivo            | Crédito a vista   | Valor Total   |

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T264
  Scenario: Solicitando Cancelamento / valor não numérico
    Given esteja em Cancelamento de Venda
    When digitar caractere ou letra no campo Valor
    Then não deverá ser permitido

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T279
  Scenario: Botão Fechar no Modal Detalhe da Venda
    Given esteja em Cancelamento de Venda
    When selecionar o Fechar
    Then deverá retornar a tela Histórico de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T240
  Scenario: Botão X no Modal Detalhe da Venda
    Given esteja em Cancelamento de Venda
    When selecionar o ‘’X’’
    Then deverá retornar a tela Histórico de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T246
  Scenario: Botão Fechar no Resumo cancelar venda
    Given usuário esteja no Resumo da venda
    When selecionar “Fechar” abaixo
    Then deverá retornar a tela Histórico de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T445
  Scenario: Botão X no Resumo cancelar venda
    Given usuário esteja no Resumo da venda
    When selecionar “X” acima
    Then deverá retornar a tela Histórico de Vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T259
  Scenario: Itens em Cancelamento de Vendas
    Given que o usuário está logado no Portal
    When o usuário clica na seção de Vendas no menu lateral esquerdo
    And seleciona "Cancelamento de vendas"
    Then ele deve ser direcionado para a aba Cancelamento de Vendas
    And visualizara, Período por default “Esse mês”, Botão Exportar na cor da Instituição

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T395
  Scenario: Layout em Cancelamento de Vendas por periodo
    Given que o usuário esteja em "Cancelamento de vendas"
    When selecionar um período
    Then Serão exibidos Total de vendas cancelados , total de valores cancelados , total de solicitações em analise de acordo com período selecionado.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T372
  Scenario: Cancelamento de Vendas Solicitado com Status Fechado
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de solicitados
    Then visualizara Vendas Solicitadas com Data da solicitação, Valor Solicitado, Bandeira, Produto, Status Fechado

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T251
  Scenario: Cancelamento de Vendas Solicitado com Status Em Analise
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de solicitados
    Then visualizara Vendas Solicitadas com Data do cancelamento, Valor Solicitado, Bandeira, Produto, Status em análise

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T241
  Scenario: Cancelamento de Vendas solicitados sem Informação
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de solicitados
    Then visualizara a mensagem “Nenhum resultado encontrado Tente filtrar por outros períodos ou parâmetros.”

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T402
  Scenario: Cancelamento de Vendas Solicitado com Status cancelamento total
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de solicitados
    Then visualizara Vendas Solicitadas com Data de solicitação, Valor Solicitado, Bandeira, Produto, Status cancelamento total

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T263
  Scenario: Cancelamento de Vendas solicitado com Status cancelamento parcial
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de solicitados
    Then visualizara Vendas Solicitadas com Data de solicitação, Valor Solicitado, Bandeira, Produto, Status cancelamento Parcial

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T374
  Scenario: Cancelamento de Vendas Efetivado com Status cancelamento parcial
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de efetivados
    Then visualizara Vendas Solicitadas com Data do cancelamento, Valor Cancelado, Bandeira, Produto, Status cancelamento parcial

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T375
  Scenario: Cancelamento de Vendas Efetivado com Status cancelamento Total
    Given que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de efetivados
    Then visualizara Vendas Solicitadas com Data do cancelamento, Valor Cancelado, Bandeira, Produto, Status cancelamento Total

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T479
  Scenario: Cancelamento de Vendas Efetivado sem Vendas
    Given  que o usuário esteja em "Cancelamento de vendas"
    When acessar a aba de Efetivados sem Vendas
    Then visualizara a mensagem “Nenhum resultado encontrado Tente filtrar por outros períodos ou parâmetros.”

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T272
  Scenario: Informações no Modal Detalhes da venda
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    Then usuário visualizara um modal com as seguintes informações: Informações gerais, Givens de Pagamento, Detalhes do Recebimento , Cancelamento , Baixar carta de cancelamento e Exportar comprovante.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T254
  Scenario: Informações no Modal Detalhes da venda “Informações Gerais”
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    Then usuário visualizara um modal com as seguintes informações: Informações gerais:  Data da venda, Código de autorização, valor bruto, canal, número terminal, Status, Número de estabelecimento, Comprovante da venda, Cód do Pedido.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T311
  Scenario: Informações no Modal Detalhes da venda “Givens de pagamento”
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    Then usuário visualizara um modal com as seguintes informações: Givens de pagamento: Valor bruto, Produto, Parcelas, Bandeira, Número do cartão, cod,ref,cartão.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T401
  Scenario: Informações no Modal Detalhes da venda “Detalhes do Recebimento”
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    Then usuário visualizara um modal com as seguintes informações: Detalhes do Recebimento: Valor líquido, Valor da taxa, Taxa de desconto, Data prevista de pagamento, Data efetiva de pagamento, Código de pagamento.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T265
  Scenario: Informações no Modal Detalhes da venda “Cancelamento”
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    Then usuário visualizara um modal com as seguintes informações: Cancelamento:Data do cancelamento, Valor cancelado, Cancelamento.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T461
  Scenario: solicitar novo cancelamento no Modal Detalhes da venda na aba solicitados
    Given que o usuário esteja em "Detalhes da venda”
    When selecionar solicitar novo cancelamento
    Then deve ser redirecionado para o modal cancelar venda

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T313
  Scenario: Exportar comprovante Detalhes da venda
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com: Informações gerais  ,Givens de Pagamento , Detalhes do Recebimento , Cancelamento.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T243
  Scenario: Exportar comprovante no Modal Detalhes da venda
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com nome fantasia , número do CNPJ , número do estabelecimento comercial e a data da emissão .

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T384
  Scenario: Comprovante Modal Detalhes da venda Informações gerais
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com a aba Informações gerais
    And os campos : Data da venda, valor bruto, Canal ,Código de autorização, número terminal, Cód do Pedido , Comprovante da venda, status e valor cancelado.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T250
  Scenario: Comprovante no Modal Detalhe da venda Givens de pagamento
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com a aba Givens de pagamento e os campos : Valor da venda, Produto, Parcelas, Bandeira, Número do cartão , código de referência do cartão.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T379
  Scenario: Comprovante no Modal detalhes da venda Detalhes do recebimento
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com a aba Detalhes do recebimento e os campos: Valor liquido , valor da taxa , taxa de desconto , data prevista de pagamento , data efetivada de pagamento , código do pagamento

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T396
  Scenario: Comprovante no Modal Detalhes da venda Cancelamento
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de efetivados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com a aba Cancelamento e os campos : data da venda , valor cancelado , cancelamento

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T394
  Scenario: Comprovante no Modal Detalhes da Venda
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de solicitados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com nome fantasia, número do CNPJ , número do estabelecimento comercial e a data da emissão , Detalhe da venda e Givens da solicitação.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T477
  Scenario: Comprovante no Modal Detalhe da venda Detalhe da Venda status em análise
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de solicitados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com Detalhe da venda com os campos : data da venda , código de autorização , valor bruto , parcelas , bandeira ?, produto , canal ,numero de terminal , numero do estabelecimento ,comprovante de venda , cod do pedido e número do cartão.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T376
  Scenario: Modal Detalhe da venda Detalhe da solicitação status em análise
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de solicitados
    Then usuário visualizara o Modal com Givens da solicitação com os campos:  Valor solicitado , cancelamento , data da solicitação , caso , motivo.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T253
  Scenario: Comprovante no Modal Detalhe da venda Detalhe da solicitação status fechado
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de solicitados
    And clicar em Exportar comprovante
    Then usuário visualizara o Comprovante de Venda com Detalhe da venda com os campos: data da venda, código de autorização, valor bruto , parcelas , produto , canal ,número de terminal , número do estabelecimento ,comprovante de venda , cód. do pedido e número do cartão.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T252
  Scenario: Modal Detalhes da venda Detalhe da solicitação Status fechado
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em uma venda na aba de solicitados
    Then usuário visualizara o Modal com Detalhe da solicitação com os campos: Valor solicitado, cancelamento, data da solicitação, caso , motivo ,data da conclusão e o campo resposta vai está preenchido com o motivo.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T444
  Scenario: Fechar o modal ‘’x’’
    Given que o usuário esteja em "Cancelar de vendas"
    When seleciona “X”
    Then usuário devera voltar para a tela de cancelamento de vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T446
  Scenario: Fechar o modal ‘’ fechar ‘’
    Given que o usuário esteja em "Cancelar de vendas"
    When seleciona “fechar”
    Then usuário deverá voltar para a tela de cancelamento de vendas

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T377
  Scenario: Exportando Arquivo Excel aba solicitados
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar em Exportar
    Then deve ser exportado um arquivo Excel com nome:Cancelamento_de_vendas_Solicitados_DD-MM-AA_HHMM

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T278
  Scenario: Campos do Arquivo Excel aba solicitados
    Given que o usuário fez o Download do arquivo “Cancelamento_de_vendas_Solicitados”
    When abrir o arquivo
    Then deve exibir: Logo da instituição , Cancelamento de vendas Solicitados , Periodo de busca , emitido em data e hora, estabelecimento comercial ,total de vendas canceladas , total valor de vendas canceladas , total de solicitações em aberto e os campos : data da solicitação , valor solicitado , bandeira , produto , cancelamento e status.

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T403
  Scenario: Exportando Arquivo Excel aba Efetivados
    Given que o usuário esteja em "Cancelamento de vendas"
    When clicar no Botão Exportar
    Then deve ser exportado um arquivo Excel com nome:Cancelamento_de_vendas_Efetivados_DD-MM-AA_HHMM

  #==========================================================================================================================================================
  @TestCaseKey=LPDC-T481
  Scenario: Campos do Arquivo Excel aba efetivados
    Given que o usuário fez o Download do arquivo “Cancelamento_de_vendas_Efetivados”
    When abrir o arquivo
    Then deve exibir: Logo da instituição , Cancelamento de vendas efetivados , Periodo de busca , emitido em data e hora, estabelecimento comercial ,total de vendas canceladas , total valor de vendas canceladas , total de solicitações em aberto, e os campos : data do cancelamento, valor cancelado , bandeira , produto , e status. [

