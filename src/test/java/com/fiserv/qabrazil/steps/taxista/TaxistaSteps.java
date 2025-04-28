package com.fiserv.qabrazil.steps.taxista;

import com.fiserv.qabrazil.pages.taxista.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class TaxistaSteps {
    @Autowired
    private HomeTaxistaPage homeTaxistaPage;

    @Autowired
    private ParaComecarSeuCadastroPage paraComecarSeuCadastroPage;

    @Autowired
    private ProdutosAzulzinhaPage produtosAzulzinhaPage;

    @Autowired
    private EnderecoPage enderecoPage;

    @Autowired
    private ContaRecebimentoPage contaRecebimentoPage;

    @Autowired
    private ReviseSeuPedidoPage reviseSeuPedidoPage;

    @Autowired
    private PedidoConfirmadoPage pedidoConfirmadoPage;

    @Given("que o usuário inicialize o cadastro de credenciamento de taxista")
    public void que_o_usuario_inicialize_o_cadastro_de_credenciamento_de_taxista() {
        homeTaxistaPage.acessarCadastroCredenciamentoTaxista();
    }

    @When("acessar a tela Para começar seu cadastro e preencher os dados {string}, {string}, {string}, {string}, {string}, {string}, {string} e {string}")
    public void acessar_a_tela_Para_comecar_seu_cadastro_e_preencher_os_dados_NomeCompleto_DataNascimento_Celular_Email_CPF_NomeFantasia_FaturamentoAnual_e_TicketMedio(
     String nomeCompleto
    ,String dataNascimento
    ,String celular
    ,String email
    ,String cpf
    ,String nomeFantasia
    ,String faturamentoAnual
    ,String ticketMedio) {
        paraComecarSeuCadastroPage.preencherCamposParaComecarSeuCadastro(
         nomeCompleto
        ,dataNascimento
        ,celular
        ,email
        ,cpf
        ,nomeFantasia
        ,faturamentoAnual
        ,ticketMedio);
    }

    @And("acessar a tela Produtos azulzinha e selecionar as opções {string}")
    public void acessar_a_tela_Produtos_azulzinha_e_selecionar_a_s_opcao_oes(String produtosAzulzinha){
        produtosAzulzinhaPage.selecionarCamposProdutosAzulzinha(produtosAzulzinha);
    }

    @And("acesar a tela Endereço e preencher os dados {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} e {string}")
    public void acesar_a_tela_Endereco_e_preencher_os_dados(
     String cep
    ,String logradouro
    ,String semNumero
    ,String numero
    ,String complemento
    ,String bairro
    ,String cidade
    ,String estado
    ,String pontoReferencia
    ,String alterarNegocio
    ,String alterarDadosPessoais) {
        enderecoPage.preencherCamposEndereco(
         cep
        ,logradouro
        ,semNumero
        ,numero
        ,complemento
        ,bairro
        ,cidade
        ,estado
        ,pontoReferencia
        ,alterarNegocio
        ,alterarDadosPessoais);
    }

    @And("acesar a tela Conta de recebimento e preencher os dados {string}, {string}, {string}, {string}, {string}, {string} e {string}")
    public void acesar_a_tela_Conta_de_recebimento_e_preencher_os_dados(
     String tipoConta
    ,String agencia
    ,String operacao
    ,String conta
    ,String alterarNegocio
    ,String alterarDadosPessoais
    ,String expandirEndereco) {
        contaRecebimentoPage.preencherCamposContaRecebimento(
         tipoConta
        ,agencia
        ,operacao
        ,conta
        ,alterarNegocio
        ,alterarDadosPessoais
        ,expandirEndereco);
    }

    @And("acessar a tela Revise seu pedido e conferir os dados {string}, {string}, {string} e {string}")
    public void acessar_a_tela_Revise_seu_pedido_e_conferir_os_dados(
     String alterarSobreVoce
    ,String alterarSobreSeuNegocio
    ,String alterarEndereco
    ,String alterarContaRecebimento) {
        reviseSeuPedidoPage.conferirReviseSeuPedido(
         alterarSobreVoce
        ,alterarSobreSeuNegocio
        ,alterarEndereco
        ,alterarContaRecebimento);
    }

    @Then("é validado que o pedido foi realizado com sucesso")
    public void e_validado_que_o_pedido_foi_realizado_com_sucesso() {
        pedidoConfirmadoPage.verificarPedidoConfirmado();
    }
}