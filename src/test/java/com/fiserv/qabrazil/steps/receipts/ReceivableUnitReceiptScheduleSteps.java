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
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
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

    @Given("usuário clicou sobre um lote \\(bandeira e produto) da listagem apresentada")
    @When("usuário clica sobre um lote \\(bandeira e produto) da listagem apresentada")
    public void userClicksReceiptBatchInThePresentedList() {
        pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Label Valor Total").firstOf().click();
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
        buttonReceiptBatch.firstOf().click();
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

    @When("não houver dados no Campo Totais líquidos por bandeira")
    public void thereIsNoDataForTotalsPerBrand() {
        PageField noValuesMessage = pageField.from("Agenda de Recebimentos por UR - Totais - sem valores");
        assumeThat(noValuesMessage.elementIsVisible())
                .isTrue();
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
}
