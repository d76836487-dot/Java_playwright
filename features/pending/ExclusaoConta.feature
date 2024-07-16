#language: en
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Pending/Exclusao_de_Conta/Exclusao_de_Conta
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Exclusao de Conta



  @TestCaseKey=SMP-T391
  Scenario: Informativo Excluir acesso digital
    Given que o usuário esteja em Meu Perfil
    When selecionar “Excluir acesso digital”
    Then Visualizará as seguintes mensagens
      | Usuário       |
      | Master        |
      | Usuário Com F |
      | Usuário sem F |

  @TestCaseKey=SMP-T399
  Scenario: Informativo Excluir acesso digital SECUNDARIO
    Given que o usuário esteja em Meu Perfil
    When selecionar “Excluir acesso digital”
    Then Visualizará as seguintes mensagens
      | Usuário             |
      | Secundário operação |
      | Secundário consulta |

  @TestCaseKey=SMP-T390
  Scenario: Fechar o acesso digital no ‘’X’’
    Given que o usuário esteja no Excluir acesso digital
    When selecionar o ‘’X’’
    Then deverá ser redirecionado para Meu Perfil
      | Usuário       |
      | Master        |
      | Usuário Com F |
      | Usuário sem F |

  @TestCaseKey=SMP-T397
  Scenario: Fechar o acesso digital no ‘’Cancelar’’
    Given que o usuário esteja no Excluir acesso digital
    When selecionar o ‘’Cancelar’’
    Then deverá ser redirecionado para Meu Perfil
      | Usuário       |
      | Master        |
      | Usuário Com F |
      | Usuário sem F |

  @TestCaseKey=SMP-T384
  Scenario: Pop-up Informativo da exclusão
    Given que o usuário Master selecionou “Excluir acesso digital” em Configurações de conta
    When selecionar ‘’Excluir meu acesso digital”
    Then visualizara a mensagem: “Tem certeza que deseja prosseguir com a exclusão do acesso?” e um informativo abaixo com os botões “Excluir” e “Cancelar”

  @TestCaseKey=SMP-T389
  Scenario: Fechar confirmação de exclusão no “X”
    Given que o usuário Master esteja na tela de “Tem certeza que deseja prosseguir com a exclusão do acesso”
    When selecionar ‘X”
    Then deve ser redirecionado para a página do Meu Perfil

  @TestCaseKey=SMP-T396
  Scenario: Fechar confirmação de exclusão no “Cancelar”
    Given que o usuário Master esteja na tela de “Tem certeza que deseja prosseguir com a exclusão do acesso”
    When selecionar “Cancelar”
    Then deve ser redirecionado para a página do Meu Perfil

  @TestCaseKey=SMP-T387
  Scenario: Exclusão do Acesso
    Given que o usuário Master esteja em Excluir acesso Digital
    When selecionar Excluir acesso digital
    And selecionar Excluir
    Then Visualizara mensagem: “Seu acesso foi excluído” “Sentimos muito de ver você indo embora. Mas saiba que você pode reativar seu acesso a qualquer momento, basta acessar o primeiro acesso assim que desejar” e um botão “Sair”

  @TestCaseKey=SMP-T392
  Scenario: Exclusão do acesso SECUNDARIO
    Given que o usuário esteja em Excluir acesso Digital
    When selecionar Excluir acesso digital
    And selecionar Excluir
    Then Visualizara mensagem: “Seu acesso foi excluído” “Sentimos muito de ver você indo embora. Mas saiba que você pode reativar seu acesso e qualquer momento, entre em contato com o administrador da conta para que ele realize a criação de um novo usuário via Portal do cliente” e um botão “Sair”
      | Usuário             |
      | Secundário operação |
      | Secundário consulta |

  @TestCaseKey=SMP-T383
  Scenario: Primeiro Acesso com Usuário Excluído
    Given que o usuário esteja excluído
    When fizer Primeiro Acesso com usuário
    Then Mostrara Dashbord na home
      | Usuário |
      | Master  |

  @TestCaseKey=SMP-T385
  Scenario: Login com Usuário Master Excluído
    Given que o usuário Master foi excluído
    When inserir login e senha
    Then Visualizara “Boas-Vindas! Verificamos que esse é seu primeiro acesso ao portal. Para criar sua senha acesse o Primeiro acesso”

  @TestCaseKey=SMP-T401
  Scenario: Login com Usuário Secundario Excluído
    Given que o usuário secundário foi excluído
    When inserir login e senha
    Then Visualizara “Parece que você ainda não é nosso cliente... Não encontramos o cadastro da sua empresa”
      | Usuário             |
      | Secundário operação |
      | Secundário consulta |

  @TestCaseKey=SMP-T381
  Scenario: Login com Usuário com Hierarquia Excluído
    Given que o usuário Pai foi excluído
    When inserir login e senha de um ‘’ EC Filho ‘’
    Then O filho devera conseguir fazer o login normalmente

  @TestCaseKey=SMP-T394
  Scenario: Esqueci minha senha com Usuário Excluído Master
    Given que o usuário Master esteja em Esqueci minha senha
    When inserir o documento excluído
    And clicar em Continuar
    Then Visualizara “Boas-Vindas! Verificamos que esse é seu primeiro acesso ao portal. Para criar sua senha acesse o Primeiro acesso”

  @TestCaseKey=SMP-T380
  Scenario: Esqueci minha senha com Usuário Excluído Secundario
    Given que o usuário secundário esteja em Esqueci minha senha
    When inserir o documento excluído
    And clicar em Continuar
    Then Visualizara “Parece que você ainda não é nosso cliente... Não encontramos o cadastro da sua empresa”

  @TestCaseKey=SMP-T395
  Scenario: Login com Usuário Excluído no APP
    Given que o usuário Master foi excluído no APP
    When inserir login e senha no PORTAL
    Then Visualizara “Boas-Vindas! Verificamos que esse é seu primeiro acesso ao portal. Para criar sua senha acesse o Primeiro acesso”

  @TestCaseKey=SMP-T398
  Scenario: Login com Usuário Excluído no Portal
    Given que o usuário Master foi excluído no Portal
    When inserir login e senha no APP
    Then Visualizara “Boas-Vindas! Verificamos que esse é seu primeiro acesso ao portal. Para criar sua senha acesse o Primeiro acesso”

  @TestCaseKey=SMP-T393
  Scenario: Secundário sem acesso devido a exclusão do Master
    Given que o usuário Master Foi excluído
    When o secundário inserir login e senha
    Then Visualizara “Parece que você ainda não é nosso cliente... Não encontramos o cadastro da sua empresa”

  @TestCaseKey=SMP-T382
  Scenario: Secundário sem acesso em esqueci a senha devido a exclusão do Master
    Given que o usuário Master Foi excluído
    When o secundário clicar em Esqueci minha senha
    And inserir o usuário secundário
    And Clicar Botão Continuar
    Then Visualizara “Parece que você ainda não é nosso cliente... Não encontramos o cadastro da sua empresa”

  @TestCaseKey=SMP-T400
  Scenario: Documento excluído deve ser consultado no Usuário com e sem F
    Given que usuário esteja logado
    When Buscar com Documento que já foi excluído
    Then Deve Retornar a tela de dashboard com o Documento pesquisado
      | Usuário       |
      | Usuário Com F |
      | Usuário sem F |

