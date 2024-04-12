package com.fiserv.qabrazil.steps.receipts;

import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.ReceiptScheduleByURPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.assertj.core.api.Assumptions.assumeThat;

public class ReceiptScheduleByURSteps extends BaseSteps {
    private static final Logger log = LoggerFactory.getLogger(ReceiptScheduleByURSteps.class);

    @Autowired
    private ReceiptScheduleByURPage receiptScheduleByURPage;

    @Given("Usuário acessou a página de Agenda de Recebimentos por UR")
    public void userAccessedTheReceiptSummaryPage() {
        receiptScheduleByURPage.navigateTo();
    }

    @Given("Existem recebimentos listados")
    public void thereAreReceiptsListed() {
        waitUntilTrue(() -> receiptScheduleByURPage.hasNotLoadingOverlay());

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
}
