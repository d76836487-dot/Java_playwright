package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
@Component("Negocio")
public class BusinessPage extends CheckedBasePage {
    public BusinessPage() {
        super(Pattern.compile("^.*/Negocio$"));
    }

    public void navigateTo() {
        String linkTo = getQuerySelector("Menu Lateral - Negócio");
        page.locator(linkTo).last().click();
        page.waitForURL(Pattern.compile("^.*/Negocio$"));
        closeAllPopups();
        waitUntilTrue(this::hasNotLoadingOverlay);
    }

}
