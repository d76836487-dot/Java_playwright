#language:en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/NPS/NPS_Usuario_Secundario
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Pending;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
#noinspection CucumberUndefinedStep
Feature: NPS Usuario Secundario

  @TestCaseKey=LPDC-T7
  Scenario: Fechando Pesquisa NPS Após Antecipação Automática - Usuario Secundario
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T34
  Scenario: Acessando Pesquisa NPS Após Antecipação Automática - Usuario Secundario
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T39
  Scenario: Fechando Pesquisa NPS Após Antecipação Eventual - Usuario Secundario
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T5
  Scenario: Acessando Pesquisa NPS Após Antecipação Eventual - Usuario Secundario
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T2
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje - Usuario Secundario
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T18
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje - Usuario Secundario
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T1
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas - Usuario Secundario
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T22
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas - Usuario Secundario
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T4
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda - Usuario Secundario
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T36
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda - Usuario Secundario
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T38
  Scenario: Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos - Usuario Secundario
    Given Usuário Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T17
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos - Usuario Secundario
    Given Usuário exportou com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T20
  Scenario: Fechando Pesquisa Após Exportar com sucesso um arquivo PDF no Detalhe do Pagamento - Usuario Secundario
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T37
  Scenario: Acessando Pesquisa NPS Após Exportar com sucesso um arquivo     PDF no Detalhe do Pagamento - Usuario Secundario
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T9
  Scenario: Fechando Pesquisa Após Solicitar um Relatório na Aba “Relatórios” - Usuario Secundario
    Given Usuário fechou uma Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T35
  Scenario: Acessando Pesquisa NPS Após Solicitar um Relatório na Aba “Relatórios” - Usuario Secundario
    Given Usuário Solicitou um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T3
  Scenario: Fechando Pesquisa NPS Através do Menu Ajuda - Usuario Secundario
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T26
  Scenario: Acessando Pesquisa NPS Através do Menu Ajuda - Usuario Secundario
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser abordado pela pesquisa

  @TestCaseKey=LPDC-T27
  Scenario: Acessando Pesquisa NPS Após o Cliente Clicar em “sair” do Portal - Usuario Secundario
    Given Usuário Clicado em “sair” do Portal
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

