#language:en
@ignore
@Zephyr:ProjectKey=LBIT
@Zephyr:Folder=/Onix/Portal_do_Cliente/Transacao_Pix_POS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Transacao Pix POS

  Scenario Outline: Realizar transacao Pix via POS apos Contratacao do Pix
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And Pix Contratado com sucesso no Portal do Cliente
    When realizo uma transacao de Pix via POS
    Then a transacao é exibida com sucesso no Relatorio de Vendas no menu Conta Pix
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Assistente de Consulta | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario: Pix não habilitado para transacionar no POS
    Given que tenho EC "Matriz"
    And não foi feita a habilitacao do Pix no Portal do Cliente
    And esteja cadastrado na Serpro <Serpro>
    When tentar transacionar no POS
    Then então não sera permitido a transacão

  Scenario: Habilitar Pix com Hierarquia Filho 1 e realizar transacão Pix com Hierarquia Matriz
    Given acesse o Portal com EC com o Perfil "Filho 1"
    And realiza a habilitacão Conta Pix com sucesso
    When Realizo uma transacão de Pix via POS com EC Master
    Then a transacão é exibida no Relatorio de Vendas no menu Conta Pix

  Scenario: Habilitar Pix com Hierarquia Filho 1 e realizar transacão Pix com Hierarquia Filho 2
    Given cesse o Portal com EC com o Perfil "Filho 1"
    And realiza a habilitacão Conta Pix com sucesso
    When realizo uma transacão de Pix via POS com "Filho 2"
    Then a transacao é exibida com sucesso no Relatorio de Vendas no menu Conta Pix
