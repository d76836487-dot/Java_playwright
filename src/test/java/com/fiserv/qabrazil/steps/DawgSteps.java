package com.fiserv.qabrazil.steps;

import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class DawgSteps {
    private final Page page;

    public DawgSteps(Page page) {
        this.page = page;
    }

    @Given("Acesso a url de login")
    public void acesso_a_url_de_login() {
        page.navigate("https://bin.qa.portaldocliente.fiserv.com/");
        throw new io.cucumber.java.PendingException();
    }

    @Given("incluir login e senha")
    public void incluir_login_e_senha() {
        page.locator("input[type=\"text\"]").click();
        page.locator("input[type=\"text\"]").fill("44209097810");
        page.locator("#b1-Input_Password").click();
        page.locator("#b1-Input_Password").fill("Teste1234@");
    }

    @Given("clicar no botão entrar")
    public void clicar_no_botao_entrar() {
        page.getByRole(AriaRole.BUTTON, new Page.GetByRoleOptions().setName("Entrar")).click();
    }
}
