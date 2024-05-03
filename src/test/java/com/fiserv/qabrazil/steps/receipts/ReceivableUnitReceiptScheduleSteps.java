package com.fiserv.qabrazil.steps.receipts;

import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.receipts.ReceivableUnitReceiptSchedulePage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static java.util.stream.Collectors.toMap;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertEquals;

public class ReceivableUnitReceiptScheduleSteps extends BaseSteps {

    @Autowired
    UrlCheckers urlCheckers;

    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;

    @Autowired
    ReceivableUnitReceiptSchedulePage receivableUnitReceiptSchedulePage;

    @Then("usuário {shakespeareBoolean} em {string} opção de Alterar Documento")
    public void ensureWeAreAtTheCorrectPageAndHeaderDoNotHaveChangeDocument(boolean value, String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage();
        PageField button = pageField.from("Agenda de recebimentos por UR - Botão Alterar Documento");
        if (value) {
            assertThat(button).hasCount(1);
        } else {
            assertThat(button).hasCount(0);
        }
    }

    @And("selecionando o Documento no Header o Usuário visualizara o Respectivo Documento selecionado")
    public void ensureSelectedDocumentShowsUp() {
        PageField button = pageField.from("Agenda de recebimentos por UR - Botão Alterar Documento");
        button.click();

        PageField radioButton = pageField.from("Agenda de recebimentos por UR - RadioButton Selecionar Documento").allVisiblePageField()
                .filter(item -> !item.isChecked())
                .findFirst()
                .orElseThrow();
        radioButton.click();

        String cnpj = radioButton.getLocator().locator("../../../../..").locator(".cor-cinza-escuro").nth(1).textContent();
        pageField.from("Agenda de recebimentos por UR - Confirmar Seleção").click();

        assertThat(pageField.from("Agenda de recebimentos por UR - CNPJ Selecionado")).containsText("CNPJ: " + cnpj);
    }

    @Then("Usuário visualizará em Agenda de recebimentos por UR o Documento selecionado")
    public void ensureSelectedECShowsUp() {
        String cnpj = selectECOrDtcoPage.getSelectedCnpj();
        assertThat(pageField.from("Agenda de recebimentos por UR - CNPJ Selecionado")).containsText("CNPJ: " + cnpj);
    }

    @Given("Usuário acessou a página de Agenda de Recebimentos por UR")
    public void userAccessedTheReceiptSummaryPage() {
        receivableUnitReceiptSchedulePage.navigateTo();
    }

    @Given("{shakespeareBoolean} recebimentos listados")
    public void thereAreReceiptsListed(boolean foundLotsOfReceivable) {
        waitUntilTrue(60, receivableUnitReceiptSchedulePage::hasNoLoadingBars);

        PageField receiptBatches = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total");

        assumeThat(waitUntilTrue(() -> receiptBatches.getCount() >= 1)).isEqualTo(foundLotsOfReceivable);
    }

    @Given("Carregou recebimentos listados")
    public void thereAreReceiptsListed() {
        waitUntilTrue(60, receivableUnitReceiptSchedulePage::hasNoLoadingBars);

        PageField receiptBatches = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total");
        PageField asUr = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Sem Recebíveis");

        waitUntilTrue(() -> receiptBatches.getCount() >= 1 || asUr.getCount() >= 1);
        assumeThat(receiptBatches.getCount() >= 1).isTrue();
    }

    @Given("Usuário clicou em uma linha de recebimento")
    public void userClickBatch() {
        pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total").firstOf().click();
    }

    @Given("usuário clicou sobre um lote \\(bandeira e produto) da listagem apresentada")
    @When("usuário clica sobre um lote \\(bandeira e produto) da listagem apresentada")
    public void userClicksReceiptBatchInThePresentedList() {
        pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total").firstOfRightNow().click();
        selectBrandAndNavigateToDetail();
    }

    @Given("usuário clicou sobre um lote \\(bandeira e produto) da listagem apresentada que tenha valor pago maior que zero")
    public void userClicksReceiptBatchWithPaidValue() {
        List<PageField> paidValueGreaterZero = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Valor pago")
                .getAllPageField().stream()
                .filter(pf -> pf.getAsCurrency().doubleValue() > 0)
                .toList();
        assumeThat(paidValueGreaterZero).hasSizeGreaterThan(0);
        paidValueGreaterZero.get(0).click();

        selectBrandAndNavigateToDetail();
    }

