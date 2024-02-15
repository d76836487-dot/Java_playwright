package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class HeaderComponent {
    @Autowired
    Page page;

    public void selectShowValuesButton(boolean show) {
        // TODO: trocar por data-testid
        Locator button = page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Ocultar valores"));
        String innerHtml = button.innerHTML();
        int numberOfTagsWithPath = innerHtml.split("<path").length - 1;

        if (show && numberOfTagsWithPath > 1) button.click();
        if (!show && numberOfTagsWithPath <= 1) button.click();
    }
}
