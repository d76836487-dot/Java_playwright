package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.MerchantDetail;
import com.fiserv.automation.api.dto.MerchantGroup;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.util.CpfCnpjUtil;
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

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Trocar Estabelecimento - Botão selecionar por Documento")
                .fieldIsOneVisibleAndEnabled());
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Trocar Estabelecimento - Botão selecionar por Estabelecimento")
                .fieldIsOneVisibleAndEnabled());
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

    @When("Expande primeiro dropdown")
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
}
