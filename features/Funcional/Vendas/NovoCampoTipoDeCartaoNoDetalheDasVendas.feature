#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/NovoCampoTipoDeCartaoNoDetalheDasVendas/NovoCampoTipoDeCartaoNoDetalheDasVendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@SplitPagamentos
Feature: Novo campo tipo de cartao no detalhe das Vendas

Scenario Outline: Verificar valor do campo "Tipo de cartão" para transação nacional
    Given acesso a plataforma de vendas
    When abro detalhes de uma venda na aba "Histórico" com o código de tipo de cartão <codigo>
    Then o campo "Tipo de cartão" deve exibir "<tipo_cartao>"

    Examples:
      | codigo | tipo_cartao  |
      | 002    | Nacional     |
      | 898    | Nacional     |

Scenario: Garantir que perfis Master, Secundário e Operador consigam visualizar o campo "Tipo de cartão"
    Given acesso a plataforma de vendas como usuário Master
    When abro detalhes de uma venda na aba "Histórico"
    Then o campo "Tipo de cartão" deve ser exibido

    Given acesso a plataforma de vendas como usuário Secundário
    When abro detalhes de uma venda na aba "Histórico"
    Then o campo "Tipo de cartão" deve ser exibido

    Given acesso a plataforma de vendas como usuário Operador
    When abro detalhes de uma venda na aba "Histórico"
    Then o campo "Tipo de cartão" deve ser 'exibido'