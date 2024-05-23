package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;


@ScenarioComponent
@Component("Vendas")
public class SalesPages extends CheckedBasePage {
    public SalesPages() {
        super(Pattern.compile("^.*/Vendas$"));
    }

    public void navigateTo() {
        String linkTo = getQuerySelector("Menu Lateral - Vendas");
        page.locator(linkTo).last().click();
        waitUntilTrue(this::hasNoLoadingBars);
    }

    public void ao_clicar_no_menu_lateral(String arg0) {
        Locator locator = page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName(arg0));
        locator.click();
    }



    public void verifica_se_a_pagina_carregou_com_sucesso(String string) {
        checkItemsMenu(string);
    }

    public void ele_deve_ver_as_informações_de_vendas_atuais_incluindo_abas_para_e(String string, String string2, String string3, String string4, String string5) {
        checkItemstabs(string,string2,  string3,  string4,  string5);
    }

    private boolean checkItemsMenu(String arg0){
        Locator userHasOnlyItem1 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(arg0)).locator("span");
        waitUntilTrue(() -> userHasOnlyItem1.isVisible());
        return userHasOnlyItem1.isVisible();
    }
    private boolean checkItemstabs(String string, String string2, String string3, String string4, String string5){
        Locator userHasOnlyItem1 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(string)).locator("span");
        Locator userHasOnlyItem2 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(string2)).locator("span");
        Locator userHasOnlyItem3 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(string3)).locator("span");
        Locator userHasOnlyItem4 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(string4)).locator("span");
        Locator userHasOnlyItem5 = page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName(string5)).locator("span");


        waitUntilTrue(() -> userHasOnlyItem1.isVisible() ||userHasOnlyItem2.isVisible()  ||userHasOnlyItem3.isVisible()  ||userHasOnlyItem4.isVisible()  ||userHasOnlyItem5.isVisible() );
        return userHasOnlyItem1.isVisible();
    }
}