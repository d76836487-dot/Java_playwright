#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/HistoricoVendasPAT
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: HistoricoVendasPAT


  Scenario: Verificar exibição do produto Voucher na aba Histórico de Vendas
    Given acesso a aba "Histórico de Vendas"
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

  Scenario: Verificar exibição do produto Voucher no relatório Excel
    Given acesso a aba "Histórico de Vendas"
    When exporto o relatório em formato Excel
    Then o campo "Produto" no relatório Excel deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

  Scenario: Verificar exibição do produto Voucher no relatório CSV
    Given acesso a aba "Histórico de Vendas"
    When exporto o relatório em formato CSV
    Then o campo "Produto" no relatório CSV deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

  Scenario: Verificar exibição do produto Voucher no relatório PDF
    Given acesso a aba "Histórico de Vendas"
    When exporto o relatório em formato PDF
    Then o campo "Produto" no relatório PDF deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

  Scenario: Verificar exibição do produto Voucher no comprovante PDF da transação
    Given acesso a aba "Histórico de Vendas"
    When gero o comprovante PDF de uma transação
    Then o campo "Produto" no comprovante PDF deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

  Scenario Outline: Verificar exibição do produto Voucher para diferentes perfis de usuário
    Given acesso a aba "Histórico de Vendas" com perfil <perfil>
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204
    Examples:
      | perfil       |
      | Master       |
      | Secundario   |
      | Operador     |

  Scenario: Verificar exibição do produto Voucher para diferentes alianças
    Given acesso a aba "Histórico de Vendas" com aliança Bin
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

    Given acesso a aba "Histórico de Vendas" com aliança Caixa
    When realizo uma consulta de vendas
    Then a coluna "Produto" deve exibir "Voucher" para transações com codProdutoTransacao 202, 203 e 204

