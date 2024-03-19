package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.dto.GenerateReportDto;
import com.fiserv.qabrazil.dto.ReportDto;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.ReportsPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.steps.home.HomeCustomizeModalSteps.csv;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.*;

public class ReportsSteps extends BaseSteps {

    private static final Logger log = LoggerFactory.getLogger(ReportsSteps.class);

    @Autowired
    private ContractConfig contractConfig;

    @Autowired
    ApiUserDetailsService apiUserDetailsService;

    @Autowired
    ReportsPage reportsPage;

    private final GenerateReportDto generateReportDto = new GenerateReportDto();

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
            reportTypeIsCorrect(report.getReportType());
            documentIsCorrect(report.getDocument(), ecs);
            requestedInIsCorrect(report.getRequestedIn());
            reportRangeIsCorrect(report.getRange());
            fileNameIsCorrect(report.getName(), report.getReportType());
        });
    }

    @Then("botão download possui ícone com seta para baixo")
    public void hasIconWithDownArrow() {
        Identifier button = Identifier.from("Relatórios - Botão Download Ok");
        assertTrue("Ícone de download não identificado", reportsPage.downloadIconIsDownArrow(button));
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

    @Then("usuário visualizará o modal de geração de relatórios contendo nome do cliente, junto de seu CPF ou CNPJ")
    public void userWillSeeTheClientNameWithTheirCPForCNPJ() throws Exception {
        UserDetailDto userDetail = apiUserDetailsService.getUserDetail();
        List<String> userNames = userDetail.ecCods.stream().map(x -> x.nomeFantasia).toList();

        //TODO: change for testid
        String businessDepartment = pageField.from("Modal Gerar Relatórios - Estabelecimento Comercial").getAsText();
        PageField businessDepartmentDocument = pageField.from("Modal Gerar Relatórios - CPF ou CNPJ");
        String documentInPage = businessDepartmentDocument.getAsText().replaceAll("\\D+", "");

        assertTrue("Estabelecimento Comercial não é igual ao da api",
                userNames.stream().anyMatch(businessDepartment::equals));
        assertEquals("Documento do Estabelecimento Comercial não é igual ao da api", userDetail.document, documentInPage);
    }

    @Then("usuário visualizará opção para selecionar um EC ou {string}")
    public void userWillSeeAnOptionToSelectABusinessDepartmentOrAllHavingBusinessDepartmentAsDefault(String allECsText) throws Exception {
        List<String> apiECsFormatted = apiUserDetailsService.getFormattedEcsAndNames();
        PageField selectECOptions = pageField.from("Modal Gerar Relatórios - Select EC Opções");

        List<String> selectECOptionTexts = selectECOptions.getAllAsText();
        assertTrue("As opções de Estabelecimento Comercial não conferem com a api",
                selectECOptionTexts.containsAll(apiECsFormatted));

        if(apiECsFormatted.size() > 1) {
            assertTrue("Não oferece opção \"%s\" para quando há mais que um Estabelecimento Comercial".formatted(allECsText),
                    selectECOptionTexts.contains(allECsText));
        }
    }

    @Then("{string} estará selecionado por padrão, caso haja mais de um")
    @Then("{string} estará selecionado por padrão")
    public void userWillSeeAllECsAsDefaultIfMoreThanOne(String optionAllECs) throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();

        if(ecs.size() > 1) {
            PageField selectECLabelSelected = pageField.from("Modal Gerar Relatórios - Select EC Selecionado");
            assertEquals("Deveria estar selecionado a opção \"%s\"".formatted(optionAllECs),
                    optionAllECs,
                    selectECLabelSelected.getAsText());
        }
    }

    @Given("usuário possui {expectedMoreThanOne} Estabelecimento Comercial vinculado")
    public void userWillSeeOneOrMoreThanOneEC(boolean expectedMoreThanOne) throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();

        if(expectedMoreThanOne) {
            assumeThat(ecs.size() > 1).isTrue();
        } else {
            assumeThat(ecs.size() == 1).isTrue();
        }
    }

    @ParameterType("(apenas um|mais que um)")
    public boolean expectedMoreThanOne(String value) {
        return value.equals("mais que um");
    }

    @Then("usuário verá no campo Estabelecimento Comercial o número deste único estabelecimento já selecionado")
    public void userWillSeeInECSelectTheValueOfTheOneECSSelected() throws Exception {
        String formattedEC = apiUserDetailsService.getFormattedEcsAndNames().get(0);

        String selected = pageField.from("Modal Gerar Relatórios - Select EC Selecionado").getAsText();
        List<String> options = pageField.from("Modal Gerar Relatórios - Select EC Opções").getAllAsText();

        assertEquals("Deveria estar selecionado o único EC vinculado a este user", formattedEC, selected);
        assertThat(options)
                .withFailMessage("Deveria exibir somente o único EC vinculado a este user")
                .containsExactly(formattedEC);
    }

    @Then("usuário poderá selecionar alguma das outras opções de EC disponíveis")
    public void willBeAbleToSelectedAnyOfTheOtherAvailableOptions() throws Exception {
        List<String> expectedECOptions = getExpectedEcOptions();
        PageField options = pageField.from("Modal Gerar Relatórios - Select EC Opções");

        assertThat(options.getAllAsText())
                .withFailMessage("Campo Estabelecimento Comercial (EC) deveria mostrar todas as opções")
                .containsExactlyElementsOf(expectedECOptions);

        verifyCanSelectOtherECs(options);
    }

    @When("usuário seleciona o tipo de relatório como {string}")
    public void userSelectsReportTypeAs(String type) {
        PageField option = openDropdownAndGetOption("Modal Gerar Relatórios - Select Tipo",
                "Modal Gerar Relatórios - Select Tipo Opções", type);

        option.click();
        generateReportDto.setType(option.getAsText());
        option.hoverAway();
    }

    @When("usuário seleciona o formato de arquivo como {string}")
    public void userSelectsReportFiletypeAs(String type) {
        PageField option = openDropdownAndGetOption("Modal Gerar Relatórios - Select Formato Arquivo",
                "Modal Gerar Relatórios - Select Formato Arquivo Opções", type);

        option.click();
        generateReportDto.setFiletype(option.getAsText());
        option.hoverAway();
    }

    @When("usuário seleciona o período do dia anterior")
    public void userSelectsInRangeDateTheDayBefore() {
        reportsPage.selectYesterday();

        String selectedDate = pageField.from("Modal Gerar Relatórios - Select Período Selecionado")
                .getAsText();
        reportRangeIsCorrect(selectedDate);
        generateReportDto.setRangeDate(selectedDate);
    }

    @Then("usuário verá uma nova linha na listagem de relatórios com o novo relatório solicitado e o ícone relógio na coluna baixar")
    public void userWillSeeANewRowInTheReportListWithTheBrandNewReport() {
        ReportDto expectedDto = ReportDto.from(
                generateReportDto,
                contractConfig.getActiveUserProfile().allianceName(),
                formatRequestedInNow()
        );

        ReportDto foundDto = reportsPage.getFirstReportInTable();
        assertEquals("New generated report is not correct", expectedDto, foundDto);

        String firstIconTestId = reportsPage.downloadIconOfFirstReportTestId();

        assertEquals("The first download icon is not a 'clock'. They don't have the same testid",
                TestIdsConfig.getTestId("Relatórios - Botão Download Aguardando"),
                firstIconTestId);
    }

    @When("usuário verifica que este Estabelecimento Comercial está selecionado")
    public void userVerifiesThisECIsSelected() {
        String selectedEC = pageField.from("Modal Gerar Relatórios - Select EC Selecionado").getAsText();
        generateReportDto.setEc(selectedEC);
    }

    @When("usuário seleciona algum de seus Estabelecimentos Comerciais")
    public void userSelectsAnyOfTheirEcs() throws Exception {
        List<String> expectedECOptions = getExpectedEcOptions();
        PageField options = pageField.from("Modal Gerar Relatórios - Select EC Opções");

        assertThat(options.getAllAsText())
                .withFailMessage("Campo Estabelecimento Comercial (EC) deveria mostrar todas as opções")
                .containsExactlyElementsOf(expectedECOptions);

        selectSecondEc();
    }

    @Given("Existem relatórios já extraídos do tipo {string}, no formato {string}, disponíveis para download")
    public void thereAreReportsExtractedOfType(String type, String filetype) {
        assumeThat(reportsPage.thereAreReportsAvailableForDownloadOfTypeAndFiletype(type, filetype)).isTrue();
    }

    @When("Usuário baixa um relatório do tipo {string}, formato {string}")
    public void userDownloadsAReportOfType(String type, String extention) {
        reportsPage.downloadFirstReportOfType(type, extention);
    }

    @Then("Usuário visualizará no arquivo baixado a coluna \"Parcelas\", contendo as parcelas das vendas")
    public void userWillSeeInTheDownloadedFileTheColumnHavingSalesInstallments() throws Exception {
        reportsPage.validateDownloadedCSVFileHasColumnContainingSalesInstallments();
    }

    @Then("Usuário visualizará no {string} baixado, as colunas")
    public void userWillSeeInTheDownloadedFileTheColumns(String fileExtension, String columns) throws Exception {
        String[] expected = csv(columns);
        String[] actual = reportsPage.getHeaderForDownloadAs(fileExtension);

        log.info("Validando o cabeçalho do arquivo csv");
        assertThat(actual)
                .containsExactlyInAnyOrder(expected);
    }

    @Then("usuário seleciona um período maior que um ano e tenta gerar o relatório")
    public void userSelectsAPeriodBiggerThanAYear() {
        reportsPage.selectOneYear();

        assertNotNull("Não foi possível selecionar o período", pageField
                .from("Modal Gerar Relatórios - Select Período Selecionado")
                .getAsText());

        pageField.from("Modal Gerar Relatórios - Botão Gerar").click();
    }

    private static void reportTypeIsCorrect(String fileType) {
        final String message = String.format("Tipo do relatório \"%s\" é diferente de \"Vendas\" e \"Pagamentos\"", fileType);
        final List<String> allowedFileTypes = List.of("Vendas", "Pagamentos");
        assertTrue(message, allowedFileTypes.contains(fileType));
    }

    private void documentIsCorrect(String documentText, List<String> ecs) {
        List<String> allowedDocuments = new ArrayList<>(ecs);
        allowedDocuments.add("Todos os estabelecimentos");
        assertTrue("Não encontrou %s na lista %s".formatted(documentText, allowedDocuments),
                allowedDocuments.contains(documentText));
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

    private void selectSecondEc() {
        PageField options = pageField.from("Modal Gerar Relatórios - Select EC Opções");
        PageField secondEc = options.getAllVisiblePageField().get(2);

        pageField.from("Modal Gerar Relatórios - Campo Select EC").click();
        secondEc.click();

        String selected = pageField.from("Modal Gerar Relatórios - Select EC Selecionado").getAsText();
        generateReportDto.setEc(selected);
    }

    @NotNull
    private List<String> getExpectedEcOptions() throws Exception {
        List<String> formattedEcs = apiUserDetailsService.getFormattedEcsAndNames();
        List<String> expectedECOptions = new ArrayList<>();
        expectedECOptions.add("Todos os estabelecimentos");
        expectedECOptions.addAll(formattedEcs);
        return expectedECOptions;
    }

    private void verifyCanSelectOtherECs(PageField options) {
        List<PageField> listOptions = options.getAllVisiblePageField();
        PageField selectedEC = pageField.from("Modal Gerar Relatórios - Select EC Selecionado");
        listOptions.get(1).click();
        assertEquals("%s deveria estar selecionado", listOptions.get(1).getAsText(), selectedEC.getAsText());
    }

    private static String formatRequestedInNow() {
        LocalDateTime date = LocalDateTime.now();
        return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy 'às' HH:mm"));
    }

    private PageField openDropdownAndGetOption(String dropdown, String option, String type) {
        PageField field = pageField.from(dropdown);
        field.click();
        field.hoverOver();

        Optional<PageField> foundOption = pageField.from(option)
                .firstWith(x -> x.attributeDataTestidContains(type));

        if(foundOption.isEmpty()) {
            fail("Didn't find the option to select: %s".formatted(type));
        }

        return foundOption.get();
    }
}