#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Onix_Pix_Caixa/Transacao_Pix_via_POS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Transacao Pix via POS

  @TestCaseKey=SMP-T337
  Scenario Outline: Realizar transacao Pix via POS apos Contratacao do Pix
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And Pix Contratado com sucesso no Portal do Cliente
    When realizo uma transacao de Pix via POS
    Then a transacao é exibida com sucesso no Relatorio de Vendas
    Examples:
      | EC  | Perfil             | Hierarquia |
      | EC1 | Master             | Matriz     |
      | EC2 | Assitente Operador | Filho      |
      | EC3 | Master             | Neto       |

  #esse é um fluxo que sera feito pela Api e pelo POS fisico
  @TestCaseKey=SMP-T336
  Scenario: Pix não habilitado para transacionar no POS
    Given que tenho EC "Master" com o Perfil "Matriz"
    And não foi feita a habilitacao do Pix no Portal do Cliente
    When tentar transacionar no POS
    Then então não sera permitido

