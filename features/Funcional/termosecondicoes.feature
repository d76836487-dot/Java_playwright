#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Termos_de_uso
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Manual;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo



Feature: Termos de uso

 Scenario: 1.Primeiro acesso sem aceitar os Termos
    Given Usuário inseriu senha que está de acordo com os pré-requisitos
    When confirmar a senha
    And clicar no Botão Confirmar
    Then apresentará a seguinte mensagem na parte superior da tela: Aceite os Termos de uso para prosseguir

  Scenario: 2.Primeiro acesso aceitando os Termos
    Given Usuário inseriu senha que está de acordo com os pré-requisitos
    When confirmar a senha
    And selecionar o Checkbox de Termos e Condições
    And clicar no Botão Confirmar
    Then usuário deve seguir a jornada


  Scenario: 3.PDF Termos e Condições
    Given Usuário está no Modal de Criar senha
    When selecionar o link Termos e Condições
    Then abrira um PDF com os termos

  Scenario: 4.Aceite dos Termos e Condições Pelo APP
    Given Usuário já tenha aceitado os termos no APP
    When Acessar ao Portal do Cliente com o mesmo Documento
    Then não deverá ser abordado novamente para aceitar os termos


  Scenario: 5.Aceite dos Termos e Condições Pelo Portal do Cliente
  Given Usuário já tenha aceitado os termos no Portal do Cliente
  When Acessar ao APP Com o Mesmo Documento
  Then não deverá ser abordado novamente para aceitar os termos

  Scenario: 6.Usuário que Excluiu a Conta
  Given Usuário tenha excluído o acesso digital, através da jornada de exclusão
  When for fazer o Primeiro acesso pelo Portal do Cliente
  Then deverá ser abordado para aceitar os termos


#  Feature: Link Ajuda pelo Rodapé


  Scenario:7.Link Ajuda pelo Rodapé
  Given Usuário está logado no Portal do Cliente
  When Usuário selecionar no Rodapé da Home o Link Ajuda
  Then abrirá o Menu Ajuda

#  Feature: Acesso aos Termos e Condições


  Scenario: 8.Menu Termos e Condições
  Given Usuário está logado no Portal do Cliente
  When Usuário selecionar no Rodapé da Home o link Termos e Condições
  Then abrirá o menu Termos e condições




  Scenario: 9.Usuário não possui conta Pix acessando Termos e Condições
  Given Usuário está logado no Portal do Cliente
  When Usuário selecionar no Rodapé da Home o link Termos e Condições
  Then abrira o menu com somente um link


  Scenario: 10.Usuário c/conta Pix acessando Termos e Condições
  Given Usuário está logado no Portal do Cliente
  When Usuário selecionar no Rodapé da Home ao link Termos e Condições
  Then abrira o menu com dois links
  And verifique 1- Termos de uso de canais digitais
  And verifique 2- Contrato conta Pix

  Scenario: 11.Usuário c/conta Pix Acessando Termos de uso de canais digitais
  Given Usuário c/Conta Pix seleciona no Rodapé da Home o link Termos e Condições
  When abrir o menu de Termos e condições
  And usuário selecionar ler termo completo de uso de canais digitais
  Then abrira um Modal contendo os termos




  Scenario: 12.Botão Fechar Modal
  Given Usuário c/Conta Pix está no Modal Termo de uso de canais digitais
   When ele selecionar o Botão Fechar
  Then deve retornar para a tela de Termos e Condições


  Scenario: 13.Botão X no Modal
  Given Usuário c/Conta Pix está no Modal Termo de uso de canais digitais
  When ele selecionar o Botão X
  Then deve retornar para a tela de Termos e Condições

  Scenario: 14.Botão Baixar Documento
  Given Usuário c/Conta Pix está no Modal Termos de uso de canais digitais
  When ele selecionar Botão Baixar Documento
  Then deve baixar PDF Com os termos



  Scenario: 15.Usuário c/conta Pix Acessando termo de Contrato conta Pix
  Given Usuário seleciona no Rodapé da Home o link Termos e Condições
  When abrir o menu de Termos e condições
  And usuário selecionar ler termo completo de contrato conta Pix
  Then abrirá um Modal contendo os termos

  Scenario: 16.Botão Fechar Modal
  Given Usuário c/conta Pix está no Modal contrato conta Pix
  When ele selecionar o Botão Fechar
  Then deve retornar para a tela de Termos e Condições

  Scenario: 17.Botão X no Modal
  Given Usuário c/conta Pix está no Modal contrato conta Pix
  When ele selecionar o Botão X
  Then deve retornar para a tela de Termos e Condições

  Scenario:18.Botão baixar Documento
  Given Usuário c/conta Pix está no Modal contrato conta Pix
  When ele selecionar Botão Baixar Documento
  Then deve baixar PDF Com os termos

  Scenario: 19.Usuário s/conta Pix Acessando termos de uso de canais digitais
  Given Usuário seleciona no Rodapé da Home o link Termos e Condições
  When abrir o menu de Termos e condições
  And usuário selecionar ler termo completo de uso de canais digitais
  Then abrira um Modal contendo os termos


  Scenario:20.Botão Fechar Modal
  Given Usuário s/conta Pix está no Modal Termo de uso de canais digitais
  When ele selecionar o Botão Fechar
  Then deve retornar para a tela de Termos e Condições

  Scenario:21.Botão X no Modal
  Given Usuário s/conta Pix está no Modal Termo de uso de canais digitais
  When ele selecionar o Botão X
  Then deve retornar para a tela de Termos e Condições

  Scenario: 22.Botão Baixar Documento
  Given Usuário s/conta Pix está no Modal Termo de uso de canais digitais
  When ele selecionar Botão Baixar Documento
  Then deve baixar PDF Com os termos

