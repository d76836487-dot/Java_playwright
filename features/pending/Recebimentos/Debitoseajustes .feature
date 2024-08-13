#language:en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Recebimentos/Débitos_e_Ajustes
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Débitos e Ajustes

  @TestCaseKey=LPDC-T666
  Scenario Outline: Visualizando Débitos e Ajustes Máster
    Given usuário esteja logado no Portal do Cliente
    When usuário selecionar Recebimentos no menu lateral esquerdo
    Then usuário visualizara as abas Pagos, Futuros, Débitos e Ajustes
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T667
  Scenario Outline: Visualizando Débitos e Ajustes através do Acesso rápido Máster
    Given usuário esteja logado no Portal do Cliente
    When usuário selecionar Recebimentos na home logada "Acesso rápido"
    Then usuário visualizara as abas Pagos, Futuros, Débitos e Ajustes
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T656
  Scenario Outline: Visualizando mensagem
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    Then usuário visualizara a seguinte mensagem Os débitos e ajustes são o que é cobrado nos seus recebíveis.
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |


  @TestCaseKey=LPDC-T664
  Scenario Outline: Visualizando Tipo de Ajuste
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    Then usuário visualizara, Tipo de Ajuste > Aluguel (única opção neste momento)
    Then usuário visualizara, Período
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |
  @TestCaseKey=LPDC-T660
  Scenario Outline: Visualizando Filtro Período default último mês
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    Then usuário visualizara, Período último mês como default
    And ao clicar no componente do calendário poderá selecionar o mês de consulta que deseja consultar (novo formato de calendário)
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |


  @TestCaseKey=LPDC-T657
  Scenario Outline: Visualizando Botão Exportar
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    Then usuário visualizara, O Botão Exportar na cor da Instituição.
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T663
  Scenario Outline: Visualizando arquivo exportado
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    And usuário clica no botão Exportar
    Then terá um arquivo na extensão Excel com logo da alianla, "Mês de referencia" e "Emitido em" no topo" e as colunas Data do ajuste, Valor do aluguel, Comprovante, Tecnologia, Estabelecimento, Data efetiva da cobrança e Status
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T668
  Scenario Outline: Visualizando Colunas
    Given usuário esteja Logado no Portal
    When estiver em Débitos e Ajustes
    Then usuário visualizara, os seguintes dados Data do ajuste, Valor do aluguel, Comprovante, Tecnologia, Estabelecimento, Data efetiva da cobrança e Status
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T658
  Scenario Outline: Visualizando Status Pendente
    Given usuário esteja em Débitos e Ajustes
    When selecionar um mês que tenha aluguel pendente
    And clicar no Botão Aplicar
    Then usuário visualizara, o histórico de aluguel contendo uma faixa vermelha com a seguinte mensagem Existem pagamentos de aluguel pendentes para esse período
    And a coluna status deve estar com status Pendente na cor amarela
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T661
  Scenario Outline: Visualizando Status Debitado
    Given usuário esteja em Débitos e Ajustes
    When selecionar um mês que não tenha aluguel pendente
    And clicar no Botão Aplicar
    Then usuário visualizara, o histórico de aluguel contendo uma faixa Verde com a seguinte mensagem Todas as tarifas de aluguel foram pagas para esse período
    And a coluna status deve estar com status Debitado na cor verde
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

  @TestCaseKey=LPDC-T665
  Scenario Outline: Buscando por período futuro
    Given usuário esteja em Débitos e Ajustes
    When tentar selecionar um mês futuro ao mês atual
    Then usuário não deve conseguir selecionar pois o calendário não permitirá
    Examples:
      | Perfis                            |
      | Máster                            |
      | Secundário assistente de consulta |
      | Secundário assistente de operação |
      | Operador com F                    |
      | Operador sem F                    |

