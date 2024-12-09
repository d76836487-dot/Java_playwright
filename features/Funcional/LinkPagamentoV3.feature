#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Link_Pagamento_V3
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Link Pagamento V3


  Scenario: Acessando Link de pagamento pelo Menu Lateral
    Given Usuario esteja logado no Portal
    When clicar em seviços ,Link de Pagamento pelo menu lateral esquerdo
    Then Tera acesso a tela de Link de pagamento


  Scenario: Botão Trocar Estabelecimento
    Given usuario esta na tela de Link de pagamento
    When selecionar o Botão trocar estabelecimento
    Then Visualizara apenas os ‘’ECs’’ que estiverem Link de pagamento habilitado


  Scenario: Cliente sem EC de Link de Pagamento
    Given usuario tenha um documento que não possue link de pagamento
    When Acessar a tela Link de pagamento
    Then Visualizara a seguinte mensagem:
       #“Comece a vender! com o link de pagamento você consegue vender de qualquer lugar sem depender da maquininha! Entre em contato com a nossa equipe para saber
       # mais e contratar o serviço.Capitais e Regiões Metropolitanas segunda a domingo das 08h00 as 22h00 (exceto feriados) Telefone
       # 3003-7828 Demais Localidades segunda a domingo das 08h00 as 22h00 (execeto feriados) Telefone 0800 728 7828


  Scenario: Solicitando link pagamento unico 24X Parcelado Lojista
    Given usuário esta na Tela Link de Pagamento
    When clica no Botão Solicitar link de pagamento único
    And  Preencher: Descrição, valor, número de parcelas = 24X
    And Tipo de Parcelamento = Parcelado Lojista
    And Clicando no Botão Continuar
    Then Abrira um Modal de Resumo onde vera os dados para Revisão
    And os Botões: Gerar Link de pagamento , Editar , X


  Scenario: Link pagamento unico 24X Parcelado Lojista Gerado
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    Then efetuando o paganento o mesmo deve constar na aba Consultar Links como Pago


  Scenario: Link pagamento unico 24X Parcelado Lojista sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetua o Pagamento
    Then depois de 48H link aparecera na aba consultar links com o Status expirado


  Scenario: Solicitando link pagamento unico 24X Parcelado emissor
    Given usuário esta na Tela Link de Pagamento
    When clica no Botão Solicitar link de pagamento único
    And  Preencher: Descrição, valor, número de parcelas = 24X
    And Tipo de Parcelamento = Parcelado emissor
    And Clicando no Botão Continuar
    Then Abrira um Modal de Resumo onde vera os dados para Revisão
    And os Botões: Gerar Link de pagamento , Editar , X


  Scenario: Link pagamento unico 24X Parcelado Emissor Gerado

    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    Then efetuando o paganento o mesmo deve constar na aba Consultar Links como Pago


  Scenario: Link pagamento unico 24X Parcelado Emissor sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetua o Pagamento
    Then depois de 48H link aparecera na aba consultar links com o Status expirado


  Scenario: Solicitando link pagamento unico 18X Parcelado Lojista
    Given usuário esta na Tela Link de Pagamento
    When clica no Botão Solicitar link de pagamento único
    And  Preencher: Descrição, valor, número de parcelas = 24X
    And Tipo de Parcelamento = Parcelado Lojista
    And Clicando no Botão Continuar
    Then Abrira um Modal de Resumo onde vera os dados para Revisão
    And os Botões: Gerar Link de pagamento , Editar , X


  Scenario: Link pagamento unico 18X Parcelado Lojista Gerado
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    Then efetuando o paganento o mesmo deve constar na aba Consultar Links como Pago


  Scenario: Link pagamento unico 18X Parcelado Lojista sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetua o Pagamento
    Then depois de 48H link aparecera na aba consultar links com o Status expirado


  Scenario: Solicitando link pagamento unico 18X Parcelado emissor
    Given usuário esta na Tela Link de Pagamento
    When clica no Botão Solicitar link de pagamento único
    And  Preencher: Descrição, valor, número de parcelas = 24X
    And Tipo de Parcelamento = Parcelado emissor
    And Clicando no Botão Continuar
    Then Abrira um Modal de Resumo onde vera os dados para Revisão
    And os Botões: Gerar Link de pagamento , Editar , X


  Scenario: Link pagamento unico 18X Parcelado Emissor Gerado
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado aparecera uma frase acima: Texto copiado para área de transferência X
    Then efetuando o paganento o mesmo deve constar na aba Consultar Links como Pago


  Scenario: Link pagamento unico 18X Parcelado Emissor sem pagar
    Given usuário Clicou no Botão Gerar Link de pagamento
    When aparecera um Modal com o Link gerado e os Botões: Ver links ativos, Fechar, X
    And copiando o Link gerado , mas não efetua o Pagamento
    Then depois de 48H link aparecera na aba consultar links com o Status expirado






