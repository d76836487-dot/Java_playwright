#language: en
@playwright @consistência
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Agenda_de_recebimentos_por_UR_com_Consistência
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Agenda de recebimentos por UR com Consistência

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessou a página de Agenda de Recebimentos por UR
    And Existem recebimentos listados

  @TestCaseKey=SMP-T326
  Scenario Outline: Valida valores da UR se é igual a outras datas já consultadas
    Given Carregou arquivo com histórico do "UR" de <dias úteis> dias úteis
    When Usuário seleciona data com base no arquivo de consistência
    Then Campo "Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Valor Total" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Valor pago" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total bruto" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total taxa MDR" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total antecipação Eventual" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total antecipação automática" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total de deduções" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total ajustes crédito" terá mesmo valor que consultado antes, salvando em arquivo
    And Campo "Agenda de Recebimentos por UR - Resumo - Total contratos" terá mesmo valor que consultado antes, salvando em arquivo
    Examples:
      | dias úteis |
      | 0          |
      | -1         |
      | -2         |
      | -3         |
      | -4         |
      | -5         |

  @TestCaseKey=SMP-T327
  Scenario Outline: Valida valores futuro da UR se é igual a outras datas já consultadas
    Given Carregou arquivo com histórico do "UR" de <dias úteis> dias úteis
    When Usuário seleciona data com base no arquivo de consistência
    Then Campo "Agenda de Recebimentos por UR - Agenda Futura - Saldo" terá mesmo valor que consultado antes, salvando em arquivo
    Examples:
      | dias úteis |
      | 2          |
      | 3          |
      | 4          |
      | 5          |
      | 6          |

