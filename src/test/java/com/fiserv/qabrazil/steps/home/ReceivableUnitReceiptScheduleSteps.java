package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static com.fiserv.qabrazil.pages.PageField.assertThat;

public class ReceivableUnitReceiptScheduleSteps extends BaseSteps {

    @Autowired
    UrlCheckers urlCheckers;

    @Then("usuário {shakespeareBoolean} em {string} opção de Alterar Documento")
    public void ensureWeAreAtTheCorrectPageAndHeaderDoNotHaveChangeDocument(boolean value, String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage();
        PageField button = pageField.from("Agenda de recebimentos por UR - Botão Alterar Documento");
        if (value) {
            assertThat(button).hasCount(1);
        } else {
            assertThat(button).hasCount(0);
        }
    }

    @And("selecionando o Documento no Header o Usuário visualizara o Respectivo Documento selecionado")
    public void ensureSelectedDocumentShowsUp() {
        PageField button = pageField.from("Agenda de recebimentos por UR - Botão Alterar Documento");
        button.click();

        PageField radioButton = pageField.from("Agenda de recebimentos por UR - RadioButton Selecionar Documento").allVisiblePageField()
                .filter(item -> !item.isChecked())
                .findFirst()
                .orElseThrow();
        radioButton.click();

        String cnpj = radioButton.getLocator().locator("../../../../..").locator(".cor-cinza-escuro").nth(1).textContent();
        pageField.from("Agenda de recebimentos por UR - Confirmar Seleção").click();

        assertThat(pageField.from("Agenda de recebimentos por UR - CNPJ Selecionado")).containsText("CNPJ: " + cnpj);
    }
}
