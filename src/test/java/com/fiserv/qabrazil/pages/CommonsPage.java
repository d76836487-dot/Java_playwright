package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.util.Config;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage extends BasePage {
    @Autowired
    ContractConfig contractConfig;

    public  String retryLogin() {
        String Ret = "S";
        try {
            if (page.getByText("Não foi possivél acessar o canal neste momento. Tente novamente mais tarde.").isVisible()) {
                page.locator("data-testid=entrar").click();
                Ret = "";
            }

            if (page.getByText("CNPJ, CPF ou usuário").isVisible()) {
                Ret = "";
            }

            if (page.getByText("Personalize sua visualização").isVisible()) {
                Ret = "S";
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return Ret;
    }

    public String getButtonWithTextIfVisible(String buttonTitle) {
        return getWholeTextIfVisible(page.getByRole(AriaRole.BUTTON,
                new Page.GetByRoleOptions().setName(buttonTitle)));
    }

    public String getWholeTextIfVisible(Locator locator) {
        waitUntilTrue(9, () -> locator.count() == 1);

        if (!locator.isVisible()) {
            return "Not visible";
        }
        return locator.textContent();
    }

    public void navigateToRoot() {
        page.navigate(contractConfig.getActiveUserProfile().url());
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public void clickButtonWithText(String buttonText) {
        page.getByText(buttonText).click();
    }

    public boolean elementIsVisibleNoWait(String dataTestId) {
        Locator locator = page.getByTestId(dataTestId);
        return locator.count() > 0 && locator.isVisible();
    }

    public boolean lateralMenuHasExpandedContaining(String identifier) {
        String buttonId = TestIdsConfig.getQuerySelector(String.format("Menu Lateral - %s", identifier));
        Locator button = page.locator(buttonId).last();
        assertThat(button).isVisible();
        assertThat(button.getByText(identifier)).isVisible();
        return true;
    }

    public List<String> getAllDataTestIds(String testId) {
        Locator allLocator = page.getByTestId(Pattern.compile(testId));
        return allLocator.all().stream()
                .map(locator -> locator.getAttribute("data-testid"))
                .toList();
    }

    public void scroll(int deltaY) {
        page.mouse().wheel(0, deltaY);
    }

    public void scrollToBottom() {
        Integer result = (Integer) page.evaluate("document.body.scrollHeight");
        page.mouse().wheel(0, result);
    }

    public String getPrimaryColor(PageField pageField) {
        pageField.highlightIfPossible();
        return (String) pageField.getLocator().evaluate("node => window.getComputedStyle(node).getPropertyValue('color')");
    }

    public String getBackgroundColor(PageField pageField) {
        pageField.highlightIfPossible();
        return (String) pageField.getLocator().evaluate("node => window.getComputedStyle(node).getPropertyValue('background-color')");
    }

    public void clickOnMenu(String menu, String submenu, String thirdmenu) {

        if(menu.equals("Vendas")){

            page.locator("data-testid=menu-vendas").click();

            if(submenu.equals("Relatório de vendas")){

                page.getByRole(AriaRole.LINK,new Page.GetByRoleOptions().setName(submenu)).click();




            }

            if(submenu.equals("")){

                if(thirdmenu.equals("Histórico de vendas")){
                    page.getByRole(AriaRole.TAB, new Page.GetByRoleOptions().setName("Histórico de vendas")).click();
                }

                if(thirdmenu.equals("Voucher")){
                    page.getByRole(AriaRole.TAB, new Page.GetByRoleOptions().setName("Voucher")).click();
                }
            }

       }

        if(menu.equals("Recebimentos")){
            page.locator("data-testid=menu-recebimentos").click();
            if(submenu.equals("Agenda de Recebimento UR")){
                page.getByRole(AriaRole.LINK,new Page.GetByRoleOptions().setName(submenu)).click();
                if(thirdmenu.equals("histórico de vendas")){

                }
            }
        }


    }
}
