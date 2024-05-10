#language: en
@playwright
@UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Recebimentos/Agenda_de_recebimentos_por_UR/Consultar_Campos_em_Resumo
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Consultar Campos em Resumo

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão

  @TestCaseKey=SMP-T322
  Scenario: Consultar Campos Valor Total, Valor Total líquido de URs, Valor pago, na Seção Resumo
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário passa o mouse sobre "Agenda de Recebimentos por UR - Resumo - Tooltip do Valor Total"
    Then Usuário verá em "Agenda de Recebimentos por UR - Resumo - Texto do tooltip do Valor Total" o texto
      | Esse campo é a soma dos campos “valor total líquido de UR´s” e “valor pago” |
    And Usuário visualizará o campo "Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Tooltip do Valor Total" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor Total líquido de URs" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Valor pago" na seção "Agenda de Recebimentos por UR - Resumo"

  @TestCaseKey=SMP-T324
  Scenario: Consultar Campos Total de Entradas e saídas , na Seção Resumo
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    Then Usuário visualizará o campo "Total de entradas e saídas" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total bruto" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total taxa MDR" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total antecipação Eventual" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total antecipação automática" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total de deduções" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total ajustes crédito" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "Total contratos" na seção "Agenda de Recebimentos por UR - Resumo"
    And Usuário visualizará o campo "O que são esses totais?" na seção "Agenda de Recebimentos por UR - Resumo"

  @TestCaseKey=SMP-T325
  Scenario: Botão “O que são esses totais?”
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When usuário clica em "O que são esses totais?" na seção "Agenda de Recebimentos por UR - Resumo"
    Then Deve abrir um modal com Todos os termos usados e um Scroll para rolagem, Botões X e Entendi!
      | Entenda os termos usados                                                                                                                                                                                |
      | Valor total líquido/atualizado de URs                                                                                                                                                                   |
      | Valor total previsto a ser pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado. Não inclui valores já pagos no período.                  |
      | Valor pago                                                                                                                                                                                              |
      | Valor total já pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado.                                                                      |
      | Total bruto                                                                                                                                                                                             |
      | Valor total das vendas realizadas no periodo selecionado.                                                                                                                                               |
      | Total taxa MDR                                                                                                                                                                                          |
      | Valor total referente à taxa MDR sobre as vendas realizadas no período selecionado.                                                                                                                     |
      | Total antecipação eventual                                                                                                                                                                              |
      | Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio da antecipação eventual                                                                            |
      | Total antecipação automática                                                                                                                                                                            |
      | Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio de antecipação automática contratada.                                                              |
      | Total deduções                                                                                                                                                                                          |
      | Valor total das deduções no período selecionado, como por exemplo: aluguel, cancelamento de venda, chargeback e entre outros débitos. Não considera desconto de taxa MDR.                               |
      | Total ajuste a crédito                                                                                                                                                                                  |
      | Valor total dos ajustes a crédito no período selecionado, como por exemplo: comissão por venda de recarga, entre outros.                                                                                |
      | Total contratos                                                                                                                                                                                         |
      | Valor total a pagar ou já pago ao estabelecimento ou financiador referente a operações como gravame, cessão e outros ônus, realizadas pelo estabelecimento junto ao financiador no período selecionado. |

  @TestCaseKey=SMP-T329
  Scenario: Consultar Componente Totais líquidos por bandeira

  OBS: Apresentar a relação das bandeiras de forma fixa no front e popular CASO retorne valor da API. Se não retornar valor, apresentar com R$ 0,00

    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When Usuário visualizará o campo "card Totais líquidos por bandeira" na seção "Agenda de Recebimentos por UR"
    Then abaixo do gráfico deve ser apresentado uma bolinha na cor da sua respectiva bandeira nas colorações:
      | bandeira   | colorações  | rgb               |
      | Mastercard | laranja     | rgb(255, 95, 0)   |
      | ELO        | amarelo     | rgb(255, 198, 34) |
      | Visa       | roxo        | rgb(26, 31, 113)  |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  |
      | Amex       | azul claro  | rgb(46, 177, 229) |
      | Cabal      | azul escuro | rgb(13, 92, 147)  |

  Scenario: Consultar Componente “gráfico”
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    And houver dados no Campo Totais líquidos por bandeira
    When Usuário passa mouse por cima do Componente “gráfico” em Totais líquidos por bandeira
    Then deve ser apresentado um tooltip informando qual a bandeira e o valor que se refere aquela cor. A ordem de apresentação e coloração deve ser:
      | bandeira   | coloração   | rgb               |
      | Mastercard | laranja     | rgb(255, 95, 0)   |
      | ELO        | amarelo     | rgb(255, 198, 34) |
      | Visa       | roxo        | rgb(26, 31, 113)  |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  |
      | Amex       | azul claro  | rgb(46, 177, 229) |
      | Cabal      | azul escuro | rgb(13, 92, 147)  |

  @TestCaseKey=SMP-T334
  Scenario: Consultar Componente “gráfico” sem valores
    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When não houver dados no Campo Totais líquidos por bandeira
    Then deve ser apresentado a frase "Sem informações para detalhamento"
    And todas as bandeiras deve vir com valores zerados

  Scenario Outline: Consultar Detalhe totais por bandeira e produto

  Obs.: Apresentar bandeira com total ainda que o total seja zero.

    Given Usuário acessou a página de Agenda de Recebimentos por UR
    When usuário clica no "Botão Detalhe totais por bandeira" em "Agenda de Recebimentos por UR"
    Then abrira um modal com: Totais líquidos por bandeira e produtos, Bolinha na cor do Cartão, Logo do Cartão e Nome do Cartão, Total em Crédito, Total em Débito, e o Botões, X acima e fechar na "<cor da Instituição>" abaixo
      | bandeira   | colorações  | rgb               | logo                     |
      | Mastercard | laranja     | rgb(255, 95, 0)   | BandeiraMastercard       |
      | ELO        | amarelo     | rgb(255, 198, 34) | BandeiraElo              |
      | Visa       | roxo        | rgb(26, 31, 113)  | visalogo_logotyp_us1_old |
      | Hipercard  | Vermelho    | rgb(184, 33, 38)  | BandeiraHipercard        |
      | Amex       | azul claro  | rgb(46, 177, 229) | BandeiraAmex             |
      | Cabal      | azul escuro | rgb(13, 92, 147)  | BandeiraCabal            |

    @afinz
    Examples:
      | cor da Instituição |
      | rgb(0, 198, 204) |

    @azulzinha
    Examples:
      | cor da Instituição |
      | rgb(247, 148, 30) |

    @bin003 @bin007
    Examples:
      | cor da Instituição |
      | rgb(255, 102, 0) |

    @sicredi
    Examples:
      | cor da Instituição |
      | rgb(63, 161, 16) |

    Scenario: Consultar Botão Período
    Obs: Esse menu terá dados de histórico (passado) mas também de futuro.
      Given Usuário acessou a página de Agenda de Recebimentos por UR
      When Usuário seleciona Botão Período
      Then Abrirá componente de calendário que deve vir por default "Este Mês"
      And 'Date ranger - Início Data Selecionada' representará 'data início do mês'
      And 'Date ranger - Fim Data Selecionada' representará 'data final do mês'
      And Usuário pode selecionar a data conforme desejado
      And Usuário pode preencher a data conforme desejado

