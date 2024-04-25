package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.dto.FilterDateRangeDto;
import com.fiserv.qabrazil.dto.GenerateReportDto;
import com.fiserv.qabrazil.dto.ReportDto;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.ReportsPage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.Identifier;
import com.fiserv.qabrazil.util.WaitUtil;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import static com.fiserv.automation.api.util.DateUtil.toLocalDate;
import static com.fiserv.qabrazil.steps.home.HomeCustomizeModalSteps.csv;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.*;

public class ReportsSteps extends BaseSteps {

    private static final Logger log = LoggerFactory.getLogger(ReportsSteps.class);
    private final GenerateReportDto generateReportDto = new GenerateReportDto();
    private final FilterDateRangeDto filterDateRangeDto = new FilterDateRangeDto();
    @Autowired
    ApiUserDetailsService apiUserDetailsService;
    @Autowired
    ReportsPage reportsPage;
    @Autowired
    private ContractConfig contractConfig;
    @Autowired
    private Paginator paginator;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private static void reportTypeIsCorrect(String fileType) {
        final String message = String.format("Tipo do relatório \"%s\" é diferente de \"Vendas\" e \"Pagamentos\"", fileType);
        final List<String> allowedFileTypes = List.of("Vendas", "Pagamentos");
        assertTrue(message, allowedFileTypes.contains(fileType));
    }

    private static String formatRequestedInNow() {
        LocalDateTime date = LocalDateTime.now();
        return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy 'às' HH:mm"));
    }

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

