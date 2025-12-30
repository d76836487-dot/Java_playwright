#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/OfertaPixOnix
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: OfertaPixOnix
 
  @TestCaseKey=LPDC-T1340
  Scenario: Clientes Com interesse no Pix
    Given que o usuario esta logado no portal do cliente,
    When  lhe for apresentado um banner pop-up com o titulo  "Ative o Pix na Sua Maquininha"
    And usuario demonstrar interesse na contratacao do Pix,
    Then ao selecionar o botao "Ativar agora" dentro do pop-up, sera direcionado para a jornada de contratacao do Pix

  @TestCaseKey=LPDC-T1350
  Scenario: Fechando pop-up pelo Botao X - Oferta Pix Onix
    Given que o usuario esta logado no portal do cliente
    When  lhe for apresentado um banner pop-up com o titulo  "Ative o Pix na Sua Maquininha"
    And usuario selecionar X
    Then sera redirecionado para Home

  @TestCaseKey=LPDC-T1341
  Scenario: Fechando pop-up por 3x - Oferta Pix Onix
    Given que o usuario logou no Portal do Cliente por 3x
    And fechou o pop-up de "Ative o Pix na Sua Maquininha" nas 3x pelo botao X
    When  logar pela 4 vez
    Then nao aparecera mais o pop-up

  @TestCaseKey=LPDC-T1345
  Scenario: Contratando pelo Banner no Header
    Given que o usuario logou por 3x no Portal do Cliente
    And fechou o pop-up nas 3x pelo botao X
    Then usuario visualizara um Banner com a mensagem "Ative o Pix na Sua Maquininha" no Header
    And selecionando Botao "Ativar agora" dentro do Banner ele sera direcionado para a jornada de contratacao do Pix

  @TestCaseKey=LPDC-T1339
  Scenario: Clientes com interesse no Pix - Pos contratacao
    Given Usuario Contratou o Pix
    When  Fizer o Login Novamente
    Then nao aparecera o banner pop-up e o banner de topo de pagina

  @TestCaseKey=LPDC-T1338
  Scenario: Clientes selecionando Botao X no banner que nao devera aparecer novamente na proxima secao de login - Primeiro Banner
    Given usuario esta logado no Portal do Cliente
    When  clicar no Botao X do Banner que esta no Header
    Then banner nao devera aparecer novamente na proxima secao de login

  @TestCaseKey=LPDC-T1347
  Scenario: Clientes que nao demonstraram interesse mas sao elegiveis ao produto
    Given que o usuario esta logado no portal do cliente,
    When  lhe for apresentado um banner pop-up com o titulo  "Receba PIX na sua Maquininha",
    And usuario demonstrar interesse em Conhecer
    Then ao selecionar o botao "Conhecer mais" dentro do pop-up, sera direcionado para a jornada de contratacao.

  @TestCaseKey=LPDC-T1349
  Scenario: Clientes que nao demonstraram interesse mas sao elegiveis ao produto Fechando pop-up atraves do Botao X
    Given que o usuario esta logado no portal do cliente
    When  lhe for apresentado um banner pop-up com o titulo  "Receba PIX na sua Maquininha"
    And usuario selecionar X
    Then sera redirecionado para Home

  @TestCaseKey=LPDC-T1346
  Scenario: Clientes que nao demonstraram interesse mas sao elegiveis ao produto Fechando pop-up por 3x
    Given que o usuario logou no Portal do Cliente por 3x
    And fechou o pop-up de " Receba PIX na sua Maquininha " nas 3x pelo botao X
    When  logar pela 4 vez
    Then nao aparecera mais o pop-up

  @TestCaseKey=LPDC-T1344
  Scenario: Banner no Header do Portal para Clientes que nao demonstraram interesse mas sao elegiveis ao produto
    Given que o usuario logou por 3x no Portal do Cliente
    And fechou o pop-up nas 3x pelo botao X
    Then usuario visualizara um Banner com a mensagem "Receba PIX na sua Maquininha" no Header
    And selecionando  Botao "Receba PIX na sua Maquininha" dentro do Banner ele sera direcionado para a jornada de contratacao do Pix

  @TestCaseKey=LPDC-T1348
  Scenario: Clientes que Contrataram o Pix nao devem ver mais o Banner no Header
    Given usuario contratou o Pix
    When  ele Logar Novamente no Portal do Cliente
    Then nao devera aparecer o Banner no Header

  @TestCaseKey=LPDC-T1343
  Scenario: Clientes Selecionando Botao X no banner que nao devera aparecer novamente na proxima secao de login - Segundo Banner
    Given usuario esta logado no Portal do Cliente
    When  clicar no Botao X do Banner que esta no Header
    Then o banner nao devera aparecer novamente na proxima secao de login

  @TestCaseKey=LPDC-T1342
  Scenario: Clientes que nao demonstraram interesse mas sao elegiveis ao produto Pos contratacao
    Given Usuario Contratou o Pix
    When  Fizer o Login Novamente
    Then nao aparecera o banner pop-up e o banner de topo de pagina

  @TestCaseKey=LPDC-T1337
  Scenario: Clientes que nao sao elegiveis ao Produto
    Given Usuario nao e elegivel a contratacao do Pix
    When  Logar no Portal do Cliente
    Then nao aparecera o banner pop-up e nem o banner de topo de pagina

