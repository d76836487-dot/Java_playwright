#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/Filtros
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Filtros

  Scenario: Remover filtros Cancelada e Cancelada parcial da aba Hoje
    Given acesso no menu de vendas Hoje
    When verifico os filtros disponíveis
    Then os filtros Cancelada e Cancelada parcial não devem estar presentes

  Scenario: Verificar filtros disponíveis na aba Hoje
    Given acesso a aba de vendas Hoje no menu vendas
    When verifico o filtros disponíveis
    Then os filtros disponíveis devem ser:
      | Filtro         |
      | Ativa          |
      | Pendente       |
      | Concluida      |

  Scenario: Validar que filtros Cancelada e Cancelada parcial não retornam resultados na aba Hoje
    Given acesso a aba vendas Hoje
    When aplico o filtro Cancelada
    Then não deve retornar nenhum resultado

  Scenario Outline: Verificar comportamento de filtros na aba Hoje
    Given acesso a aba de vendas Hoje no aba
    When aplico o filtro <filtro>
    Then deve retornar resultados correspondentes ao filtro <filtro>
    Examples:
      | filtro    |
      | Ativa     |
      | Pendente  |
      | Concluida |

  Scenario: Validar que filtros removidos não afetam outros filtros na aba Hoje
    Given acesso aba de vendas Hoje
    When aplico o filtro Ativa
    Then deve retornar resultados correspondentes ao filtro Ativa

  Scenario: Validar que filtros estão removidos não afetam outros filtros na aba Hoje
    Given acesso a aba de vendas Hoje
    When aplico o filtro Pendente
    Then deve retornar resultados correspondentes ao filtro Pendente

  Scenario: Validar que os filtros removidos não afetam outros filtros na aba Hoje
    Given acesso vendas Hoje
    When aplico o filtro Concluída
    Then deve retornar resultados correspondentes ao filtro Concluída
