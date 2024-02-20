package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Identifier;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class HeaderComponent {
    @Autowired
    Page page;

    public void selectShowValuesButton(boolean show) {
        Locator button = page.getByTestId(Identifier.from("Header - Ocultar Valores").testId());
        String innerHtml = button.innerHTML();
        int numberOfTagsWithPath = innerHtml.split("<path").length - 1;

        if (show && numberOfTagsWithPath > 1) button.click();
        if (!show && numberOfTagsWithPath <= 1) button.click();
    }
}
