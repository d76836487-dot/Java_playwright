#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Vendas_Histórico_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Vendas Histórico com CNPJ

  Background:
    Given Usuário tenta logar na aplicação
    And Usuário acessou com sucesso
    And Usuário acessou Vendas - Histórico de Vendas

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

