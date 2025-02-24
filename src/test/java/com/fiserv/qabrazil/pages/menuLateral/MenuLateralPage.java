package com.fiserv.qabrazil.pages.menuLateral;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
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
    private Locator menuRecebimentos;
    private Locator subMenuRecebimentosResumo;
    private Locator menuAntecipacao;

    @PostConstruct
    private void loadLocators() {
        this.menuInicio = page.locator("//*[@data-testid='menu-home']");
        this.menuVendas = page.locator("//*[@data-testid='menu-vendas']");
        this.subMenuRelatorioVendas = page.locator("//*[@data-testid='menu-relatorio-vendas']");
        this.menuRecebimentos = page.locator("//*[@data-testid='menu-recebimentos']");
        this.subMenuRecebimentosResumo = page.locator("//*[@data-testid='menu-recebimentos-resumo']");
        this.menuAntecipacao = page.locator("//*[@data-testid='menu-antecipacao']");
    }

    private void verificarMenuSubmenuClick(Locator menuSubmenu) {
        if (menuSubmenu.isVisible()) {
            menuSubmenu.hover();
            menuSubmenu.click();
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
        } else if (menu.equalsIgnoreCase("recebimentos")) {
            this.verificarMenuSubmenuClick(this.menuRecebimentos);

            if (subMenu.equalsIgnoreCase("resumoRecebimentos")) {
                this.verificarMenuSubmenuClick(this.subMenuRecebimentosResumo);
            }
        } else if (menu.equalsIgnoreCase("antecipacao")) {
            this.verificarMenuSubmenuClick(this.menuAntecipacao);
        }
    }
}