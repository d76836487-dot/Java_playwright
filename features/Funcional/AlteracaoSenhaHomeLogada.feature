#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Alteração_de_senha_Home_logada
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Alteração de senha Home logada

  @TestCaseKey=LPDC-T880
  Scenario: Login no Portal após alterar senha
    Given que eu alterei a senha na jornada do Portal,
    When fizer logoff
    And realizar tentativa de login no Portal com a senha nova
    Then devo ter sucesso.

  @TestCaseKey=LPDC-T877
  Scenario: Login no app após alterar senha
    Given que eu alterei a senha na jornada do Portal,
    When fizer logoff
    And realizar tentativa de login no App com a senha nova
    Then devo ter sucesso.

  @TestCaseKey=LPDC-T881
  Scenario: Validando máscara da senha
    Given que eu estou no modal Alterar senha
    When começar a preencher a senha atual ou a senha nova
    Then o campo deve ser mascarado com bolinhas
    And caso eu clique no olho
    Then devo conseguir visualizar os caracteres sem máscara

  @TestCaseKey=LPDC-T883
  Scenario: Alterar senha para a mesma que já está
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    And preencha os campos Nova senha e Confirmar Senha com a senha atual
    When o usuário clicar em Alterar
    Then deve ser exibido a mensagem “Senha não deve ser igual as últimas senhas utilizadas.”

  @TestCaseKey=LPDC-T886
  Scenario: Alterar senha incluindo o caractere “^”
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    And preencha os campos Nova senha e Confirmar Senha com a senha “Teste@1^2’
    When o usuário clicar em Alterar
    Then deve ser exibido o modal “Senha alterada com sucesso”

  @TestCaseKey=LPDC-T869
  Scenario: Clicar no X para fechar modal Alterar Senha
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    When clicar no “X”
    Then deve ser exibido a tela “Meu Perfil”

  @TestCaseKey=LPDC-T870
  Scenario: Clicar em “Fechar” para fechar modal Alterar Senha
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    When clicar no  botão “Fechar”
    Then deve ser exibido a tela “Meu Perfil”

  @TestCaseKey=LPDC-T872
  Scenario: Clicar no X para fechar modal Senha alterada com sucesso
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    And preencha os campos Nova senha e Confirmar Senha com uma nova senha
    And clicar em Alterar
    When clicar no “X”
    Then deve ser exibido o menu “Meu Perfil”

  @TestCaseKey=LPDC-T871
  Scenario: Clicar em “Fechar” para fechar modal Senha alterada com sucesso
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    And preencha os campos Nova senha e Confirmar Senha com uma nova senha
    And clicar em Alterar
    When clicar no botão “Fechar”
    Then deve ser exibido o menu “Meu Perfil”

  @TestCaseKey=LPDC-T888
  Scenario: Colocar senha incorreta no campo “Senha atual”
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual com uma senha incorreta
    And preencha os campos Nova senha e Confirmar Senha com uma nova senha
    When o usuáro clicar em Alterar
    Then deve ser exibido o a mensagem “Senha incorreta” próximo ao campo “Senha Atual”

  @TestCaseKey=LPDC-T878
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de letra minúscula
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “TESTE123@”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T887
  Scenario: Botão “Alterar” habilitado após senha nova cumprir requisitos
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste@147”
    Then o botão “Alterar” deve ser habilitado

  @TestCaseKey=LPDC-T884
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de sequência
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste@112”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T882
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de espaço em branco
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste 112”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T885
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de letra maiúscula
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “teste@132”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T879
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de número de caracteres
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste@13”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T876
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de número de caracteres especial
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste3413”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T875
  Scenario: Botão “Alterar” desabilitado após senha nova não cumprir requisitos de números presente na senha
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    When o usuário preencher os campos Nova senha e Confirmar Senha com “Teste@portal”
    Then o botão “Alterar” deve permanecer desabilitado

  @TestCaseKey=LPDC-T874
  Scenario: Inserir duas senhas diferentes nos campos de senha nova para ser exibida mensagem de erro
    Given que o usuário esteja na tela Meu Perfil
    And clique em Alterar senha
    And preencha o campo Senha Atual
    And preencha o campo “Nova Senha” com a senha “Teste@1portal”
    When preencher o campo “Confirmar Senha” com a senha “Teste@234portal”
    Then deve ser exibida a mensagem “As senhas não coincidem”

  @TestCaseKey=LPDC-T873
  Scenario: Operador sem F acessando modal de alterar senha, todos os campos ficam desabilitados
    Given que o usuário esteja na tela Meu Perfil
    When clicar em Alterar senha
    Then todos os campos devem estar desabilitados

