package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class HeaderComponent extends BasePage {
    public void selectShowValuesButton(boolean show) {
        PageField button = pageField.from("Header - Ocultar Valores");
        waitUntilTrue(button::elementIsVisibleRightNow);

        if (button.getLocator().getAttribute("status").equals("on") == show) return;

        button.click();
    }

    public void ensureAllHeaderElementsArePresent() {
        assertThat(pageField.from("Header - Logotipo")).isVisible();
        assertThat(pageField.from("Header - Ocultar Valores")).isVisible();
        assertThat(pageField.from("Header - Ajuda")).isVisible();
        assertThat(pageField.from("Header - Notificações")).isVisible();
        assertThat(pageField.from("Header - Sair")).isVisible();
    }
}
