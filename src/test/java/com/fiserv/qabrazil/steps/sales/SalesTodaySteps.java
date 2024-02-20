package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.sales.SalesTodayPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertFalse;

public class SalesTodaySteps {
    @Autowired
    SalesTodayPage salesTodayPage;

    @Autowired
    CommonsPage commonsPage;

    @Given("Usuário acessou Vendas Hoje")
    @When("Usuário acessa Vendas Hoje")
    public void goTo() {
        salesTodayPage.navigateTo();
    }

    @Then("Página conterá rodapé {string} com o ano atual")
    public void pageWillContainFooterWithCurrentYear(String expected_footer) {
        String footerText = salesTodayPage.getTextFromElement("footer-text");
        String expected = String.format(expected_footer, LocalDate.now().getYear(), "|");
        assertEquals(expected.trim(), footerText.trim());
    }

    @Then("Página conterá mensagem com a {string} do resumo de vendas")
    public void pageWillContainMessageDescribingSalesSummary(String expectedMessage) {
        String message = commonsPage.getWholeTextIfVisible(expectedMessage.substring(0, 10));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

    @When("Usuário passa o mouse sobre vendas")
    public void userHoversMenu() {
        salesTodayPage.hoverMenuOnSalesMenu();
    }

    @Given("Existem vendas com status {string}")
    public void thereIsSalesWithStatus(String salesStatus) {
        thereAreSalesWith("status", salesStatus);
    }

    @Then("Serão filtradas as vendas com status {string}")
    public void thereIsNoSalesWithStatus(String salesStatus) {
        boolean foundSalesWithStatus = salesTodayPage.thereAreSalesWithStatus(salesStatus);
        assertFalse(foundSalesWithStatus);
    }

    @Given("Existem vendas com bandeira {string}")
    public void thereAreSalesWithBrandName(String brandName) {
        assumeThat(salesTodayPage.thereAreSalesWithBrandName(brandName)).isTrue();
    }

    @Then("Serão filtradas as vendas com bandeira {string}")
    public void thereAreNoSalesWithBrandName(String brandName) {
        boolean foundSalesWithBrandName = salesTodayPage.thereAreSalesWithBrandName(brandName);
        assertFalse(foundSalesWithBrandName);
    }

    @When("Existem vendas com {string} tipo {string}")
    public void thereAreSalesWith(String testIdColumn, String value) {
        assumeThat(salesTodayPage.thereAreSalesWith(value, testIdColumn)).isTrue();
    }

    @Then("Serão filtradas as vendas com produto {string}")
    public void thereIsNoSalesOfProduct(String productType) {
        boolean foundSalesWithProduct = salesTodayPage.thereAreSalesWithProduct(productType);
        assertFalse(foundSalesWithProduct);
    }
}
