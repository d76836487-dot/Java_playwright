#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Home_Logada_Login
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Home Logada Login

  @TestCaseKey=SMP-T10
  Scenario: Login com sucesso
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso e sessão foi salva

  @TestCaseKey=SMP-T11
  Scenario: Usuário não encontrado no GA1 nem no GA2 e sem cadastro na Fiserv
    When Usuário tenta logar na aplicação com "81633816000210" e "Fiserv@123"
    Then Usuário verá em "Login - Esqueceu senha - Título" o valor "Parece que você ainda não é nosso cliente"

  @TestCaseKey=SMP-T13
  Scenario Outline: Usuário tenta logar com senha errada
    When Usuário loga com senha errada
    And Todas as requisições HTTP foram respondidas
    Then Usuário verá em "Login - mensagem de erro" o valor "<descrição>"
    @pt-br
    Examples:
      | descrição                                                                                           |
      | Usuário ou senha incorretos. para você restam ainda mais 4 tentativas antes de bloquear seu acesso. |

