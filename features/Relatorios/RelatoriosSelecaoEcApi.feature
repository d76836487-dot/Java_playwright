#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Tela_Relatórios_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Relatórios com API e Seleção EC

  Scenario: Valores tela Relatórios - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções de EC disponíveis

  Scenario: Valores tela Relatórios - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessa página de Relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário terá apenas um EC disponível para seleção

