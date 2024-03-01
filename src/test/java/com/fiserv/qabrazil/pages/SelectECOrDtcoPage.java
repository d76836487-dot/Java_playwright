package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.util.List;

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
}
