package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Identifier;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class HeaderComponent {
    @Autowired
    Page page;
    @Autowired
    private ContractConfig contractConfig;

    public void selectShowValuesButton(boolean show) {
        Locator button = page.getByTestId(Identifier.from("Header - Ocultar Valores").testId());
        if (button.getAttribute("status").equals("on") == show) return;

        button.click();
    }

    public void selectAllDocuments() {
        Locator changeButton = PageField.from("Header - Trocar Estabelecimento").getLocator();
        if (noDocumentHasBeenSelected(changeButton)) return;

        changeButton.click();
        PageField.from("Header - Trocar Estabelecimento - Modal - Todos").click();
        PageField.from("Header - Trocar Estabelecimento - Modal - Padrao").click();

        startMonitoringRequests(page, contractConfig);
        PageField.from("Header - Trocar Estabelecimento - Modal - Acessar").click();
        ensureNoFlyingRequests();
    }

    private static boolean noDocumentHasBeenSelected(Locator button) {
        return button.textContent().replaceAll("\\D", "").isEmpty();
    }
}
