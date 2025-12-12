#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SplitPagamentos/SplitCooperativeNovoPagamento
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SplitCooperativeNovoPagamento

  Scenario: Apresentar jornada comum para agente cooperative
    When acessar Portal do Cliente
    Then deve apresentar as mesmas jornadas que um usuário com perfilamento comum
      | usuario             |
      | Master              |
      | Segundario Consulta |
      | Operador Com F      |

  Scenario: Apresentar menu de vendas antigo para vendedor cooperative
    When acessar Portal do Cliente
    Then deve apresentar o menu de vendas antigo
      | usuario             |
      | Master              |
      | Segundario Consulta |
      | Operador Com F      |

  Scenario: Alterar nomenclatura de royalties para repasse no totalizador principal em Historico de Vendas
    Given que o usuário tenha o perfilamento cooperative vendedor
    When acessar Portal do Cliente
    Then o totalizador principal deve exibir "Valor total de repasse" ao invés de "Valor total de royalties"

  Scenario: Alterar nomenclatura de royalties para repasse na sumarização de vendas por dia
    Given que o usuário tenha o perfilamento cooperative vendedor
    When acessar Portal do Cliente
    Then sumarização de vendas no Historico de Vendas deve exibir "Valor total de repasse" ao invés de "Valor total de royalties"

  Scenario: Alterar nomenclatura de royalties para repasse na transação
    Given que o usuário tenha o perfilamento cooperative vendedor
    When acessar Portal do Cliente
    And em Historico de Vendas ele selecionar uma venda
    Then transação deve exibir o campo "Valor repasse" ao invés de "Valor royalties"

  Scenario: Ajustar nomenclaturas de royalties para repasse nos relatórios Historico de Vendas
    Given que o usuário tenha o perfilamento cooperative vendedor
    When exportar arquio Excel ou CSV em Historico de Vendas
    Then as colunas devem vir ajustadas para:
      | Simplificado  | Detalhado                  |
      |               | Valor repasse da parcela   |

  Scenario: Ajustar nomenclaturas de royalties para repasse nos relatórios de recebimentos pagos
    Given que o usuário tenha o perfilamento cooperative vendedor
    When ao exportar um relatório detalhado de Recebimentos Pagos em Excel e CSV
    Then a coluna deve ser ajustada de Valor royalties da parcela para Valor repasse da parcela

  Scenario: Verificar aba de split de pagamento não visível para Agentes e Vendedores
    When acessar Portal do Cliente
    Then a aba de split de pagamento não deve ser visível
      | usuario             |
      | Master              |
      | Segundario Consulta |
      | Operador Com F      |