#language:en
@ignore
@Zephyr:ProjectKey=LBIT
@Zephyr:Folder=/Onix/Portal_do_Cliente/Modal_de_Oferta
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Modal de Oferta


  Scenario Outline: Exibição do modal de Habilitação Conta Pix - Primeiro acesso e usuario elegivel
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then é apresentado o modal para habilitação do PIX
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Assistente de Consulta | OK     | OK  |


  Scenario: Exibição de modal de Habilitação Conta Pix - Operador com F
    Given que tenho usuário Operador com F
    And esteja cadastrado na Serpro
    And Possua CP (POS) ativo
    And não acessei ao Portal do Cliente após implementação da funcionalidade de PIX
    When realizo o login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX


  Scenario Outline: Exibição de modal de Habilitação Conta Pix - Segundo acesso e usuario elegivel
    Given que tenho um EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And visualizou o modal de habilitacao do Pix no primeiro acesso
    When realizo um novo login no Portal do Cliente
    Then não é apresentado o modal para habilitação do PIX
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Assistente de Consulta | OK     | OK  |