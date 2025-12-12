#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Antecipacao/MelhoriaPerformanceNoCarregamentoMenuAntecipação
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: MelhoriaPerformanceNoCarregamentoMenuAntecipação

Scenario: Acesso ao menu de Antecipação
    Given o usuário está autenticado na plataforma
    When o usuário acessa a funcionalidade "Antecipação" a partir da home
    Then o portal deve exibir a tela de saldo do cliente e opções de "Solicitar antecipação eventual" e "Solicitar antecipação automática"

Scenario: Clicar na aba "Histórico de solicitações"
    Given o usuário está na tela de saldo do cliente na funcionalidade "Antecipação"
    When o usuário clica na aba "Histórico de solicitações"
    Then o portal deve enviar a requisição para o histórico de solicitações e exibir os resultados correspondentes a funcionalidade de histórico de solicitações

Scenario: Clicar na aba "Relatório de antecipação"
    Given o usuário está na tela de saldo do cliente na funcionalidade "Antecipação"
    When o usuário clica na aba "Relatório de antecipação"
    Then o portal deve enviar a requisição para o relatório de antecipação e exibir os resultados correspondentes

Scenario Outline: Carregamento da tela de Antecipação para diferentes perfis
    Given o usuário está autenticado na plataforma como <perfil>
    When o usuário acessa a funcionalidade "Antecipação" a partir da home
    Then o portal deve exibir a tela de saldo do cliente e opções de "Solicitar antecipação eventual" e "Solicitar antecipação automática"
    Examples:
      | perfil     |
      | Master     |
      | Secundario |
      | Operador   |

Scenario: Requisição para "Solicitar antecipação"
    Given o usuário está na tela de saldo do cliente na funcionalidade "Antecipação"
    When o usuário clica na opção "Solicitar antecipação eventual"
    Then uma requisição deve ser enviada para solicitar a antecipação eventual
    And o portal deve exibir a confirmação da solicitação realizada

Scenario: Apenas requisição inicial na tela de Antecipação
    Given o usuário está autenticado na plataforma
    When o usuário acessa a funcionalidade "Antecipação" a partir da home
    Then o portal deve realizar apenas a requisição necessária para exibir a tela inicial de solicitação de antecipação

Scenario: Validar estabilidade e performance da funcionalidade Antecipação
    Given o usuário está autenticado na plataforma
    When o usuário acessa a funcionalidade "Antecipação"
    Then o tempo de resposta para carregar a tela inicial deve ser inferior a 2 segundos
    And a funcionalidade deve se manter estável durante a navegação entre as abas "Histórico de solicitações" e "Relatório de antecipação"