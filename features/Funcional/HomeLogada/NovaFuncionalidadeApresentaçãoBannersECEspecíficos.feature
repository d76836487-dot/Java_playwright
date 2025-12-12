#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/HomeLogada/NovaFuncionalidadeApresentaçãoBannersECEspecíficos
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: NovaFuncionalidadeApresentaçãoBannersECEspecíficos


Scenario: Verificar a criação de banners para uma base específica via Portal do Cliente
    Given acesso o Portal do Cliente
    When crio um novo banner para uma base específica
    Then deve ser apresentado o banner na tela

Scenario: Verificar se o formato do arquivo CSV para base está correto
    Given acesso o Portal do Cliente
    When crio um novo banner com a base em formato CSV
    And informo a base com o formato correto
    | EC            | Nome da empresa |
    | 123456        | Empresa XYZ     |
    Then o banner deve ser criado corretamente

Scenario: Verificar a parametrização de data início e fim
    Given acesso o Portal do Cliente
    When crio um novo banner e informo data início "01/01/2024" e data fim "31/01/2024"
    Then o banner deve ser exibido dentro do período parametrizado

Scenario: Subir banner sem prazo de término
    Given acesso o Portal do Cliente
    When crio um novo banner sem data de término
    Then o banner deve ser exibido por tempo indeterminado

Scenario: Desativar banner sem excluir do histórico
    Given acesso o Portal do Cliente
    When desativo um banner existente
    Then o banner deve ser removido da exibição sem ser excluído do histórico

Scenario: Verificar sobreposição de banner para uma base específica
    Given acesso o Portal do Cliente
    When crio um banner geral para todos os usuários
    And depois crio um banner para uma base específica
    Then o banner da base específica deve sobrepor o banner geral para esses ECs

Scenario: Verificar a exibição do último banner parametrizado para um EC
    Given acesso o Portal do Cliente
    When crio dois banners para o mesmo EC
    And a última parametrização deve ser aplicada
    Then o último banner criado deve ser exibido para o EC

Scenario: Parametrizar hyperlink em banner de uma base específica
    Given acesso o Portal do Cliente
    When crio um banner e insiro um hyperlink
    Then o banner com hyperlink deve ser exibido e acessível

Scenario: Verificar a abertura do hyperlink em nova aba
    Given acesso o Portal do Cliente
    When crio um banner com hyperlink que abre em outra aba
    Then ao clicar no hyperlink, a nova aba deve ser aberta

Scenario Outline: Criar banner com diferentes variáveis de tempo e verificar a exibição
    Given acesso o Portal do Cliente
    When crio um banner com data início "<data_inicio>" e data fim "<data_fim>"
    Then o banner deve ser exibido conforme as datas informadas
    Examples:
      | data_inicio | data_fim   |
      | 01/01/2023  | 31/01/2023 |
      | 01/02/2023  | 28/02/2023 |
