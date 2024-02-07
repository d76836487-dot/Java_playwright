package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.ElementHandle;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

@ScenarioComponent
public class HomeCustomizeModal extends BasePage {

    @Autowired
    CommonsPage commonsPage;

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

    public void select(String identifier) {
        String selector = TestIdsConfig.getQuerySelector("Home - personalizar - " + identifier);
        List<String> selectorList = TestIdsConfig.getAllQuerySelector("Home - personalizar -");
        Map<String, Boolean> checkMap = selectorList.stream()
                .collect(Collectors.toMap(x -> x, x -> page.isChecked(x)));

        Collections.shuffle(selectorList);
        for (String itemSelector : selectorList) {
            if (checkMap.get(itemSelector)) {
                page.uncheck(itemSelector);
                break;
            }
        }
        page.check(selector);
        commonsPage.clickButton("[data-testid=home-personalizar-btn-personalizar]");
    }
}
