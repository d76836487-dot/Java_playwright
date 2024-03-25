#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Consultar_Relatorios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Consultar Relatorios

  # TODO: fix all scenarios when we have data-testid for side menu
  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão

  @TestCaseKey=SMP-T140
  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre "Menu Lateral - Relatórios"
    Then O menu lateral expandiu contendo "Relatórios"

  @TestCaseKey=SMP-T142
  Scenario: O usuário acessa a página de relatórios pelo menu lateral
    Given Usuário não está na página de Relatórios
    When Usuário acessa página de Relatórios através do menu lateral
    Then será direcionado para a jornada de Relatórios

  @TestCaseKey=SMP-T141
  Scenario Outline: Rodapé de Relatórios
    Given Usuário acessa página de Relatórios
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=SMP-T159
  Scenario: Visualização de mensagem informativa
    Given Usuário acessa página de Relatórios
    Then Usuário verá em "Relatórios - Texto Descritivo" o valor
      | Caso já tenha gerado um relatório, aguarde o processamento de até 1 dia para o mesmo ser exibido para baixar na tabela. |

  @TestCaseKey=SMP-T143
  Scenario Outline: Colunas dos relatórios na tela inicial
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos
    Then Usuário visualizará as <colunas> na tabela
    @pt-br
    Examples:
      | colunas                                                                    |
      | Nome Do Arquivo, Documento/EC, Tipo do Arq, Solicitado em, Período, Baixar |

  #  Por motivos de performance do teste, o passo "Usuário visualizará a listagem do relatório com valores corretos"
  #  aplica as seguintes validações:
  #  - Usuário visualizará o nome do relatório sendo NOMEALIANÇA_TipoDoArquivo_dd-mm-yyyy_dd-mm-yyyy
  #  - Usuário visualizará a coluna Documento/EC contendo o documento CNPJ, CPF ou EC
  #  - Usuário visualizará a coluna Tipo de Arquivo contendo Vendas ou Pagamentos
  #  - Usuário visualizará a coluna Solicitado Em contendo a data no formato dia/mês/ano
  #  - Usuário visualizará a coluna Período contendo a data de início no formato dia/mês/ano e a data de final no formato dia/mês/ano
  @api
  @TestCaseKey=SMP-T147
  Scenario: Colunas nome do arquivo
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos
    Then Usuário visualizará a listagem do relatório com valores corretos

  @TestCaseKey=SMP-T158
  Scenario: Coluna baixar
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos disponíveis para download
    Then botão download possui ícone com seta para baixo

  @TestCaseKey=SMP-T160
  Scenario: Fazer download do arquivo de relatório
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos disponíveis para download
    When tenta baixar o primeiro relatório ao clicar no ícone de download
    Then o download do relatório começará
    And o nome do arquivo baixado seguirá o da listagem (primeiro relatório da lista)

