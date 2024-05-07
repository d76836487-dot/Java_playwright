package com.fiserv.qabrazil.steps.receipts;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.receipts.detail.ReceivableUnitReceiptScheduleDetailExportExcel;
import com.fiserv.qabrazil.pages.receipts.detail.ReceivableUnitReceiptScheduleDetailPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.Currency;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.assertj.core.api.Assertions;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import static com.fiserv.qabrazil.steps.home.HomeCustomizeModalSteps.csv;
import static com.fiserv.qabrazil.util.ExcelFormatValidation.validateFormatForCellsInTable;
import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static org.assertj.core.api.Assertions.assertThatNoException;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.testng.AssertJUnit.*;

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
                DateUtil.isInFormat(texts[1], format));

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
        double valueExcel = excel.getFieldFirstColAsDouble(excelField);

        assertEquals(valueExcel, valueScreen, 0.001);
    }

    @Then("Usuário visualizar status pago com bolinha na cor verde")
    public void statusPaidWithGreenColor() {
        assertDescriptionAndColor("Pago", ReceivableUnitReceiptScheduleDetailPage::statusColorIsGreen);
    }

    @Then("Usuário visualizar status programado com bolinha na cor amarelo")
    public void statusScheduledWithYellowColor() {
        assertDescriptionAndColor("Programado", ReceivableUnitReceiptScheduleDetailPage::statusColorIsYellow);
    }


    private void assertDescriptionAndColor(String expectedDescription, BiFunction<ReceivableUnitReceiptScheduleDetailPage, PageField, Boolean> method) {
        List<PageField> statusesDescription = pageField.from("Detalhe da UR - Pagamentos - Situação").getAllPageField();
        List<PageField> statusesColor = pageField.from("Detalhe da UR - Pagamentos - Bolinha Situação").getAllPageField();

        assertEquals("Número de descrição de status e bolinhas é diferente.",
                statusesDescription.size(), statusesColor.size());

        for (int i = 0; i < statusesDescription.size(); i++) {
            boolean descriptionIsPaid = statusesDescription.get(i).getAsText().equals(expectedDescription);
            boolean expectedColor = method.apply(receivableUnitReceiptScheduleDetailPage, statusesColor.get(i));
            boolean colorAsExpected = !descriptionIsPaid || expectedColor;

            if (!colorAsExpected) {
                statusesDescription.get(i).highlightIfPossible();
            }

            assertTrue("Situação é '%s' mas cor não é esperada".formatted(statusesDescription.get(i).getAsText()),
                    colorAsExpected);
        }
    }

    @Then("Nome do arquivo será {string} seguido de data e hora padrão {string}")
    public void exportFileName(String expectedFilename, String dateFormat) {
        String lastMinute = DateUtil.formattedDateAddMinute(-1, dateFormat);
        String thisMinute = DateUtil.formattedDateAddMinute(0, dateFormat);

        assertThat(excel.getFileName(), containsString(expectedFilename));
        assertThat(excel.getFileName(), anyOf(containsString(lastMinute), containsString(thisMinute)));
    }

    @Then("Terá campo com um dos valores ou formatações abaixo na aba Resumo")
    public void fieldWithOneOfThoseValues(List<Map<String, String>> table) throws IOException {
        for (Map<String, String> map : table) {
            assertIfCsv(map.get("campo"), map.get("valor"), map.get("tipo validação"));
            assertIfCurrency(map.get("campo"), map.get("valor"), map.get("tipo validação"));
        }
    }

    private void assertIfCurrency(String fieldName, String value, String validationType) throws IOException {
        if (!validationType.equals("formato") && !value.equals("valor monetário")) return;

        assertThat(excel.getFieldFirstColFormat(fieldName), containsString("R$"));
    }

    private void assertIfCsv(String fieldName, String value, String validationType) throws IOException {
        if (!validationType.equals("csv")) return;

        String[] values = Arrays.stream(value.split(","))
                .map(String::trim)
                .toArray(String[]::new);
        assertThat(excel.getFieldFirstColAsText(fieldName), oneOf(values));
    }

    @Then("Terá as colunas abaixo na aba {string} em Detalhe UR")
    public void sameColumnsNewSheet(String excelTab, String columns) throws IOException {
        excel.goToSheet(excelTab);

        String[] expected = csv(columns);
        String[] actual = Arrays.stream(excel.getTableHeaderCells())
                .map(String::trim)
                .toArray(String[]::new);

        Assertions.assertThat(actual).containsExactlyInAnyOrder(expected);
    }

    @Then("Os valores das colunas do excel em Detalhe UR baixado terão mesma formatação")
    public void formatColumns() {
        validateFormatForCellsInTable(excel.getExcelWrapper());
    }

    @Then("Valores da popup da UR da venda tem mesmas informações que listagem")
    public void popupSameValuesInListing() {
        List<String> displayNames = List.of(
                "Detalhe da UR - Venda - Data Venda 0",
                "Detalhe da UR - Venda - Cod Autorização 0",
                "Detalhe da UR - Venda - Produto 0",
                "Detalhe da UR - Venda - Parcela 0",
                "Detalhe da UR - Venda - Valor Bruto 0",
                "Detalhe da UR - Venda - Valor Bruto Parcela 0",
                "Detalhe da UR - Venda - Valor Líquido 0",
                "Detalhe da UR - Venda - Valor Taxa 0");

        for(String displayName: displayNames) {
            String textLookingFor = pageField.from(displayName).getAsText();
            boolean hasValueVisibleInPopup = receivableUnitReceiptScheduleDetailPage.lookForTextInPopup(textLookingFor);

            assertTrue("Não encontrei texto '%s' no popup com detalhe da venda".formatted(textLookingFor),
                    hasValueVisibleInPopup);
        }
    }

    @Then("Popup da UR da venda será fechada após usuário clicar no botão Fechar")
    public void closePopup() {
        pageField.from("Detalhe da UR - Popup - Botão Fechar").click();
        sleep(Duration.ofMillis(500));
        assertFalse("Popup não fechou após clicar no botão fechar.",
                pageField.from("Detalhe da UR - Popup").elementIsVisibleRightNow());
    }
}
