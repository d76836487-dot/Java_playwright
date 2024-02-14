package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.Locator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
@Component("Relatórios")
public class ReportsPage extends CheckedBasePage {

    private static final Logger log = LoggerFactory.getLogger(ReportsPage.class);

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
        String linkTo = getQuerySelector("Menu Lateral - Relatórios");
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
        return waitUntilTrue(20, () ->
                page.locator(getQuerySelector("Relatórios - Tabela Linha - Nome Arquivo")).count() > 0);
    }

    public void tableHasColumns(String[] columns) {
        // TODO: change once we have testids
        Locator theads = page.locator("table th");
        assertThat(theads).hasCount(columns.length);
        assertThat(theads).hasText(columns);
    }

    public void userWillSeeTheReportNameHavingCorrectFormat() {
        paginator.forEach(() -> {
            String cellFileNameIds = getQuerySelector("Relatórios - Tabela Linha - Nome Arquivo");
            String cellFileTypeIds = getQuerySelector("Relatórios - Tabela Linha - Tipo Arquivo");

            List<Locator> cellFileNames = page.locator(cellFileNameIds).all();
            List<Locator> cellFileTypes = page.locator(cellFileTypeIds).all();

            for (int i = 0; i < cellFileNames.size(); i++) {
                String fileType = cellFileTypes.get(i).textContent();
                assertThat(cellFileNames.get(i)).containsText(getNamePattern(fileType));
            }
        });
    }

    private Pattern getNamePattern(String reportType) {
        String startDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String endDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String fileExt = ".[a-z]+";

        return Pattern.compile(contractConfig.getAllianceName() + "_" + reportType + "_" + startDate + "_" + endDate + fileExt);
    }
}
