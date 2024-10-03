package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

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
        if (this.title.isVisible())
            assertTrue(true);
        else
            assertFalse(false);
    }
}