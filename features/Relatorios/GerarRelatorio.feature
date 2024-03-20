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
    And Usuário verá em "Modal Gerar Relatórios - Select Formato Arquivo Label" o rótulo "Formato do arquivo"
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
    And Usuário verá em "Modal Gerar Relatórios - Select Formato Arquivo Opções" as opções .XLSX (Excel), .CSV

  @api
  @TestCaseKey=SMP-T178
  Scenario: Validar Cliente com Apenas 1 Estabelecimento Comercial Vinculado (Sem Hierarquia)
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    Then usuário verá no campo Estabelecimento Comercial o número deste único estabelecimento já selecionado

  @api
  @TestCaseKey=SMP-T179
  Scenario: Validar Cliente com 2 ou Mais Estabelecimentos Comerciais Vinculados (Sem Hierarquia)
    Given usuário possui mais que um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário clica no "Campo Select EC" no "Modal Gerar Relatórios"
    Then "Todos os estabelecimentos" estará selecionado por padrão
    And usuário poderá selecionar alguma das outras opções de EC disponíveis

  @api
  @TestCaseKey=SMP-T198
  Scenario Outline: Gerar Relatório Cliente com Apenas Um Estabelecimento Comercial Vinculado e Tipo de Relatório de Vendas (sem hierarquia)
    Given usuário possui apenas um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário verifica que este Estabelecimento Comercial está selecionado
    And usuário seleciona o tipo de relatório como "<tipo>"
    And usuário seleciona o formato de arquivo como "<formatoArquivo>"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"
    And usuário verá uma nova linha na listagem de relatórios com o novo relatório solicitado e o ícone relógio na coluna baixar
    Examples:
      | formatoArquivo | tipo       |
      | .csv           | vendas     |
      | .csv           | pagamentos |
      | .xlsx-(excel)  | vendas     |

  @api
  @TestCaseKey=SMP-T268
  Scenario Outline: Gerar Relatório em arquivo CSV Cliente com Mais que Um Estabelecimento Comercial Vinculado (sem hierarquia)
    Given usuário possui mais que um Estabelecimento Comercial vinculado
    When usuário clica no "Botão Gerar Relatório" em "Relatórios"
    And usuário seleciona algum de seus Estabelecimentos Comerciais
    And usuário seleciona o tipo de relatório como "<tipo>"
    And usuário seleciona o formato de arquivo como "<formatoArquivo>"
    And usuário seleciona o período do dia anterior
    And usuário clica no "Botão Gerar" em "Modal Gerar Relatórios"
    Then Usuário verá em "Relatórios - Notificação Sucesso" o texto "Relatório Solicitado com Sucesso!!"
    And usuário verá uma nova linha na listagem de relatórios com o novo relatório solicitado e o ícone relógio na coluna baixar
    Examples:
      | formatoArquivo | tipo       |
      | .csv           | pagamentos |
      | .csv           | vendas     |
      | .xlsx-(excel)  | vendas     |

# TODO: não possível no momento @rebatedor
#  43.    Cenário: Validar mensagem de erro Sistema Indisponível
#  Dado que o usuário está logado no Merchant Portal
#  E o usuário está no modal Relatórios
#  E o usuário preencheu todos os campos obrigatórios
#  Quando o usuário clica no botão Gerar Relatórios
#  E o sistema está indisponível
#  Então usuário visualizará o popup de erro com a mensagem “Sua solicitação não foi concluída! Refaça a solicitação do seu relatório”, e os botões “Fechar” e “X”
