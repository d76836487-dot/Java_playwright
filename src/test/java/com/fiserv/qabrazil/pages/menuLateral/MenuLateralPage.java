package com.fiserv.qabrazil.pages.menuLateral;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent 
public class MenuLateralPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator menuInicio;
    private Locator menuVendas;
    private Locator subMenuRelatorioVendas;
    private Locator menuRecebimentos;
    private Locator subMenuRecebimentosResumo;
    private Locator menuAntecipacao;
    private Locator menuServicos;
    private Locator subMenuLinkPagamento;
    private Locator menuNegocio;

    @PostConstruct
    private void loadLocators() {
        this.menuInicio = page.locator("//*[@data-testid='menu-home']");
        this.menuVendas = page.locator("//*[@data-testid='menu-vendas']");
        this.subMenuRelatorioVendas = page.locator("//*[@data-testid='menu-relatorio-vendas']");
        this.menuRecebimentos = page.locator("//*[@data-testid='menu-recebimentos']");
        this.subMenuRecebimentosResumo = page.locator("//*[@data-testid='menu-recebimentos-resumo']");
        this.menuAntecipacao = page.locator("//*[@data-testid='menu-antecipacao']");
        this.menuServicos = page.locator("(//*[@data-testid='menu-servicos'])[2]");
        this.subMenuLinkPagamento = page.locator("(//*[@data-testid='menu-link-pagamento'])[2]");
        this.menuNegocio = page.locator("//*[@data-testid='menu-negocio']");
    }

    private void verificarMenuSubmenuClick(Locator menuSubmenu) {
        if (menuSubmenu.isVisible()) {
            menuSubmenu.hover();
            menuSubmenu.click();
            assertThat(menuSubmenu).isVisible();
        }
    }

    public void acessarMenu(String menu) {
        if (menu.equalsIgnoreCase("Serviços"))
            this.verificarMenuSubmenuClick(this.menuServicos);
    }

    public void acessarMenuSubmenu(String menu, String subMenu) {
        if (menu.equalsIgnoreCase("inicio")) {
            this.verificarMenuSubmenuClick(this.menuInicio);
        } else if (menu.equalsIgnoreCase("Vendas")) {
            this.verificarMenuSubmenuClick(this.menuVendas);

            if (subMenu.equalsIgnoreCase("Relatório de vendas"))
                this.verificarMenuSubmenuClick(this.subMenuRelatorioVendas);
        } else if (menu.equalsIgnoreCase("recebimentos")) {
            this.verificarMenuSubmenuClick(this.menuRecebimentos);

            if (subMenu.equalsIgnoreCase("resumoRecebimentos"))
                this.verificarMenuSubmenuClick(this.subMenuRecebimentosResumo);
        } else if (menu.equalsIgnoreCase("antecipacao"))
            this.verificarMenuSubmenuClick(this.menuAntecipacao);
        else if (menu.equalsIgnoreCase("negocio"))
            this.verificarMenuSubmenuClick(this.menuNegocio);
    }

    public void validarOcultacaoSubmenu(String subMenu) {
        if (subMenu.equalsIgnoreCase("Link de pagamento"))
            waitIsNotVisibleForSeconds(this.subMenuLinkPagamento, Config.WAIT_5_SECONDS);
    }
}