#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nps/NotificacaoConclusaoDeRelatorio
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: NotificacaoConclusaoDeRelatorio

  @TestCaseKey=LPDC-T1756
  Scenario: Exibir modal de alerta de conclusão de relatório
    Given que o usuário tenha solicitado um relatório
    When o relatório estiver pronto
    Then o modal de alerta deve ser exibido com a mensagem "Seu relatório está pronto!"

  @TestCaseKey=LPDC-T1751
  Scenario: Verificar conteúdo do modal de alerta de conclusão de relatório
    Given que o usuário tenha solicitado um relatório
    When o relatório estiver pronto
    Then o modal de alerta deve conter o título "Seu relatório está pronto!"
    And o modal de alerta deve conter o subtítulo "Acesse a página Relatórios para baixar agora!"
    And o modal de alerta deve conter a mensagem "O relatório de vendas que você solicitou em {{1}} do período de {{2}} a {{3}} já está disponível!"

  @TestCaseKey=LPDC-T1759
  Scenario: Exibir modal de alerta de conclusão de relatório para diferentes tipos de relatórios
    Given que o usuário tenha solicitado um relatório de vendas
    When o relatório estiver pronto
    Then o modal de alerta deve conter a mensagem "O relatório de vendas que você solicitou em {{1}} do período de {{2}} a {{3}} já está disponível!"
    And o modal de alerta deve conter o botão "Ir para Relatórios"

  @TestCaseKey=LPDC-T1749
  Scenario: Exibir modal de alerta de conclusão de relatório para diferentes usuários
    Given que diferentes usuários tenham solicitado relatórios
    When os relatórios estiverem prontos
    Then o modal de alerta deve ser exibido para cada usuário com a mensagem "Seu relatório está pronto!"
    And o modal de alerta deve conter o botão "Ir para Relatórios"

  @TestCaseKey=LPDC-T1758
  Scenario: Verificar que o modal de alerta não é exibido antes do relatório estar pronto
    Given que o usuário tenha solicitado um relatório
    When o relatório ainda não estiver pronto
    Then o modal de alerta não deve ser exibido

