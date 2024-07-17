#language:en
@ignore
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Pending/Login/Login_Esqueci_Minha_Senha
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo

Feature: Login Esqueci Minha Senha


  Scenario: Esqueci Minha Senha / Domicílio Bancário CX Econômica
    Given Usuário já está cadastrado no Portal Cliente
    When usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And usuário clicar no botão “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco, Agência (sem Limitação de caracteres), Operação (Onde encontro esses dados?), Conta
    Then Clicar em Continuar
    And Usuário insere novo Email e Celular, clica em Cadastrar
    And Clica em Confirmar os dados
    Then Usuário seleciona novo Tel e Email para receber o Token e Redefinir Senha


  Scenario: Esqueci Minha Senha / Erro Domicílio Bancário CX Econômica
    Given Usuário não está cadastrado no Portal Cliente
    When usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And Usuário clicar em “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados que não seja com domicílio bancário Cx econômica Federal: Banco, Agência (sem Limitação de caracteres), Operação (Onde encontro esses dados?), Conta
    And Clicar em Continuar
    Then Usuário visualizara a Mensagem: Ops ... Os dados informados não coincidem
    #Verificamos uma inconsistência nos dados informados, mas não se preocupe, você pode retornar para o início do processo e tentar novamente
    And Botão Tentar novamente na cor da Instituição


  Scenario: Esqueci Minha Senha / Erro Domicílio Bancário CX Econômica pela 2 vez
    Given Usuário não está cadastrado no Portal Cliente
    When usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And Usuário clicar em “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados que não seja com domicílio bancário Cx econômica Federal: Banco, Agência (sem Limitação de caracteres), Operação (Onde encontro esses dados?), Conta
    And Clicar em Continuar
    Then Usuário visualizara a Mensagem: Ops ... Os dados informados não coincidem

  #Verificamos uma inconsistência nos dados informados, mas não se preocupe, você pode retornar para o início do processo e tentar novamente
  #Capitais e Regiões Metropolitanas
  #Atendimento todos os dias das 8h as 22h. Suporte técnico 24h.
  #Telefone xxxxxxxx
  #Outras Localidades
  #Atendimento todos os dias das 8h as 22h. Suporte técnico 24h.
  #Telefone xxxxxxxx

  Scenario: Esqueci Minha Senha / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Agência bancária
    Given Usuário não está cadastrado no Portal Cliente
    When usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And Usuário clicar em “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco, Agência Bancária com Letras ou caracteres especiais
    Then Usuário não conseguira digitar


  Scenario: Esqueci Minha Senha / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Operação
    Given Usuário não está cadastrado no Portal Cliente
    Then usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And Usuário clicar em “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco,Agencia, Operação com Letras ou caracteres especiais
    Then Usuário não conseguira digitar


  Scenario: Esqueci Minha Senha / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Conta
    Given Usuário não está cadastrado no Portal Cliente
    Then usuário inserir CPF/CNPJ ou Usuário
    And clicar em Continuar
    Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
    And Usuário clicar em “Não reconheço os dados acima”
    And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco,Agencia,Operação ,Conta com Letras ou caracteres especiais
    Then Usuário não conseguira digitar

