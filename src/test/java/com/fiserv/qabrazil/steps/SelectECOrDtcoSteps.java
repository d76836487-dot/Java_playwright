package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import static org.testng.AssertJUnit.*;

public class SelectECOrDtcoSteps extends BaseSteps {
    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Documento")
                .fieldIsOneVisibleAndEnabled());
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento")
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
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Nome Estabelecimento");
        PageField docEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Documento Estabelecimento");
        PageField detailNameEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Nome Estabelecimento Detalhe");

        assertFalse("Não encontrei Nome fantasia", nameEstablishment.getAllAsText().isEmpty());
        assertFalse("Não encontrei Documento", docEstablishment.getAllAsText().isEmpty());
        assertFalse("Dropdown deveria estar fechada", detailNameEstablishment.elementIsVisible());
    }

    @Then("O primeiro dropdown estará expandido")
    public void checkFirstDropdown() {
        List<PageField> detailNameEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Nome Estabelecimento Detalhe")
                .getAllPageField();
        assertFalse("Retornou zero detalhes para primeiro dropdown", detailNameEstablishment.isEmpty());
        assertTrue("Dropdown do primeiro documento não abriu ao clicar", detailNameEstablishment.get(0).elementIsVisibleRightNow());
    }

    @Then("O dropdown conterá com as informações de Nome fantasia do EC")
    public void checkName() {
        PageField detailNameEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Nome Estabelecimento Detalhe");

        for(String name: detailNameEstablishment.getAllAsText()) {
            assertTrue("Nome do estabelecimento %s é estranhamente pequeno".formatted(name),
                    name.length() > 2);
        }
    }

    @Then("O dropdown conterá com as informações de número do EC")
    public void oDropdownConteráComAsInformaçõesDeNúmeroDoEC() {
        PageField detailNumEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Num Estabelecimento Detalhe");
        for(String ec: detailNumEstablishment.getAllAsText()) {
            assertTrue("Número do estabelecimento %s não é apenas numérico".formatted(ec),
                    ec.replaceAll("\\d", "").isEmpty());
        }
    }

    @Then("O dropdown conterá com as informações do status do EC no BW")
    public void oDropdownConteráComAsInformaçõesDoStatusDoECNoBW() {
        PageField detailStatusEstablishment = pageField
                .from("Header - Trocar Estabelecimento - Modal - Estabelecimento - Status Estabelecimento Detalhe");
        for(String status: detailStatusEstablishment.getAllAsText()) {
            assertTrue("Status %s é diferente de Ativo/Inativo".formatted(status),
                    status.equals("Ativo") || status.equals("Inativo"));
        }
    }

    @And("Expande primeiro dropdown")
    public void openFirstDropdown() {
        selectECOrDtcoPage.openFirstDropdown();
    }
}
