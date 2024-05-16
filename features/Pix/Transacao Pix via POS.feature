#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Onix_Pix_Caixa/Pix_Transacao_POS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Pix Transacao POS

  @TestCaseKey=SMP-T337
  Scenario Outline: Realizar transacao Pix via POS apos Contratacao do Pix
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And Pix Contratado com sucesso no Portal do Cliente
    When realizo uma transacao de Pix via POS
    Then a transacao é exibida com sucesso no Relatorio de Vendas no menu Conta Pix
    Examples:
      | EC  | Perfil             | Hierarquia | Serpro | POS |
      | EC1 | Master             | Matriz     | OK     | OK  |
      | EC2 | Assitente Operador | Filho      | OK     | OK  |
      | EC3 | Master             | Neto       | OK     | OK  |

  @TestCaseKey=SMP-T336
  Scenario: Pix não habilitado para transacionar no POS
    Given que tenho EC "Master" com o Perfil "Matriz"
    And não foi feita a habilitacao do Pix no Portal do Cliente
    And esteja cadastrado na Serpro <Serpro>
    When tentar transacionar no POS
    Then então não sera permitido a transação

  #esse fluxo sera feito pela Api e pelo POS fisico
  @TestCaseKey=SMP-T348
  Scenario: Habilitar Pix com Hierarquia Filho 1 e realizar transação Pix com Hierarquia Matriz
    Given acesse o Portal com EC com o Perfil "Filho 1"
    And realiza a habilitação Conta Pix com sucesso
    When Realizo uma transação de Pix via POS com EC Master
    Then a transação é exibida no Relatório de Vendas no menu Conta Pix

  @TestCaseKey=SMP-T349
  Scenario: Habilitar Pix com Hierarquia Filho 1 e realizar transação Pix com Hierarquia Filho 2
    Given cesse o Portal com EC com o Perfil "Filho 1"
    And realiza a habilitação Conta Pix com sucesso
    When realizo uma transação de Pix via POS com "Filho 2"
    Then a transacao é exibida com sucesso no Relatorio de Vendas no menu Conta Pix