        if (apiECsFormatted.size() > 1) {
            assertTrue("Não oferece opção \"%s\" para quando há mais que um Estabelecimento Comercial".formatted(allECsText),
                    selectECOptionTexts.contains(allECsText));
        }
    }

    @Then("{string} estará selecionado por padrão, caso haja mais de um")
    @Then("{string} estará selecionado por padrão")
    public void userWillSeeAllECsAsDefaultIfMoreThanOne(String optionAllECs) throws Exception {
        List<String> ecs = filterIfNotSelectedInHeader(apiUserDetailsService.getEcs());

        if (ecs.size() > 1) {
            PageField selectECLabelSelected = pageField.from("Modal Gerar Relatórios - Select EC Selecionado");
            assertEquals("Deveria estar selecionado a opção \"%s\"".formatted(optionAllECs),
                    optionAllECs,
                    selectECLabelSelected.getAsText());
        }
    }

    @Given("usuário possui {expectedMoreThanOne} Estabelecimento Comercial vinculado")
    public void userWillSeeOneOrMoreThanOneEC(boolean expectedMoreThanOne) throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();

        if (expectedMoreThanOne) {
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
        pageField.from("Modal Gerar Relatórios - Campo Select EC").hoverOver();
        List<String> expectedECOptions = getExpectedEcOptions();
        PageField options = pageField.from("Modal Gerar Relatórios - Select EC Opções");

        assertThat(options.getAllAsText())
                .withFailMessage("Campo Estabelecimento Comercial (EC) deveria mostrar todas as opções")
                .containsExactlyElementsOf(expectedECOptions);

        verifyCanSelectOtherECs(options);
    }

    @Then("usuário terá apenas um EC disponível para seleção")
    public void thereIsOnlyOneECAvailable() throws Exception {
        pageField.from("Modal Gerar Relatórios - Campo Select EC").hoverOver();
        PageField options = pageField.from("Modal Gerar Relatórios - Select EC Opções");
        List<String> ecsAvailableForSelection = options.getAllAsText();
        String selectedEcHeader = selectECOrDtcoPage.getSelectedEcs().get(0);

        assertThat(ecsAvailableForSelection)
                .withFailMessage("Esperado apenas um EC disponível para seleção. Encontrado '%s'".formatted(ecsAvailableForSelection))
                .hasSize(1);
        assertThat(ecsAvailableForSelection.get(0))
                .withFailMessage("Campo Estabelecimento Comercial (EC) deveria mostrar todas as opções")
                .contains(selectedEcHeader);
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
    public void userDownloadsAReportOfType(String type, String extension) {
        reportsPage.downloadFirstReportOfType(type, extension);
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

    private void documentIsCorrect(String documentText, List<String> ecs) {
        List<String> allowedDocuments = new ArrayList<>(ecs);
        allowedDocuments.add("Todos os estabelecimentos");
        assertTrue("Não encontrou %s na lista %s".formatted(documentText, allowedDocuments),
                allowedDocuments.contains(documentText));
    }

    private void requestedInIsCorrect(String requestedIn) {
        String[] texts = requestedIn.split(" ");

        if (requestedInHasCorrectFormat(texts)) return;

        fail("A data \"" + requestedIn + "\" na coluna \"Solicitado Em\" não está no formato dd/MM/yyyy às hh:mm");
    }

    private boolean requestedInHasCorrectFormat(String[] texts) {
        return texts.length == 3
                && DateUtil.isInFormat(texts[0], "dd/MM/yyyy")
                && Pattern.matches("\\d{2}:\\d{2}", texts[2]);
    }

    private void reportRangeIsCorrect(String range) {
        String[] texts = range.split(" ");

        if (rangeHasCorrectFormat(texts)) return;

        fail("O período \"" + range + "\" não está no formato correto");
    }

    private boolean rangeHasCorrectFormat(String[] texts) {
        if (texts.length != 3
                && !DateUtil.isInFormat(texts[0], "dd/MM/yyyy")
                && !DateUtil.isInFormat(texts[2], "dd/MM/yyyy")) {
            return false;
        }

        LocalDate dateFrom = toLocalDate(texts[0], "dd/MM/yyyy");
        LocalDate dateTo = toLocalDate(texts[2], "dd/MM/yyyy");

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
        PageField secondEc = reportsPage.selectSecondEcAsOptions();

        pageField.from("Modal Gerar Relatórios - Campo Select EC").click();
        secondEc.click();

        String selected = pageField.from("Modal Gerar Relatórios - Select EC Selecionado").getAsText();
        generateReportDto.setEc(selected);
    }

    private List<String> getExpectedEcOptions() throws Exception {
        List<String> formattedEcs = apiUserDetailsService.getFormattedEcsAndNames();
        List<String> expectedECOptions = new ArrayList<>();
        List<String> filteredEcFromHeader = filterIfNotSelectedInHeader(formattedEcs);
        if (filteredEcFromHeader.size() > 1) {
            expectedECOptions.add("Todos os estabelecimentos");
        }
        expectedECOptions.addAll(filteredEcFromHeader);
        return expectedECOptions;
    }

    private List<String> filterIfNotSelectedInHeader(List<String> expectedECOptions) throws Exception {
        List<String> selectedEcsHeader = selectECOrDtcoPage.getSelectedEcs();
        return expectedECOptions.stream()
                .filter(ec -> selectedEcsHeader.stream().anyMatch(ec::contains))
                .toList();
    }

    private void verifyCanSelectOtherECs(PageField options) {
        pageField.from("Modal Gerar Relatórios - Campo Select EC").hoverOver();
        List<PageField> listOptions = options.getAllVisiblePageField();
        PageField selectedEC = pageField.from("Modal Gerar Relatórios - Select EC Selecionado");
        listOptions.get(1).click();
        assertEquals("%s deveria estar selecionado", listOptions.get(1).getAsText(), selectedEC.getAsText());
    }

    private PageField openDropdownAndGetOption(String dropdown, String option, String type) {
        PageField field = pageField.from(dropdown);
        field.click();
        field.hoverOver();

        Optional<PageField> foundOption = pageField.from(option)
                .firstWith(x -> x.attributeDataTestidContains(type));

        if (foundOption.isEmpty()) {
            fail("Didn't find the option to select: %s".formatted(type));
        }

        return foundOption.get();
    }

    @Then("usuário verá no filtro um ou mais documentos")
    public void userWillSeeInTheFilterOneOrMoreDocuments() {
        assertFalse("Deveria ter pelo menos um documento listado",
                pageField.from("Filtros de relatório - Item Documentos")
                        .getAllVisiblePageField()
                        .isEmpty());
    }

    @Then("usuário verá no filtro todos os seus documentos")
    public void userWillSeeInTheFilterAllTheirDocuments() throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();

        assertTrue("Deveria exibir todos os ECs no filtro",
                pageField.from("Filtros de relatório - Item Documentos")
                        .allVisiblePageField()
                        .allMatch(el -> el.attributeDataTestidContainsAnyOf(ecs)));
    }

    @Then("serão filtrados apenas os relatórios do tipo {string}")
    public void thereWillBeFilteredOnlyReportsOfType(String reportType) {
        assertTrue("Deveriam ter aparecido apenas filtros de %s".formatted(reportType),
                paginator.allMatch(() -> allReportsInPageAreOfType(reportType)));
    }

    private boolean allReportsInPageAreOfType(String type) {
        return pageField.from("Relatórios - Item - Tipo Relatório")
                .allVisiblePageField()
                .allMatch(el -> el.getAsText().equals(type));
    }

    @Given("Existem relatórios de vendas e pagamentos extraídos")
    public void thereAreReportsOfSalesAndPayments() {
        assumeThat(reportsPage.thereIsAtLeastOneReportOfEachType()).isTrue();
    }

    @When("usuário limpa os filtros de relatório")
    public void userClearsFilters() {
        pageField.from("Relatórios - Botão Filtros").click();

        PageField clearAllButton = pageField.from("Filtros - Botão Limpar Filtros");
        assertTrue("Botão Filtros deveria estar visível", clearAllButton.elementIsVisible());
        clearAllButton.click();

        pageField.from("Filtros - Botão Mostrar Resultados").click();
    }

    @Then("Usuário voltará a visualizar ambos relatórios de vendas e pagamentos")
    public void userWillSeeAgainReportsOfSalesAndPayments() {
        assertTrue("Deveria estar listado relatórios de vendas e pagamentos",
                reportsPage.thereIsAtLeastOneReportOfEachType());
    }

    @Given("Existem relatórios extraídos em datas diferentes")
    public void thereAreReportsWithDifferentDates() {
        assumeThat(reportsPage.thereAreReportsExtractedOfDifferentDates()).isTrue();
    }

    @When("usuário filtra por uma data")
    public void userFiltersByADateRange() {
        String dateToFilter = pageField.from("Relatórios - Item - Período").firstOf().getAsText();

        pageField.from("Filtros de relatório - Accordion Período").click();
        pageField.from("Filtros de relatório - Item Período").click();

        String[] dates = dateToFilter.split(" até ");
        filterDateRangeDto.startDate = toLocalDate(dates[0], "dd/MM/yyyy");
        filterDateRangeDto.endDate = toLocalDate(dates[1], "dd/MM/yyyy");

        reportsPage.selectRange(filterDateRangeDto);

        PageField showResultsButton = pageField.from("Filtros - Botão Mostrar Resultados");
        showResultsButton.click();
    }

    @Then("serão exibidos apenas relatórios extraídos da mesma data")
    public void thereWillBeShownOnlyReportsForTheSameDateRange() {
        WaitUtil.sleep(Duration.ofSeconds(2));
        String[] rangesListed = pageField.from("Relatórios - Item - Período")
                .allVisiblePageField()
                .map(PageField::getAsText)
                .distinct()
                .toArray(String[]::new);

        log.info("Datas encontradas: {}", (Object) rangesListed);
        log.info("Data filtrada: {} até {}", filterDateRangeDto.startDate, filterDateRangeDto.endDate);
        assertTrue("Deveria ter exibido apenas relatórios do mesmo range",
                this.isInTheFilteredDate(rangesListed));
    }

    private boolean isInTheFilteredDate(String[] dates) {
        return Arrays.stream(dates).allMatch(this::isInTheFilteredDate);
    }

    private boolean isInTheFilteredDate(String date) {
        String[] dates = date.split(" até ");
        LocalDate startDate = toLocalDate(dates[0], "dd/MM/yyyy");
        LocalDate endDate = toLocalDate(dates[1], "dd/MM/yyyy");

        return !startDate.isBefore(filterDateRangeDto.startDate) && !endDate.isAfter(filterDateRangeDto.endDate);
    }
}