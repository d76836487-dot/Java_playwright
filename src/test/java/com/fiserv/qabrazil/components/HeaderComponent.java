package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Identifier;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class HeaderComponent extends BasePage {
    @Autowired
    Page page;
    @Autowired
    private ContractConfig contractConfig;

    public void selectShowValuesButton(boolean show) {
        Locator button = page.getByTestId(Identifier.from("Header - Ocultar Valores").testId());
        if (button.getAttribute("status").equals("on") == show) return;

        button.click();
    }

    public void selectAllDocumentsIfAvailable() {
        PageField changeButton = pageField.from("Header - Trocar Estabelecimento");
        if (allDocumentsIsSelected(changeButton)) return;

        openModalIfRequired(changeButton);
        if (userHasOnlyOneDocument()) {
            page.getByTestId("alterar-matriz-fechar").click();
            return;
        }
        pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Documento").click();
        pageField.from("Header - Trocar Estabelecimento - Modal - Todos").click();
        unselectSetAsDefault();

        startMonitoringRequests(page, contractConfig);
        pageField.from("Header - Trocar Estabelecimento - Modal - Acessar").click();
        ensureNoFlyingRequests();
    }

    private void unselectSetAsDefault() {
        Locator checkboxSetAsDefault = pageField
                .from("Header - Trocar Estabelecimento - Modal - Padrão")
                .getLocator()
                .locator("//input");
        if (checkboxSetAsDefault.isChecked()) {
            checkboxSetAsDefault.click();
        }
    }

    private boolean userHasOnlyOneDocument() {
        Locator allDocsButton = pageField.from("Header - Trocar Estabelecimento - Modal - Todos").getLocator();
        Locator userHasOnlyOneDoc = page.getByText("Você só possui um documento para seleção");

        waitUntilTrue(() -> allDocsButton.isVisible() || userHasOnlyOneDoc.isVisible());
        return userHasOnlyOneDoc.isVisible();
    }

    private void openModalIfRequired(PageField changeButton) {
        if (changeButton.getLocator().isVisible()) {
            changeButton.click();
        }
    }

    private boolean allDocumentsIsSelected(PageField button) {
        Locator closeModalButton = page.getByTestId("alterar-matriz-fechar");
        Locator buttonOpenModal = button.getLocator();

        waitUntilTrue(() -> buttonOpenModal.isVisible() || closeModalButton.isVisible());

        return buttonOpenModal.isVisible()
                && buttonOpenModal.textContent().contains("Todos documentos");
    }
}
