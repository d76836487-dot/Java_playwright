#language:en
@ignore
@Zephyr:ProjectKey=LBIT
@Zephyr:Folder=/Onix/Portal_do_Cliente/Contratacao_Pix
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Contratacao Pix

  Scenario Outline: Modal Conta Pix - Botao "Conhecer mais" (usuario elegivel e sem Conta Pix)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    Then sou direcionado para tela de "Contratar Conta Pix"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |


  Scenario Outline: Menu Lateral - Botao "Conta Pix" (usuario elegivel e sem Conta Pix)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    When clico em "Conta Pix" no menu lateral
    Then sou direcionado para tela de "Contratar Conta Pix"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |

  Scenario: Modal Conta Pix - Botao "Conhecer mais" (Assistente de Consulta e sem Conta Pix)
    Given que tenho EC "Assistente de Consulta"
    And esteja cadastrado na Serpro
    And Possua CP (POS) ativo
    And nao possua Conta Pix
    And acessar o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    Then é exibido modal "Por favor, entre em contato com o usuario administrador da conta".

  Scenario Outline: Tela Contratar Pix" - "Contrato de Prestacao de Servicos"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar no link "Contrato de Prestacao de Servicos"
    Then devera ser exibido o modal de "Contrato de Prestacao de Servicos e outras Avencas"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |

  Scenario Outline: Modal "Contrato de Prestacao de Servicos" - Botao X
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar no link "Contrato de Prestacao de Servicos"
    And exibir o modal de "Contrato de Prestacao de Servicos e outras Avencas"
    When clicar no botao "X"
    Then modal deixara de ser exibido
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |


  Scenario Outline: Tela Contratar Pix" - "Termo de Aceite"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar no link "Termo de Aceites"
    Then devera ser exibido o modal de "Termo de Aceite"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |


  Scenario Outline: Tela Contratar Pix" - "Termo de Aceites" - Botao X
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar no link "Termo de Aceites"
    And devera ser exibido o modal de "Termo de Aceite"
    When clicar no botao "X"
    Then modal deixara de ser exibido
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Operador com F         | OK     | OK  |

  Scenario Outline: Tela Contratar Pix - Flag "Termos e Condicoes"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar na flag de Termos e Condicoes
    Then o botao "Contratar" sera habilitado
    Examples:
       | EC  | Hierarquia             | Serpro | POS |
       | EC1 | Matriz                 | OK     | OK  |
       | EC2 | Filho                  | OK     | OK  |
       | EC3 | Assistente de Operacao | OK     | OK  |
       | EC4 | Operador com F         | OK     | OK  |

  Scenario Outline: Tela Contratar Pix - Botao "Contratar" (Usuario elegivel)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar na flag de Termos e Condicoes
    When clicar no botao "Contratar'
    Then serei redirecionado para tela "Tudo pronto pra usar!"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |

  Scenario: Tela Contratar Pix - Botao "Contratar" (Operador com F)
    Given que tenho EC "Operador com F"
    And esteja cadastrado na Serpro
    And Possua CP (POS) ativo
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar na flag de Termos e Condicoes
    Then o botao "Contratar" nao deve ser habilitado

  Scenario Outline: Tela "Tudo Pronto pra usar!" - Botao "Ir para Conta Pix"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And nao possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar na flag de Termos e Condicoes
    And clicar no botao "Contratar"
    And sera exibido a tela "Tudo pronto pra usar!"
    When clicar no botao "Ir para Conta Pix"
    Then serei redirecionado para o Webview
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |

  Scenario: Modal Conta Pix - Botao "Conhecer mais" (NOK na Serpro)
    Given que tenho EC
    And esteja NOK na Serpro
    And Possua CP (POS) ativo
    And nao possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    Then sera exibido mensagem de erro "Agradecemos seu interesse na conta Pix. Infelizmente..."

  Scenario: Modal Conta Pix - Botao "Conhecer mais" (erro de integracao SERPRO)
    Given que tenho EC
    And esteja OK na Serpro
    And Possua CP (POS) ativo
    And nao possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    And API de elegibilidade nao recebeu retorno da SERPRO
    Then sera exibido mensagem de erro "Ops, algo seu errado!"

  Scenario: Modal Conta Pix - Botao "Conhecer mais" (sem POS ativo)
    Given que tenho EC
    And esteja OK na Serpro
    And Nao possua CP (POS) ativo
    And nao possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    Then sera exibido mensagem de erro "Quase la..."


  Scenario: Modal Conta Pix - Botao "Conhecer mais" (erro na consulta API de elegibilidade)
    Given que tenho EC
    And esteja OK na Serpro
    And possua CP (POS) ativo
    And nao possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitacao do PIX
    When clico em "Conhecer mais"
    And ocorre erro inesperado na API de elegibilidade
    Then sera exibido mensagem de erro "Ops, algo seu errado!"