package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class ProdutosAzulzinhaPage {
    @Autowired
    private Page page;

    private Locator title;
    private Locator cbAzulzinhaPro;
    private Locator cbAzulzinhaAproxima;
    private Locator drillDownNegocio;
    private Locator btnAlterarNegocio;
    private Locator drillDownDadosPessoais;
    private Locator btnAlterarDadosPessoais;
    private Locator linkTaxas;
    private Locator linkAzulzinhaPro;
    private Locator linkAzulzinhaAproxima;
    private Locator btnX;
    private Locator btnProximo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b7-Titulo']");
        this.cbAzulzinhaPro = page.locator("//*[@id='b7-Switch1']");
        this.cbAzulzinhaAproxima = page.locator("//*[@id='b7-Switch2']");
        this.drillDownNegocio = page.locator("//*[@id='b8-b6-TitleWrapper']");
        this.btnAlterarNegocio = page.locator("//*[@id='b8-b7-Content']/span[contains(text(), 'Alterar')]");
        this.drillDownDadosPessoais = page.locator("//*[@id='b8-b8-TitleWrapper']");
        this.btnAlterarDadosPessoais = page.locator("//*[@id='b8-b9-Content']/span[contains(text(), 'Alterar')]");
        this.linkTaxas = page.locator("//*[contains(text(), 'Detalhe de taxas')]");
        this.linkAzulzinhaPro = page.locator("//*[@id='b7-b16-b2-Title']");
        this.linkAzulzinhaAproxima = page.locator("//*[@id='b7-b16-b3-Title']");
        this.btnX = page.locator("//*[@id='b7-b16-Actions']/img");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    public void verificarProdutosAzulzinha() {
        assertThat(title).isVisible();
    }

    public void selecionarProdutosAzulzinha(String produtosAzulzinha) {
        if ((produtosAzulzinha.contains("pro") && !this.cbAzulzinhaPro.isChecked())
        && (produtosAzulzinha.contains("aproxima") && !this.cbAzulzinhaAproxima.isChecked())) {
            this.cbAzulzinhaPro.click();
            this.cbAzulzinhaAproxima.click();
        } else if (produtosAzulzinha.contains("pro") && !this.cbAzulzinhaPro.isChecked())
            this.cbAzulzinhaPro.click();
        else if (produtosAzulzinha.contains("aproxima") && !this.cbAzulzinhaAproxima.isChecked())
            this.cbAzulzinhaAproxima.click();
    }

    public void clickAlterarDadosNegocio() {
        this.drillDownNegocio.click();
        this.btnAlterarNegocio.click();
    }

    public void clickAlterarDadosPessoais() {
        this.drillDownDadosPessoais.click();
        this.btnAlterarDadosPessoais.click();
    }

    public void clickTaxas() {
        this.linkTaxas.click();
    }

    public void clickAzulzinhaPro() {
        this.linkAzulzinhaPro.click();
    }

    public void clickAzulzinhaAproxima() {
        this.linkAzulzinhaAproxima.click();
    }

    public void clickFecharTaxas() {
        this.btnX.click();
    }

    public void clickProximo() {
        this.btnProximo.click();
    }

    public void selecionarCamposProdutosAzulzinha(String produtosAzulzinha) {
        this.verificarProdutosAzulzinha();
        this.selecionarProdutosAzulzinha(produtosAzulzinha);
        this.clickTaxas();
        this.clickAzulzinhaPro();
        this.clickAzulzinhaAproxima();
        this.clickFecharTaxas();
        this.clickProximo();
    }
}