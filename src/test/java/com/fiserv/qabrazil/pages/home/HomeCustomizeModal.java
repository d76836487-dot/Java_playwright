package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

@ScenarioComponent
public class HomeCustomizeModal extends BasePage {

    public void hasOptions(String ...expectedOptions) {
        // TODO: change for data-testid
        List<String> foundOptions = page
                .locator(".container-atalhos")
                .locator(".fundo-branco")
                .allTextContents();

        assertThat(expectedOptions)
                .withFailMessage("Opções esperadas %s são diferentes da encontrada %s".formatted(expectedOptions, foundOptions))
                .hasSameSizeAs(foundOptions);
        for(String option: expectedOptions) {
            assertThat(foundOptions)
                    .withFailMessage("Não encontrei a opção %s na modal Personalização da Home".formatted(option))
                    .contains(option);
        }
    }

    public void select(String identifier) {
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
        selector.check();
        pageField.from("Home - personalizar - botão confirmar").click();
    }
}
