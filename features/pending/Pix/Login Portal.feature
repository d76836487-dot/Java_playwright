#language:en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Pix/Pix_Login
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Pix Login

  @TestCaseKey=LPDC-T113
  Scenario Outline: Exibição do modal de Habilitação Conta Pix - Primeiro acesso e usuário elegível
    Given que tenho EC <Hierarquia> com o <Perfil>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then é apresentado o modal para habilitação do PIX
    Examples:
      | EC  | Hierarquia | Perfil              | Serpro | POS |
      | EC1 | Matriz     | Master              | OK     | OK  |
      | EC2 | Filho      | Assistente Operador | OK     | OK  |
      | EC3 | Neto       | Assistente Consulta | OK     | OK  |

  @TestCaseKey=LPDC-T103
  Scenario Outline: Exibição de modal de Habilitação Conta Pix - Primeiro acesso e usuário não elegível
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX
    Examples:
      | EC  | Hierarquia | Perfil              | Serpro | POS |
      | EC1 | Matriz     | Assistente Consulta | OK     | OK  |
      | EC2 | Filho      | Operador com F      | OK     | OK  |

  @TestCaseKey=LPDC-T139
  Scenario: Exibição de modal de Habilitação Conta Pix - Segundo acesso e usuário elegível
    Given que tenho EC "Matriz" com o Perfil "Master" EC1
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And visualizei o modal de habilitacao do Pix no primeiro acesso
    When realizo um novo login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX

#
