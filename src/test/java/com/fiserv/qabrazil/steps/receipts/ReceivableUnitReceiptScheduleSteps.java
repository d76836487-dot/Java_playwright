package com.fiserv.qabrazil.steps.receipts;

import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.receipts.ReceivableUnitReceiptSchedulePage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;

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
        waitUntilTrue(receivableUnitReceiptSchedulePage::hasNoLoadingBars);

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

    @And("Usuário visualizará um popup com informações sobre os campos")
    public void summaryPopupWillShow() {
        PageField popupContent = pageField.from("Popup");
        assertThat(popupContent.getAsText()).isEqualTo("Entenda os termos usados" +
                "Valor total líquido/atualizado de URs" +
                "Valor total previsto a ser pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado. Não inclui valores já pagos no período." +
                "Valor pago" +
                "Valor total já pago ao estabelecimento ou financiador (conforme condições negociadas pelo estabelecimento) no período selecionado." +
                "Total bruto" +
                "Valor total das vendas realizadas no periodo selecionado." +
                "Total taxa MDR" +
                "Valor total referente à taxa MDR sobre as vendas realizadas no período selecionado." +
                "Total antecipação eventual" +
                "Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio da antecipação eventual" +
                "Total antecipação automática" +
                "Valor total pago ao estabelecimento antes das datas originais de vencimento dos recebíveis, por meio de antecipação automática contratada." +
                "Total deduções" +
                "Valor total das deduções no período selecionado, como por exemplo: aluguel, cancelamento de venda, chargeback e entre outros débitos. Não considera desconto de taxa MDR." +
                "Total ajuste a crédito" +
                "Valor total dos ajustes a crédito no período selecionado, como por exemplo: comissão por venda de recarga, entre outros." +
                "Total contratos" +
                "Valor total a pagar ou já pago ao estabelecimento ou financiador referente a operações como gravame, cessão e outros ônus, realizadas pelo estabelecimento junto ao financiador no período selecionado." +
                "Entendi");
    }
}
