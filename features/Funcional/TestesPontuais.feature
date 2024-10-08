#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Testes_Pontuais
@Zephyr:Status=Approved
@Zephyr:Priority=Low
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Confirmação;Automation=Pending
Feature: Testes Pontuais

  @TestCaseKey=LPDC-T865
  Scenario: Refresh token visão operador
    Given que o usuario logue na visão operador
    When buscar o cnpj e clicar em buscar
    And visualizar o dashboard
    Then a sessão permanece ativa por 20 min

  @TestCaseKey=LPDC-T864
  Scenario: Captcha no login
    Given Estou na home logada
    When clicar em esqueci minha senha
    Then usuario visualizara o captcha

  @TestCaseKey=LPDC-T867
  Scenario: Botões de Acesso Rápido dispostos 2 por linha em dispositivos móveis
    Given usuario esta na página inicial da aplicação
    And usando um dispositivo móvel
    When verificar a disposição dos botões de acesso rápido
    Then devera visualizar os botões de acesso rápido estão dispostos 2 por linha