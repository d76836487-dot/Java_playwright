#language:en
@ignore
@Zephyr:ProjectKey=LBIT
@Zephyr:Folder=/Onix/Portal_do_Cliente/Conta_Pix_Webview
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Conta Pix Webview

  Scenario Outline: Menu Lateral - Botão "Conta Pix" (usuario elegivel e possui Conta Pix)
    Given que tenho EC <Hierarquia>
    And esteja cadastrado na Serpro <Serpro>
    And Possua CP (POS) ativo <POS>
    And já possua Conta Pix
    And acessar o portal do cliente
    When clico em "Conta Pix" no menu lateral
    Then sou direcionado para o Webview

    Examples:
      | EC  | Hierarquia             | Serpro | POS |
      | EC1 | Matriz                 | OK     | OK  |
      | EC2 | Filho                  | OK     | OK  |
      | EC3 | Assistente de Operacao | OK     | OK  |
      | EC4 | Assistente de Consulta | OK     | OK  |
      | EC5 | Operador com F         | Ok     | OK  |

  Scenario: Tela "Conta Pix" - Tela sem transacoes
    Given estou logado no Portal do Cliente
    And com conta Pix Habilitada
    And não realizei transacoes de venda via Pix
    When acesso o Webview
    Then eu visualizo o webview sem informacoes de venda

  Scenario: Tela "Conta Pix" - Relatório de transacoes - Filtro "Pesquisar por CNPJ"
    Given acessei o portal do cliente com usuário que possui Pix
    And realizei transacoes de venda via Pix
    And acesso o Webview
    When clico no filtro "Pesquisar por CNPJ"
    And insiro um CNPJ válido
    And clico na lupa
    Then é listado apenas transacoes referentes ao CNPJ filtrado


  Scenario: Tela "Conta Pix" - Filtro "Data de Venda"
    Given acessei o portal do cliente com usuário que possui Pix
    And realizei transacoes de venda via Pix
    And acessei o Webview
    When clico no filtro de "Data de Venda" (Default=hoje)
    And parametrizo a data inicial
    And parametrizo a data final
    And clico em "Aplicar"
    Then é listado apenas as transacoes de venda dentro das datas parametrizadas


  Scenario: Tela "Conta Pix" - Filtro "Data de Venda" - Limpar Filtros
    Given acessei o portal do cliente com usuário que possui Pix
    And acessei o Webview
    And no filtro de "Data de Venda" já esteja com datas parametrizadas
    When clico no filtro de "Período de Venda"
    And e clico em "Limpar"
    Then as transacoes de venda retornam para exibicao padrao (Default=hoje)

  Scenario: Tela "Conta Pix" - Filtro "Data de recebimento"
    Given estou logado no Portal do Cliente
    And com conta Pix Habilitada
    And realizei transacoes de venda via Pix
    And acesso o Webview
    When clico no filtro de "Data de recebimento" (Default=hoje)
    And parametrizo a data inicial
    And parametrizo a data final
    And clico em "Aplicar"
    Then é listado apenas as transacoes de recebimento dentro das datas parametrizadas


  Scenario: Tela "Conta Pix" - Filtro "Data de recebimento" - Limpar Filtros
    Given acessei o portal do cliente com usuário que possui Pix
    And realizei transacoes de venda via Pix
    And acessei o Webview
    And no filtro de "Data de recebimento" já esteja com datas parametrizadas
    When clico no filtro de "Data de recebimento"
    And e clico em "Limpar"
    Then as transacoes de recebimento retornam para exibicao padrao (Default=hoje)

  Scenario: Tela "Conta Pix" - Campo "Filtros" - CNPJ Loja
    Given acessei o portal do cliente com usuário que possui Pix
    And acessei o Webview
    When clico em "Filtros"
    And clico em "CNPJ Loja"
    And insiro um CNPJ válido
    And clico em "Mostrar Resultados"
    Then é exibido apenas transacoes referentes ao CNPJ filtrado

  Scenario: Tela "Conta Pix" - Campo "Filtros" - End to End ou TX ID
    Given acessei o portal do cliente com usuário que possui Pix
    And acessei o Webview
    When clico em "Filtros"
    And clico em "End to End ou TX ID"
    And insiro um código válido
    And clico em "Mostrar Resultados"
    Then é exibido apenas a transacao referente ao código inserido

  Scenario: Tela "Conta Pix" - Campo "Filtros" - "Limpar filtros"
    Given acessei o portal do cliente com usuário que possui Pix
    And acessei o Webview
    When clico em "Filtros" com dados parametrizados anteriormente
    And clico em "limpar filtros"
    Then a janela de filtros deixa de ser exibida
    And as parametrizacoes permanecem inalteradas

  Scenario: Tela "Conta Pix" - Campo "Filtros" - Botão "X"
    Given acessei o portal do cliente com usuário que possui Pix
    And acessei o Webview
    When clico em "Filtros"
    And no botão "x"
    Then a janela de filtros deixa de ser exibida
    And as transacoes de venda retornam para exibicao padrao (Default=hoje)
