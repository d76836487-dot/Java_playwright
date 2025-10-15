#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/FiltrosVendas
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: FiltrosVendas


Scenario: Verificar remoção dos filtros "Cancelada" e "Cancelada parcial" na aba "Hoje"
    Given acesso a aba "Hoje" na plataforma de vendas
    When verifico os filtros disponíveis
    Then os filtros "Cancelada" e "Cancelada parcial" não devem estar presentes

Scenario: Filtrar vendas na aba "Hoje" sem os filtros "Cancelada" e "Cancelada parcial"
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico filtros para visualizar vendas
    Then as vendas filtradas não devem incluir status "Cancelada" ou "Cancelada parcial"

Scenario Outline: Aplicar diferentes filtros na aba "Hoje"
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico o filtro "<filtro>"
    Then as vendas filtradas devem corresponder ao filtro "<filtro>"
    Examples:
      | filtro            |
      | Confirmada        |
      | Pendente          |
      | Em processamento  |

Scenario: Verificar a remoção dos filtros "Cancelada" e "Cancelada parcial" após atualização
    Given acesso a aba "Hoje" na plataforma de vendas após atualização
    When verifico os filtros disponíveis
    Then os filtros "Cancelada" e "Cancelada parcial" não devem estar presentes

Scenario: Garantir que vendas com status "Cancelada" e "Cancelada parcial" não aparecem na aba "Hoje"
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico filtros para visualizar vendas
    Then as vendas com status "Cancelada" e "Cancelada parcial" não devem ser exibidas

Scenario: Verificar a funcionalidade de filtragem na aba "Hoje" após remoção dos filtros
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico filtros para visualizar vendas
    Then a funcionalidade de filtragem deve funcionar corretamente sem os filtros "Cancelada" e "Cancelada parcial"

Scenario: Testar a performance da aba "Hoje" após remoção dos filtros
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico filtros para visualizar vendas
    Then a performance da aba deve ser adequada e sem lentidão

Scenario: Garantir que a interface da aba "Hoje" está correta após remoção dos filtros
    Given acesso a aba "Hoje" na plataforma de vendas
    When verifico a interface da aba
    Then a interface deve estar correta e sem os filtros "Cancelada" e "Cancelada parcial"

Scenario: Verificar a consistência dos dados na aba "Hoje" após remoção dos filtros
    Given acesso a aba "Hoje" na plataforma de vendas
    When aplico filtros para visualizar vendas
    Then os dados exibidos devem ser consistentes e corretos