package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.SalesTodayExportPage;
import com.fiserv.qabrazil.pages.sales.SalesTodayPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.Currency;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;

import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.*;

public class SalesTodaySteps extends BaseSteps {
    @Autowired
    SalesTodayPage salesTodayPage;

    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;

    @Autowired
    SalesTodayExportPage salesTodayExportPage;

    private SalesTodayExportPage.SalesTodayExportExcel salesTodayAsExcel;

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

    @Given("Existem vendas com {string} tipo {string}")
    public void thereAreSalesWith(String columnPageFieldId, String value) {
        assumeThat(salesTodayPage.thereAreSalesWith(value, columnPageFieldId))
                .withFailMessage("No sales of type %s found", value)
                .isTrue();
    }

    @Then("Serão filtradas as vendas com produto {string}")
    public void thereIsNoSalesOfProduct(String productType) {
        boolean foundSalesWithProduct = salesTodayPage.thereAreSalesWithProduct(productType);
        assertFalse(foundSalesWithProduct);
    }

    @Then("Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'")
    public void checkSalesTodayMatches() throws IOException {
        String salesTodayFromHome = pageField.from("Home - Card Vendas Hoje - Valor Vendas Hoje").getAsText();
        salesTodayAsExcel = salesTodayExportPage.getDownloadAsExcel();
        String salesTodayFromExport = salesTodayAsExcel.getGrossSales();

        assertEquals(salesTodayFromHome, salesTodayFromExport);
    }

    @Then("A exportação do relatório 'Vendas Hoje' terá somente o EC selecionado")
    public void exportWillHaveOnlySelectedEc() throws IOException {
        List<String> exportedEcs = salesTodayAsExcel.getECs();
        boolean allSameEcs = exportedEcs.stream()
                .allMatch(ec -> ec.equals(selectECOrDtcoPage.getSelectedEc()));

        assertTrue("Existem ECS gerados no excel que não são iguais ao selecionado <%s>: <%s>.".formatted(selectECOrDtcoPage.getSelectedEc(), exportedEcs),
                allSameEcs);
    }

    @Then("Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas")
    public void sumColumnGrossValueFromExport() throws IOException, ParseException {
        double salesTodayFromExport = Currency.parseCurrency(salesTodayAsExcel.getGrossSales()).doubleValue();
        double unpaidSalesTodayFromExport = Currency.parseCurrency(salesTodayAsExcel.getUnpaidSales()).doubleValue();
        double sumGrossValue = salesTodayAsExcel.getSumGrossValues();

        assertEquals("Valor da soma do cabeçalho é diferente da soma da coluna.",
                salesTodayFromExport + unpaidSalesTodayFromExport, sumGrossValue, 0.001);
    }
}
