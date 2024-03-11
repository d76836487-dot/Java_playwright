#language:en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Domicilio_Bancario_CX/Primeiro_Acesso
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep

Feature:Primeiro Acesso

  Scenario: enário: Primeiro Acesso / Domicílio Bancário CX Econômica

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And na próxima tela usuário informar os dados: Banco (104-Caixa econômica federal, Agência (sem Limitação de caracteres), Operação (Onde encontro esses dados?), Conta
  Then Clicar em Continuar
  And Usuário inserir Novo Email e Celular, clicar em Cadastrar
  And Clica em Confirmar os dados
  Then insere novo Tel e Email para receber o Token e fazer o primeiro acesso


  Scenario: Cenário: Primeiro Acesso / Erro Domicílio Bancário CX Econômica

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And Clicar no Botão (Onde encontro esses dados?)
  Then Usuário visualizara um modal com:  Agência, Operação, Conta, Digito


  Scenario: enário: Primeiro Acesso / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Agência bancária

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco, Agência Bancária com Letras ou caracteres especiais
  Then Usuário não conseguira digitar


  Scenario: Cenário: Primeiro Acesso / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Operação

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco, Agência, Operação com Letras ou caracteres especiais
  Then Usuário não conseguira digitar


  Scenario: Cenário: Primeiro Acesso / Erro Domicílio Bancário CX Econômica Com Letras e caracteres especiais em Conta

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And na próxima tela usuário informar os dados com domicílio bancário Cx econômica Federal: Banco,Agencia, Operação, Conta com Letras ou caracteres especiais
  Then Usuário não conseguira digitar


  Scenario: Cenário: Primeiro Acesso / Erro Domicílio Bancário CX Econômica pela 2 vez

  Given Usuário não está cadastrado no Portal Cliente
  When usuário inserir CPF/CNPJ ou Usuário
  And clicar em Continuar
  Then Usuário visualizara tela com email e Tel e Botão “Não reconheço os dados acima”
  And Usuário clicar em “Não reconheço os dados acima”
  And na próxima tela usuário informar os dados que não seja com domicilio bancário Cx econômica Federal: Banco, Agência (sem Limitação de caracteres), Operação (Onde encontro esses dados?), Conta
  And Clicar em Continuar
  Then Usuário visualizara a Mensagem: Ops ... Os dados informados não coincidem

  #Verificamos uma inconsistência nos dados informados, mas não se preocupe, você pode retornar para o início do processo e tentar novamente

  #Capitais e Regiões Metropolitanas
  #Atendimento todos os dias das 8h as 22h. Suporte técnico 24h.
  #Telefone xxxxxxxxxxxx
  #Outras Localidades
  #Atendimento todos os dias das 8h as 22h. Suporte técnico 24h.
  #Telefone) xxxxxxxxxx




