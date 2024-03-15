package com.fiserv.qabrazil.pages;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.dto.ReportDto;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.Identifier;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.testng.AssertJUnit.*;

@ScenarioComponent
@Component("Relatórios")
public class ReportsPage extends CheckedBasePage {

    private static final Logger log = LoggerFactory.getLogger(ReportsPage.class);

    @Autowired
    private Paginator paginator;

    private Pair<String, Download> download;

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
            String cellFileTypeId = getQuerySelector("Relatórios - Item - Tipo Relatório");
            String cellRequestedInId = getQuerySelector("Relatórios - Item - Solicitado Em");
            String cellReportRangeId = getQuerySelector("Relatórios - Item - Período");

            List<Locator> cellsFileName = page.locator(cellFileNameId).all();
            List<Locator> cellsDocument = page.locator(cellDocumentId).all();
            List<Locator> cellsReportType = page.locator(cellFileTypeId).all();
            List<Locator> cellsRequestedIn = page.locator(cellRequestedInId).all();
            List<Locator> cellsReportRange = page.locator(cellReportRangeId).all();

            for (int i = 0; i < cellsFileName.size(); i++) {
                reports.add(new ReportDto()
                        .setName(cellsFileName.get(i).textContent())
                        .setDocument(cellsDocument.get(i).textContent())
                        .setReportType(cellsReportType.get(i).textContent())
                        .setRequestedIn(cellsRequestedIn.get(i).textContent())
                        .setRange(cellsReportRange.get(i).textContent())
                );
            }

        });

        return reports;
    }

    public boolean downloadIconIsDownArrow(Identifier identifier) {
        List<Locator> icons = page.locator(identifier.selector()).locator("i.fa-arrow-down").all();
        return icons.stream().allMatch(Locator::isVisible);
    }

    public boolean theDownloadOfTheReportStarted() {
        return download != null;
    }

    public void clickOnTheFirstDownloadButton() {
        String fileNameTestId = Identifier.from("Relatórios - Item - Nome Arquivo").selector();
        String downloadTestId = Identifier.from("Relatórios - Botão Download Ok").testId();

        List<Locator> downloadCells = getAllDownloadCells();
        List<Locator> fileNames = page.locator(fileNameTestId).all();

        for (int i = 0; i < fileNames.size(); i++) {
            Locator icon = downloadCells.get(i);

            if(isDownloadAvailable(icon, downloadTestId)) {
                downloadReport(icon, fileNames.get(i));
                break;
            }
        }
    }

    private void downloadReport(Locator icon, Locator fileName) {
        Download file = page.waitForDownload(icon::click);

        download = Pair.of(fileName.textContent(), file);
    }

    private static boolean isDownloadAvailable(Locator icon, String downloadTestId) {
        return icon.getAttribute("data-testid").equals(downloadTestId);
    }

    public boolean theFirstNameOfTheReportIsEqualToTheFirstReportDownloaded() {
        if(download == null) {
            fail("Couldn't compare the download file name with the listed one. No download found.");
        }

        String listedFileName = download.getKey();
        String downloadedFileName = download.getValue().suggestedFilename();

        log.info("Comparing reports:");
        log.info("Report in the table: {}", listedFileName);
        log.info("Actual downloaded file name: {}", downloadedFileName);
        return listedFileName.equals(downloadedFileName);
    }

    public void selectYesterday() {
        pageField.from("Modal Gerar Relatórios - Select Período").click();
        List<Locator> calendarDays = page.locator(getQuerySelector("Modal Gerar Relatórios - Dia Calendário")).all();
        String yesterday = DateUtil.yesterdayInFormatMonthNameAndDayAndYear();

        Locator yesterdayElement = calendarDays.stream()
                .filter(d -> d.getAttribute("aria-label").equalsIgnoreCase(yesterday) && d.isVisible())
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Could not find any element containing the date %s in the calendar".formatted(yesterday)));

        log.info("Selecting yesterday in calendar: {}", yesterday);
        yesterdayElement.dblclick();
    }

    public ReportDto getFirstReportInTable() {
        PageField cellFileName = pageField.from("Relatórios - Item - Nome Arquivo").firstOf();
        PageField cellDocument = pageField.from("Relatórios - Item - Documento").firstOf();
        PageField cellReportType = pageField.from("Relatórios - Item - Tipo Relatório").firstOf();
        PageField cellRequestedIn = pageField.from("Relatórios - Item - Solicitado Em").firstOf();
        PageField cellReportRange = pageField.from("Relatórios - Item - Período").firstOf();

        return new ReportDto()
                .setName(cellFileName.getAsText())
                .setDocument(cellDocument.getAsText())
                .setReportType(cellReportType.getAsText())
                .setRequestedIn(cellRequestedIn.getAsText())
                .setRange(cellReportRange.getAsText());
    }

    public String downloadIconOfFirstReportTestId() {
        List<Locator> downloadCells = getAllDownloadCells();

        if (downloadCells.isEmpty()) {
            fail("Couldn't find any download cells in table");
        }

        return downloadCells.get(0).getAttribute("data-testid");
    }

    private List<Locator> getAllDownloadCells() {
        String downloadTestId = Identifier.from("Relatórios - Botão Download Ok").testId();
        String failTestId = Identifier.from("Relatórios - Botão Download Falha").selector();
        String waitingTestId = Identifier.from("Relatórios - Botão Download Aguardando").selector();

        return page.getByTestId(downloadTestId)
                .or(page.locator(waitingTestId))
                .or(page.locator(failTestId))
                .all();
    }

    public void downloadFirstReportOfType(String type, String extention) {
        Locator report = getFirstReportAvailableForDownloadOfTypeAndFiletype(type, extention);

        if(report == null) {
            fail("Nenhum relatório do tipo \"%s\" e formato \"%s\" encontrado".formatted(type, extention));
        }

        Download file = page.waitForDownload(report::click);
        download = Pair.of(file.suggestedFilename(), file);
    }

    public boolean thereAreReportsAvailableForDownloadOfTypeAndFiletype(String type, String extention) {
        return getFirstReportAvailableForDownloadOfTypeAndFiletype(type, extention) != null;
    }

    private Locator getFirstReportAvailableForDownloadOfTypeAndFiletype(String type, String extention) {
        List<Locator> downloadButtons = getAllDownloadCells();
        List<PageField> reportsTypes = pageField.from("Relatórios - Item - Tipo Relatório").getAllPageField();
        List<PageField> reportsFilenames = pageField.from("Relatórios - Item - Nome Arquivo").getAllPageField();

        for (int i = 0; i < reportsTypes.size(); i++) {
            if(isOfType(type, reportsTypes.get(i))
                    && isOfFiletype(extention, reportsFilenames.get(i))
                    && isDownloadIcon(downloadButtons.get(i))) {
                return downloadButtons.get(i);
            }
        }

        return null;
    }

    private boolean isOfFiletype(String filetype, PageField report) {
        return report.getAsText().endsWith(filetype);
    }

    private static boolean isOfType(String type, PageField report) {
        return report.getAsText().equals(type);
    }

    private static boolean isDownloadIcon(Locator button) {
        String downloadTestId = TestIdsConfig.getTestId("Relatórios - Botão Download Ok");
        return button.getAttribute("data-testid").equals(downloadTestId);
    }

    private CSVWrapper getDownloadAsCSV() throws Exception {
        if (download.getValue() == null) {
            throw new RuntimeException("Não foi possível salvar o arquivo para validação");
        }

        Download file = download.getValue();
        return new CSVWrapper(file.createReadStream());
    }

    public void validateDownloadedCSVFileHasColumnContainingSalesInstallments() throws Exception {
        String column = "Parcelas";
        CSVWrapper csvReader = getDownloadAsCSV();
        List<String> salesInstallments = csvReader.getColumnsAsText(column);

        log.info("Validating the following elements of column {}", column);

        salesInstallments.forEach(this::installmentIsCorrect);
    }

    private void installmentIsCorrect(String s) {
        if (StringUtils.isEmpty(s)) return;

        String[] installments = s.split(" de ");

        try {
            int current = Integer.parseInt(installments[0]);
            int amount = Integer.parseInt(installments[1]);

            if(current > amount) {
                fail("Parcela atual deveria ser menor ou igual ao total de parcelas. Valor do campo: <%s>".formatted(s));
            }

        } catch (NumberFormatException e) {
            fail("Má formatação de Parcela: %s. O primeiro e último valor precisam ser números inteiros.");
        }
    }

    public String[] getCSVHeaderOfDownload() throws Exception {
        CSVWrapper csvReader = getDownloadAsCSV();
        return csvReader.getRow(0);
    }
}
