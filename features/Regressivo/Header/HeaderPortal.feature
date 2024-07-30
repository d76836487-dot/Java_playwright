#language: en

@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Header/Header_Portal
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Header Portal

  @TestCaseKey=LPDC-T276
  Scenario Outline: Validação do Header - troca de estabelecimento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do EC
    And Usuário visualizará um label escrito “Trocar estabelecimento”
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T277
  Scenario Outline: Validação do Header - troca de documento
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do Documento
    And Usuário visualizará um label escrito “Trocar estabelecimento”
    And logout
    @sicredi @alliances @HeaderAll
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T248
  Scenario Outline: Validação do Header seleção todos documentos
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar Todos na aba Documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o texto Todos documentos
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T234
  Scenario Outline: Validação do Header scroll
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário move a tela através do scroll
    Then Usuário verá "Header - Trocar Estabelecimento"
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T239
  Scenario Outline: Header exportação excel - Vendas Hoje - validação cabecalho EC
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
    And A exportação do relatório 'Vendas Hoje' terá somente o EC selecionado
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T257
  Scenario Outline: Header exportação excel - Vendas Hoje - validação cabeçalho Valor
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T269
  Scenario Outline: Header exportação excel - Vendas Hoje - validação cabeçalho
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T245
  Scenario Outline: Health check Meu Perfil
    Given open portal "<alianca>" and logon
    When usuário clica "Header - Meu Perfil"
    And waiting
    And Usuário verá "Meu Perfil - Label Documento ou usuário"
    And Usuário verá "Meu Perfil - Label Endereço de e-mail"
    And Usuário verá "Meu Perfil - Label Celular"
    And Usuário verá "Meu Perfil - Label Configurações da conta"
    And Usuário verá "Meu Perfil - Label Excluir acesso digital"
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

  @TestCaseKey=LPDC-T233
  Scenario Outline: Popup Excluir acesso Digital
    Given open portal "<alianca>" and logon
    When usuário clica "Header - Meu Perfil"
    Then usuário clica "Meu Perfil - Label Excluir acesso digital"
    And Usuário verá "Excluir - Popup Excluir acesso digital"
    And logout
    @sicredi @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | sicredi |

    @afinz @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | afinz   |

    @azulzinha @alliances
    Examples:
      | Description    | alianca   |
      | Usuario master | azulzinha |

    @bin @alliances
    Examples:
      | Description    | alianca |
      | Usuario master | bin     |

