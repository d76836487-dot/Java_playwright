#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Onix_Pix_Caixa/Relatorio_de_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo

Feature: Relatorio de vendas

  Scenario Outline: Visualização de relatorio de vendas no menu Conta Pix

    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And a Contratacao do Pix ja foi realizada no Portal do Cliente
    And foram efetuados transacoes de venda via Pix no POS
    When acessar o menu conta Pix no Portal
    Then as transacoes de Pix serão exibidas no relatório de vendas
    Examples:
      | EC  | Perfil             | Hierarquia |
      | EC1 | Master             | Matriz     |
      | EC2 | Assitente Operador | Filho      |
      | EC3 | Assitente Consulta | Neto       |
      | EC4 | Operador com F     | Matriz     |
      | EC5 | Operador sem F     | Filho      |

  Scenario Outline: Visualização de relatório de vendas sem lancamentos no menu Conta Pix

    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    And a Contratacao do Pix ja foi realizada no Portal do Cliente
    And não foram efetuados transacoes de venda via Pix no POS
    When acessar o menu Conta Pix no Portal
    Then o relatório de vendas estará vazio dentro do menu conta Pix
    Examples:
      | EC  | Perfil             | Hierarquia |
      | EC1 | Master             | Matriz     |
      | EC2 | Assitente Operador | Filho      |

  Scenario: Visualizar relatório de vendas Por Paginacao

    Given que tenho Documento "Assitente Operador" com o Perfil "Filho"
    When a habilitacao do Pix ja foi realizada no Portal do Cliente
    And  foram efetuadas mais de 50 transacoes de venda via Pix no POS
    Then serão exibidas as transações de vendas no relatório de vendas
    And e será possível visualizar a pagina seguinte do relatório
