#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/RelatorioDeVendasNovaColunaTipoDeCartãoNoRelatorioDetalhadoDeVendas
@Zephyr:Status=Approved
@Zephyr:Component=BDD&Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: RelatorioDeVendasNovaColunaTipoDeCartãoNoRelatorioDetalhadoDeVendas


Scenario: Verificar tipo de cartão no relatório detalhado de vendas
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório detalhado de vendas no formato CSV
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Nacional" ou "Internacional"

Scenario: Verificar tipo de cartão no relatório detalhado de vendas em Excel
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório detalhado de vendas no formato Excel
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Nacional" ou "Internacional"

Scenario: Verificar retorno "Nacional" para cartões com código "002"
    Given que o retorno da API contém o código "002" para o tipo de cartão
    When verifico o relatório detalhado de vendas
    Then a coluna "Tipo de cartão" deve exibir "Nacional"

Scenario: Verificar retorno "Nacional" para cartões com código "898"
    Given que o retorno da API contém o código "898" para o tipo de cartão
    When verifico o relatório detalhado de vendas
    Then a coluna "Tipo de cartão" deve exibir "Nacional"

Scenario: Verificar retorno "Internacional" para cartões com código diferente de "002" e "898"
    Given que o retorno da API contém um código diferente de "002" e "898" para o tipo de cartão
    When verifico o relatório detalhado de vendas
    Then a coluna "Tipo de cartão" deve exibir "Internacional"

Scenario Outline: Verificar a exibição correta do tipo de cartão no relatório detalhado de vendas
    Given que o retorno da API contém o código "<codTipoCartao>" para o tipo de cartão
    When verifico o relatório detalhado de vendas no formato "<formato>"
    Then a coluna "Tipo de cartão" deve exibir "<tipoCartao>"
    Examples:
      | codTipoCartao | formato | tipoCartao  |
      | 002           | CSV     | Nacional    |
      | 898           | Excel   | Nacional    |
      | 001           | CSV     | Internacional |
      | 999           | Excel   | Internacional |

Scenario: Verificar tipo de cartão no relatório de vendas da aba "Relatórios"
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório de vendas da aba "Relatórios" no formato CSV
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Nacional"

Scenario: Verificar tipo de cartão no relatório de vendas da aba "Relatórios" em Excel
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório de vendas da aba "Relatórios" no formato Excel
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Nacional"

Scenario: Verificar tipo de cartão no relatório detalhado de vendas no novo menu
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório detalhado de vendas no novo menu no formato CSV
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Internacional"

Scenario: Verificar tipo de cartão no relatório detalhado de vendas no novo menu em Excel
    Given que acesso a plataforma de relatórios de vendas
    When gero o relatório detalhado de vendas no novo menu no formato Excel
    Then o relatório deve conter a coluna "Tipo de cartão" como a última coluna
    And os valores na coluna devem ser "Internacional"