    @Given("usuário clicou sobre um lote \\(bandeira e produto) da listagem apresentada que tenha saldo negociável maior que zero")
    public void userClicksReceiptBatchWithNegotiableValue() {
        List<PageField> paidValueGreaterZero = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Saldo disponível negociável")
                .getAllPageField().stream()
                .filter(pf -> {
                    pf.highlightIfPossible();
                    return pf.getAsCurrency().doubleValue() > 0;
                })
                .toList();
        assumeThat(paidValueGreaterZero).hasSizeGreaterThan(0);
        paidValueGreaterZero.get(0).click();

        selectBrandAndNavigateToDetail();
    }

    private void selectBrandAndNavigateToDetail() {
        PageField buttonReceiptBatch = pageField.from("Agenda de Recebimentos por UR - Unidade de Recebível Registrada");
        waitUntilTrue(() -> buttonReceiptBatch.allVisiblePageField().findAny().isPresent());
        buttonReceiptBatch.firstOfRightNow().click();
    }

    @Given("usuário clicou sobre o lote {int} \\(bandeira e produto) da listagem apresentada")
    public void userClicksReceiptBatchInThePresentedListNumbered(int lotNumber) {
        PageField lotElement = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total");
        assumeThat(lotElement.getCount() > lotNumber)
                .withFailMessage("Pulando o teste, pois não existem tantos loges de recebimento.")
                .isTrue();

        lotElement.getAllVisiblePageField().get(lotNumber).click();
        selectBrandAndNavigateToDetail();
    }

    @Then("Deve abrir um modal com Todos os termos usados e um Scroll para rolagem, Botões X e Entendi!")
    public void summaryPopupWillShow(List<String> text) {
        PageField popupContent = pageField.from("Agenda de Recebimentos por UR - Resumo - Popup - Entenda os termos usados");
        assertThat(popupContent.getAllAsText()).isEqualTo(text);

        PageField popupCloseButton = pageField.from("Agenda de Recebimentos por UR - Resumo - Popup - Fechar");
        assertThat(popupCloseButton).isVisible();
        assertThat(popupCloseButton).hasCount(1);

        PageField popupConfirmButton = pageField.from("Agenda de Recebimentos por UR - Resumo - Popup - Entendi");
        assertThat(popupConfirmButton).isVisible();
        assertThat(popupConfirmButton).hasCount(1);
    }

    @Then("Valor total Líquido de UR será igual à soma dos valores das Bandeiras")
    public void sumAllBrandsEqualFutureValue() {
        double totalNet = pageField.from("Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs").getAsCurrency().doubleValue();
        double sumNetAllBrands = receivableUnitReceiptSchedulePage.sumFutureValueAllBrands();

        assertEquals("Valor total líquido de UR não é igual à soma por bandeiras",
                totalNet, sumNetAllBrands, 0.001);
    }

    @Then("abaixo do gráfico deve ser apresentado uma bolinha na cor da sua respectiva bandeira nas colorações:")
    public void belowGraphShowsBrandsRespectiveColorCircle(DataTable table) {
        for (Map<String, String> map : table.asMaps()) {
            String brand = map.get("bandeira");
            String color = map.get("rgb");

            PageField circle = pageField.from("Agenda de Recebimentos por UR - legenda gráfico Totais - cor " + brand);
            assertThat(circle).hasCSS("fill", color);
        }
    }

    @Then("Valor total é igual a soma do Valor Líquido com o Valor Pago")
    public void sumLiquidAndPaidEqualToTotal() {
        double total = pageField.from("Agenda de Recebimentos por UR - Resumo - Valor Total").getAsCurrency().doubleValue();
        double netValue = pageField.from("Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs").getAsCurrency().doubleValue();
        double paidValue = pageField.from("Agenda de Recebimentos por UR - Resumo - Valor pago").getAsCurrency().doubleValue();

        assertEquals("Total não é igual a soma do Valor Líquido com o Valor Pago",
                total, netValue + paidValue, 0.001);
    }

