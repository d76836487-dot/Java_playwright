package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class ContractIdentity {
    @Autowired
    LoginPage loginPage;

    @Autowired
    ContractConfig contractConfig;

    @Given("Usuário acessou o portal")
    public void navigatePortal() {
        loginPage.navigateTo();
    }

    @Then("Nome da página é Portal <contrato> - Login")
    public void thenCheckPageName() {
        String expected = String.format("portal %s - login", contractConfig.identity);
        assertEquals(expected, loginPage.getTitle().toLowerCase());
    }

    @Then("Imagem da página é referente ao contrato")
    public void thenCheckImage() {
        assertTrue(String.format("Imagem da página deve conter: %s", contractConfig.identity),
                loginPage.pageHasImageWith(contractConfig.identity));
    }
}
