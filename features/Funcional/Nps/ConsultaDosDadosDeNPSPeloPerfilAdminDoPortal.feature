#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nps/ConsultaDosDadosDeNPSPeloPerfilAdminDoPortal
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: ConsultaDosDadosDeNPSPeloPerfilAdminDoPortal

  @TestCaseKey=LPDC-T2087
  Scenario: Extrair dados de NPS capturados pelo próprio Portal
    Given acesso a plataforma como administrador
    When a API de NPS Fiserv não está funcionando
    And clico no card de relatório
    And clico em “Gerar Relatório”
    Then deve ser possível extrair os dados de NPS capturados pelo Portal

  @TestCaseKey=LPDC-T2085
  Scenario Outline: Filtrar dados de NPS por canal
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And escolho "<canal>" no combo box de "Canais"
    And clico em "Gerar Relatório"
    Then o relatório deve ser gerado com dados do "<canal>"
    Examples:
      | canal  |
      | App    |
      | Portal |
      | Ambos  |

  @TestCaseKey=LPDC-T2080
  Scenario: Apresentar coluna de canal nos relatórios de NPS
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then o relatório deve incluir uma coluna "Canal"

  @TestCaseKey=LPDC-T2081
  Scenario: Verificar conteúdos de ABA 1 no relatório de NPS
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then a primeira aba do relatório deve conter as colunas
      | Coluna            |
      | Canal             |
      | Alianca           |
      | Data de resposta  |
      | CNPJ              |
      | Documento         |
      | Referencia        |
      | Nota              |
      | Evento            |
      | Comentario        |
      | Perfil do Cliente |

  @TestCaseKey=LPDC-T2083
  Scenario Outline: Verificar comportamento de perfil do cliente
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then o relatório deve classificar o cliente como "<perfil>"
      | Nota   |
      | <nota> |
    Examples:
      | nota | perfil   |
      | 9    | Promotor |
      | 10   | Promotor |
      | 7    | Neutro   |
      | 8    | Neutro   |
      | 6    | Detrator |
      | 0    | Detrator |
      | 2    | Detrator |

  @TestCaseKey=LPDC-T2082
  Scenario: Verificar conteúdos de ABA 2 no relatório de NPS
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then a segunda aba do relatório deve conter as colunas
      | Coluna                  |
      | Pergunta                |
      | Promotores              |
      | Neutros                 |
      | Detratores              |
      | Quantidade de Respostas |
      | NPS                     |

  @TestCaseKey=LPDC-T2084
  Scenario Outline: Verificar calculo de NPS na ABA 2
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then a coluna "NPS" deve conter a subtração de <promotor> - <detrator>
      | Pergunta  | Promotores | Neutros | Detratores | Quantidade de Respostas | NPS   |
      | pergunta1 | <promotor> | 8       | <detrator> | 20                      | <nps> |
    Examples:
      | promotor | detrator | nps |
      | 10       | 5        | 5   |
      | 15       | 6        | 9   |

  @TestCaseKey=LPDC-T2086
  Scenario: Verificar lista de triggers no relatório
    Given acesso a plataforma como administrador
    When clico no card de relatório
    And clico em "Gerar Relatório"
    Then o relatório deve incluir todos os triggers do App ou Portal

  @TestCaseKey=LPDC-T2090
  Scenario: Verificar nome do arquivo gerado para extração via Portal
    Given solicito uma extração via Portal
    When o arquivo é gerado
    Then o nome do arquivo deve conter "PORTAL"
      | Nome do Arquivo                                       |
      | BIN_NPS_PORTAL_01-12-2025_23-12-2025_23-12_15:57.xlsx |

  @TestCaseKey=LPDC-T2088
  Scenario: Verificar nome do arquivo gerado para extração via App
    Given solicito uma extração via App
    When o arquivo é gerado
    Then o nome do arquivo deve conter "APP"
      | Nome do Arquivo                                    |
      | BIN_NPS_APP_01-12-2025_23-12-2025_23-12_15:56.xlsx |

  @TestCaseKey=LPDC-T2089
  Scenario: Verificar nome do arquivo gerado para extração via Ambos (Portal e App)
    Given solicito uma extração via Ambos (Portal e App)
    When o arquivo é gerado
    Then o nome do arquivo deve conter "AMBOS"
      | Nome do Arquivo                                      |
      | BIN_NPS_AMBOS_01-12-2025_23-12-2025_23-12_15:53.xlsx |

