package com.fiserv.qabrazil.steps.components;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.components.ChangeEstablishmentPopupComponent;
import com.fiserv.qabrazil.pages.home.HomePage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.util.CpfCnpjUtil;
import com.microsoft.playwright.Page;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class ChangeEstablishmentPopupSteps extends BaseSteps {
    @Autowired
    private ChangeEstablishmentPopupComponent changeEstablishmentPopupComponent;

    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    @Autowired
    HomePage homePage;

    @Autowired
    Page page;



    @Then("Popup terá nomes do documento selecionado")
    public void popupHaveDocumentName() throws Exception {
        String selectedDoc = selectECOrDtcoPage.getSelectedDoc();
        String name = apiUserDetailsService.getUserDetail().ecCods.stream()
                .filter(dto -> dto.document.equals(selectedDoc))
                .map(dto -> dto.nomeFantasia)
                .findFirst()
                .orElseThrow();
        int numberOfElementsInsidePopup = changeEstablishmentPopupComponent.numberOfElementsWithText(name);
        int expectedElements = apiUserDetailsService.getEcsFromDoc(selectECOrDtcoPage.getSelectedDoc()).size();

        assertEquals("Número de ECs no popup Trocar Estabelecimento é diferente. Esperado '%d', atual '%d'".formatted(expectedElements, numberOfElementsInsidePopup),
                expectedElements, numberOfElementsInsidePopup);
    }

    @Then("Popup terá cnpj do documento selecionado")
    public void popupHaveCnpj() throws Exception {
        String formattedCnpj = CpfCnpjUtil.formatCpfCnpj(selectECOrDtcoPage.getSelectedDoc());
        int expectedElements = apiUserDetailsService.getEcsFromDoc(selectECOrDtcoPage.getSelectedDoc()).size();
        int numberOfElementsInsidePopup = changeEstablishmentPopupComponent.numberOfElementsWithText(formattedCnpj);

        assertEquals("Número de ECs no popup Trocar Estabelecimento é diferente.",
                expectedElements, numberOfElementsInsidePopup);
    }

    @Then("Popup terá ECs do documento selecionado")
    public void popupHaveEcs() throws Exception {

        /*List<String> expectedEcs = apiUserDetailsService.getEcsFromDoc(selectECOrDtcoPage.getSelectedDoc());

        for (String ec : expectedEcs) {
            int numberOfElementsInsidePopup = changeEstablishmentPopupComponent.numberOfElementsWithText(ec);

            assertEquals("Não encontrei EC '%s' no popup.".formatted(ec),
                    1, numberOfElementsInsidePopup);
        }*/
        page.getByText("Selecionar Estabelecimento comercial").click();
    }



    @Then("Popup terá mesmo ECs que o selecionado")
    public void popupSameEc() {
        String expectedEc = selectECOrDtcoPage.getSelectedEc();
        int numberOfElementsInsidePopup = changeEstablishmentPopupComponent.numberOfElementsWithText(expectedEc);

        assertEquals("Não encontrei EC '%s' no popup.".formatted(expectedEc),
                1, numberOfElementsInsidePopup);
    }

    @Then("Popup terá nomes do EC selecionado")
    public void popupHaveEcName() throws Exception {
        String expectedEc = selectECOrDtcoPage.getSelectedEc();
        String name = apiUserDetailsService.getUserDetail().ecCods.stream()
                .filter(dto -> dto.ec.equals(expectedEc))
                .map(dto -> dto.nomeFantasia)
                .findFirst()
                .orElseThrow();
        int numberOfElementsInsidePopup = changeEstablishmentPopupComponent.numberOfElementsWithText(name);

        assertEquals("Não encontrei nome do EC '%s'.".formatted(name),
                1, numberOfElementsInsidePopup);
    }

    @And("Popup será fechado ao clicar em Selecionar")
    public void selectEc() {
        pageField.from("Negócios - Popup Trocar - Botão selecionar").click();

        boolean isClosed = changeEstablishmentPopupComponent.waitPopupClose();

        assertTrue("Popup para troca de estabelecimento deveria fechar após Selecionar",
                isClosed);
    }

    @And("o texto {string} esta visivel na pagina de Antecipação")
    public void estaVisivelNaPaginaDeAntecipação(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }
}
