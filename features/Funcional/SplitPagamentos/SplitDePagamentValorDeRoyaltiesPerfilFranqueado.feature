#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SplitPagamentos/SplitDePagamentValorDeRoyaltiesPerfilFranqueado
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SplitDePagamentValorDeRoyaltiesPerfilFranqueado

  @TestCaseKey=LPDC-T1697
  Scenario: Verificar totalizador de royalties no histórico de vendas para Franqueado
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    Then deve existir um totalizador "Valor total de royalties" entre "Valor total das Vendas" e "Valor bruto"

  @TestCaseKey=LPDC-T1693
  Scenario: Verificar totalizador de royalties por dia no histórico de vendas para Franqueado
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    Then cada dia deve apresentar um totalizador "Valor total de royalties" entre "Valor total de vendas" e "Valor bruto"

  @TestCaseKey=LPDC-T1694
  Scenario Outline: Verificar totalizador de royalties com diferentes valores
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    Then o totalizador "Valor total de royalties" deve mostrar o valor <valorRoyalties>
    Examples:
      | valorRoyalties |
      | R$100,00       |
      | R$200,00       |
      | R$300,00       |

  @TestCaseKey=LPDC-T1695
  Scenario: Verificar cálculo correto do totalizador de royalties
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    And realizo vendas com royalties
    Then o totalizador "Valor total de royalties" deve refletir corretamente os valores das vendas

  @TestCaseKey=LPDC-T1698
  Scenario: Verificar totalizador de royalties em diferentes períodos
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    And seleciono um período específico
    Then o totalizador "Valor total de royalties" deve refletir os valores do período selecionado

  @TestCaseKey=LPDC-T1699
  Scenario: Verificar totalizador de royalties com múltiplos franqueados
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    And outros franqueados também realizam vendas
    Then o totalizador "Valor total de royalties" deve refletir apenas as minhas vendas

  @TestCaseKey=LPDC-T1696
  Scenario: Verificar totalizador de royalties com vendas canceladas
    Given que eu esteja logado como Franqueado
    When acesso a aba "Histórico de vendas"
    And realizo uma venda e depois a cancelo
    Then o totalizador "Valor total de royalties" deve ser ajustado corretamente

