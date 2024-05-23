package com.fiserv.qabrazil.steps.sales;


import com.fiserv.qabrazil.pages.sales.SalesPages;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class SalesSteps extends BaseSteps {
    @Autowired
    private SalesPages salesPage;


    @When("Usuário acessou página de Vendas")
    public void shouldBeAtSalesPage() {
        salesPage.navigateTo();
    }

    @When("ao clicar no menu lateral {string}")
    public void ao_clicar_no_menu_lateral(String arg0) {
        salesPage.ao_clicar_no_menu_lateral(arg0);
    }

    @Then("verifica se a pagina  {string} carregou com sucesso")
    public void verifica_se_a_pagina_carregou_com_sucesso(String string) {
        salesPage.verifica_se_a_pagina_carregou_com_sucesso(string);
    }

    @Then("ele deve ver as informações de vendas atuais, incluindo abas para {string}, {string}, {string}, {string} e {string}")
    public void ele_deve_ver_as_informações_de_vendas_atuais_incluindo_abas_para_e(String string, String string2, String string3, String string4, String string5) {
        // Write code here that turns the phrase above into concrete actions
         salesPage.ele_deve_ver_as_informações_de_vendas_atuais_incluindo_abas_para_e( string,  string2,  string3,  string4,  string5);
    }


    @Given("que o usuário está logado e está na seção de Vendas")
    public void que_o_usuário_está_logado_e_está_na_seção_de_vendas() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @When("solicitar um cancelamento de uma venda em {string} informando o motivo {string}")
    public void solicitar_um_cancelamento_de_uma_venda_em_informando_o_motivo(String string, String string2) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("A solicitação de cancelamento deve estar listada em {string} no menu {string}")
    public void a_solicitação_de_cancelamento_deve_estar_listada_em_no_menu(String string, String string2) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

}
