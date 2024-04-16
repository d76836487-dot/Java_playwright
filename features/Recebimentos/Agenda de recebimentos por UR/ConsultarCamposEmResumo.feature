#language: en
@playwright
@UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Consultar_Campos_em_Resumo
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Consultar Campos em Resumo

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão

  @TestCaseKey=SMP-T322
  Scenario: Consultar Campos Valor Total, Valor Total líquido de URs, Valor pago, na Seção Resumo
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário passa o mouse sobre "Agenda de Recebimentos por UR - Resumo - Tooltip do Valor Total"
    Then Usuário verá em "Agenda de Recebimentos por UR - Resumo - Texto do tooltip do Valor Total" o texto
      | Esse campo é a soma dos campos “valor total líquido de UR´s” e “valor pago” |
    And Usuário visualizará o campo "Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Tooltip do Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor Total líquido de URs" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor pago" na seção "Agenda de Recebimentos por UR - Resumo"

