#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas

  Background:
    Given Usuário tenta logar na aplicação
    And Usuário acessou com sucesso
    And Usuário acessou Vendas - Histórico de Vendas
    And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T157
  Scenario Outline: Rodapé de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=SMP-T156
  Scenario Outline: Traz como padrão Ontem no filtro do período
    Then Usuário verá em "Vendas - Histórico Vendas - Período - Descrição" o valor "<período>"
    @pt-br
    Examples:
      | período |
      | Ontem   |

  @TestCaseKey=SMP-T167
  Scenario: Ocultar valores de Vendas - Histórico de Vendas
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Vendas - Histórico de Vendas - Resumo - Quantidade de vendas" o valor "••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor bruto" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor líquido" o valor "R$ ••••"
    And Usuário verá em "Vendas - Histórico de Vendas - Resumo - Valor cancelado" o valor "R$ ••••"

