#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Pré_Autorizações_com_CNPJ_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Pré Autorizações com CNPJ com API e Seleção EC

  @TestCaseKey=SMP-T303
  Scenario: Valores tela Vendas - PRÉ-AUTORIZADAS deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Vendas - Pré Autorizações
    And usuário clicou no "Vendas - Pré Autorizações - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório 'Pré Autorizadas' terá somente o EC selecionado
    And A soma de vendas pré-autorizadas é igual ao valor bruto autorizado
    And A contagem de vendas pré-autorizadas é igual a Total de Vendas

#  Scenario: Valores tela Vendas - NÃO EFETIVADAS deve bater com exportação - com seleção de EC
#    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
#    And Usuário selecionou um EC e clicar Acessar
#    And Usuário acessou Vendas - Não Realizadas
#    And usuário clicou no "Vendas - Não Efetivadas - Botão Filtrar"
#    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
#    Then Opções do filtro tem somente os ECs selecionados
#    And A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado
#    And A soma de vendas recusadas é igual a "Não Efetivadas - Recusadas"
#    And A soma de vendas estornadas é igual a "Não Efetivadas - Estornadas"
