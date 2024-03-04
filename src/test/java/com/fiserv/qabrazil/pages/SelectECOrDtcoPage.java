package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import org.jetbrains.annotations.NotNull;

import java.time.Duration;
import java.util.List;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SelectECOrDtcoPage extends BasePage {

    public boolean tabEstablishmentIsSelected() {
        Locator button = pageField
                .from("Trocar Estabelecimento - Botão selecionar por Estabelecimento")
                .getLocator();
        return button.getAttribute("aria-checked").equals("true");
    }

    public void openFirstDropdown() {
        Locator nameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento")
                .getLocator();

        nameEstablishment.first().click();
    }

    public void openDropdownForDocument(String formattedDoc) {
        List<PageField> nameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento")
                .getAllPageField();

        findPageWithWithDataTestId(formattedDoc, nameEstablishment).click();
    }

    public String getTextForDocument(String document, String displayName) {
        List<PageField> nameEstablishment = pageField
                .from(displayName)
                .getAllPageField();

        return findPageWithWithDataTestId(document, nameEstablishment).getAsText();
    }

    public boolean ecIsVisible(String ec) {
        List<PageField> pageFields = pageField.from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe")
                .getAllPageField();

        return findPageWithWithDataTestId(ec, pageFields).fieldIsOneVisibleAndEnabled();
    }

    public String getTextForEC(String documentOrEc, String displayName) {
        List<PageField> pageFields = pageField.from(displayName)
                .getAllPageField();

        return findPageWithWithDataTestId(documentOrEc, pageFields).getAsText();
    }

    private PageField findPageWithWithDataTestId(String documentOrEc, List<PageField> nameEstablishment) {
        for(PageField pageField: nameEstablishment) {
            if (pageField.getLocator().getAttribute("data-testid").contains(documentOrEc)) {
                return pageField;
            }
        }

        throw new RuntimeException("Não encontrei dropdown/ec para %s".formatted(documentOrEc));
    }

    public boolean modalIsVisible() {
        return pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").fieldIsOneVisibleAndEnabled()
                && pageField.from("Trocar Estabelecimento - Botão selecionar por Estabelecimento").fieldIsOneVisibleAndEnabled();
    }

    public void selectAllDocumentsIfAvailable() {
        if (!contractConfig.getActiveUserProfile().isMaster()) return;

        PageField changeButton = pageField.from("Header - Trocar Estabelecimento");
        if (allDocumentsIsAlreadySelected(changeButton)) return;

        openModalIfRequired(changeButton);

        if (userHasOnlyOneDocument()) {
            page.getByTestId("alterar-matriz-fechar").click();
            return;
        }

        pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").click();
        pageField.from("Trocar Estabelecimento - Botão Todos Documentos").click();
        selectSetAsDefault(true);

        pageField.from("Trocar Estabelecimento - Botão Acessar").click();
    }

    private void openModalIfRequired(PageField changeButton) {
        if (changeButton.getLocator().isVisible()) {
            changeButton.click();
        }
    }

    private boolean allDocumentsIsAlreadySelected(PageField button) {
        if (modalIsVisible()) return false;

        return button.getLocator().textContent().contains("Todos documentos");
//        Locator closeModalButton = page.getByTestId("alterar-matriz-fechar");
//        Locator buttonOpenModal = button.getLocator();
//        return ()
//
//        waitUntilTrue(() -> buttonOpenModal.isVisible() || closeModalButton.isVisible());
//
//        return buttonOpenModal.isVisible()
//                && buttonOpenModal.textContent().contains("Todos documentos");
    }

    private void selectSetAsDefault(boolean markDefaultOption) {
        Locator checkboxSetAsDefault = pageField
                .from("Trocar Estabelecimento - Marcar como Padrão")
                .getLocator()
                .locator("//input");
        if (checkboxSetAsDefault.isChecked() != markDefaultOption) {
            checkboxSetAsDefault.click();
        }
    }

    private boolean userHasOnlyOneDocument() {
        Locator allDocsButton = pageField.from("Trocar Estabelecimento - Botão Todos Documentos").getLocator();
        Locator userHasOnlyOneDoc = page.getByText("Você só possui um documento para seleção");

        waitUntilTrue(() -> allDocsButton.isVisible() || userHasOnlyOneDoc.isVisible());
        return userHasOnlyOneDoc.isVisible();
    }

    public void openModalAndUnsetDefault() {
        pageField.from("Header - Trocar Estabelecimento").click();
        pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").click();
        pageField.from("Trocar Estabelecimento - Botão Todos Documentos").click();
        selectSetAsDefault(false);
        pageField.from("Trocar Estabelecimento - Botão Acessar").click();
    }

    public List<String> getDocumentsFromTabDocument() {
        sleep(Duration.ofMillis(200));

        PageField inputs = pageField.from("Trocar Estabelecimento - Documento - Documento Estabelecimento");
        waitUntilTrue(() -> !filterDocsFromDialog(inputs).isEmpty());

        return filterDocsFromDialog(inputs);
    }

    @NotNull
    private static List<String> filterDocsFromDialog(PageField inputs) {
        return inputs.getAllPageField().stream()
                .map(pf -> pf.getLocator().getAttribute("value"))
                .filter(value -> value != null && value.length() > 1 && Character.isDigit(value.charAt(0)))
                .toList();
    }

    public void openModalAndTab(String tab) {
        startMonitoringRequests(page, contractConfig);

        pageField.from("Header - Trocar Estabelecimento").click();
        pageField.from("Trocar Estabelecimento - Botão selecionar por %s".formatted(tab)).click();

        ensureNoFlyingRequests();
    }
}
