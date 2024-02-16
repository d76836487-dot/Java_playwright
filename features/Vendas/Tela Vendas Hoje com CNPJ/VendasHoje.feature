#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Tela Vendas Hoje com CNPJ

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T9
  Scenario Outline: Mensagem de Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Usuário verá mensagem "<descrição>"
    @pt-br
    Examples:
      | descrição                                                                                                                                                                                                                                                          |
      | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  # TODO: fix me when we have 'rebatedores'
  @ignore
  @TestCaseKey=SMP-T6
  Scenario Outline: Visualização da Quantidade e Valor de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Usuário verá em "Vendas Hoje - Resumo - Quantidade Vendas" o valor "0"
    And Usuário verá em "Vendas Hoje - Resumo - Valor Vendas" o valor "<valor vendas>"
    @pt-br
    Examples:
      | valor vendas |
      | R$ 47.100,00 |

  @TestCaseKey=SMP-T7
  Scenario Outline: Rodapé de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé "<descrição>" com o ano atual
    @pt-br
    Examples:
      | descrição                                                                             |
      | © %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. %s |

  @TestCaseKey=SMP-T8
  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre "Menu Lateral - Vendas"
    Then O menu lateral expandiu contendo "Vendas"


  @TestCaseKey=SMP-T149
  Scenario: Ocultar valores de Vendas Hoje
    Given Usuário acessa Vendas Hoje
    When usuário clica no "Ocultar Valores" no "Header"
    Then Usuário verá em "Vendas Hoje - Resumo - Valor Vendas" o valor "corrigir aqui"
    And Usuário verá em "Vendas Hoje - Resumo - Quantidade Vendas" o valor "corrigir aqui"
    And Usuário verá em todos os campos "Vendas Hoje - Histórico - Coluna Valor Bruto" o valor "corrigir aqui" - se existir

