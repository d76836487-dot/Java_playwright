#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/Filtros
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Filtros

  @TestCaseKey=LPDC-T1748
  Scenario: Remover filtros Cancelada e Cancelada parcial da aba Hoje
    Given acesso no menu de vendas Hoje
    When verifico os filtros disponíveis
    Then os filtros Cancelada e Cancelada parcial não devem estar presentes

  @TestCaseKey=LPDC-T1750
  Scenario: Verificar filtros disponíveis na aba Hoje
    Given acesso a aba de vendas Hoje no menu vendas
    When verifico o filtros disponíveis
    Then os filtros disponíveis devem ser:
      | Filtro    |
      | Ativa     |
      | Pendente  |
      | Concluida |

  @TestCaseKey=LPDC-T1753
  Scenario: Validar que filtros Cancelada e Cancelada parcial não retornam resultados na aba Hoje
    Given acesso a aba vendas Hoje
    When aplico o filtro Cancelada
    Then não deve retornar nenhum resultado

  @TestCaseKey=LPDC-T1754
  Scenario Outline: Verificar comportamento de filtros na aba Hoje
    Given acesso a aba de vendas Hoje no aba
    When aplico o filtro <filtro>
    Then deve retornar resultados correspondentes ao filtro <filtro>
    Examples:
      | filtro    |
      | Ativa     |
      | Pendente  |
      | Concluida |

  @TestCaseKey=LPDC-T1755
  Scenario: Validar que filtros removidos não afetam outros filtros na aba Hoje
    Given acesso aba de vendas Hoje
    When aplico o filtro Ativa
    Then deve retornar resultados correspondentes ao filtro Ativa

  @TestCaseKey=LPDC-T1757
  Scenario: Validar que filtros estão removidos não afetam outros filtros na aba Hoje
    Given acesso a aba de vendas Hoje
    When aplico o filtro Pendente
    Then deve retornar resultados correspondentes ao filtro Pendente

  @TestCaseKey=LPDC-T1752
  Scenario: Validar que os filtros removidos não afetam outros filtros na aba Hoje
    Given acesso vendas Hoje
    When aplico o filtro Concluída
    Then deve retornar resultados correspondentes ao filtro Concluída

  @TestCaseKey=LPDC-T1932
  Scenario: Apresentar botão "Carta de cancelamento" para venda cancelada
    Given que estou no "Histórico de vendas"
    And a venda possui status "Cancelada"
    When visualizo os detalhes da venda
    Then deve ser apresentado o botão "Carta de cancelamento"

  @TestCaseKey=LPDC-T1923
  Scenario: Apresentar botão "Carta de cancelamento" para venda cancelada parcialmente
    Given que estou no "Histórico de vendas"
    And a venda possui status "Cancelada Parcial"
    When visualizo os detalhes da venda
    Then deve ser apresentado o botão "Carta de cancelamento"

  @TestCaseKey=LPDC-T1926
  Scenario: Apresentar múltiplas cartas de cancelamento para múltiplos cancelamentos
    Given que estou no "Histórico de vendas"
    And a venda possui múltiplos cancelamentos
    When visualizo os detalhes da venda
    Then deve ser apresentado todas as cartas de cancelamento disponíveis

Scenario: Verificar mensagem de erro ao não carregar a API na aba Hoje
    Given acesso a aba "Hoje" no menu Vendas
    When clico no filtro "Terminal"
    And a API não carrega os dados
    Then deve ser mostrada uma mensagem de erro "Erro ao carregar os dados. Tente novamente."