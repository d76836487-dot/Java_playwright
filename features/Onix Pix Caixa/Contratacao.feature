#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Onix_Pix_Caixa/Contratacao
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Contratacao

  @TestCaseKey=SMP-T342
  Scenario Outline: Contratacao de Pix no Portal do Cliente com chave Pix valida e Serpro Ok
    # Testes do bloco 3 (Contratação)
    Given que tenho EC <Hierarquia> com o Perfil <Perfil> e cadastrado na Serpro <Status Serpro>
    When acesso o Portal do Cliente
    And realizo a solicitacao da conta Pix dentro do Portal do Cliente
    And insiro uma chave Pix valida <Chave Pix>
    And aceito os termos e condicoes
    Then a habilitacao Pix sera concluida com sucesso
    Examples:
      | EC  | Perfil                | Hierarquia | Chave Pix | Status Serpro |
      | EC1 | Master                | Matriz     | Hash      | OK            |
      | EC2 | Assitente de Operador | Filho      | Email     | OK            |
      | EC3 | Master                | Neto       | CNPJ      | OK            |
      | EC4 | Assitente de Operador | Matriz     | Celular   | OK            |

  @TestCaseKey=SMP-T347
  Scenario Outline: Contratacao de Pix no Portal do Cliente Com Perfil inelegivel
    # Testes do bloco 1 (Sem perfil)
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    When acesso o Portal do Cliente
    And realizo a solicitacao abertura de conta Pix
    Then nao sera possivel habilitacao
    Examples:
      | EC  | Perfil                | Hierarquia |
      | EC1 | Assitente de Consulta | Matriz     |
      | EC2 | Operador com F        | Filho      |
      | EC3 | Operador sem F        | Neto       |

  @TestCaseKey=SMP-T340
  Scenario: Contratacao de Pix no Portal do Cliente elegível Com Perfil Serpro NOK
    # Testes do bloco 1 (Sem habilitação)
    Given que tenho EC "Master" com o Perfil "Matriz" EC5
    And usuário não possui cadastro na Serpro
    When acessar o Portal do Cliente
    And realizar a solicitação de conta Pix
    Then recebo mensagem de erro

  @TestCaseKey=SMP-T343
  Scenario Outline: Contratacao de Pix no Portal do Cliente Com Perfil elegivel e chave Pix invalida
    # Testes do bloco 2 (Chave Pix Inválida)
    Given que tenho EC <Hierarquia> com o Perfil <Perfil>
    When acesso o Portal do Cliente
    And realizo a solicitacao da conta Pix dentro do Portal do Cliente
    And insiro uma chave Pix inválida <Chave Pix>
    Then recebo mensagem de erro na validação da chave
    Examples:
      | EC  | Perfil             | Hierarquia | Chave Pix          |
      | EC1 | Master             | Matriz     | Outra titularidade |
      | EC2 | Assitente Operador | Filho      | Chave Invalida     |