#
#QScenario: Consultar Período (Hoje)
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Período > Hoje
#    And Clica no Botão Aplicar
#    Then trará os dados referentes aquele período
#
#
#
#QScenario: Consultar Período (Essa semana)
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Período > Essa semana
#    And Clica no Botão Aplicar
#    Then trará os dados referentes a Essa semana
#
#  Obs: O fitro rápido “Essa semana” contempla os 7 dias da semana, independente do dia que for, ou seja, apresentará dados de Domingo  a sábado
#
#
#
#QScenario: Consultar Período (anterior a abril /2024) ***
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Período
#    And seleciona um Período anterior a abril/2024
#    And Clica no Botão Aplicar
#    Then Mostrara O card com os dias bloqueados e a seguinte mensagem: Para períodos anteriores a abril/2024 consulte Recebimentos > Resumo de recebimentos
#
#
#QScenario: Consultar Botão Filtros
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When seleciona Botão Filtros
#    Then usuário visualizara Título Filtros, mensagem: Os itens selecionados serão aplicados na pesquisa Botão X, Botões: Bandeiras (0) que deve vir por default 0, Botões Limpar Filtros, Mostrar resultados (na cor da instituição)
#
#  Obs.: Filtro fixo, ou seja, apresentar todas as bandeiras abaixo e seus respectivos produtos
#  Master débito
#  Master crédito
#  Visa débito
#  Visa crédito
#  Elo débito
#  Elo crédito
#  Cabal débito
#  Cabal crédito
#  Hipercard crédito
#  Amex crédito
#
#
#QScenario: Consultar Aplicando filtros
#
#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário seleciona Botão Filtros
#    And clica na seta
#    And Usuário seleciona alguma Bandeira
#  (Obs: que ao selecionar a bandeira o botão ficará em um tom mais forte” na cor da instituição)
#    And clica no Botão Mostrar resultados
#    Then deve ser populado o número dentre os parênteses (x) conforme a quantidade de Bandeiras selecionadas trazendo os resultados conforme as Bandeiras selecionadas
#  Obs.: Testar com diferentes bandeiras e também com bandeiras múltiplas, tipo master débito e visa crédito, etc...
#
#
#QScenario: Consultar Coloração do Componente Filtros
#
#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário já aplicou um filtro
#    Then Selecionando um cartão em (Filtro) na página Meus recebimentos, deve ficar com uma coloração na cor da Instituição.
#
#
#
#QScenario: Consultar  Botão Exportar
#
#    Given Usuário está logado em Agenda de recebimentos por UR
#    When Usuário seleciona Botão Exportar
#    Then abrira modal com a mensagem: Escolha como deseja exportar o relatório Opções de Exportar (Excel,CSV,PDF) , os botões: X, Cancelar e Gerar arquivo
#
#
#QScenario: Consultar Botão X no Modal Exportar
#
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Exportar
#    Then abrira o modal
#    And Usuário seleciona o Botão X
#    Then usuário retornara para a página que estava anteriormente
#
#
#
#QScenario: Consultar  Botão Cancelar no Modal Exportar
#    Given Usuário está logado Agenda de recebimentos por UR
#    When Usuário seleciona Botão Exportar
#    Then abrira o modal
#    And Usuário seleciona o Botão Cancelar
#    Then usuário retornara para a página que estava anteriormente
#
#Feature: Exportando arquivos Excel/CSV/PDF
#
#
#QScenario: Consultar  Arquivo Excel
#
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Usuário clica no Botão Exportar
#  And Usuário seleciona Tipo de arquivo Excel
#  And seleciona Botão Gerar arquivo
#  Then arquivo será exportado com sucesso
#
#
#QScenario: Consultar  Arquivo CSV
#
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Usuário clica no Botão Exportar
#  And Usuário seleciona Tipo de arquivo CSV
#  And seleciona Botão Gerar arquivo
#  Then arquivo será exportado com sucesso
#
#
#QScenario: Consultar  Arquivo PDF
#
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Usuário clica no Botão Exportar
#  And Usuário seleciona Tipo de arquivo PDF
#  And seleciona Botão Gerar arquivo
#  Then arquivo será exportado com sucesso
#
#  Feature: Consultar  Arquivos Excel/CSV/PDF
#
#
#QScenario: Consultar  Excel Simplificado
#
#  Given Usuário Exportou arquivo Excel Simplificado
#  When usuário abrir o arquivo
#  Then arquivo estará com Aba única com totalizadores + listagem de arranjos de acordo com o período. A linha 13 deve vir com filtro aplicado para facilitar para o cliente. Nome do arquivo: Relatório_simplificado_Agenda de recebimentos por UR_ [data e hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento
#
#
#
#QScenario: Consultar  CSV
#  Given Usuário Exportou arquivo CSV
#  When usuário abrir o arquivo
#  When arquivo estará com Aba única com totalizadores + listagem de arranjos de acordo com o período. A linha 13 deve vir com filtro aplicado para facilitar para o cliente. Nome do arquivo: Relatório_simplificado_Agenda de recebimentos por UR_[data e hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento
#
#
#QScenario: Consultar  PDF
#  Given Usuário Exportou arquivo PDF Simplificado
#  When Usuário abrir o arquivo
#  Then Nome do PDF: Relatório_Agenda de recebimentos por UR_ [data e
#  hora de exportação]
#
#  Obs.: Validar com o modelo Excel repassado no material de refinamento, nesse caso não vão seguir o LAYOUT à risca, mas as informações devem estar IGUAIS as que eu defini no requisito.
#
#  Feature: Seção Meus recebimentos
#
#
#QScenario: Consultar Meus recebimentos
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário visualizar a seção meus recebimentos
#  Then visualizará os Botões Filtros e Exportar (na cor da Instituição)
#  And uma listagem com os totais por dia contendo as informações: Data,Valor Total, Valor atualizado das URs + quantidade de URs, Valor pago, Saldo disponível negociável
#
#  Obs.: O Botão filtro só fica na cor se aplicado filtro de alguma bandeira
#
#
#
#QScenario: Consultar detalhe da UR por dia / Meus recebimentos
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário seleciona uma Lote na seção meus recebimentos
#  And clica no Accordion
#  Then Usuário visualizara no detalhe os lançamentos da UR
#  •    Total bruto
#  •    Total taxa MDR (com sinal negativo a frente do valor)
#  •    Total antecipação eventual
#  •    Total antecipação automática
#  •    Total deduções (com sinal negativo a frente do valor)
#  •    Total ajustes crédito
#  •    Total contratos
#  OBS: Apresentar todas as 7 linhas ainda que o retorno seja zerado
#  And visualizará a imagem da bandeira, o nome da bandeira, o Produto (Crédito ou débito) e o Valor do pagamento
#
#  Feature: Agenda de recebimentos por UR / Detalhe da UR
#
#
#QScenario: Direcionamento / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  Then usuário será direcionado a tela “Agenda de recebimentos por UR > Detalhe da UR”
#
#
#
#QScenario: Consultar Layout da seção Resumo / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  Then visualizará, “Resumo dd/mm/aaaa”, um botão Exportar, um card com a imagem da bandeira, nome da bandeira e produto, Valor total, Total atualizado da UR, Valor pago, Total de deduções , botão Mostrar todos os detalhes
#
#
#QScenario: Consultar Abas na Tela / Detalhe da UR
#  Given Usuário está logado Agenda de recebimentos por UR
#  When Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  And estiver na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  Then usuário visualizara as abas (Vendas vinculadas, Pagamentos, Créditos e deduções, Contratos)
#
#  Feature: Botão Exportar/ Detalhe da UR
#
#  34.Cenário: Botão Exportar
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário Clica Botão Exportar (que deve estar na cor da Instituição)
#  Then o arquivo deve ser baixado na extensão Excel
#
#  Feature: Exportando Excel / Detalhe da UR
#
#
#QScenario: Exportando Arquivo Excel
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário Clica Botão Exportar
#  Then arquivo será exportado com sucesso
#
#  Obs: Independente da extensão que o cliente solicitar, o arquivo deve contemplar TODAS as 4 abas. Validar modelo exportado com meu modelo anexo no documento de requisito.
#
#
#  Feature: Consultar Arquivos Excel / Detalhe da UR
#
#  Feature: Vendas Vinculadas / Detalhe da UR
#
#
#QScenario: Consultar Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  AND Clicar sobre um lote (bandeira e produto) da listagem apresentada
#  When seleciona aba Vendas vinculadas
#  Then Usuário visualizara: Busca por Código de autorização, colunas: Data da venda, Cód de autorização, Produto, Parcela, Valor Bruto, Valor bruto da parcela, Valor Líquido, Valor da Taxa, abaixo da tela: Exibindo 10 com opção de 30 itens ou 50 itens, X resultado(s) e paginação < 1,2,3, etc...>
#
#
#
#QScenario: Botão Busca por cód de autorização / Vendas vinculadas
#  Given Usuário está na tela Detalhe da UR > Aba Vendas vinculadas
#  When inserir no campo Busca Por Cod de autorização um código valido
#  And clicar na Lupa para Buscar
#  Then será apresentada a venda correspondente aquele código de autorização
#
#
#
#QScenario: Botão Busca por cód de autorização invalido / Vendas vinculadas
#  Given Usuário está na tela Detalhe da UR” > aba Vendas vinculadas
#  When insere no campo Busca Por Cod de autorização um código invalido
#  And clica na Lupa para Buscar
#  Then apresentara na tela “Nenhum resultado encontrado”
#
#
#  40.Sccenário: Consultar Informações tooltip (Parcela) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Parcela
#  Then usuário verá a mensagem: Referência da parcela paga x total de parcelas da venda
#
#
#
#
#QScenario: Consultar Informações tooltip (Valor bruto da parcela) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Valor bruto da parcela
#  Then usuário verá a mensagem: Valor bruto da parcela paga
#
#
#
#QScenario: Consultar Informações tooltip (Valor líquido) na listagem das transações na aba Vendas vinculadas
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#  When Usuário passar o mouse no tooltip Valor líquido
#  Then usuário verá a mensagem: Valor líquido da parcela paga
#
#
#QScenario: Botão X Modal Detalhe de Venda vinculada
#  Given Usuário está no modal Detalhe da venda vinculada
#  When Usuário clica no Botão X
#  Then Usuário deverá retornar a página “Agenda de recebimentos por UR / Detalhe da UR” > aba vendas vinculadas
#
#  Feature: Pagamento
#
#
#QScenario: Consultar Sem Pagamento / Pagamentos da UR
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar Pagamentos
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#  Feature: Créditos e deduções
#
#QScenario: Consultar Sem Informações Detalhe de Créditos e deduções da UR
#  Given Usuário está na tela “Agenda de recebimentos por UR > Detalhe da UR”
#  When Usuário clicar na aba Créditos e deduções
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#
#QScenario: Consultar Créditos e deduções / Tooltip (Order ID)
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Créditos e deduções
#  And Usuário passa Mouse sobre o Tooltip em (Order ID)
#  Then Usuário visualizara a seguinte mensagem: Número da transação online.
#
#  Feature: Contratos
#
#
#
#QScenario: Consultar Contratos na UR Sem Informações
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And não existir Informações
#  Then Usuário visualizara a Mensagem: Nenhum resultado encontrado
#  Tente filtrar por outros períodos ou parâmetros.
#
#
#QScenario: Consultar Contratos / Tooltip (Tipo de contrato)
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Tipo de Contrato)
#  Então Usuário visualizara a seguinte mensagem: tipo de negociação realizada entre o estabelecimento e o financiador (gravame, cessão ou outros ônus)
#
#
#QScenario: Consultar Tooltip (Prioridade de contrato) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Prioridade de contrato)
#  Then Usuário visualizara a seguinte mensagem: se o estabelecimento negociou seus recebíveis com mais de um financiador, a prioridade indica a ordem em que cada negociação foi concluída (caso tenha negociado apenas um contrato a prioridade será 1)
#
#
#
#QScenario: Consultar Tooltip (Regra de divisão) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Regra de divisão)
#  Then Usuário visualizara a seguinte mensagem: indica-se se o contrato realizado com o financiador é em percentual ou valor fixo.
#
#  69.Scenário Consultar Tooltip (Valor comprometido) / Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Valor comprometido)
#  Then Usuário visualizara a seguinte mensagem: indica o valor correspondente à regra de divisão
#
#  70.Cenário: Consultar Tooltip (Valor atingido) Contratos
#  Given Usuário está na tela “Agenda de recebimentos por UR / Detalhe da UR”
#  When Usuário clicar na aba Contratos
#  And seleciona algum Tipo (Ônus Gravame Cessão / Programado, Pago)
#  And Usuário passa Mouse sobre o Tooltip em (Valor atingido)
#  Then Usuário visualizara a seguinte mensagem: indica o valor obtido pelo financiador de acordo com o valor da UR.
#
#
#QScenario: Consulta de Tooltip em Valor total
#
#  Given Usuário está logado em Agenda de recebimentos por UR
#  When Usuário Está em Resumo, Valor total.
#  Then Usuário deve visualizar o ícone do Tooltip em Valor Total
#  And o texto: Esse campo é a soma dos campos “Valor total líquido de URs” e “Valor pago
#
#
