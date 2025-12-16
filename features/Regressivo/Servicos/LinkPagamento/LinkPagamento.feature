#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Servicos/LinkPagamento/Link_de_pagamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@Servicos
@LinkPagamento
Feature: Link de pagamento

  @TestCaseKey=LPDC-T2048
  Scenario Outline: Validar ocultação do menu Link de pagamento
    Given que realizei Login no Portal pela aliança <alianca>
    When realizo o acesso ao menu <menu>
    Then o submenu <submenu> estará ocultado
    @nubank
    Examples:
      | alianca  | menu       | submenu             |
      | "nubank" | "Serviços" | "Link de pagamento" |

