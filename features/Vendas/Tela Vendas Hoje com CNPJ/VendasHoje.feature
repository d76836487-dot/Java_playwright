#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Vendas/Tela_Vendas_Hoje_com_CNPJ
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
Feature: Tela Vendas Hoje com CNPJ

  Background:
    When Usuário tenta logar na aplicacao
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T9
  Scenario Outline: Mensagem de Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Página conterá mensagem com a "<descricao>" do resumo de vendas
    Examples:
      | descricao                                                                                                                                                                                                                                                          |
      | Visualize suas vendas realizadas no dia. Não achou a venda que estava procurando? Ela pode levar até 15 minutos para ser apresentada aqui. E lembre-se, essas vendas estão em processamento, vendas estornadas ou não efetivadas aparecem aqui até o final do dia. |

  @TestCaseKey=SMP-T6
  Scenario: Visualização do Campo Resumo de Vendas
    When Usuário acessa Vendas Hoje
    Then Página conterá todos os elementos do resumo de vendas

  @TestCaseKey=SMP-T7
  Scenario: Rodapé de Vendas Hoje
    When Usuário acessa Vendas Hoje
    Then Página conterá rodapé com o ano atual

  @TestCaseKey=SMP-T8
  Scenario: O menu expande quando o usuário passa o mouse
    When Usuário passa o mouse sobre vendas
    Then O menu de vendas expande

