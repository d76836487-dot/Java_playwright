package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class ProdutosAzulzinhaPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator cbAzulzinhaPro; 
    private Locator cbAzulzinhaAproxima;
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
        this.linkTaxas = page.locator("//*[contains(text(), 'Detalhe de taxas')]");
        this.linkAzulzinhaPro = page.locator("//*[@id='b7-b16-b2-Title']");
        this.linkAzulzinhaAproxima = page.locator("//*[@id='b7-b16-b3-Title']");
        this.btnX = page.locator("//*[@id='b7-b16-Actions']/img");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    private void selecionarProdutosAzulzinha(String produtosAzulzinha) {
        if ((produtosAzulzinha.contains("pro") && !this.cbAzulzinhaPro.isChecked())
        && (produtosAzulzinha.contains("aproxima") && !this.cbAzulzinhaAproxima.isChecked())) {
            click(this.cbAzulzinhaPro);
            click(this.cbAzulzinhaAproxima);
        } else if (produtosAzulzinha.contains("pro") && !this.cbAzulzinhaPro.isChecked())
            click(this.cbAzulzinhaPro);
        else if (produtosAzulzinha.contains("aproxima") && !this.cbAzulzinhaAproxima.isChecked())
            click(this.cbAzulzinhaAproxima);
    }

    public void selecionarCamposProdutosAzulzinha(String produtosAzulzinha) {
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);
        this.selecionarProdutosAzulzinha(produtosAzulzinha);
        click(this.linkTaxas);
        click(this.linkAzulzinhaPro);
        click(this.linkAzulzinhaAproxima);
        click(this.btnX);
        click(this.btnProximo);
    }
}