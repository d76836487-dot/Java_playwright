package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
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
        PageField selector = PageField.from("Home - personalizar - " + identifier);
        List<PageField> selectorList = PageField.allWithPrefix("Home - personalizar - item");
        Map<PageField, Boolean> checkMap = selectorList.stream()
                .collect(Collectors.toMap(x -> x, PageField::isChecked));

        Collections.shuffle(selectorList);
        for (PageField itemSelector : selectorList) {
            if (checkMap.get(itemSelector)) {
                itemSelector.uncheck();
                break;
            }
        }
        selector.check();
        PageField.from("Home - personalizar - botão confirmar").click();
    }
}
