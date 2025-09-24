#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Negocio/Negocio
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Negocio
Feature: Negocio

  @TestCaseKey=LPDC-T1554
  Scenario Outline: Validar troca de estabelecimento - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valido a troca do estabelecimento
    @bin
    Examples:
      | alianca | menu      | submenu |
      | "bin"   | "negocio" | ""      |

    @sicredi
    Examples:
      | alianca   | menu      | submenu |
      | "sicredi" | "negocio" | ""      |

    @azulzinha
    Examples:
      | alianca     | menu      | submenu |
      | "azulzinha" | "negocio" | ""      |

    @afinz
    Examples:
      | alianca | menu      | submenu |
      | "afinz" | "negocio" | ""      |

    @claropay
    Examples:
      | alianca    | menu      | submenu |
      | "claropay" | "negocio" | ""      |

    @banqi
    Examples:
      | alianca | menu      | submenu |
      | "banqi" | "negocio" | ""      |

    @corujacapital
    Examples:
      | alianca         | menu      | submenu |
      | "corujacapital" | "negocio" | ""      |

  @TestCaseKey=LPDC-T1555
  Scenario Outline: Verificar Dados Cadastrais - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then verifico os Dados Cadastrais
    @bin
    Examples:
      | alianca | menu      | submenu |
      | "bin"   | "negocio" | ""      |

    @sicredi
    Examples:
      | alianca   | menu      | submenu |
      | "sicredi" | "negocio" | ""      |

    @azulzinha
    Examples:
      | alianca     | menu      | submenu |
      | "azulzinha" | "negocio" | ""      |

    @afinz
    Examples:
      | alianca | menu      | submenu |
      | "afinz" | "negocio" | ""      |

    @claropay
    Examples:
      | alianca    | menu      | submenu |
      | "claropay" | "negocio" | ""      |

    @banqi
    Examples:
      | alianca | menu      | submenu |
      | "banqi" | "negocio" | ""      |

    @corujacapital
    Examples:
      | alianca         | menu      | submenu |
      | "corujacapital" | "negocio" | ""      |

  @TestCaseKey=LPDC-T1559
  Scenario Outline: Realizar filtros em Meus Domicilios - <filtro>: <valor> - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then realiza o filtro no campo <filtro> atribuindo o valor <valor>
    @bin
    @banco
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "bin"   | "negocio" | ""      | "Banco" | ""    |

    @bin
    @agencia
    Examples:
      | alianca | menu      | submenu | filtro    | valor |
      | "bin"   | "negocio" | ""      | "Agência" | ""    |

    @bin
    @conta
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "bin"   | "negocio" | ""      | "Conta" | ""    |

    @bin
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor   |
      | "bin"   | "negocio" | ""      | "Produtos" | "todos" |

    @bin
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor     |
      | "bin"   | "negocio" | ""      | "Produtos" | "Crédito" |

    @bin
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor    |
      | "bin"   | "negocio" | ""      | "Produtos" | "Débito" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "todos" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor        |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Visa" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Amex" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor       |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @bin
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor |
      | "bin"   | "negocio" | ""      | "Bandeiras" | "Elo" |

    @sicredi
    @banco
    Examples:
      | alianca   | menu      | submenu | filtro  | valor |
      | "sicredi" | "negocio" | ""      | "Banco" | ""    |

    @sicredi
    @agencia
    Examples:
      | alianca   | menu      | submenu | filtro    | valor |
      | "sicredi" | "negocio" | ""      | "Agência" | ""    |

    @sicredi
    @conta
    Examples:
      | alianca   | menu      | submenu | filtro  | valor |
      | "sicredi" | "negocio" | ""      | "Conta" | ""    |

    @sicredi
    @produtos
    Examples:
      | alianca   | menu      | submenu | filtro     | valor   |
      | "sicredi" | "negocio" | ""      | "Produtos" | "todos" |

    @sicredi
    @produtos
    Examples:
      | alianca   | menu      | submenu | filtro     | valor     |
      | "sicredi" | "negocio" | ""      | "Produtos" | "Crédito" |

    @sicredi
    @produtos
    Examples:
      | alianca   | menu      | submenu | filtro     | valor    |
      | "sicredi" | "negocio" | ""      | "Produtos" | "Débito" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor   |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "todos" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor        |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor  |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor  |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor   |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor       |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @sicredi
    @bandeiras
    Examples:
      | alianca   | menu      | submenu | filtro      | valor |
      | "sicredi" | "negocio" | ""      | "Bandeiras" | "Elo" |

    @azulzinha
    @banco
    Examples:
      | alianca     | menu      | submenu | filtro  | valor |
      | "azulzinha" | "negocio" | ""      | "Banco" | ""    |

    @azulzinha
    @agencia
    Examples:
      | alianca     | menu      | submenu | filtro    | valor |
      | "azulzinha" | "negocio" | ""      | "Agência" | ""    |

    @azulzinha
    @conta
    Examples:
      | alianca     | menu      | submenu | filtro  | valor |
      | "azulzinha" | "negocio" | ""      | "Conta" | ""    |

    @azulzinha
    @produtos
    Examples:
      | alianca     | menu      | submenu | filtro     | valor   |
      | "azulzinha" | "negocio" | ""      | "Produtos" | "todos" |

    @azulzinha
    @produtos
    Examples:
      | alianca     | menu      | submenu | filtro     | valor     |
      | "azulzinha" | "negocio" | ""      | "Produtos" | "Crédito" |

    @azulzinha
    @produtos
    Examples:
      | alianca     | menu      | submenu | filtro     | valor    |
      | "azulzinha" | "negocio" | ""      | "Produtos" | "Débito" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor   |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "todos" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor        |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor  |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor  |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor   |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor       |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @azulzinha
    @bandeiras
    Examples:
      | alianca     | menu      | submenu | filtro      | valor |
      | "azulzinha" | "negocio" | ""      | "Bandeiras" | "Elo" |

    @afinz
    @banco
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "afinz" | "negocio" | ""      | "Banco" | ""    |

    @afinz
    @agencia
    Examples:
      | alianca | menu      | submenu | filtro    | valor |
      | "afinz" | "negocio" | ""      | "Agência" | ""    |

    @afinz
    @conta
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "afinz" | "negocio" | ""      | "Conta" | ""    |

    @afinz
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor   |
      | "afinz" | "negocio" | ""      | "Produtos" | "todos" |

    @afinz
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor     |
      | "afinz" | "negocio" | ""      | "Produtos" | "Crédito" |

    @afinz
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor    |
      | "afinz" | "negocio" | ""      | "Produtos" | "Débito" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "todos" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor        |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor       |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @afinz
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor |
      | "afinz" | "negocio" | ""      | "Bandeiras" | "Elo" |

    @claropay
    @banco
    Examples:
      | alianca    | menu      | submenu | filtro  | valor |
      | "claropay" | "negocio" | ""      | "Banco" | ""    |

    @claropay
    @agencia
    Examples:
      | alianca    | menu      | submenu | filtro    | valor |
      | "claropay" | "negocio" | ""      | "Agência" | ""    |

    @claropay
    @conta
    Examples:
      | alianca    | menu      | submenu | filtro  | valor |
      | "claropay" | "negocio" | ""      | "Conta" | ""    |

    @claropay
    @produtos
    Examples:
      | alianca    | menu      | submenu | filtro     | valor   |
      | "claropay" | "negocio" | ""      | "Produtos" | "todos" |

    @claropay
    @produtos
    Examples:
      | alianca    | menu      | submenu | filtro     | valor     |
      | "claropay" | "negocio" | ""      | "Produtos" | "Crédito" |

    @claropay
    @produtos
    Examples:
      | alianca    | menu      | submenu | filtro     | valor    |
      | "claropay" | "negocio" | ""      | "Produtos" | "Débito" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor   |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "todos" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor        |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor  |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor  |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor   |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor       |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @claropay
    @bandeiras
    Examples:
      | alianca    | menu      | submenu | filtro      | valor |
      | "claropay" | "negocio" | ""      | "Bandeiras" | "Elo" |

    @banqi
    @banco
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "banqi" | "negocio" | ""      | "Banco" | ""    |

    @banqi
    @agencia
    Examples:
      | alianca | menu      | submenu | filtro    | valor |
      | "banqi" | "negocio" | ""      | "Agência" | ""    |

    @banqi
    @conta
    Examples:
      | alianca | menu      | submenu | filtro  | valor |
      | "banqi" | "negocio" | ""      | "Conta" | ""    |

    @banqi
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor   |
      | "banqi" | "negocio" | ""      | "Produtos" | "todos" |

    @banqi
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor     |
      | "banqi" | "negocio" | ""      | "Produtos" | "Crédito" |

    @banqi
    @produtos
    Examples:
      | alianca | menu      | submenu | filtro     | valor    |
      | "banqi" | "negocio" | ""      | "Produtos" | "Débito" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "todos" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor        |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor  |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor   |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor       |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @banqi
    @bandeiras
    Examples:
      | alianca | menu      | submenu | filtro      | valor |
      | "banqi" | "negocio" | ""      | "Bandeiras" | "Elo" |

    @corujacapital
    @banco
    Examples:
      | alianca         | menu      | submenu | filtro  | valor |
      | "corujacapital" | "negocio" | ""      | "Banco" | ""    |

    @corujacapital
    @agencia
    Examples:
      | alianca         | menu      | submenu | filtro    | valor |
      | "corujacapital" | "negocio" | ""      | "Agência" | ""    |

    @corujacapital
    @conta
    Examples:
      | alianca         | menu      | submenu | filtro  | valor |
      | "corujacapital" | "negocio" | ""      | "Conta" | ""    |

    @corujacapital
    @produtos
    Examples:
      | alianca         | menu      | submenu | filtro     | valor   |
      | "corujacapital" | "negocio" | ""      | "Produtos" | "todos" |

    @corujacapital
    @produtos
    Examples:
      | alianca         | menu      | submenu | filtro     | valor     |
      | "corujacapital" | "negocio" | ""      | "Produtos" | "Crédito" |

    @corujacapital
    @produtos
    Examples:
      | alianca         | menu      | submenu | filtro     | valor    |
      | "corujacapital" | "negocio" | ""      | "Produtos" | "Débito" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor   |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "todos" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor        |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Mastercard" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor  |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Visa" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor  |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Amex" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor   |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Cabal" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor       |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Hipercard" |

    @corujacapital
    @bandeiras
    Examples:
      | alianca         | menu      | submenu | filtro      | valor |
      | "corujacapital" | "negocio" | ""      | "Bandeiras" | "Elo" |

  @TestCaseKey=LPDC-T1557
  Scenario Outline: Validar acesso ao Inteligencia financeira - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valido o acesso ao Inteligencia financeira
    @bin
    Examples:
      | alianca | menu      | submenu |
      | "bin"   | "negocio" | ""      |

    @sicredi
    Examples:
      | alianca   | menu      | submenu |
      | "sicredi" | "negocio" | ""      |

    @azulzinha
    Examples:
      | alianca     | menu      | submenu |
      | "azulzinha" | "negocio" | ""      |

    @afinz
    Examples:
      | alianca | menu      | submenu |
      | "afinz" | "negocio" | ""      |

    @claropay
    Examples:
      | alianca    | menu      | submenu |
      | "claropay" | "negocio" | ""      |

    @banqi
    Examples:
      | alianca | menu      | submenu |
      | "banqi" | "negocio" | ""      |

    @corujacapital
    Examples:
      | alianca         | menu      | submenu |
      | "corujacapital" | "negocio" | ""      |

  @TestCaseKey=LPDC-T1560
  Scenario Outline: Validar busca por terminal no link Ver todos os terminais - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida a busca por terminal no link Ver todos os terminais
    @bin
    Examples:
      | alianca | menu      | submenu |
      | "bin"   | "negocio" | ""      |

    @sicredi
    Examples:
      | alianca   | menu      | submenu |
      | "sicredi" | "negocio" | ""      |

    @azulzinha
    Examples:
      | alianca     | menu      | submenu |
      | "azulzinha" | "negocio" | ""      |

    @afinz
    Examples:
      | alianca | menu      | submenu |
      | "afinz" | "negocio" | ""      |

    @claropay
    Examples:
      | alianca    | menu      | submenu |
      | "claropay" | "negocio" | ""      |

    @banqi
    Examples:
      | alianca | menu      | submenu |
      | "banqi" | "negocio" | ""      |

    @corujacapital
    Examples:
      | alianca         | menu      | submenu |
      | "corujacapital" | "negocio" | ""      |

  @TestCaseKey=LPDC-T1556
  Scenario Outline: Validar Meus Terminais - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida Meus Terminais
    @bin
    Examples:
      | alianca | menu      | submenu |
      | "bin"   | "negocio" | ""      |

    @sicredi
    Examples:
      | alianca   | menu      | submenu |
      | "sicredi" | "negocio" | ""      |

    @azulzinha
    Examples:
      | alianca     | menu      | submenu |
      | "azulzinha" | "negocio" | ""      |

    @afinz
    Examples:
      | alianca | menu      | submenu |
      | "afinz" | "negocio" | ""      |

    @claropay
    Examples:
      | alianca    | menu      | submenu |
      | "claropay" | "negocio" | ""      |

    @banqi
    Examples:
      | alianca | menu      | submenu |
      | "banqi" | "negocio" | ""      |

    @corujacapital
    Examples:
      | alianca         | menu      | submenu |
      | "corujacapital" | "negocio" | ""      |

  @TestCaseKey=LPDC-T1558
  Scenario Outline: Validar Taxas e Tarifas por Bandeira <bandeira> - Negocio
    Given realizar login no portal <alianca>
    When acessar menu <menu> e submenu <submenu>
    Then valida as Taxas e Tarifas por Bandeira <bandeira>
    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira     |
      | "bin"   | "negocio" | ""      | "Mastercard" |

    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "bin"   | "negocio" | ""      | "Visa"   |

    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "bin"   | "negocio" | ""      | "ELO"    |

    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "bin"   | "negocio" | ""      | "Cabal"  |

    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "bin"   | "negocio" | ""      | "AMEX"   |

    @bin
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira    |
      | "bin"   | "negocio" | ""      | "Hipercard" |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira     |
      | "sicredi" | "negocio" | ""      | "Mastercard" |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira |
      | "sicredi" | "negocio" | ""      | "Visa"   |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira |
      | "sicredi" | "negocio" | ""      | "ELO"    |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira |
      | "sicredi" | "negocio" | ""      | "Cabal"  |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira |
      | "sicredi" | "negocio" | ""      | "AMEX"   |

    @sicredi
    @bandeira
    Examples:
      | alianca   | menu      | submenu | bandeira    |
      | "sicredi" | "negocio" | ""      | "Hipercard" |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira     |
      | "azulzinha" | "negocio" | ""      | "Mastercard" |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira |
      | "azulzinha" | "negocio" | ""      | "Visa"   |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira |
      | "azulzinha" | "negocio" | ""      | "ELO"    |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira |
      | "azulzinha" | "negocio" | ""      | "Cabal"  |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira |
      | "azulzinha" | "negocio" | ""      | "AMEX"   |

    @azulzinha
    @bandeira
    Examples:
      | alianca     | menu      | submenu | bandeira    |
      | "azulzinha" | "negocio" | ""      | "Hipercard" |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira     |
      | "afinz" | "negocio" | ""      | "Mastercard" |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "afinz" | "negocio" | ""      | "Visa"   |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "afinz" | "negocio" | ""      | "ELO"    |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "afinz" | "negocio" | ""      | "Cabal"  |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "afinz" | "negocio" | ""      | "AMEX"   |

    @afinz
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira    |
      | "afinz" | "negocio" | ""      | "Hipercard" |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira     |
      | "claropay" | "negocio" | ""      | "Mastercard" |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira |
      | "claropay" | "negocio" | ""      | "Visa"   |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira |
      | "claropay" | "negocio" | ""      | "ELO"    |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira |
      | "claropay" | "negocio" | ""      | "Cabal"  |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira |
      | "claropay" | "negocio" | ""      | "AMEX"   |

    @claropay
    @bandeira
    Examples:
      | alianca    | menu      | submenu | bandeira    |
      | "claropay" | "negocio" | ""      | "Hipercard" |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira     |
      | "banqi" | "negocio" | ""      | "Mastercard" |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "banqi" | "negocio" | ""      | "Visa"   |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "banqi" | "negocio" | ""      | "ELO"    |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "banqi" | "negocio" | ""      | "Cabal"  |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira |
      | "banqi" | "negocio" | ""      | "AMEX"   |

    @banqi
    @bandeira
    Examples:
      | alianca | menu      | submenu | bandeira    |
      | "banqi" | "negocio" | ""      | "Hipercard" |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira     |
      | "corujacapital" | "negocio" | ""      | "Mastercard" |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira |
      | "corujacapital" | "negocio" | ""      | "Visa"   |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira |
      | "corujacapital" | "negocio" | ""      | "ELO"    |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira |
      | "corujacapital" | "negocio" | ""      | "Cabal"  |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira |
      | "corujacapital" | "negocio" | ""      | "AMEX"   |

    @corujacapital
    @bandeira
    Examples:
      | alianca         | menu      | submenu | bandeira    |
      | "corujacapital" | "negocio" | ""      | "Hipercard" |

