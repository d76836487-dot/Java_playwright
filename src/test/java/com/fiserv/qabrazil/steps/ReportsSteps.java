package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.dto.ReportDto;
import com.fiserv.qabrazil.pages.ReportsPage;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertTrue;
import static org.testng.AssertJUnit.fail;

public class ReportsSteps {

    @Autowired
    private ContractConfig contractConfig;

    @Autowired
    ApiUserDetailsService apiUserDetailsService;

    @Autowired
    ReportsPage reportsPage;

    @Then("será direcionado para a jornada de Relatórios")
    public void shouldBeAtReportsPage() {
        reportsPage.ensureWeAreAtReportsPage();
    }

    @Given("Existem relatórios já extraídos disponíveis para download")
    public void thereAreReportsExtractedAvailableForDownload() {
        assumeThat(reportsPage.areAnyReportsInTableAvailbleForDownload()).isTrue();
    }

    @Given("Usuário acessa página de Relatórios( através do menu lateral)")
    public void userGoesToReportsPage() {
        reportsPage.navigateTo();
    }

    @Given("Usuário não está na página de Relatórios")
    public void userIsNotInReportsPage() {
        reportsPage.ensureIsNotInReportsPage();
    }

    @Given("Existem relatórios já extraídos")
    public void thereAreReportsExtracted() {
        assumeThat(reportsPage.thereAreReportsExtracted()).isTrue();
    }

    @Then("Usuário visualizará as {csv} na tabela")
    public void userWillSeeTheseColumnsInTheTable(String[] columns) {
        reportsPage.tableHasColumns(columns);
    }

    @Then("Usuário visualizará a listagem do relatório com valores corretos")
    public void userWillSeeTheReportListingContainingCorrectValues() throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();
        List<ReportDto> reports = reportsPage.getAllReports();

        reports.forEach(report -> {
            fileTypeIsCorrect(report.getFileType());
            documentIsCorrect(report.getDocument(), ecs);
            requestedInIsCorrect(report.getRequestedIn());
            reportRangeIsCorrect(report.getRange());
            fileNameIsCorrect(report.getName(), report.getFileType());
        });
    }

    @Then("botão download possui ícone com seta para baixo")
    public void hasIconWithDownArrow() {
        Identifier button = Identifier.from("Relatórios - Botão Download Ok");
        assertTrue("Ícone de download não identificado", reportsPage.downloadIconIsDownArrow(button));
    }

    private static void fileTypeIsCorrect(String fileType) {
        final String message = String.format("Tipo do arquivo \"%s\" é diferente de \"Vendas\" e \"Pagamentos\"", fileType);
        final List<String> allowedFileTypes = List.of("Vendas", "Pagamentos");
        assertTrue(message, allowedFileTypes.contains(fileType));
    }

    private void documentIsCorrect(String documentText, List<String> ecs) {
        List<String> allowedDocuments = new ArrayList<>(ecs);
        allowedDocuments.add("Todos os estabelecimentos");
        assertTrue(allowedDocuments.contains(documentText));
    }

    private void requestedInIsCorrect(String requestedIn) {
        String[] texts = requestedIn.split(" ");

        if(requestedInHasCorrectFormat(texts)) return;

        fail("A data \"" + requestedIn +  "\" na coluna \"Solicitado Em\" não está no formato dd/MM/yyyy às hh:mm");
    }

    private boolean requestedInHasCorrectFormat(String[] texts) {
        return texts.length == 3
                && DateUtil.isInFormat("dd/MM/yyyy", texts[0])
                && Pattern.matches("\\d{2}:\\d{2}", texts[2]);
    }

    private void reportRangeIsCorrect(String range) {
        String[] texts = range.split(" ");

        if(rangeHasCorrectFormat(texts)) return;

        fail("O período \"" + range +  "\" não está no formato correto");
    }

    private boolean rangeHasCorrectFormat(String[] texts) {
        if (texts.length != 3
                && !DateUtil.isInFormat("dd/MM/yyyy", texts[0])
                && !DateUtil.isInFormat("dd/MM/yyyy", texts[2])) {
            return false;
        }

        LocalDate dateFrom = DateUtil.toLocalDate(texts[0], "dd/MM/yyyy");
        LocalDate dateTo = DateUtil.toLocalDate(texts[2], "dd/MM/yyyy");

        return dateFrom.isBefore(dateTo) || dateFrom.isEqual(dateTo);
    }

    private void fileNameIsCorrect(String fileName, String fileType) {
        assertTrue("O nome do arquivo não segue o padrão NOMEALIANÇA_TipoDoArquivo_dd-mm-yyyy_dd-mm-yyyy",
                Pattern.matches(getNamePattern(fileType), fileName));
    }


    private String getNamePattern(String reportType) {
        String startDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String endDate = "(\\d{2})-(\\d{2})-(\\d{4})";
        String fileExt = ".[a-z]+";

        return contractConfig.getActiveUserProfile().allianceName() + "_" + reportType + "_" + startDate + "_" + endDate + fileExt;
    }

    @Then("o download do relatório começará")
    public void theDownloadOfTheReportStarted() {
        assertTrue("O Download do relatório não iniciou como esperado",
                reportsPage.theDownloadOfTheReportStarted());
    }

    @When("tenta baixar o primeiro relatório ao clicar no ícone de download")
    public void userTriesToDownloadTheFirstReport() {
        reportsPage.clickOnTheFirstDownloadButton();
    }

    @Then("o nome do arquivo baixado seguirá o da listagem \\(primeiro relatório da lista)")
    public void theNameOfTheReportIsEqualToTheListedInTheFirstReport() {
        assertTrue("O nome do relatório baixado difere do nome do relatório listado",
                reportsPage.theFirstNameOfTheReportIsEqualToTheFirstReportDownloaded());
    }
}