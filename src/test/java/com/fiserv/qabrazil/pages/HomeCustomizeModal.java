package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.ElementHandle;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@ScenarioComponent
public class HomeCustomizeModal extends BasePage {

    public void hasOptions(String ...options) {
        // TODO: trocar por data-testid
        List<ElementHandle> availableOptions = page.querySelectorAll(".container-atalhos .fundo-branco");
        assertThat(availableOptions)
                .hasSameSizeAs(options);
        for(int i = 0; i < options.length; ++i) {
            assertThat(availableOptions)
                    .element(i)
                    .extracting(ElementHandle::textContent)
                    .isEqualTo(options[i]);
        }
    }
}
