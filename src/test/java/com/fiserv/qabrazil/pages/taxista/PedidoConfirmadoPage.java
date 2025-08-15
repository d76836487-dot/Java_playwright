package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class PedidoConfirmadoPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='$b19']/div[contains(text(), 'Pedido confirmado!')]");
    }

    public void verificarPedidoConfirmado() {
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);
    }
}