#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Login
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:Automation=Automated
Feature: Login

  @TestCaseKey=SMP-T10
  Scenario: Login com sucesso
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso

  @TestCaseKey=SMP-T11
  Scenario: Usuário não encontrado no GA1 nem no GA2 e sem cadastro na Fiserv
    When Usuário tenta logar na aplicação com "71633816000210" e "Fiserv@123"
    Then Usuário verá mensagem "Parece que você ainda não é nosso cliente"

  @TestCaseKey=SMP-T12
  Scenario: Usuário perdeu a sessão e deve logar-se novamente
    Given Usuário logou na aplicação
    When Usuário loga em outra sessão

  @TestCaseKey=SMP-T13
  Scenario Outline: Usuário tenta logar com senha errada
    When Usuário loga com senha errada
    Then Usuário verá mensagem "<descrição>"
    @pt-br
    Examples:
      | descrição                                                                                           |
      | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

