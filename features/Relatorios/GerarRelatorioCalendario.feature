#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Relatorios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Relatorios

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios

  @TestCaseKey=SMP-T279
  Scenario: Componente Período não deve permitir mais que 12 meses
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário clica no "Select Período" em "Modal Gerar Relatórios"
    And usuário seleciona um período maior que um ano e tenta gerar o relatório
    Then Usuário verá em "Relatórios - Notificação de Falha" o texto
      | O intervalo da seleção deve ser menor ou igual a 12 meses |

  @TestCaseKey=SMP-T286
  Scenario: Componente Período permite data anterior a data de hoje
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"

