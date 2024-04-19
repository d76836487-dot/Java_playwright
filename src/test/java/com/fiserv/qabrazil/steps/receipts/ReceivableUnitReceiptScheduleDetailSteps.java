package com.fiserv.qabrazil.steps.receipts;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.pages.receipts.detail.ReceivableUnitReceiptScheduleDetailExportExcel;
import com.fiserv.qabrazil.pages.receipts.detail.ReceivableUnitReceiptScheduleDetailPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.Currency;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;

import static com.fiserv.qabrazil.steps.home.HomeCustomizeModalSteps.csv;
import static org.assertj.core.api.Assertions.assertThatNoException;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class ReceivableUnitReceiptScheduleDetailSteps extends BaseSteps {

    @Autowired
    private ReceivableUnitReceiptScheduleDetailPage receivableUnitReceiptScheduleDetailPage;
    private ReceivableUnitReceiptScheduleDetailExportExcel excel;

    @Given("usuário foi redirecionado à tela \"Agenda de recebimentos por UR > Detalhe da UR\"")
    @Then("usuário será direcionado à tela \"Agenda de recebimentos por UR > Detalhe da UR\"")
    public void userWillBeRedirectedTo() {
        receivableUnitReceiptScheduleDetailPage.ensureWeAreAtURDetailPage();
    }

    @Then("usuário visualizará no título do Resumo da UR a data no formato {string}")
    public void userWillSeeInSummaryTitleDateInFormat(String format) {
        String text = pageField.from("Detalhe da UR - Resumo - Título").getAsText();

        String[] texts = text.split(" ");

        assertEquals("Título da seção Resumo deve conter o texto \"Resumo\"", "Resumo", texts[0]);

        assertTrue("Título da seção Resumo deve conter a data no formato %s. Encontrado: %s".formatted(format, texts[1]),
                DateUtil.isInFormat(format, texts[1]));

    }

    @Then("Usuário verá no card da seção Resumo a imagem da bandeira, seguido do nome da bandeira")
    public void userWillSeeImageOfBrandAndTheBrandName() {
        assertTrue("Imagem da Bandeira não está presente", pageField.from("Detalhe da UR - Resumo - Imagem Bandeira").elementIsVisible());
        assertTrue("Nome da Bandeira não encontrada", pageField.from("Detalhe da UR - Resumo - Nome da Bandeira").elementIsVisible());
    }

    @Then("Usuário verá no card da seção Resumo o Valor total, Total atualizado da UR, Valor pago, Total de deduções")
    public void userWillSeeTotalValueURUpdatedTotalPaidValue() {
        assertThatNoException().isThrownBy(() ->
                pageField.from("Detalhe da UR - Resumo - Total atualizado da UR").getAsCurrency());
        assertThatNoException().isThrownBy(() ->
                pageField.from("Detalhe da UR - Resumo - Valor pago").getAsCurrency());
        assertThatNoException().isThrownBy(() ->
                pageField.from("Detalhe da UR - Resumo - Total de deduções").getAsCurrency());
        assertThatNoException().isThrownBy(() ->
                pageField.from("Detalhe da UR - Resumo - Valor total").getAsCurrency());

    }

    @Then("usuário verá na seção resumo os elementos")
    public void userWillSeeInSummarySectionTheElements(String elements) {
        String[] elementArr = csv(elements);

        Arrays.stream(elementArr).forEach(element -> {
            assertEquals("%s não possui texto esperado".formatted(element),
                    pageField.from("Detalhe da UR - Resumo - " + element).getAsText(),
                    element);

            assertThatNoException().isThrownBy(() ->
                    pageField.from("Detalhe da UR - Resumo - %s valor".formatted(element)).getAsCurrency());
        });
    }

    @When("Usuário clica em Exportar como Excel")
    public void userExportsExcel() throws IOException {
        excel = receivableUnitReceiptScheduleDetailPage.downloadExport();
    }

    @Then("{string} do Detalhe da UR será igual ao {string} do Excel")
    public void doDetalheDaURSeráIgualAoDoExcel(String displayName, String excelField) throws IOException, ParseException {
        String asText = pageField.from("Detalhe da UR - Resumo - " + displayName).getAsText();
        String textFromElement = asText.replaceAll("[^-]*(-?) ?(R\\$)", "$1R\\$");
        double valueScreen = Currency.parse(textFromElement).doubleValue();
        double valueExcel = excel.getField(excelField);

        assertEquals(valueExcel, valueScreen, 0.001);
    }
}
