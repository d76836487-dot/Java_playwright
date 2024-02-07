package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.Locator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
@Component("Relatórios")
public class ReportsPage extends CheckedBasePage {

    @Autowired
    private ContractConfig contractConfig;

    @Autowired
    private Paginator paginator;

    public ReportsPage() {
        super(Pattern.compile("^.*/Relatorios$"));
    }

    public void ensureWeAreAtReportsPage() {
        page.waitForURL(Pattern.compile("^.*/Relatorios$"));
    }

    public void navigateTo() {
        // TODO: fix when we have data-testid
        String linkTo = TestIdsConfig.getQuerySelector("Menu Lateral - Relatórios");
        page.locator(linkTo).last().click();
        page.waitForURL(Pattern.compile("^.*/Relatorios$"));
    }

    public void ensureIsNotInReportsPage() {
        if(page.url().contains("/Relatorios"))
            goTo(toUrl("/Home"));
    }

    public boolean thereAreReportsExtracted() {
        return paginator.anyMatch(this::areAnyReportsInTable);
    }

    public boolean areAnyReportsInTable() {
        // TODO: fix when we have data-testid
        Locator tableRows = page.locator("table tr");

        return waitUntilTrue(() -> tableRows.count() > 0);
    }

    public void tableHasColumns(String[] columns) {
        // TODO: change once we have testids
        Locator theads = page.locator("table th");
        assertThat(theads).hasCount(columns.length);
        assertThat(theads).hasText(columns);
    }

}
