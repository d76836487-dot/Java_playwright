#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/HistoricoDeVendasParaTransacoesVoucherPAT
@Zephyr:Status=Approved
@Zephyr:Component=BDD&Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: HistoricoDeVendasParaTransacoesVoucherPAT

Scenario Outline: Verificar detalhes de transação de voucher no histórico de vendas para diferentes bandeiras
    Given que o usuário acessa a aba "Histórico de vendas"
    When o usuário clica em uma venda de voucher da bandeira <bandeira>
    Then os detalhes da venda devem exibir os seguintes campos:
      | Campo                      |
      | Data e horario             |
      | Valor bruto                |
      | Bandeira                   |
      | Status                     |
      | Modalidade                 |
      | Produto                    |
      | Status (Order ID)          |
      | Metodo de captura          |
      | Numero do terminal         |
      | Estabelecimento            |
      | Numero do cartao           |
      | Cod. de autorizacao        |
      | CV                         |
      | Codigo de referencia do cartao |
      | Valor liquido              |
      | Previsao de pagamento em   |
      | Valor da taxa (MDR)        |
      | Pago em                   |
    Examples:
      | bandeira   |
      | Elo        |
      | Visa       |
      | Mastercard |

Scenario: Verificar apresentação dos campos no comprovante em PDF
    Given que o usuário acessa a aba "Histórico de vendas"
    When o usuário clica em uma venda de voucher da bandeira Elo
    And o usuário gera o comprovante em PDF
    Then o comprovante em PDF deve exibir os seguintes campos:
      | Campo                      |
      | Data e horario             |
      | Valor bruto                |
      | Bandeira                   |
      | Status                     |
      | Modalidade                 |
      | Produto                    |
      | Status (Order ID)          |
      | Metodo de captura          |
      | Numero do terminal         |
      | Estabelecimento            |
      | Numero do cartao           |
      | Cod. de autorizacao        |
      | CV                         |
      | Codigo de referencia do cartao |
      | Valor liquido              |
      | Previsao de pagamento em   |
      | Valor da taxa (MDR)        |
      | Pago em                   |

Scenario: Verificar processo de cancelamento de venda de voucher
    Given que o usuário acessa a aba "Histórico de vendas"
    When o usuário clica em uma venda de voucher da bandeira Elo
    And o usuário clica no botão de cancelamento de venda
    Then a venda deve ser cancelada com sucesso