#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Nps/NPSParaColetaEExtraçãoDeDados
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: NPSParaColetaEExtraçãoDeDados

  @TestCaseKey=LPDC-T2022
  Scenario Outline: Disparar perguntas NPS após execução de ações no Portal
    Given que o usuário é elegível para perguntas NPS
    When o usuário <acao>
    Then o sistema deve apresentar o modal de perguntas NPS
    Examples:
      | acao                                                              |
      | realiza a contratacao de uma antecipacao (eventual ou automatica) |
      | exporta um arquivo PDF no menu vendas > historico de vendas       |
      | exporta um arquivo PDF no menu Recebimentos > pagos               |
      | solicita um relatorio na aba Relatroios                           |
      | exporta um arquivo Excel no menu Vendas > hoje                    |
      | exporta um arquivo Excel no menu Vendas > historico de vendas     |
      | exporta um arquivo Excel no menu Recebimentos > Pagos             |
      | consulta na FAQ/Suporte - Atraves do Menu Ajuda                   |
      | abre ou solicita chamados - atraves do menu Solicitacoes          |
      | clica em sair do Portal                                           |

