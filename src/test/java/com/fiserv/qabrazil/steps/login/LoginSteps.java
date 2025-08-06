package com.fiserv.qabrazil.steps.login;

import com.fiserv.qabrazil.pages.home.*;
import com.fiserv.qabrazil.pages.login.*;
import com.fiserv.qabrazil.pages.login.esqueciMinhaSenha.EsqueciMinhaSenhaEtapa1Page;
import com.fiserv.qabrazil.pages.login.esqueciMinhaSenha.EsqueciMinhaSenhaEtapa3Page;
import com.fiserv.qabrazil.pages.login.primeiroAcesso.PrimeiroAcessoEtapa1Page;
import com.fiserv.qabrazil.pages.login.primeiroAcesso.PrimeiroAcessoEtapa3Page;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginSteps {
    @Autowired
    LoginPage loginPage;

    @Autowired
    HomePage homePage;

    @Autowired
    EsqueciMinhaSenhaEtapa1Page esqueciMinhaSenhaEtapa1Page;

    @Autowired
    EsqueciMinhaSenhaEtapa3Page esqueciMinhaSenhaEtapa3Page;

    @Autowired
    PrimeiroAcessoEtapa1Page primeiroAcessoEtapa1Page;

    @Autowired
    PrimeiroAcessoEtapa3Page primeiroAcessoEtapa3Page;

    @Autowired
    EnvioCodigoPage envioCodigoPage;

    @Autowired
    SenhaCadastradaComSucessoPage senhaCadastradaComSucessoPage;

    @Given("realizar login no portal {string}")
    public void realizar_login_no_portal(String alianca) {
        loginPage.acessarLoginPortal(alianca);
        homePage.verificarHome();
    }

    @Given("que foi acessado o portal {string}")
    public void que_foi_acessado_o_portal(String alianca) {
        loginPage.acessarPortal(alianca);
    }

    @And("realiza a etapa 1 do {string} - {string}")
    public void realiza_a_etapa_1_do(String fluxo, String usuario) {
        if (fluxo.equalsIgnoreCase("Esqueci minha senha"))
            esqueciMinhaSenhaEtapa1Page.realizarEsqueciMinhaSenhaEtapa1(usuario);
        else if (fluxo.equalsIgnoreCase("Primeiro acesso"))
            primeiroAcessoEtapa1Page.realizarPrimeiroAcessoEtapa1(usuario);
    }

    @And("realiza a etapa 2 do {string} - {string}")
    @When("enviar o codigo do {string} via {string}")
    public void enviarToken(String fluxo, String receberPor) {
        envioCodigoPage.realizarEnvioCodigo(fluxo, receberPor);
    }

    @And("realiza a etapa 3 do {string} - {string}")
    public void realiza_a_etapa_3_do(String fluxo, String senha) {
        if (fluxo.equalsIgnoreCase("Esqueci minha senha"))
            esqueciMinhaSenhaEtapa3Page.realizarEsqueciMinhaSenhaEtapa3(senha);
        else if (fluxo.equalsIgnoreCase("Primeiro acesso"))
            primeiroAcessoEtapa3Page.realizarPrimeiroAcessoEtapa3(senha);
    }

    @And("valida que a senha foi cadastrada com sucesso")
    public void valida_que_a_senha_foi_cadastrada_com_sucesso() {
        senhaCadastradaComSucessoPage.verificarSenhaCastradaComSucesso();
    }

    @Given("realizar login no portal com MFA ativo {string}")
    public void realizar_login_no_portal_com_MFA_ativo(String alianca) {
        loginPage.acessarLoginPortal(alianca);
    }

    @Then("valida que a home do portal foi carregada com sucesso")
    public void valida_que_a_home_do_portal_foi_carregada_com_sucesso() {
        homePage.verificarHome();
    }
}