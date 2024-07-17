#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Header/Header_Portal
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Header Portal

  @TestCaseKey=LPDC-T276
  Scenario Outline: Validação do Header quando for selecionado ESTABELECIMENTO (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do EC
    And Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança
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
  Scenario Outline: Validação do Header quando for selecionado DOCUMENTO (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do Documento
    And Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança
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

  @TestCaseKey=LPDC-T248
  Scenario Outline: Validação do Header quando for selecionado na aba DOCUMENTO a opção TODOS (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar Todos na aba Documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o texto Todos documentos
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
  Scenario Outline: Validação do comportamento do Header do Portal não se mover com scroll (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário move a tela através do scroll
    Then Usuário verá "Header - Trocar Estabelecimento"
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
  Scenario Outline: Validação informações home logada com seleção de EC (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
    And A exportação do relatório 'Vendas Hoje' terá somente o EC selecionado
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
  Scenario Outline: Validação informações home logada com seleção de Documento (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
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
  Scenario Outline: Validação informações home logada com seleção todos Documentos (Usuário Master)
    Given open portal "<alianca>" and logon
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
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
  Scenario Outline: Health check Minha Meu Perfil
    Given open portal "<alianca>" and logon
    When usuário clica "Header - Meu Perfil"
    And waiting
    And Usuário verá "Meu Perfil - Label Documento ou usuário"
    And Usuário verá "Meu Perfil - Label Endereço de e-mail"
    And Usuário verá "Meu Perfil - Label Celular"
    And Usuário verá "Meu Perfil - Label Configurações da conta"
    And Usuário verá "Meu Perfil - Label Excluir acesso digital"
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

