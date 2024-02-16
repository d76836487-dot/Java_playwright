package com.fiserv.qabrazil.pages;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.Locator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.testng.AssertJUnit.assertTrue;
import static org.testng.AssertJUnit.fail;

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

    public void userWillSeeTheReportListingContainingCorrectValues(List<String> ecs) {
        paginator.forEach(() -> {
            String cellFileNameId = getQuerySelector("Relatórios - Tabela Linha - Nome Arquivo");
            String cellDocumentId = getQuerySelector("Relatórios - Tabela Linha - Documento");
            String cellFileTypeId = getQuerySelector("Relatórios - Tabela Linha - Tipo Arquivo");
            String cellRequestedInId = getQuerySelector("Relatórios - Tabela Linha - Solicitado Em");
            String cellReportRangeId = getQuerySelector("Relatórios - Tabela Linha - Período");

            List<Locator> cellsFileName = page.locator(cellFileNameId).all();
            List<Locator> cellsDocument = page.locator(cellDocumentId).all();
            List<Locator> cellsFileType = page.locator(cellFileTypeId).all();
            List<Locator> cellsRequestedIn = page.locator(cellRequestedInId).all();
            List<Locator> cellsReportRange = page.locator(cellReportRangeId).all();


            for (int i = 0; i < cellsFileName.size(); i++) {
                fileTypeIsCorrect(cellsFileType.get(i));
                documentIsCorrect(cellsDocument.get(i), ecs);
                requestedInIsCorrect(cellsRequestedIn.get(i));
                reportRangeIsCorrect(cellsReportRange.get(i));
                fileNameIsCorrect(cellsFileName.get(i), cellsFileType.get(i));
            }
        });
    }

    private void reportRangeIsCorrect(Locator locator) {
        String[] texts = locator.textContent().split(" ");

        if(rangeHasCorrectFormat(texts)) return;

        fail("O período \"" + locator.textContent() +  "\" não está no formato correto");
    }

    private boolean rangeHasCorrectFormat(String[] texts) {
        if (texts.length != 3
                && !DateUtil.isInFormat("dd/MM/yyyy", texts[0])
                && !DateUtil.isInFormat("dd/MM/yyyy", texts[2])) {
            return false;
        }

        LocalDate dateFrom = DateUtil.toLocalDate(texts[0], "dd/MM/yyyy");
        LocalDate dateTo = DateUtil.toLocalDate(texts[2], "dd/MM/yyyy");

        return dateFrom.isBefore(dateTo);
    }

    private void requestedInIsCorrect(Locator locator) {
        String[] texts = locator.textContent().split(" ");

        if(requestedInHasCorrectFormat(texts)) return;

        fail("A data \"" + locator.textContent() +  "\" na coluna \"Solicitado Em\" não está no formato dd/MM/yyyy às hh:mm");
    }

    private boolean requestedInHasCorrectFormat(String[] texts) {
        return texts.length == 3
                && DateUtil.isInFormat("dd/MM/yyyy", texts[0])
                && Pattern.matches("\\d{2}:\\d{2}", texts[2]);
    }

    private void documentIsCorrect(Locator locator, List<String> ecs) {
        String documentText = locator.textContent();
        assertTrue(ecs.contains(documentText));
    }

    private void fileNameIsCorrect(Locator fileName, Locator fileType) {
        String fileTypeText = fileType.textContent();
        assertThat(fileName).containsText(getNamePattern(fileTypeText));
    }

    private static void fileTypeIsCorrect(Locator fileTypeCell) {
        final String message = String.format("Tipo do arquivo \"%s\" é diferente de \"Vendas\" e \"Pagamentos\"", fileTypeCell);
        final List<String> allowedFileTypes = List.of("Vendas", "Pagamentos");
        assertTrue(message, allowedFileTypes.contains(fileTypeCell.textContent()));
    }

    private Pattern getNamePattern(String reportType) {
        String startDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String endDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String fileExt = ".[a-z]+";

        return Pattern.compile(contractConfig.getAllianceName() + "_" + reportType + "_" + startDate + "_" + endDate + fileExt);
    }
}
