package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

@ScenarioComponent
public class SelectECOrDtcoPage extends BasePage {

    public boolean tabEstablishmentIsSelected() {
        Locator button = pageField
                .from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento")
                .getLocator();
        return button.getAttribute("aria-checked").equals("true");
    }

    public void openFirstDropdown() {
        Locator nameEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Nome Estabelecimento")
                .getLocator();

        nameEstablishment.first().click();
    }
}
