#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/LiquidacaoD31
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: LiquidacaoD31


  # Para Credencimento feito Antes das Tratativas feitas no BW e FO
  Scenario: Historico de Vendas Detalhe de Venda Antes das Tratativas
    Given foi feito uma transação de Credito a Vista
    When usuario Acessar historico de vendas
    And selecionar o detalhe de uma venda de Credito a Vista sendo ela, Master , Visa , Elo , Amex
    Then Campo Data Prevista de Pagamento deve estar com a data de 31D


  Scenario: Extracao de Comprovante em Historico de Vendas Antes das Tratativas
    Given usuario solicitou Comprovante de uma venda em Historico de Vendas
    When tiver exportado
    Then Comprovante deve estar com o Campo Data Prevista de Pagamento com a data 31D


  Scenario: Menu Negocio Antes das Tratativas
    Given usuario Acessou o Portal do Cliente Antes das Tratativas
    When Selecionar o Menu Negocio na Lateral esquerda
    Then em Taxas e Tarifas o Prazo de Credito a Vista deve estar com 31D


  # Para Credenciamento feito após as tratativas no BW e FO
 Scenario: Historico de Vendas Detalhe de Venda após as tratativas
    Given foi feito uma transação de Credito a Vista
    When usuario Acessar historico de vendas
    And selecionar o detalhe de uma venda de Credito a Vista sendo, Master , Visa , Elo , Amex
    Then Campo Data Prevista de Pagamento deve estar com a data de 31D


  Scenario: Extracao de Comprovante em Historico de Vendas após as tratativas
    Given usuario solicitou Comprovante em Historico de Vendas
    When tiver exportado
    Then Comprovante deve vir com Campo Data Prevista de Pagamento com a data 31D


  Scenario: Menu Negocio após as tratativas
    Given usuario Acessou o Portal do Cliente após as tratativas
    When Selecionar o Menu Negocio na Lateral esquerda
    Then em Taxas e Tarifas o Prazo de Credito a Vista deve estar com 31D


  Scenario: Detalhe de Venda em Recebimentos Futuros após as tratativas
    Given foi feito uma transação de Credito a Vista após as tratativas
    When usuario Acessar Recebimentos > Resumo de Recebimentos > Recebimentos Futuros
    And selecionar o detalhe de uma venda de Credito a Vista sendo, Master , Visa , Elo , Amex
    Then Campo Data Prevista de Pagamento deve estar com a data de 31D


  Scenario: Extracao de Comprovante em Recebimentos Futuros após as tratativas
    Given usuario solicitou a Exportacao Comprovante em Recebimentos Futuros após as tratativas
    When tiver exportado
    Then Comprovante deve vir com o Campo Data Prevista de Pagamento com a data 31D


