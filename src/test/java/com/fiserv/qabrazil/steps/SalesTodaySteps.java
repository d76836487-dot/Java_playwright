package com.fiserv.qabrazil.steps;

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
        String message = salesTodayPage.getWholeTextIfVisible(expectedMessage.substring(0, 10));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

    @Then("Página conterá na seção Resumo de Vendas {string}, total de vendas {string}, e valor bruto {string}")
    public void pageWillContainAllElementsOfSalesSummary(String expectedDescription, String totalSales, String grossValue) {
        pageWillContainMessageDescribingSalesSummary(expectedDescription);

        boolean totalSalesWasFound = salesTodayPage.assertWholeTextIsVisible( totalSales, "vendas-hoje-card-total-vendas");
        assertTrue("Total de Vendas não encontrado na página", totalSalesWasFound);

        boolean grossValueWasFound = salesTodayPage.assertWholeTextIsVisible(grossValue, "vendas-hoje-card-vlr-bruto");
        assertTrue("Valor Bruto não encontrado na página", grossValueWasFound);
    }

    @When("Usuário passa o mouse sobre vendas")
    public void userHoversMenu() {
        salesTodayPage.hoverMenuOnSalesMenu();
    }

    @Then("O menu de vendas expande")
    public void lateralMenuExpands() {
        assertTrue("Menu lateral não está espandido", salesTodayPage.lateralMenuHasExpanded());
    }

    @And("Existem vendas com status {string}")
    public void thereIsSalesWithStatus(String salesStatus) {
        boolean foundSalesWithStatus = salesTodayPage.thereAreSalesWithStatus(salesStatus);

        String messageAssert = String.format("Não há vendas do tipo %s", salesStatus);
        assertTrue(messageAssert, foundSalesWithStatus);
    }

    @Then("Serão filtradas as vendas com {string}")
    public void thereIsNoSalesWithStatus(String salesStatus) {
        boolean foundSalesWithStatus = salesTodayPage.thereAreSalesWithStatus(salesStatus);
        assertFalse(foundSalesWithStatus);
    }
}
