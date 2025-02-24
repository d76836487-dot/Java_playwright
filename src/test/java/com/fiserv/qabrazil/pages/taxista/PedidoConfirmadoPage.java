package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;

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
        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));

        assertThat(title).isVisible();
    }
}