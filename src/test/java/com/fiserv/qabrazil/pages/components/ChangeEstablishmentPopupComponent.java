package com.fiserv.qabrazil.pages.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class ChangeEstablishmentPopupComponent extends BasePage {
    public boolean waitPopupOpen() {
        return waitUntilTrue(6, () -> page.locator(".popup-content").isVisible());
    }

    public boolean waitPopupClose() {
        return waitUntilTrue(6, () -> !page.locator(".popup-content").isVisible());
    }

    public int numberOfElementsWithText(String textLookingFor) {
        return page.locator(".popup-content")
                .locator("//span[text()='%s']".formatted(textLookingFor))
                .count();
    }

    public void openPopupChangeEstablishment() {
        pageField.from("Negócios - Botão Trocar Estabelecimento").click();
        waitUntilTrue(() -> !hasLoadingOverlay());
    }
}
