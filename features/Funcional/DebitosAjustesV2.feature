#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Debitos_Ajustes_V2
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending

Feature: Debitos Ajustes

  Scenario: Acessando as abas Pagos,Futuros,Debitos e Alugueis

  Given usuário esteja logado no Portal do Cliente
  When usuário selecionar Recebimentos no menu lateral esquerdo
  Then usuário visualizara as abas Pagos, Futuros, Débitos e Aluguéis



  Scenario: Débitos e Aluguéis através do Acesso rápido

  Given usuário esteja logado no Portal do Cliente
  When usuário selecionar Recebimentos na home logada "Acesso rápido"
  Then usuário visualizara as abas Pagos, Futuros, Débitos e Aluguéis



  Scenario: Débitos e Aluguéis

  Given usuário esteja logado no Portal do Cliente
  When usuário selecionar Recebimentos no menu lateral esquerdo
  And selecionar a aba Débitos e Aluguéis
  Then usuário visualizara Histórico de Aluguel com mês passado como default



  Scenario: Visualizando mensagem

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara a seguinte mensagem, Filtre por tipo de ajuste e consulte as informações de acordo com o período selecionado. Os ajustes são realizados diretamente na sua agenda de recebimentos.



  Scenario: Tipo de Ajuste

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara, Tipo de Ajuste > Aluguel (única opção neste momento)



  Scenario: Filtro Período

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara, Período



  Scenario: Filtro Período default último mês

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara, Período último mês como default
  And ao clicar no componente do calendário poderá selecionar o mês de consulta que deseja consultar (novo formato de calendário)



  Scenario: Botão Exportar

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara, O Botão Exportar na cor da Instituição.



  Scenario: Arquivo exportado

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  And usuário clica no botão Exportar
  Then terá um arquivo na extensão Excel com logo da alianla, "Mês de referencia" e "Emitido em" no topo" e as colunas Data do ajuste, Valor do aluguel, Comprovante, Tecnologia, Estabelecimento, Data efetiva da cobrança e Status



  Scenario: Colunas

  Given usuário esteja Logado no Portal
  When estiver em Débitos e Aluguéis
  Then usuário visualizara, os seguintes dados:Data do ajuste, Valor do aluguel, Comprovante, Tecnologia, Estabelecimento, Data efetiva da cobrança e Status



  Scenario: Status Pendente

  Given usuário esteja em Débitos e Aluguéis
  When selecionar um mês que tenha aluguel pendente
  And clicar no Botão Aplicar
  Then usuário visualizara, o histórico de aluguel contendo uma faixa vermelha com a seguinte mensagem:Existem pagamentos de aluguel pendentes para esse período
  And a coluna status deve estar com status Pendente na cor amarela



  Scenario: Status Debitado

  Given usuário esteja em Débitos e Aluguéis
  When selecionar um mês que não tenha aluguel pendente
  And clicar no Botão Aplicar
  Then usuário visualizara, o histórico de aluguel contendo uma faixa Verde com a seguinte mensagem:Todas as tarifas de aluguel foram pagas para esse período
  And a coluna status deve estar com status Debitado na cor verde



  Scenario: Período futuro

  Given usuário esteja em Débitos e Aluguéis
  When tentar selecionar um mês futuro ao mês atual
  Then usuário não deve conseguir selecionar pois o calendário não permitirá

