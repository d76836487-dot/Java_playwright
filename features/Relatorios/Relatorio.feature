#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Consultar_Relatorios
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Consultar Relatorios

  # TODO: fix all scenarios when we have data-testid for side menu
  Background:
    Given Usuário logou na aplicação

  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre "Menu Lateral - Relatórios"
    Then O menu lateral expandiu contendo "Relatórios"

  Scenario: O usuário acessa a página de relatórios pelo menu lateral
    Given Usuário não está na página de Relatórios
    When Usuário acessa página de Relatórios através do menu lateral
    Then será direcionado para a jornada de Relatórios

  Scenario Outline: Rodapé de Relatórios
    Given Usuário acessa página de Relatórios
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  Scenario Outline: Colunas dos relatórios na tela inicial
    Given Usuário acessa página de Relatórios
    And Existem relatórios já extraídos
    Then Usuário visualizará as <colunas> na tabela
    @pt-br
    Examples:
      | colunas                                                                    |
      | Nome Do Arquivo, Documento/EC, Tipo do Arq, Solicitado em, Periodo, Baixar |


