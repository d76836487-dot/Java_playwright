package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class HomeTaxistaPage {
    @Autowired
    private Page page;

    private Locator title;
    private Locator btnQueroMinhaAzulzinha;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[contains(text(), 'você tem mais possibilidades')]");
        this.btnQueroMinhaAzulzinha = page.locator("//*[@class='btn btn-quero-azulzinha']");
    }

    public void acessarHomeTaxista(String url) { page.navigate(url); }

    public void verificarHomeTaxista() {
        assertThat(title).isVisible();
    }

    public void clickQueroMinhaAzulzinha() { this.btnQueroMinhaAzulzinha.click(); }

    @Value("${taxista.url}")
    private String url;

    public void acessarCadastroCredenciamentoTaxista() {
        this.acessarHomeTaxista(this.url);
        this.verificarHomeTaxista();
        this.clickQueroMinhaAzulzinha();
    }
}