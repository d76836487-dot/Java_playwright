package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.retryUntilTrue;

@ScenarioComponent
public class SalesHistoryPage extends BasePage {
    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Histórico de vendas")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/HistoricodeVendas.*$"));
    }

    public void selectLastMonth() {
        retryUntilTrue(() -> page.getByLabel("toggle tooltip").getByRole(AriaRole.IMG).click(),
                () -> page.getByLabel("toggle tooltip").getByRole(AriaRole.IMG).isVisible());
        retryUntilTrue(() -> page.locator("div").filter(new Locator.FilterOptions().setHasText(Pattern.compile("^Mês Atual$"))).click(),
                () -> page.locator("div").filter(new Locator.FilterOptions().setHasText(Pattern.compile("^Mês Atual$"))).isVisible());
    }
}
