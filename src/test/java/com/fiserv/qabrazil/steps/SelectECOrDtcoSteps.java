package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.MerchantDetail;
import com.fiserv.automation.api.dto.MerchantGroup;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.login.LoginPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.util.List;

import static com.fiserv.qabrazil.util.CpfCnpjUtil.formatCpfCnpj;
import static org.testng.AssertJUnit.*;

public class SelectECOrDtcoSteps extends BaseSteps {
    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;
    @Autowired
    private ApiUserDetailsService apiUserDetailsService;
    @Autowired
    private LoginPage loginPage;
    @Autowired
    private ContractConfig contractConfig;

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                selectECOrDtcoPage.modalIsVisible());
    }

    @Then("Listagem por documento contendo dropdown com as informações de Nome fantasia do documento e o número do documento")
    public void listHasDocsAndNames() {
        PageField nameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento");
        PageField docEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento");
        PageField detailNameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe");

        assertFalse("Não encontrei Nome fantasia", nameEstablishment.getAllAsText().isEmpty());
        assertFalse("Não encontrei Documento", docEstablishment.getAllAsText().isEmpty());
        assertFalse("Dropdown deveria estar fechada", detailNameEstablishment.elementIsVisible());
    }

    @Then("O primeiro dropdown estará expandido")
    public void checkFirstDropdown() {
        List<PageField> detailNameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe")
                .getAllVisiblePageField();
        assertFalse("Retornou zero detalhes para primeiro dropdown", detailNameEstablishment.isEmpty());
        assertTrue("Dropdown do primeiro documento não abriu ao clicar", detailNameEstablishment.get(0).elementIsVisibleRightNow());
    }

    @Then("O dropdown conterá com as informações de Nome fantasia do EC")
    public void checkName() {
        PageField detailNameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe");

        for (String name : detailNameEstablishment.getAllAsText()) {
            assertTrue("Nome do estabelecimento %s é estranhamente pequeno".formatted(name),
                    name.length() > 2);
        }
    }

    @Then("O dropdown conterá com as informações de número do EC")
    public void dropdownHasECInfo() {
        PageField detailNumEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe");
        for (String ec : detailNumEstablishment.getAllAsText()) {
            assertTrue("Número do estabelecimento %s não é apenas numérico".formatted(ec),
                    ec.replaceAll("\\d", "").isEmpty());
        }
    }

    @Then("O dropdown conterá com as informações do status do EC no BW")
    public void drodownHasInfoAboutECFromBW() {
        PageField detailStatusEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Status Estabelecimento Detalhe");
        for (String status : detailStatusEstablishment.getAllAsText()) {
            assertTrue("Status %s é diferente de Ativo/Inativo".formatted(status),
                    status.equals("Ativo") || status.equals("Inativo"));
        }
    }

    @When("Usuário expande primeiro dropdown")
    public void openFirstDropdown() {
        selectECOrDtcoPage.openFirstDropdown();
    }

    @Then("Todos Nomes, CNPJ CPFs, número ECs e status são iguais a API")
    public void todosNomesCPFsNúmeroECsEStatusAPISãoIguaisAAPI() throws Exception {
        List<MerchantGroup> allDocuments = apiUserDetailsService.getUserDetailGroupedByDocument();

        for (MerchantGroup merchantGroup : allDocuments) {
            String formattedDoc = formatCpfCnpj(merchantGroup.document());
            assertAny(formattedDoc, "Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento", merchantGroup.nomeFantasia());
            assertAny(formattedDoc, "Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento", formattedDoc);

            assertInsideDropdownAreShowing(formattedDoc, merchantGroup);
        }

    }

    private void assertInsideDropdownAreShowing(String formattedDoc, MerchantGroup merchantGroup) {
        selectECOrDtcoPage.openDropdownForDocument(formattedDoc);

        for (MerchantDetail merchantDetail : merchantGroup.merchantDetails()) {
            assertTrue("EC %s não está visível após dropdown ser aberto para %s".formatted(merchantDetail.ec(), formattedDoc),
                    selectECOrDtcoPage.ecIsVisible(merchantDetail.ec()));

            assertDetailsAreEqual(merchantDetail);
        }
    }

    private void assertDetailsAreEqual(MerchantDetail merchantDetail) {
        assertEquals(merchantDetail.nomeFantasia(),
                selectECOrDtcoPage.getTextForEC(merchantDetail.ec(),
                        "Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe"));
        assertEquals(merchantDetail.ec(),
                selectECOrDtcoPage.getTextForEC(merchantDetail.ec(),
                        "Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe"));
        assertEquals(merchantDetail.status(),
                selectECOrDtcoPage.getTextForEC(merchantDetail.ec(),
                        "Trocar Estabelecimento - Estabelecimento - Status Estabelecimento Detalhe"));
    }

    private void assertAny(String formattedDoc, String displayName, String expectedValue) {
        String foundValue = selectECOrDtcoPage.getTextForDocument(formattedDoc, displayName);

        assertEquals(expectedValue, foundValue);
    }

    @When("Usuário digitar um EC válido em 'Buscar por documento ou número do estabelecimento'")
    public void typeValidEc() {
        String lastEc = getLastEc();
        pageField.from("Trocar Estabelecimento - Buscar documento").pressSequentially(lastEc);
    }

    @When("Usuário digitar um documento válido em 'Buscar por documento ou número do estabelecimento'")
    public void typeValidDocTabEstablishment() {
        String lastDoc = getLastDocTabEstablishment();
        pageField.from("Trocar Estabelecimento - Buscar documento").pressSequentially(lastDoc);
    }

    @When("Usuário digitar um documento válido em 'Buscar por documento'")
    public void typeValidDocTabDocument() {
        String lastDoc = getLastDocTabDocument();
        pageField.from("Trocar Estabelecimento - Buscar documento").pressSequentially(lastDoc);
    }

    @When("Usuário digitar um documento inválido em 'Buscar por documento'")
    @When("Usuário digitar um documento inválido em 'Buscar por documento ou número do estabelecimento'")
    public void typeInvalidDoc() {
        pageField.from("Trocar Estabelecimento - Buscar documento").pressSequentially("123123123");
    }

    @Then("Dropdown irá filtrar e apresentar somente a informação correspondente")
    public void checkIfFiltered() {
        assertEquals(1,
                pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento")
                        .getAllVisiblePageField()
                        .size());
        assertEquals(1,
                pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe")
                        .getAllVisiblePageField()
                        .size());
    }

    @Then("Filtro apresentará somente a informação correspondente")
    public void filterHasWorkedAsExpected() {
        List<String> documentsFromTabDocument = selectECOrDtcoPage.getDocumentsFromTabDocument();
        assertFalse("Opção Todos não deveria estar visível quando filtrando por documento",
                pageField.from("Trocar Estabelecimento - Botão Todos Documentos").elementIsVisibleRightNow());
        assertEquals("Filtro deveria trazer somente um CNPJ, mas encontrou %s.".formatted(documentsFromTabDocument),
                1, documentsFromTabDocument.size());
    }

    private String getLastEc() {
        List<String> allEcs = pageField.from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe")
                .getAllAsText();
        return allEcs.get(allEcs.size() - 1);
    }

    private String getLastDocTabEstablishment() {
        List<String> allEcs = pageField.from("Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento")
                .getAllAsText();
        return allEcs.get(allEcs.size() - 1);
    }

    private String getLastDocTabDocument() {
        List<String> allDocs = selectECOrDtcoPage.getDocumentsFromTabDocument();
        return allDocs.get(allDocs.size() - 1);
    }

    @Given("Usuário está na aba {string} da modal 'Trocar Estabelecimento'")
    public void userIsInEstablishmentTab(String tab) {
        if (!loginPage.userIsLogged()) {
            loginPage.forceNewLogin();
            loginPage.userIsLogged();
        }

        selectECOrDtcoPage.openModalAndTab(tab);
    }

    @When("Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' {string}")
    public void userLogsInWithoutPreSelectedEC(String checkedOrUnchecked) {
        loginPage.forceNewLogin();

        if (selectECOrDtcoPage.modalIsVisible()) return;

        assertTrue(loginPage.userIsLogged());

        selectECOrDtcoPage.openModalAndSetDefault(checkedOrUnchecked.equals("marcada"));
        loginPage.forceNewLogin();
    }

    @Then("Usuário poderá limpar a busca clicando no X")
    public void cleanSearchClickingOnX() {
        pageField.from("Trocar Estabelecimento - Limpar buscar documento").click();
        assertTrue("Botão X não limpou o texto digitado",
                pageField.from("Trocar Estabelecimento - Buscar documento").getAsText().isEmpty());
    }

    @Given("Usuário selecionou um documento e clicar Acessar")
    @When("Usuário selecionar um documento e clicar Acessar")
    public void userSelectsDocument() {
        List<String> allDocs = selectECOrDtcoPage.getDocumentsFromTabDocument();
        selectECOrDtcoPage.selectDocumentInput(allDocs.get(0));

        selectECOrDtcoPage.storeDocAndFirstNameFromDocuments(allDocs.get(0));

        selectECOrDtcoPage.clickAccessAndWaitClose();
    }

    @When("Usuário selecionar Todos na aba Documento e clicar Acessar")
    public void userSelectsAllDocument() {
        pageField.from("Trocar Estabelecimento - Botão Todos Documentos").click();
        selectECOrDtcoPage.clickAccessAndWaitClose();
    }

    @Then("Documento estará previamente selecionado")
    public void docWillBePreviouslySelected() throws ParseException {
        String prevSelected = pageField.from("Header - Trocar Estabelecimento").getAsText();

        assertTrue("Esperava ter selecionado <%s>, mas encontrou <%s>".formatted(selectECOrDtcoPage.getSelectedDoc(), prevSelected),
                prevSelected.contains(formatCpfCnpj(selectECOrDtcoPage.getSelectedDoc())));
    }

    @Given("Usuário selecionou um EC e clicar Acessar")
    @When("Usuário selecionar um EC e clicar Acessar")
    public void userSelectEcAndAccess() {
        PageField firstEcFromDropdown = pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe")
                .getAllPageField().get(0);

        if (!firstEcFromDropdown.elementIsVisibleRightNow()) {
            selectECOrDtcoPage.openFirstDropdown();
        }
        firstEcFromDropdown.click();

        selectECOrDtcoPage.storeNameAndEc();

        selectECOrDtcoPage.clickAccessAndWaitClose();
    }

    @Then("Usuário visualizará no Header do Portal \\(todas as páginas) o Nome fantasia e número do EC")
    public void headerWillHaveSelectedEc() {
        PageField button = pageField.from("Header - Trocar Estabelecimento");
        assertTrue("Botão trocar estabelecimento não tem o EC selecionado <%s>. Encontrado <%s>".formatted(selectECOrDtcoPage.getSelectedEc(), button.getAsText()),
                button.getAsText().contains(selectECOrDtcoPage.getSelectedEc()));
        String nameFromButton = button.getAsText().replaceAll("\\.* -.*", "").replaceAll("\\n", "");
        assertTrue("Botão trocar estabelecimento não tem o nome do EC selecionado <%s>. Encontrado <%s>".formatted(selectECOrDtcoPage.getSelectedEcName(), nameFromButton),
                selectECOrDtcoPage.getSelectedEcName().contains(nameFromButton));
    }

    @Then("Usuário visualizará no Header do Portal \\(todas as páginas) o Nome fantasia e número do Documento")
    public void headerWillHaveSelectedDoc() throws ParseException {
        PageField button = pageField.from("Header - Trocar Estabelecimento");
        String formattedDoc = formatCpfCnpj(selectECOrDtcoPage.getSelectedDoc());
        assertTrue("Botão trocar estabelecimento não tem o Documento selecionado <%s>. Encontrado <%s>".formatted(formattedDoc, button.getAsText()),
                button.getAsText().contains(formattedDoc));
        String selectedDocName = selectECOrDtcoPage.getSelectedDocName();
        String buttonText = button.getAsText()
                .replaceAll(" - .*", "")
                .replaceAll("\\n", "")
                .replaceAll("\\.\\.\\.$", "");
        assertTrue("Botão trocar estabelecimento não tem o nome do Documento selecionado <%s>. Encontrado <%s>".formatted(selectedDocName, button.getAsText()),
                selectedDocName.contains(buttonText));
    }

    @Then("Usuário visualizará no Header do Portal \\(todas as páginas) o texto Todos documentos")
    public void headerWillHaveTodos() {
        PageField changeButton = pageField.from("Header - Trocar Estabelecimento");
        assertTrue("Botão trocar estabelecimento não o texto Todos. Encontrado <%s>.".formatted(changeButton.getAsText()),
                selectECOrDtcoPage.allDocumentsIsAlreadySelected(changeButton));
    }

    @Then("Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança")
    public void changeEstablishmentHasTextAndColor() {
        PageField button = pageField.from("Header - Trocar Estabelecimento - Span Texto");

        assertEquals("Botão trocar estabelecimento não tem o texto 'Trocar estabelecimento'. Encontrado <%s>".formatted(button.getAsText()),
                "Trocar estabelecimento", button.getAsText());
        assertTrue("Botão trocar estabelecimento não tem class <%s>. Encontrado <%s>".formatted(contractConfig.getActiveUserProfile().primaryCssClass(), button.getClasses()),
                button.getClasses().contains(contractConfig.getActiveUserProfile().primaryCssClass()));
    }
}
