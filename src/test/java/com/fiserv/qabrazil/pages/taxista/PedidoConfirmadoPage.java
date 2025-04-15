package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class PedidoConfirmadoPage {
    @Autowired
    private Page page;

    private Locator title;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='$b19']/div[contains(text(), 'Pedido confirmado!')]");
    }

    public void verificarPedidoConfirmado() {
        GeneralUtils.waitForMillis(Config.wait_for_seconds(3));
        assertThat(title).isVisible();
    }
}