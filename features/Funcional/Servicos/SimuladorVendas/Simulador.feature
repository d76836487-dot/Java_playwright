#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Servicos/SimuladorVendas/Simulador
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Simulador

  @TestCaseKey=LPDC-T1320
  Scenario: Acesso a nova aba Simulador de Vendas pelo menu Lateral
    Given que o usuário esteja logado no Portal
    When clicar no Memu lateral esquerdo em Servicos, Simulador de Vendas
    Then A aba Simulador de Vendas deve ser exibida
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1315
  Scenario: Personalizando o Acesso Rapido com Botao Simulador de Vendas
    Given que o usuário esta na home
    When clicar em personalizar
    And no Modal seleciona a Opcao Simulador de Vendas
    And clicar no Botão personalizar
    Then sera exibido no acesso rapido a opcao Simulador de Vendas
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1323
  Scenario: Acesso a nova aba de Simulador de Vendas pelo Acesso Rapido
    Given que o usuário esta na home
    When clicar no Botão de Acesso Rapido Simulador de Vendas
    Then A aba Simulador de Vendas deve ser exibida
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1326
  Scenario: Validando Itens - Simulador de Vendas
    Given que o usuário clicou no Menu Lateral ou no Acesso Rapido em Simulador de Vendas
    When Acessar a Aba
    Then visualizara as seguintes informações, Razão Social, CPF ou CNPJ,EC
    And Botao Trocar estabelecimento
    And em Selecionar os detalhes da venda , valor, Meio de pagamento, Parcelas,Bandeira, Antecipar valor?,Repassar para o cliente?
    And Botao, Simular venda
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1313
  Scenario: Simulando Venda de Credito a Vista
    Given usuario selecionou um valor
    And selecionou Meio de pagamento, Credito a Vista
    And selecionar uma bandeira
    And no campo antecipar valor ,colocar sim
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1322
  Scenario: Detalhes da Simulacao
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1312
  Scenario: Simulando Venda Credito Parcelado
    Given usuario selecionou um valor
    And selecionou Meio de pagamento, Credito com parcelas de 2X até 21X
    And selecionar uma bandeira
    And no campo antecipar valor ,colocar sim
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1324
  Scenario: Detalhes da Simulacao Credito Parcelado
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1316
  Scenario: Simulando Venda Debito
    Given usuario selecionou um valor
    And selecionou Meio de pagamento,Debito
    And selecionar uma bandeira
    And o campo antecipar valor devera ficar desabilitado
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1311
  Scenario: Detalhes da Simulacao Debito
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1318
  Scenario: Simulando Venda com um usuario com Plano Flex
    Given usuario selecionou um valor
    And selecionou Meio de pagamento,Debito
    And selecionar uma bandeira
    And o campo antecipar valor nao devera aparecer
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1321
  Scenario: Detalhes da Simulacao com um usuario com Plano Flex
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1325
  Scenario: Simulando Venda com um usuario da inst 10 Afinz
    Given usuario selecionou um valor
    And selecionou Meio de pagamento,Debito
    And selecionar uma bandeira
    And o campo antecipar valor nao devera aparecer
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1314
  Scenario: Detalhes da Simulacao com um usuario da inst 10 Afinz
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1319
  Scenario: Simulando Venda com um usuario da Inst 7 CX com MCC e CNAE Loterica
    Given usuario selecionou um valor
    And selecionou Meio de pagamento,Debito
    And selecionar uma bandeira
    And o campo antecipar valor nao devera aparecer
    And no campo repassar valor para o cliente?, colocar sim
    Then o Botao Simular venda deve ficar habilitado na cor da instituicao
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

  @TestCaseKey=LPDC-T1317
  Scenario: Detalhes da Simulacao com um usuario da nst 7 CX com MCC e CNAE Loterica
    Given usuario preencheu todos os dados da simulacao
    When  usuario clicar no botao, Simular venda
    Then do lado direto a simulacao aparecera os dados de detalhe e resultados conforme foi preenchido
      | Perfis              |
      | Master              |
      | Secundario operacao |
      | Secundario consulta |
      | Operador Com F      |
      | Operador SEM F      |

