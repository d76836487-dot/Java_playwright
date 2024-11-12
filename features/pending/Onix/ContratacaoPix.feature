#language:en
@ignore
@Zephyr:ProjectKey=LBIT
@Zephyr:Folder=/Portal_do_Cliente/Pending/Onix/Contratacao_Pix
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Contratacao Pix

  Scenario Outline: Modal Conta Pix - Botão "Conhecer mais" (usuario elegivel e sem Conta Pix)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    Then sou direcionado para tela de "Contratar Conta Pix"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Menu Lateral - Botão "Conta Pix" (usuario elegivel e sem Conta Pix)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    When clico em "Conta Pix" no menu lateral
    Then sou direcionado para tela de "Contratar Conta Pix"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario: Modal Conta Pix - Botão "Conhecer mais" (Assistente de Consulta)
    Given que tenho EC "Assistente de Consulta"
    And esteja cadastrado na Serpro
    And Possua CP (POS) ativo
    And não possua Conta Pix
    And acessar o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    Then é exibido modal "Por favor, entre em contato com o usuario administrador da conta".

    Scenario Outline: Tela Contratar Pix" - "Contrato de Prestação de Serviços"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar no link "Contrato de Prestação de Serviços"
    Then deverá ser exibido o modal de "Contrato de Prestação de Serviços e outras Avenças"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Modal "Contrato de Prestação de Serviços" - Botão X
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar no link "Contrato de Prestação de Serviços"
    And exibir o modal de "Contrato de Prestação de Serviços e outras Avenças"
    When clicar no botão "X"
    Then modal deixará de ser exibido
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Tela Contratar Pix" - "Termo de Aceite"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar no link "Termo de Aceites"
    Then deverá ser exibido o modal de "Termo de Aceite"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Tela Contratar Pix" - "Termo de Aceites" - Botão X
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar no link "Termo de Aceites"
    And deverá ser exibido o modal de "Termo de Aceite"
    When clicar no botão "X"
    Then modal deixará de ser exibido
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Tela Contratar Pix" - Botão "Voltar"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar no botão "Voltar"
    Then usuario deverá ser redirecionado para Home
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Tela Contratar Pix - Flag "Termos e Condições"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar na flag de Termos e Condições
    Then o botão "Contratar" será habilitado
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario Outline: Tela Contratar Pix - Botão "Contratar" (Usuario elegivel)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar na flag de Termos e Condições
    When clicar no botao "Contratar'
    Then serei redirecionado para tela "Tudo pronto pra usar!"
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |

  Scenario: Tela Contratar Pix - Botão "Contratar" (Operador com F)
    Given que tenho EC "Operador com F"
    And esteja cadastrado na Serpro
    And Possua CP (POS) ativo
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    When clicar na flag de Termos e Condições
    Then o botão "Contratar" não deve ser habilitado

  Scenario Outline: Tela "Tudo Pronto pra usar!" - Botão "Ir para Conta Pix"
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And não possua Conta Pix
    And acessar o portal do cliente
    And acessar a tela "Contratar Conta Pix"
    And clicar na flag de Termos e Condições
    And clicar no botao "Contratar"
    And sera exibido a tela "Tudo pronto pra usar!"
    When clicar no botão "Ir para Conta Pix"
    Then serei redirecionado para o Webview
    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |

  Scenario: Modal Conta Pix - Botão "Conhecer mais" (NOK na Serpro)
    Given que tenho EC
    And esteja NOK na Serpro
    And Possua CP (POS) ativo
    And não possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    Then sera exibido mensagem de erro "Agradecemos seu interesse na conta Pix. Infelizmente..."

  Scenario: Modal Conta Pix - Botão "Conhecer mais" (erro de integração SERPRO)
    Given que tenho EC
    And esteja OK na Serpro
    And Possua CP (POS) ativo
    And não possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    And API de elegibilidade não recebeu retorno da SERPRO
    Then sera exibido mensagem de erro "Ops, algo seu errado!"

  Scenario: Modal Conta Pix - Botão "Conhecer mais" (sem POS ativo)
    Given que tenho EC
    And esteja OK na Serpro
    And NÃO possua CP (POS) ativo
    And não possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    Then sera exibido mensagem de erro "Quase lá..."

  Scenario: Modal Conta Pix - Botão "Conhecer mais" (erro na consulta API de elegibilidade)
    Given que tenho EC
    And esteja OK na Serpro
    And possua CP (POS) ativo
    And não possua Conta Pix
    And acessei o portal do cliente
    And é apresentado o modal para habilitação do PIX
    When clico em "Conhecer mais"
    And ocorre erro inesperado na API de elegibilidade
    Then sera exibido mensagem de erro "Quase lá..."
