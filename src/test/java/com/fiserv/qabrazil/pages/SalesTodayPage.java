package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.microsoft.playwright.Locator;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
@Component("Vendas Hoje")
public class SalesTodayPage extends CheckedBasePage {

    public SalesTodayPage() {
        super(Pattern.compile("^.*/Hoje$"));
    }

    @Autowired
    private Paginator paginator;

    public void navigateTo() {
        getLateralMenuLocator().click();
        page.waitForURL(Pattern.compile("^.*/Hoje$"));
    }

    public void hoverMenuOnSalesMenu() {
        getLateralMenuLocator().hover();
    }


    private Locator getLateralMenuLocator() {
        return page.getByTestId("menu-vendas").last();
    }

    public boolean thereAreSalesWithStatus(String salesStatus) {
        return thereAreSalesWith(salesStatus, "vendas-hoje-coluna-status\\d");
    }

    public boolean thereAreSalesWithBrandName(String brandName) {
        return thereAreSalesWith(brandName, "vendas-hoje-coluna-bandeira");
    }
    public boolean thereAreSalesWith(String textLookingFor, String testId) {
        return paginator.anyMatch(() -> findSalesWithinPage(textLookingFor, testId));
    }

    private boolean findSalesWithinPage(String textLookingFor, String testId) {
        Locator salesStatusLabel = page.getByTestId(Pattern.compile(testId));
        return waitUntilTrue(2, () ->
                salesStatusLabel.filter(new Locator.FilterOptions().setHasText(textLookingFor)).count() > 0);
    }
}