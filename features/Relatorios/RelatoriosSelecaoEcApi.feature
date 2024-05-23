#language: en
@playwright @api @UsuárioComHierarquia
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Relatorios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Relatorios

  @TestCaseKey=SMP-T312
  Scenario: Valores tela Relatórios - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções de EC disponíveis

  @TestCaseKey=SMP-T313
  Scenario: Valores tela Relatórios - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário terá apenas um EC disponível para seleção

