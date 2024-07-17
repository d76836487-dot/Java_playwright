#language:en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Pix/Pix_Relatorio_de_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Pix Relatorio de vendas

  @TestCaseKey=LPDC-T323
  Scenario Outline: Visualização de relatorio de vendas no menu Conta Pix
    Given que tenho EC <Hierarquia> com o Perfil <Perfil> cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And foram efetuados transacoes de venda via Pix no POS
    When acessar o menu conta Pix no Portal
    Then as transacoes de Pix serão exibidas no relatório de vendas
    Examples:
      | EC  | Perfil              | Hierarquia | Serpro | POS |
      | EC1 | Master              | Matriz     | OK     | OK  |
      | EC2 | Assistente Operador | Filho      | OK     | OK  |
      | EC3 | Assistente Consulta | Neto       | OK     | OK  |
      | EC1 | Operador com F      | Matriz     | OK     | OK  |

  @TestCaseKey=LPDC-T296
  Scenario Outline: Visualização de relatório de vendas sem lancamentos no menu Conta Pix
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não foram efetuados transacoes de venda via Pix no POS
    When acessar o menu Conta Pix no Portal
    Then o relatório de vendas estará vazio dentro do menu conta Pix
    Examples:
      | EC  | Perfil              | Hierarquia | Serpro | POS |
      | EC1 | Master              | Matriz     | OK     | OK  |
      | EC2 | Assistente Operador | Filho      | OK     | OK  |

  @TestCaseKey=LPDC-T303
  Scenario: Visualizar relatório de vendas Por Paginacao
    Given que tenho Documento "Assitente Operador" com o Perfil "Filho"
    And esteja cadastrado na Serpro "Serpro OK"
    And possua CP (POS) ativo "POS OK"
    And  foram efetuadas mais de 50 transacoes de venda via Pix no POS
    Then serão exibidas as transações de vendas no relatório de vendas
    And e será possível visualizar a pagina seguinte do relatório

#
