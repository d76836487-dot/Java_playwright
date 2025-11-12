#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Recebimentos/RecebimentosPagos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: RecebimentosPagos

  @TestCaseKey=LPDC-T1985
  Scenario: Verificar ausência de mensagem em amarelo após atualização de dados
    Given que estou logado como usuário "10890038000130" com senha "Bin@95120879"
    And estou na aba "Recebimentos Pagos"
    When atualizo os dados da aba
    Then não deve haver nenhuma mensagem em amarelo sobre cessão e gravame

  @TestCaseKey=LPDC-T1986
  Scenario: Verificar ausência de mensagem em amarelo após navegação entre abas
    Given que estou logado como usuário "10890038000130" com senha "Bin@95120879"
    And estou na aba "Recebimentos Pagos"
    When navego para a aba "Outros Recebimentos" e retorno para a aba "Recebimentos Pagos"
    Then não deve haver nenhuma mensagem em amarelo sobre cessão e gravame no recebimento
