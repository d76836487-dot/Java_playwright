#language: en
@playwright @UsuárioMaster
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Home_logada/Seleção_de_EC_ou_DCTO_-_Usuário_Master
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Seleção de EC ou DCTO - Usuário Master

  Scenario: Redirecionamento Correto (Usuário Master) - o usuário verá modal Personalizar ao logar
    When Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' desmarcada
    Then Usuário verá modal para selecionar EC ou DTCO
