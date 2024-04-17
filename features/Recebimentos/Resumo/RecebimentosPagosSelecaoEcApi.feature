#language: en
@playwright @api @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Resumo/Tela_Recebimentos_Pagos_com_API_e_Seleção_EC
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Recebimentos Pagos com API e Seleção EC

  @TestCaseKey=SMP-T308
  Scenario Outline: Valores tela Recebimentos - Pagos - deve bater com exportação - com seleção de Documento
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um documento com maior número de ECs e clicar Acessar
    And Usuário acessou Recebimentos - Pagos
    And Usuário seleciona Últimos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Recibos Pagos' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade recebido em 'Recibos Pagos' é igual ao exportado
    And Quantidade agendado em 'Recibos Pagos' é igual ao exportado
    And Quantidade cedido em 'Recibos Pagos' é igual ao exportado
    And Total recebido em 'Recibos Pagos' é igual ao exportado
    And Total agendado em 'Recibos Pagos' é igual ao exportado
    And Total cedido em 'Recibos Pagos' é igual ao exportado
    Examples:
      | format             |
      | Excel Simplificado |
      | CSV Simplificado   |

  #      | CSV Detalhado      |
  @TestCaseKey=SMP-T309
  Scenario Outline: Valores tela Recebimentos - Pagos - deve bater com exportação - com seleção de EC
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    And Usuário selecionou um EC e clicar Acessar
    And Usuário acessou Recebimentos - Pagos
    And Usuário seleciona Últimos 30 Dias
    And usuário clicou no "Recebimentos - Pagos - Botão Filtrar"
    When usuário clica no "Accordion Estabelecimentos" em "Filtros de relatório"
    Then Opções do filtro tem somente os ECs selecionados
    And A exportação do relatório em "<format>" 'Recibos Pagos' terá somente o EC selecionado no detalhamento
    And A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho
    And Quantidade recebido em 'Recibos Pagos' é igual ao exportado
    And Quantidade agendado em 'Recibos Pagos' é igual ao exportado
    And Quantidade cedido em 'Recibos Pagos' é igual ao exportado
    And Total recebido em 'Recibos Pagos' é igual ao exportado
    And Total agendado em 'Recibos Pagos' é igual ao exportado
    And Total cedido em 'Recibos Pagos' é igual ao exportado
    Examples:
      | format             |
      | Excel Simplificado |
      | CSV Simplificado   |

#      | CSV Detalhado    |
