#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/ModalDeAvisoDeInatividadeDe15minutosPortal
@Zephyr:Status=Approved
@Zephyr:Component=BDD Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: ModalDeAvisoDeInatividadeDe15minutosPortal

  Scenario: Aviso de queda de sessão após 12 minutos de inatividade
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos
    Then deve ser apresentado um pop-up de aviso de queda de sessão
    And o pop-up deve conter um cronômetro iniciando em 03:00 minutos

  Scenario: Queda de sessão após contagem regressiva
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos
    And o pop-up de aviso de queda de sessão seja apresentado
    When o cronômetro do pop-up chegue a 00:00 minutos
    Then a sessão do usuário deve ser encerrada

  Scenario: Continuação da sessão após interação do usuário
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos
    And o pop-up de aviso de queda de sessão seja apresentado
    When o usuário mover o mouse ou pressionar qualquer tecla
    Then o pop-up de aviso de queda de sessão deve ser fechado
    And a sessão do usuário deve continuar ativa

  Scenario Outline: Verificação do aviso de queda de sessão em diferentes abas
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos na aba <aba>
    Then deve ser apresentado um pop-up de aviso de queda de sessão
    And o pop-up deve conter um cronômetro iniciando em 03:00 minutos
    Examples:
      | aba                |
      | Home               |
      | Perfil             |
      | Configuracoes      |
      | Relatorios         |

  Scenario: Verificação da mensagem no pop-up de aviso de queda de sessão
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos
    Then deve ser apresentado um pop-up de aviso de queda de sessão com a mensagem:
      | Mensagem                                              |
      | Sua sessao esta prestes a ser encerrada por inatividade. |
      | Para continuar, mova o mouse ou pressione qualquer tecla. |
      | Tempo restante: 03:00 minutos                         |

  Scenario: Verificação do encerramento da sessão após inatividade
    Given que o usuário esteja logado no Portal
    And o usuário fique inativo por 12 minutos
    And o pop-up de aviso de queda de sessão seja apresentado
    And o cronômetro do pop-up chegue a 00:00 minutos
    Then a sessão do usuário deve ser encerrada
    And o usuário deve ser redirecionado para a página de login