#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/HistoricoDeVendasRelatorioSimplificadoInclusãoDaHoraDaVenda
@Zephyr:Status=Approved
@Zephyr:Component=BDD&Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: HistoricoDeVendasRelatorioSimplificadoInclusãoDaHoraDaVenda

  @TestCaseKey=LPDC-T2091
  Scenario Outline: Acessar e visualizar horário da venda no relatório simplificado com diferentes perfis
    Given que acesso o portal como usuário <perfil>
    When acesso o relatório simplificado do histórico de vendas
    Then a coluna data da venda apresenta também a informação do horário no formato HH:MM:SS
    Examples:
      | perfil                 |
      | master                 |
      | secundario de operacao |
      | de consulta            |
      | de link de pagamento   |
      | operador com F         |
      | operador sem F         |
      | franqueado             |
      | franqueador            |

