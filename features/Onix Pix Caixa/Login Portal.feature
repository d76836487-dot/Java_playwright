#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Onix_Pix_Caixa/Login_Portal
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo

Feature: Login Portal

  Scenario Outline: Exibição do modal de Habilitação Conta Pix - Primeiro acesso e usuário elegível
    Given que tenho EC <Hierarquia> com o <Perfil>
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then é apresentado o modal para habilitação do PIX

    Examples:
      | EC  | Hierarquia | Perfil              |
      | EC1 | Matriz     | Master              |
      | EC2 | Filho      | Assistente Operador |
      | EC3 | Neto       | Assistente Consulta |

    #ver com a stefanie / apresenta o modal ou não ?
  Scenario Outline: Exibição de modal de Habilitação Conta Pix - Primeiro acesso e usuário não elegível
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX

    Examples:
      | EC  | Hierarquia | Perfil              |
      | EC1 | Matriz     | Assistente Consulta |
      | EC2 | Filho      | Operador com F      |
      | EC3 | Neto       | Operador sem F      |

  Scenario: Exibição de modal de Habilitação Conta Pix - Segundo acesso e usuário elegível
    Given que tenho EC "Matriz" com o Perfil "Master" EC1
    And a funcionalidade de Pix ja esta habilitada
    And visualizei o modal de habilitacao do Pix no primeiro acesso
    When realizo um novo login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX
