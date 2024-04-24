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

    @Given("Existem recebimentos listados")
    public void thereAreReceiptsListed() {
        waitUntilTrue(60, receivableUnitReceiptSchedulePage::hasNoLoadingBars);

        PageField receiptBatches = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total");

        assumeThat(waitUntilTrue(() -> receiptBatches.getCount() >= 1)).isTrue();
    }

    @Given("usuário clicou sobre um lote \\(bandeira e produto) da listagem apresentada")
    @When("usuário clica sobre um lote \\(bandeira e produto) da listagem apresentada")
    public void userClicksReceiptBatchInThePresentedList() {
        pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total").firstOf().click();
        PageField buttonReceiptBatch = pageField.from("Agenda de Recebimentos por UR - Unidade de Recebível Registrada");
        waitUntilTrue(() -> buttonReceiptBatch.allVisiblePageField().findAny().isPresent());
        buttonReceiptBatch.firstOf().click();
    }

    @Given("usuário clicou sobre o lote {int} \\(bandeira e produto) da listagem apresentada")
    public void userClicksReceiptBatchInThePresentedListNumbered(int lotNumber) {
        PageField lotElement = pageField.from("Agenda de Recebimentos por UR - Lote de Recebimento - Valor Total");
        assumeThat(lotElement.getCount() > lotNumber)
                .withFailMessage("Pulando o teste, pois não existem tantos loges de recebimento.")
                .isTrue();

        lotElement.getAllVisiblePageField().get(lotNumber).click();
        PageField buttonReceiptBatch = pageField.from("Agenda de Recebimentos por UR - Unidade de Recebível Registrada");
        waitUntilTrue(() -> buttonReceiptBatch.allVisiblePageField().findAny().isPresent());
        buttonReceiptBatch.firstOf().click();
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
        double futureValue = pageField.from("Agenda de Recebimentos por UR - Resumo - Valor Total líquido de URs").getAsCurrency().doubleValue();
        double sumFutureValueAllBrands = receivableUnitReceiptSchedulePage.sumFutureValueAllBrands();

        assertEquals("Valor da agenda futura de UR não é igual à soma por bandeiras",
                futureValue, sumFutureValueAllBrands, 0.001);
    }

    @Then("abaixo do gráfico deve ser apresentado uma bolinha na cor da sua respectiva bandeira nas colorações:")
    public void belowGraphShowsBrandsRespectiveColorCircle(DataTable table) {
        for (Map<String, String> map : table.asMaps()) {
            String brand = map.get("bandeira");
            String color = map.get("rgb");

            PageField circle = pageField.from("Agenda de Recebimentos por UR - Totais - " + brand + " cor legenda no gráfico");
            assertThat(circle).hasCSS("fill", color);
        }
    }
}