    @When("{shakespeareBoolean} dados no Campo Totais líquidos por bandeira")
    public void totalsPerBrandVisibility(boolean value) {
        PageField noValuesMessage = pageField.from("Agenda de Recebimentos por UR - Totais - sem valores");
        assumeThat(noValuesMessage.elementIsVisible())
                .isEqualTo(!value);
    }

    @Then("deve ser apresentado a frase {string}")
    public void shouldShowNoDetailsInformation(String message) {
        PageField noValuesMessage = pageField.from("Agenda de Recebimentos por UR - Totais - sem valores");
        assertThat(noValuesMessage).isVisible();
        assertThat(noValuesMessage).containsText(message);
    }

    @And("todas as bandeiras deve vir com valores zerados")
    public void allBrandsShouldBeZero() {
        List<PageField> allFields = pageField.allWithPrefix("Agenda de Recebimentos por UR - legenda gráfico Totais - texto");
        for (PageField field : allFields) {
            assertThat(field).containsText(Pattern.compile("R\\$ 0,00$"));
        }
    }

    @When("Usuário passa mouse por cima do Componente “gráfico” em Totais líquidos por bandeira")
    public void hoversOverGraphComponent() {
        pageField.anyOf(pageField.allWithPrefix("Agenda de Recebimentos por UR - gráfico - barra")).hoverOverFirst();
    }

    @Then("deve ser apresentado um tooltip informando qual a bandeira e o valor que se refere aquela cor. A ordem de apresentação e coloração deve ser:")
    public void shouldShowTooltipAboutWhichBrandAndValueEachColorCorresponds(DataTable table) {
        PageField tooltip = pageField.from("Agenda de Recebimentos por UR - gráfico - tooltip");
        assertThat(tooltip).isVisible();
        assertThat(tooltip.getAsText())
                .withFailMessage("Graph tooltip doesn't match ")
                .matches("(Mastercard|ELO|Visa|Hipercard|Amex|Cabal) R\\$ [\\d.]+,\\d{2}");

        List<String> brandsOrder = table.asMaps().stream()
                .map(map -> map.get("bandeira"))
                .toList();

        List<PageField> bars = pageField.anyOf(pageField.allWithPrefix("Agenda de Recebimentos por UR - gráfico - barra")).getAllPageField();
        List<String> brands = bars.stream()
                .map(pf -> pf.attributeAsString("aria-label"))
                .map(ReceivableUnitReceiptScheduleSteps::extractBrand)
                .toList();

        assertThat(brands)
                .containsExactlyElementsOf(brandsOrder);

        List<String> colors = table.asMaps().stream()
                .map(map -> map.get("rgb"))
                .toList();

        for (int i = 0; i < colors.size(); i++) {
            String color = colors.get(i);
            assertThat(bars.get(i))
                    .hasCSS("fill", color);
        }
    }

    @Then("abrira um modal com: Totais líquidos por bandeira e produtos, Bolinha na cor do Cartão, Logo do Cartão e Nome do Cartão, Total em Crédito, Total em Débito, e o Botões, X acima e fechar na {string} abaixo")
    public void modalOpens(String color, DataTable dataTable) {
        Map<String, String> balls = dataTable.asMaps().stream()
                        .collect(toMap(map -> map.get("bandeira"), map -> map.get("rgb")));
        Map<String, String> logos = dataTable.asMaps().stream()
                        .collect(toMap(map -> map.get("bandeira"), map -> map.get("logo")));
        receivableUnitReceiptSchedulePage.validateModal(balls, logos, color);
    }

    private static String extractBrand(String graphLabel) {
        Pattern p = Pattern.compile("^Totais líquidos por produto, [\\d,.]+ (Mastercard|ELO|Visa|Hipercard|Amex|Cabal) R\\$ [\\d,.]+$");
        Matcher m = p.matcher(graphLabel);
        if (!m.matches()) {
            throw new IllegalArgumentException("Could not extract brand from \"" + graphLabel + "\"");
        }
        return m.group(1);
    }
}
