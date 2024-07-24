package com.fiserv.qabrazil.pages;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.microsoft.playwright.Locator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SelectECOrDtcoPage extends BasePage {
    private static final Logger log = LoggerFactory.getLogger(SelectECOrDtcoPage.class);
    @Autowired
    private ApiUserDetailsService apiUserDetailsService;
    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;
    private String selectedDoc;
    private String selectedDocName;
    private String selectedEc;
    private String selectedEcName;
    private String selectedCpnj;

    public String getSelectedDoc() {
        return selectedDoc;
    }

    public String getSelectedDocName() {
        return selectedDocName;
    }

    public String getSelectedEc() {
        return selectedEc;
    }

    public String getSelectedEcName() {
        return selectedEcName;
    }

    public String getSelectedCnpj() {
        return selectedCpnj;
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
                .getAllVisiblePageField();

        findPageFieldWithWithDataTestId(formattedDoc, nameEstablishment).click();
    }

    public String getTextForDocument(String document, String displayName) {
        List<PageField> nameEstablishment = pageField
                .from(displayName)
                .getAllVisiblePageField();

        return findPageFieldWithWithDataTestId(document, nameEstablishment).getAsText();
    }

    public boolean ecIsVisible(String ec) {
        List<PageField> pageFields = pageField.from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe")
                .getAllVisiblePageField();

        return findPageFieldWithWithDataTestId(ec, pageFields).fieldIsOneVisibleAndEnabled();
    }

    public String getTextForEC(String documentOrEc, String displayName) {
        List<PageField> pageFields = pageField.from(displayName)
                .getAllVisiblePageField();

        return findPageFieldWithWithDataTestId(documentOrEc, pageFields).getAsText();
    }

    private PageField findPageFieldWithWithDataTestId(String documentOrEc, List<PageField> nameEstablishment) {
        for(PageField pageField: nameEstablishment) {
            pageField.fieldIsOneVisibleAndEnabled();
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
        PageField buttonAllDocs = pageField.from("Trocar Estabelecimento - Botão Todos Documentos");
        waitUntilTrue(360, this::allDocsHaveBeenLoaded);
        if (!buttonAllDocs.elementIsVisibleAndEnabledRightNow()) {
            log.info("Não carregou documentos. Isso significa uma lentidão muito grande ou token expirou...");
        }
        buttonAllDocs.click();
        selectSetAsDefault(true);

        pageField.from("Trocar Estabelecimento - Botão Acessar").click();
    }



    public void checkModalAutomaticIsOpen() throws InterruptedException {
        Thread.sleep(4000);

        if(page.getByText("Personalize sua visualização").isVisible()) {

            //page.getByText("Documento").click();

            page.locator("data-testid=alterar-matriz-type-documento evt_clicou_selecao_docOuEC_personalize_documento").click();
           // if(page.getByText("Todos").isVisible()) {
                PageField buttonAllDocs = pageField.from("Trocar Estabelecimento - Botão Todos Documentos");
                buttonAllDocs.click();


            //PageField buttonAcessar = pageField.from("Trocar Estabelecimento - Acessar");
            //buttonAcessar.click();



                page.getByText("Acessar").click();
          //  }else{

                Config.SessionLogado = "YES";

            //    List<String> allDocs = selectECOrDtcoPage.getDocumentsFromTabDocument();
             //   selectECOrDtcoPage.selectDocumentInput(allDocs.get(0));
              //  selectECOrDtcoPage.storeDocAndFirstNameFromDocuments(allDocs.get(0));
                ///page.getByText("Acessar").click();
            //}
        }
    }
    private void openModalIfRequired(PageField changeButton) {
        if (changeButton.getLocator().isVisible()) {
            changeButton.click();
        }
    }

    public boolean allDocumentsIsAlreadySelected(PageField button) {
        if (modalIsVisible()) return false;

        return button.fieldIsOneVisibleAndEnabled() && button.getAsText().contains("Todos documentos");
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

    public void openModalAndSetDefault(boolean setAsDefault) {
        pageField.from("Header - Trocar Estabelecimento").click();
        pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").click();

        waitUntilTrue(90, () -> pageField.from("Trocar Estabelecimento - Botão Todos Documentos").elementIsVisibleRightNow());

        pageField.from("Trocar Estabelecimento - Botão Todos Documentos").click();
        selectSetAsDefault(setAsDefault);
        pageField.from("Trocar Estabelecimento - Botão Acessar").click();
    }

    public void AutomaticopenModalAndSetDefault(boolean setAsDefault) {

        pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").click();

        waitUntilTrue(90, () -> pageField.from("Trocar Estabelecimento - Botão Todos Documentos").elementIsVisibleRightNow());

        pageField.from("Trocar Estabelecimento - Botão Todos Documentos").click();
        selectSetAsDefault(setAsDefault);
        pageField.from("Trocar Estabelecimento - Botão Acessar").click();
    }

    public List<String> getDocumentsFromTabDocument() {
        PageField inputs = pageField.from("Trocar Estabelecimento - Documento - Documento Estabelecimento");
        waitUntilTrue(() -> inputs.getCount() > 0);

        return filterDocsFromDialog(inputs);
    }

    private static List<String> filterDocsFromDialog(PageField inputs) {
        return inputs.getAllVisiblePageField().stream()
                .map(pf -> pf.getLocator().getAttribute("value"))
                .filter(value -> value != null && value.length() > 1 && Character.isDigit(value.charAt(0)))
                .toList();
    }

    public void openModalAndTab(String tab) throws InterruptedException {
        //startMonitoringRequests(page, contractConfig);
        PageField openModalButton = pageField.from("Header - Trocar Estabelecimento");
        if (openModalButton.elementIsVisible()) {
            openModalButton.click();
        }
        Thread.sleep(3000);

        if(tab.equals("Estabelecimento")) {
           pageField.from("Trocar Estabelecimento - Botão selecionar por Estabelecimento").click();


        }

        if(tab.equals("Documento")) {
            pageField.from("Trocar Estabelecimento - Botão selecionar por Documento").click();

        }

        //PageField establishmentTab = pageField.from("Trocar Estabelecimento - Botão selecionar por %s".formatted(tab));
        //PageField establishmentTab = pageField.from("Trocar Estabelecimento - Botão selecionar por %s".formatted(tab));
        //if (!establishmentTab.elementIsVisible()) throw new RuntimeException("A aba para seleciona estabelecimento não está visível");
       // establishmentTab.click();
        ensureNoFlyingRequests();

        boolean ready = waitUntilTrue(120, () ->
                pageField.from("Trocar Estabelecimento - %s - Documento Estabelecimento".formatted(tab)).getCount() > 0 &&
                        allDocsHaveBeenLoaded());
        if (!ready) throw new RuntimeException("Não carregou documentos/estabelecimentos em Trocar Estabelecimento");
    }

    private boolean allDocsHaveBeenLoaded() {
        return page.locator(".popup-dialog")
                .locator(".ph-picture-small")
                .count() == 0;
    }

    public void selectDocumentInput(String docToSelect) {
        List<PageField> allPageFields = pageField.from("Trocar Estabelecimento - Documento - Documento Estabelecimento")
                .getAllVisiblePageField();
        for(PageField pf: allPageFields) {
            if (pf.getLocator().inputValue().equals(docToSelect)) {
                pf.click();
                return;
            }
        }

        throw new RuntimeException("Não foi possível selecionar %s".formatted(docToSelect));
    }

    public void clickAccessAndWaitClose() {
        //PageField accessButton = pageField.from("Trocar Estabelecimento - Botão Acessar");
        //accessButton.click();
        //waitUntilTrue(() -> !accessButton.elementIsVisibleRightNow());
        page.getByText("Acessar").click();
    }

    public void storeDocAndFirstNameFromDocuments(String selectedDoc) {
        this.selectedDoc = selectedDoc;

        List<String> allNames = pageField.from("Trocar Estabelecimento - Documento - Nome Estabelecimento")
                .getAllAsText().stream()
                .filter(name -> !name.equals("Todos"))
                .toList();

        if (!allNames.isEmpty()) {
            selectedDocName = allNames.get(0);
        }
    }

    public void storeNameAndEc() {
        selectedCpnj = pageField.from("Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento")
                .getAllVisiblePageField().get(0)
                .getAsText();
        selectedEcName = pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe")
                .getAllVisiblePageField().get(0)
                .getAsText();
        selectedEc = pageField.from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe")
                .getAllVisiblePageField().get(0)
                .getAsText();
    }

    public void storeEc(String ec) {
        selectedEc = ec;
    }

    public List<String> getSelectedEcs() throws Exception {
        if (getSelectedEc() != null) return List.of(getSelectedEc());

        return apiUserDetailsService.getEcsFromDoc(getSelectedDoc());
    }

    public void userSelectFirstEcAndAccess() {
        PageField allEcDetails = pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe");
        PageField firstEcFromDropdown = allEcDetails.getAllPageField().get(0);

        if (!firstEcFromDropdown.elementIsVisibleRightNow()) {
            openFirstDropdown();
        }
        firstEcFromDropdown.click();

        storeNameAndEc();

        clickAccessAndWaitClose();
    }
}
