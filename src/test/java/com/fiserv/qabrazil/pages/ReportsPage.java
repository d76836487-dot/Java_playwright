package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.dto.ReportDto;
import com.fiserv.qabrazil.util.Identifier;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import jakarta.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
@Component("Relatórios")
public class ReportsPage extends CheckedBasePage {

    private static final Logger log = LoggerFactory.getLogger(ReportsPage.class);

    @Autowired
    private Paginator paginator;

    private final List<Download> downloads = new ArrayList<>();

    public ReportsPage() {
        super(Pattern.compile("^.*/Relatorios$"));
    }

    @PostConstruct
    public void init() {
        page.onDownload(downloads::add);
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
                page.locator(getQuerySelector("Relatórios - Item - Nome Arquivo")).count() > 0);
    }

    public boolean areAnyReportsInTableAvailbleForDownload() {
        return waitUntilTrue(20, () ->
                page.locator(getQuerySelector("Relatórios - Botão Download Ok")).count() > 0);
    }

    public void tableHasColumns(String[] columns) {
        // TODO: change once we have testids
        Locator theads = page.locator("table th");
        assertThat(theads).hasCount(columns.length);
        assertThat(theads).hasText(columns);
    }

    public List<ReportDto> getAllReports() {
        List<ReportDto> reports = new ArrayList<>();

        paginator.forEach(() -> {
            String cellFileNameId = getQuerySelector("Relatórios - Item - Nome Arquivo");
            String cellDocumentId = getQuerySelector("Relatórios - Item - Documento");
            String cellFileTypeId = getQuerySelector("Relatórios - Item - Tipo Arquivo");
            String cellRequestedInId = getQuerySelector("Relatórios - Item - Solicitado Em");
            String cellReportRangeId = getQuerySelector("Relatórios - Item - Período");

            List<Locator> cellsFileName = page.locator(cellFileNameId).all();
            List<Locator> cellsDocument = page.locator(cellDocumentId).all();
            List<Locator> cellsFileType = page.locator(cellFileTypeId).all();
            List<Locator> cellsRequestedIn = page.locator(cellRequestedInId).all();
            List<Locator> cellsReportRange = page.locator(cellReportRangeId).all();

            for (int i = 0; i < cellsFileName.size(); i++) {
                reports.add(new ReportDto()
                        .setName(cellsFileName.get(i).textContent())
                        .setDocument(cellsDocument.get(i).textContent())
                        .setFileType(cellsFileType.get(i).textContent())
                        .setRequestedIn(cellsRequestedIn.get(i).textContent())
                        .setRange(cellsReportRange.get(i).textContent())
                );

            }
        });

        return reports;
    }

    public boolean downloadIconIsDownArrow(Identifier identifier) {
        List<Locator> icons = page.locator(identifier.selector() + " i.fa-arrow-down").all();
        return icons.stream().allMatch(Locator::isVisible);
    }

    public boolean theDownloadOfTheReportStarted() {
        log.info("Number of downloads initialized in this test: {}", downloads.size());
        log.info("Being: {}", downloads.stream().map(Download::suggestedFilename).collect(Collectors.joining()));
        return downloads.size() == 1;
    }

    public void clickOnTheFirstDownloadButton() {
        String testId = Identifier.from("Relatórios - Botão Download Ok").selector();
        Locator button = page.locator(testId).first();
        button.click();
    }

    public boolean theFirstNameOfTheReportIsEqualToTheFirstReportDownloaded() {
        String testId = Identifier.from("Relatórios - Item - Nome Arquivo").selector();
        Locator fileName = page.locator(testId).first();

        String listedFileName = fileName.textContent();
        String downloadedFileName = downloads.get(0).suggestedFilename();

        log.info("Comparing reports:");
        log.info("Report in the table: {}", listedFileName);
        log.info("Actual downloaded file name: {}", downloadedFileName);
        return downloads.size() == 1 && listedFileName.equals(downloadedFileName);
    }
}
