#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Link_de_Pagamento_Selecao_de_Parcelas_e_Order_Id
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Link de Pagamento Selecao de Parcelas e Order Id

  Scenario: Link pagamento unico em ate 21X Parcelado Lojista Pago
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    And efetuando o paganento que devera dar a opcao de A Vista até 21X
    Then o mesmo deve constar na aba Consultar Links e no dia seguinte em historico de Vendas como Pago
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Link pagamento unico em ate 21X Parcelado Lojista sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetuando o Pagamento
    Then depois de 48H link aparecera nas abas consultar links e historico de Vendas com o Status expirado
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Link pagamento unico em ate 12X Parcelado Emissor Pago
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    And efetuando o paganento que devera dar a opcao de A Vista até 12X
    Then o mesmo deve constar na aba Consultar Links e no dia seguinte em historico de Vendas como Pago
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Link pagamento unico em ate 12X Parcelado Emissor sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetuando o Pagamento
    Then depois de 48H link aparecera na aba consultar links e historico de Vendas com o Status expirado
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe da Venda com status (autorizado) - Historico de Vendas
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status autorizado
    Then visualizara o modal Detalhe do link de pagamento com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe da venda com status (ativo)
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status ativo
    Then visualizara o modal Detalhe da venda com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe da venda com status (Expirado)
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status expirado
    Then visualizara o modal Detalhe da venda com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe da venda com status (Negado)
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status negado
    Then visualizara o modal Detalhe da venda com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe da venda com status (Estornado)
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status estornado
    Then visualizara o modal Detalhe da venda com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Detalhe do link de pagamento (pago)
    Given usuário esteja na aba historico de vendas
    When selecionar uma transação de link de pagamento com status pago
    Then visualizara o modal Detalhe da venda com Informações gerais: Data da venda,Código de autorização, Valor Bruto, Canal, Status, Numero do terminal, Numero do estabelecimento, Comprovante da venda, Codigo do pedido, Descricao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Validar arquivo Excel - Link de Pagamento Selecao de Parcelas e Order Id
    Given usuário esteja na aba historico de vaendas
    When selecionar exportar
    And selecionar arquivo excel simplificado ou detalhado
    And clicar em gerar arquivo
    Then devera baixar na sua maquina o arquivo contendo as seguintes informaçoes,Relatório de vendas ,Período de Venda, Emitido em,Estabelecimento comercial,Total de vendas,Valor bruto,Valor líquido,Valor cancelado
    And as colunas, Data da Venda, Cód de autorização, Produto, Parcelas, Bandeira, Canal, Valor Original da venda, Valor Bruto, Valor da taxa, valor liquido, Valor Cancelado, status, numero de terminal, comprovante de venda, Cód do Pedido, Numero do estabelecimento, nome do estabelecimento, Descriçao,Numero do cartao, Cód de Ref Cartao
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Validar arquivo CSV - Link de Pagamento Selecao de Parcelas e Order Id
    Given usuário esteja na aba historico de vaendas
    When selecionar exportar
    And selecionar arquivo CSV simplificado ou detalhado
    And clicar em gerar arquivo
    Then devera baixar na sua maquina o arquivo contendo as seguintes informaçoes,Relatório de vendas ,Período selecionado, Emitido em,Documento/EC
    And as colunas, Data da venda, Hora da venda, Código de autorização, Código do estabelecimento, Nome do estabelecimento, Comprovante de venda,Código do pedido,Canal, Número do Terminal, Produto, Parcelas, Tipo de cartão, Bandeira, Status, Valor Original da Venda, Valor bruto da transação, Valor bruto da parcela, Valor da taxa (MDR), Valor líquido da parcela/transação, Descrição, Número do cartão, Cartão pré pago, Data prevista de pagamento da venda,Status do pagamento da venda, Data efetiva do pagamento da venda, Código de pagamento, Cód. Ref. Cartão
      | Perfis  |
      | master  |
      | sec op  |
      | sec con |

  Scenario: Criar link unico - Operador com F
    Given usuário operador COM F acessou a jornada de link de pagamento
    When todo o cadastro do EC do cliente estiver OK
    And operador clicar em "Solicitar link de pagamento único"
    Then o operador deve conseguir chegar até a tela de resumo mas o botão "Gerar link de pagamento" deve ficar desabilitado

  Scenario: Copiar link de pagamento gerado - aba Links gerados - status ativo - Operador com F
    Given usuário operador COM F acessou a jornada de link de pagamento
    When estiver na aba links gerados
    And operador clicar no detlalhe de um link com status ativo
    Then o operador não deve conseguir copiar o link gerado

  Scenario: Criar link unico - Operador sem F
    Given usuário operador SEM F acessou a jornada de link de pagamento
    When todo o cadastro do EC do cliente estiver OK
    And operador clicar em "Solicitar link de pagamento único"
    Then o operador deve conseguir chegar até a tela de resumo mas o botão "Gerar link de pagamento" deve ficar desabilitado

  Scenario: Copiar link de pagamento gerado - aba Links gerados - status ativo - Operador sem F
    Given usuário operador SEM F acessou a jornada de link de pagamento
    When estiver na aba links gerados
    And operador clicar no detlalhe de um link com status ativo
    Then o operador não deve conseguir copiar o link gerado