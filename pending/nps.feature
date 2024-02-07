# language: en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/NPS
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep
Feature: Acessar Pesquisa NPS

  Scenario:Fechando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  Scenario: Acessando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  Scenario: Fechando Pesquisa NPS Após Antecipação Eventual
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    Given Usuário Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após Exportar com sucesso um arquivo PDF no Detalhe do Pagamento
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    Given Usuário fechou uma Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Através do Menu Ajuda
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.


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


  Scenario:Acessando Pesquisa NPS Após o Cliente Clicar em “sair” do Portal
    Given Usuário Clicado em “sair” do Portal
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa





Feature: Acessar Pesquisa NPS Com Usuário Secundário

  Scenario:Fechando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

  Scenario: Acessando Pesquisa NPS Após Antecipação Automática
    Given Usuário tenha realizado uma Antecipação Automática
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa

  Scenario: Fechando Pesquisa NPS Após Antecipação Eventual
    Given Usuário tenha realizado uma Antecipação Eventual
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/no Menu Vendas Hoje
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Vendas Hoje
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    Given Usuário Após exportar com sucesso um arquivo CSV/Excel.xls/PDF no Menu Histórico de vendas
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Após exportar com sucesso um arquivo PDF no Detalhe da venda
    Given Usuário após exportar com sucesso um arquivo PDF no Detalhe da Venda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    Given Usuário Fechando Pesquisa Após exportar com sucesso um arquivo CSV/Excel.xls no Menu Recebimentos Pagos
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após Exportar com sucesso um arquivo PDF no Detalhe do Pagamento
    Given Usuário Exportou com sucesso um arquivo PDF no Detalhe do Pagamento
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    Given Usuário fechou uma Pesquisa Após Solicitar um Relatório na Aba “Relatórios”
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.

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

  Scenario: Fechando Pesquisa NPS Através do Menu Ajuda
    Given Usuário venha acessar o Menu Ajuda
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    Then Clicara em (Talvez depois ou X) para fechar o Modal e deve ir para a página que estava navegando anteriormente.


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


  Scenario:Acessando Pesquisa NPS Após o Cliente Clicar em “sair” do Portal
    Given Usuário Clicado em “sair” do Portal
    When ao término aparecera um Modal de pesquisa na Tela com as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar a empresa “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (0-Muito insatisfeito) e máxima (Muito sadisfeito-10)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Próximo (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Próximo” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Clicara Próximo para ir para o Outro Modal ,onde vera as seguintes informações: (Título) Avaliação de satisfação, (Mensagem) Em uma escala de 0 a 10, qual a probabilidade de você recomendar o este site “xxxxxx” a um (a) amigo (a) ou colega?, Botões clicáveis de zero a dez, Informação nos extremos quanto as notas mínimas (Muito insatisfeito) e máxima (Muito satisfeito)”, Dialog box OPCIONAL para inclusão de mensagens até 40 caractere e os botões X (acima) e “Talvez depois” (abaixo) e Botão Enviar (abaixo)
    And Usuário Clicara em um dos Botões Clicáveis de 0 a 10 para classificar a sua nota (Após deleção da nota, através do clique, o botão “Enviar” deve ficar habilitado)
    And digitará uma mensagem no Dialog box (OPCIONAL)
    And Usuário Clicará no Botão enviar e aparecera um modal com a seguinte mensagem “Avaliação concluída” A avaliação ajuda a melhorarmos sua experiência. Obrigado pela sua participação.
    Then clicara no Botão “x” OU “Fechar” visualizar a página que estava antes de ser     abordado pela pesquisa



Feature: Extração da base de respostas NPS

  Scenario: Acessar as pesquisas NPS
    Given usuario perfil admin
    When acessa a area cliente
    And clica na caixa de NPS
    Then  exibe quadro coluna nome ,tipo do arq, periodo

  Scenario: Busca por período de relatórios NPS gerados anteriormente
    Given usuário está na Tela NPS
    When Usuário clica no componente período
    And Usuário seleciona datas anteriores a dia corrente
    Then é exibida a lista com os relatórios identificados dentro do período selecionando

  Scenario: Fazer o download de um relatório
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar”
    Then usuário Exportara o Arquivo com Sucesso

  Scenario: Validar se o nome do arquivo Excel está vindo corretamente
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar
    Then é baixado um arquivo Excel

  Scenario: Validar que o arquivo Excel está vindo com as colunas corretamente
    Given Usuário está na tela NPS
    When Usuário deseja baixar um relatório NPS selecionando o Botão “Baixar”
    Then Usuário abre o Arquivo e verifica se seguintes Colunas Corretas (Aliança, Data da resposta, Documento, Referência da pergunta, Nota, Evento, Comentário, Perfil do cliente)

  Scenario: Validando Botão Gerar Relatório
    Given Usuário está na tela NPS
    When Usuário solicita um relatório NPS clicando no botão “Gerar relatório”
    Then visualizar os componentes Período (passível de preenchimentos), tipo de entrega (já preenchido com “Portal do cliente”), um botão X, um cancelar e outro gerar relatório desabilitado.

  Scenario: Validar se é bloqueado ao tentar escolher uma data futura
    Given Usuário está na tela NPS
    When Usuário Deseja baixar um relatório selecionando data Futura
    Then não deve permitir

  Scenario: Validar se o componente de paginação está vindo com 10 de default
    Given Usuário está na Página NPS
    When Usuário clica paginação
    Then deve aparecer 10 Itens Por Default

  Scenario: Validar botão Cancelar do modal de Gerar Relatório
    Given Usuário está na Tela de NPS
    When Usuário clica no Botão Gerar Relatório
    And Usuário clica no botão Cancelar
    Then Usuário deve ser direcionado para a tela inicial de NPS

  Scenario: Validar botão X do modal de Gerar Relatório
    Given Usuário está na Tela de NPS
    When Usuário clica no Botão Gerar Relatório
    And Usuário clica no botão X
    Then Usuário deve ser direcionado para a tela inicial de NPS


