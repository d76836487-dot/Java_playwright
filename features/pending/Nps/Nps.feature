#language:en
@playwright @api @ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/NPS/NPS_Pesquisa
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
#noinspection CucumberUndefinedStep
Feature: NPS Pesquisa

  @TestCaseKey=LPDC-T458
  Scenario: Fechando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T464
  Scenario: Acessando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T460
  Scenario: Fechando Pesquisa NPS Após Antecipação Eventual
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T486
  Scenario: Acessando Pesquisa NPS Após Antecipação Eventual
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T470
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T475
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T456
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T474
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T457
  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T467
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T482
  Scenario: Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    Given Usuário Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T478
  Scenario: Acessando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    Given Usuário exportou com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T459
  Scenario: Fechando Pesquisa Após Exportar com sucesso um arquivo PDF no Detalhe do Pagamento
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T471
  Scenario: Acessando Pesquisa NPS Após Exportar com sucesso um arquivo     PDF no Detalhe do Pagamento
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T465
  Scenario: Fechando Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    Given Usuário fechou uma Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T476
  Scenario: Acessando Pesquisa NPS Após Solicitar um Relatório na Aba “Relatórios”
    Given Usuário Solicitou um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  @TestCaseKey=LPDC-T484
  Scenario: Fechando Pesquisa NPS Através do Menu Ajuda
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  @TestCaseKey=LPDC-T483
  Scenario: Acessando Pesquisa NPS Através do Menu Ajuda
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser abordado pela pesquisa

  @TestCaseKey=LPDC-T462
  Scenario: Acessando Pesquisa NPS Após o Cliente Clicar em “sair” do Portal
    Given Usuário Clicado em “sair” do Portal
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

