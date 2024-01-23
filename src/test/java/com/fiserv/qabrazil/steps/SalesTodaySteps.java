package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.SalesTodayPage;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class SalesTodaySteps {
    @Autowired
    SalesTodayPage salesTodayPage;

    @When("Usuário acessa Vendas Hoje")
    public void goTo() {
        salesTodayPage.navigateTo();
    }

    @Then("Página conterá rodapé com o ano atual")
    public void pageWillContainFooterWithCurrentYear() {
        String footerText = salesTodayPage.getTextFromElement("footer-text");
        String expected = String.format("© %d Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados. | ", LocalDate.now().getYear());
        assertEquals(expected, footerText);
    }

    @Then("Página conterá mensagem com a {string} do resumo de vendas")
    public void pageWillContainMessageDescribingSalesSummary(String expectedMessage) {
        String message = salesTodayPage.getWholeTextIfVisible(expectedMessage.substring(0, 10));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

    @Then("Página conterá todos os elementos do resumo de vendas")
    public void pageWillContainAllElementsOfSalesSummary() {
//        assertTrue(salesTodayPage.);
    }

    @When("Usuário passa o mouse sobre vendas")
    public void userHoversMenu() {
        salesTodayPage.hoverMenuOnSalesMenu();
    }

    @Then("O menu de vendas expande")
    public void lateralMenuExpands() {
        assertTrue("Menu lateral não está espandido", salesTodayPage.lateralMenuHasExpanded());
    }
}
