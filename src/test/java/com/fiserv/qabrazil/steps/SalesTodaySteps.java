package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.SalesTodayPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

import static org.testng.AssertJUnit.*;

public class SalesTodaySteps {
    @Autowired
    SalesTodayPage salesTodayPage;

    @Autowired
    CommonsPage commonsPage;

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

    @And("Existem vendas com status {string}")
    public void thereIsSalesWithStatus(String salesStatus) {
        thereAreSalesWith("status", salesStatus);
    }

    @Then("Serão filtradas as vendas com status {string}")
    public void thereIsNoSalesWithStatus(String salesStatus) {
        boolean foundSalesWithStatus = salesTodayPage.thereAreSalesWithStatus(salesStatus);
        assertFalse(foundSalesWithStatus);
    }

    @And("Existem vendas com bandeira {string}")
    public void thereAreSalesWithBrandName(String brandName) {
        boolean foundSalesWithBrandName = salesTodayPage.thereAreSalesWithBrandName(brandName);

        String messageAssert = String.format("Não há vendas com bandeira %s", brandName);
        assertTrue(messageAssert, foundSalesWithBrandName);
    }

    @Then("Serão filtradas as vendas com bandeira {string}")
    public void thereAreNoSalesWithBrandName(String brandName) {
        boolean foundSalesWithBrandName = salesTodayPage.thereAreSalesWithBrandName(brandName);
        assertFalse(foundSalesWithBrandName);
    }

    @When("Existem vendas com {string} tipo {string}")
    public void thereAreSalesWith(String testIdColumn, String value) {
        boolean wereFoundSalesContainingValue = salesTodayPage.thereAreSalesWith(value, testIdColumn);

        String messageAssert = String.format("Não há vendas do tipo %s", value);
        assertTrue(messageAssert, wereFoundSalesContainingValue);
    }

    @Then("Serão filtradas as vendas com {string} tipo {string}")
    public void thereIsNoSalesWithStatus(String testIdColumn, String value) {
        boolean foundSalesWithStatus = salesTodayPage.thereAreSalesWith(value, testIdColumn);
        assertFalse(foundSalesWithStatus);
    }
}
