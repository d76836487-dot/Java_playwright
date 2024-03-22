package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

@ScenarioComponent
public class HomeCustomizeModal extends BasePage {

    public void hasOptions(String ...expectedOptions) {
        // TODO: change for data-testid
        List<String> foundOptions = pageField.from("Home - personalizar - todos os itens")
                .getLocator()
                .locator("//../../../..")
                .allTextContents();

        assertThat(foundOptions).containsExactlyInAnyOrder(expectedOptions);
    }

    public boolean select(String identifier) {
        PageField selector = pageField.from("Home - personalizar - " + identifier);
        List<PageField> selectorList = pageField.allWithPrefix("Home - personalizar - item");
        Map<PageField, Boolean> checkMap = selectorList.stream()
                .filter(PageField::elementIsVisible)
                .collect(Collectors.toMap(x -> x, PageField::isChecked));

        Collections.shuffle(selectorList);
        for (PageField itemSelector : selectorList) {
            if (checkMap.containsKey(itemSelector) && checkMap.get(itemSelector)) {
                itemSelector.uncheck();
                break;
            }
        }

        if(!selector.elementIsVisibleRightNow()) {
            return false;
        }

        selector.check();
        pageField.from("Home - personalizar - botão confirmar").click();

        return true;
    }
}
