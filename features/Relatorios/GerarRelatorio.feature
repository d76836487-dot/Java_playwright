#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Gerar_Relatorio
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Gerar Relatorio

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios

  @TestCaseKey=SMP-T171
  Scenario: Validar rótulos dos campos na geração de relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then Usuário verá em "Modal Gerar Relatórios - Título" o valor "Gerar relatório"
    And Usuário verá em "Modal Gerar Relatórios - Descrição" o texto
      | Solicite relatórios com informações de vendas ou pagamentos, ajuste o período conforme suas preferências. |
    And Usuário verá em "Modal Gerar Relatórios - Select EC Label" o rótulo "Estabelecimento comercial (EC)"
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Label" o rótulo "Tipo de relatório"
    And Usuário verá em "Modal Gerar Relatórios - Select Período Label" o rótulo "Período"
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Arquivo Label" o rótulo "Formato do arquivo"
    And Usuário verá em "Modal Gerar Relatórios - Título Informativo" o texto "Tipo de entrega"
    And Usuário verá em "Modal Gerar Relatórios - Valor Informativo" o texto "Portal do cliente"
    And Usuário verá em "Modal Gerar Relatórios - Mensagem sobre prazo" o texto
      | O relatório leva até 24 horas para ser exibido para download. |

  @TestCaseKey=SMP-T173
  Scenario Outline: Validar botões de fechar tela Gerar Relatórios
    Given usuário clica no "Botão Gerar Relatório" em "Relatórios"
    When usuário clica no <botão_cancelar>
    Then "Modal Gerar Relatórios" não mais estará visível
    Examples:
      | botão_cancelar                                 |
      | "Ícone Fechar (X)" em "Modal Gerar Relatórios" |
      | "Botão Cancelar" em "Modal Gerar Relatórios"   |

  @api
  @TestCaseKey=SMP-T170
  Scenario: Validar campos na geração de relatórios
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then usuário visualizará o modal de geração de relatórios contendo nome do cliente, junto de seu CPF ou CNPJ
    And usuário visualizará opção para selecionar um EC ou "Todos os estabelecimentos"
    And "Todos os estabelecimentos" estará selecionado por padrão, caso haja mais de um
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Opções" as opções Pagamentos, Vendas
    And Usuário verá em "Modal Gerar Relatórios - Select Tipo Arquivo Opções" as opções .XLSX (Excel), .CSV

  @api
  Scenario: Validar Cliente com Apenas 1 Estabelecimento Comercial Vinculado (Sem Hierarquia)
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then usuário verá no campo Estabelecimento Comercial o número deste único estabelecimento já selecionado

  @api
  Scenario: Validar Cliente com 2 ou Mais Estabelecimentos Comerciais Vinculados (Sem Hierarquia)
    Given usuário possui mais que um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário clica no "Campo Select EC" no "Modal Gerar Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções disponíveis
