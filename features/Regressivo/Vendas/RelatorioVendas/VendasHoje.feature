#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Vendas/RelatorioVendas/Vendas_Hoje
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
Feature: Vendas Hoje

  Scenario Outline: Acessar Vendas Hoje - Menu lateral
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso

    @bin
    Examples:
    |alianca    |menu     |submenu          |
    |"bin"      |"vendas" |"relatorioVendas"|

    @sicredi
    Examples:
    |alianca    |menu     |submenu          |
    |"sicredi"  |"vendas" |"relatorioVendas"|

    @azulzinha
    Examples:
    |alianca    |menu     |submenu          |
    |"azulzinha"|"vendas" |"relatorioVendas"|

    @afinz
    Examples:
    |alianca    |menu     |submenu          |
    |"afinz"    |"vendas" |"relatorioVendas"|

  Scenario Outline: Acessar Vendas Hoje - Dashboard Vendas
    Given realizar login no portal <alianca>
    When acessar dashboard <dashboard>
    Then valida que o Vendas Hoje foi acessado com sucesso

    @bin
    Examples:
    |alianca    |dashboard|
    |"bin"      |"vendas" |

    @sicredi
    Examples:
    |alianca    |dashboard|
    |"sicredi"  |"vendas" |

    @azulzinha
    Examples:
    |alianca    |dashboard|
    |"azulzinha"|"vendas" |

    @afinz
    Examples:
    |alianca    |dashboard|
    |"afinz"    |"vendas" |

  Scenario Outline: Verificar texto do rodape - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And verifica o texto do rodape

    @bin
    Examples:
    |alianca    |menu     |submenu          |
    |"bin"      |"vendas" |"relatorioVendas"|

    @sicredi
    Examples:
    |alianca    |menu     |submenu          |
    |"sicredi"  |"vendas" |"relatorioVendas"|

    @azulzinha
    Examples:
    |alianca    |menu     |submenu          |
    |"azulzinha"|"vendas" |"relatorioVendas"|

    @afinz
    Examples:
    |alianca    |menu     |submenu          |
    |"afinz"    |"vendas" |"relatorioVendas"|

  Scenario Outline: Visualizar campos do Resumo - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And visualiza os campos <campo1> e <campo2>

    @bin
    Examples:
    |alianca    |menu     |submenu          |campo1           |campo2       |
    |"bin"      |"vendas" |"relatorioVendas"|"Total de vendas"|"Valor bruto"|

    @sicredi
    Examples:
    |alianca    |menu     |submenu          |campo1           |campo2       |
    |"sicredi"  |"vendas" |"relatorioVendas"|"Total de vendas"|"Valor bruto"|

    @azulzinha
    Examples:
    |alianca    |menu     |submenu          |campo1           |campo2       |
    |"azulzinha"|"vendas" |"relatorioVendas"|"Total de vendas"|"Valor bruto"|

    @afinz
    Examples:
    |alianca    |menu     |submenu          |campo1           |campo2       |
    |"afinz"    |"vendas" |"relatorioVendas"|"Total de vendas"|"Valor bruto"|

  Scenario Outline: Personalizar colunas - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And realiza a personalizacao das colunas <colunas>
    And valida que foi aplicado a personalizacao das colunas <colunas>

    @azulzinha
    Examples:
    |alianca    |menu     |submenu          |colunas                                                                                                                        |
    |"azulzinha"|"vendas" |"relatorioVendas"|"dataVenda;produto;bandeira;valorBruto;status"                                                                                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"dataVenda;codAutorizacao;comprovanteVenda;produto;parcelas;valorBruto;status;estabelecimento;finalCartao;codReferenciaCartao" |
    |"azulzinha"|"vendas" |"relatorioVendas"|"codAutorizacao;canal;estabelecimento;finalCartao;codReferenciaCartao"                                                         |

  Scenario Outline: Realizar filtro - <filtro>: <valor> - Vendas Hoje
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida que o Vendas Hoje foi acessado com sucesso
    And aplicar o filtro <filtro> atribuindo o valor <valor>
    And valida que foi atribuido o valor <valor> do filtro <filtro>

    @azulzinha
    Examples:
    |alianca    |menu     |submenu          |filtro             |valor                    |
    |"azulzinha"|"vendas" |"relatorioVendas"|"codAutorizacao"   |"primeiroRegistro"       |
    |"azulzinha"|"vendas" |"relatorioVendas"|"codAutorizacao"   |"WWW333"                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"status"           |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"status"           |"Autorizada"             |
    |"azulzinha"|"vendas" |"relatorioVendas"|"status"           |"Recusada"               |
    |"azulzinha"|"vendas" |"relatorioVendas"|"status"           |"Estornada"              |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Crédito"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Crédito Internacional"  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Débito"                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Débito Internacional"   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Refeição"               |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Alimentação"            |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Premium"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Cultura"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Auto"                   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Gift"                   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Corporativo"            |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Benefícios"             |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Multiplo"               |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Flex"                   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Natal"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"produtos"         |"Multibenefícios"        |
    |"azulzinha"|"vendas" |"relatorioVendas"|"canal"            |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"canal"            |"selecionarPrimeiraOpcao"|
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Mastercard"             |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Maestro"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Cabal"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Elo"                    |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Banese"                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Ticket"                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Alelo"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Sorocred"               |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Amex"                   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Hipercard"              |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Pluxee"                 |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"VR"                     |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Visa"                   |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Softnex"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Redecompras"            |
    |"azulzinha"|"vendas" |"relatorioVendas"|"bandeira"         |"Fepas"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"valores"          |"100;300"                |
    |"azulzinha"|"vendas" |"relatorioVendas"|"estabelecimento"  |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"estabelecimento"  |"selecionarPrimeiraOpcao"|
    |"azulzinha"|"vendas" |"relatorioVendas"|"terminal"         |"todos"                  |
    |"azulzinha"|"vendas" |"relatorioVendas"|"terminal"         |"selecionarPrimeiraOpcao"|