package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.MerchantDetail;
import com.fiserv.automation.api.dto.MerchantGroup;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.login.LoginPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.util.CpfCnpjUtil;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import static org.testng.AssertJUnit.*;

public class SelectECOrDtcoSteps extends BaseSteps {
    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;
    @Autowired
    private LoginPage loginPage;

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                selectECOrDtcoPage.modalIsVisible());
    }

    @Then("Usuário visualizará a aba Estabelecimento por padrão")
    public void tabEstablishmentIsSelected() {
        assertTrue("Aba estabelecimento não está selecionada por padrão",
                selectECOrDtcoPage.tabEstablishmentIsSelected());
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
                .getAllPageField();
        assertFalse("Retornou zero detalhes para primeiro dropdown", detailNameEstablishment.isEmpty());
        assertTrue("Dropdown do primeiro documento não abriu ao clicar", detailNameEstablishment.get(0).elementIsVisibleRightNow());
    }

    @Then("O dropdown conterá com as informações de Nome fantasia do EC")
    public void checkName() {
        PageField detailNameEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe");

        for(String name: detailNameEstablishment.getAllAsText()) {
            assertTrue("Nome do estabelecimento %s é estranhamente pequeno".formatted(name),
                    name.length() > 2);
        }
    }

    @Then("O dropdown conterá com as informações de número do EC")
    public void oDropdownConteráComAsInformaçõesDeNúmeroDoEC() {
        PageField detailNumEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe");
        for(String ec: detailNumEstablishment.getAllAsText()) {
            assertTrue("Número do estabelecimento %s não é apenas numérico".formatted(ec),
                    ec.replaceAll("\\d", "").isEmpty());
        }
    }

    @Then("O dropdown conterá com as informações do status do EC no BW")
    public void oDropdownConteráComAsInformaçõesDoStatusDoECNoBW() {
        PageField detailStatusEstablishment = pageField
                .from("Trocar Estabelecimento - Estabelecimento - Status Estabelecimento Detalhe");
        for(String status: detailStatusEstablishment.getAllAsText()) {
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

        for(MerchantGroup merchantGroup: allDocuments) {
            String formattedDoc = CpfCnpjUtil.formatCpfCnpj(merchantGroup.document());
            assertAny(formattedDoc, "Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento", merchantGroup.nomeFantasia());
            assertAny(formattedDoc, "Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento", formattedDoc);

            assertInsideDropdownAreShowing(formattedDoc, merchantGroup);
        }

    }

    private void assertInsideDropdownAreShowing(String formattedDoc, MerchantGroup merchantGroup) {
        selectECOrDtcoPage.openDropdownForDocument(formattedDoc);

        for(MerchantDetail merchantDetail: merchantGroup.merchantDetails()) {
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
                        .getAllPageField()
                        .size());
        assertEquals(1,
                pageField.from("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe")
                        .getAllPageField()
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

    @Then("Botão Acessar estará habilitado após seleção de um EC")
    public void buttonIsEnableAfter() {
        assertFalse("Botão está habilitado, mesmo sem selecionar um EC",
                pageField.from("Trocar Estabelecimento - Botão Acessar").elementIsEnabledRightNow());

        pageField.from("Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento").click();
        pageField.from("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe").click();

        assertTrue(pageField.from("Trocar Estabelecimento - Botão Acessar").elementIsEnabledRightNow());
    }

    @Given("Usuário está na aba {string} da modal 'Trocar Estabelecimento'")
    public void usuárioEstáNaAbaEstabelecimentoDeTrocarEstabelecimento(String tab) {
        loginPage.login();
        loginPage.userIsLogged();

        selectECOrDtcoPage.openModalAndTab(tab);
    }

    @When("Usuário faz login, com a opção 'Definir como padrão e não mostrar novamente' desmarcada")
    public void userLogsInWithoutPreSelectedEC() {
        loginPage.forceNewLogin();

        if (selectECOrDtcoPage.modalIsVisible()) return;

        assertTrue(loginPage.userIsLogged());

        selectECOrDtcoPage.openModalAndUnsetDefault();
        loginPage.forceNewLogin();
    }

    @Then("Usuário poderá limpar a busca clicando no X")
    public void usuárioPoderáLimparABuscaClicandoNoX() {
        pageField.from("Trocar Estabelecimento - Limpar buscar documento").click();
        assertTrue("Botão X não limpou o texto digitado",
                pageField.from("Trocar Estabelecimento - Buscar documento").getAsText().isEmpty());
    }
}
