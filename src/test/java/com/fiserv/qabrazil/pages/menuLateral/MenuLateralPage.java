package com.fiserv.qabrazil.pages.menuLateral;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class MenuLateralPage {
    @Autowired
    private Page page;

    private Locator menuInicio;
    private Locator menuVendas;
    private Locator subMenuRelatorioVendas;

    @PostConstruct
    private void loadLocators() {
        this.menuInicio = page.locator("//*[@data-testid='menu-home']");
        this.menuVendas = page.locator("//*[@data-testid='menu-vendas']");
        this.subMenuRelatorioVendas = page.locator("//*[@data-testid='menu-relatorio-vendas']");
    }

    private void verificarMenuSubmenuClick(Locator elemento) {
        if (elemento.isVisible()) {
            elemento.hover();
            elemento.click();
        }
    }

    public void acessarMenuSubmenu(String menu, String subMenu) {
        if (menu.equalsIgnoreCase("inicio")) {
            this.verificarMenuSubmenuClick(this.menuInicio);
        } else if (menu.equalsIgnoreCase("vendas")) {
            this.verificarMenuSubmenuClick(this.menuVendas);

            if (subMenu.equalsIgnoreCase("relatorioVendas")) {
                this.verificarMenuSubmenuClick(this.subMenuRelatorioVendas);
            }
        }
    }
}