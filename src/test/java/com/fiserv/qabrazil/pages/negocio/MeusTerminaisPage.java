package com.fiserv.qabrazil.pages.negocio;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.ArrayList;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class MeusTerminaisPage extends GeneralUtils {
    @Autowired
    private Page page; 

    private Locator title;
    private Locator linkVoltar;
    private Locator txtTerminal;
    private Locator iconSearch;
    private Locator resultadoColunaTerminal;
    private Locator resultadoColunaTipoTerminal;
    private Locator resultadoColunaDataHabilitacao;
    private Locator resultadoColunaValorAluguel;
    private Locator resultadoColunaStatus;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Meus terminais']");
        this.linkVoltar = page.locator("//*[text()='Voltar']");
        this.txtTerminal = page.locator("//*[contains(@id, '-Input_Codigo')]");
        this.iconSearch = page.locator("//*[(contains(@class, 'fa-search'))]");
        this.resultadoColunaTerminal = page.locator("//div[span[text()='Terminal']]/following-sibling::div/span");
        this.resultadoColunaTipoTerminal = page.locator("//div[span[text()='Tipo Terminal']]/following-sibling::div/span");
        this.resultadoColunaDataHabilitacao = page.locator("//div[span[text()='Data de habilitação']]/following-sibling::div/span");
        this.resultadoColunaValorAluguel = page.locator("//div[span[text()='Valor do aluguel']]/following-sibling::div/span");
        this.resultadoColunaStatus = page.locator("//div[span[text()='Status']]/following-sibling::div/span");
    }

    private void verificarMeusTerminais() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }

    public void clickVoltar() { click(this.linkVoltar); }

    private void preencherTerminal(String terminal) {
        pressValue(this.txtTerminal, terminal);
        click(this.iconSearch);
    }

    public void validarBuscaTerminal() {
        String terminal = getStringLocator(this.resultadoColunaTerminal.first());

        this.verificarMeusTerminais();
        this.preencherTerminal(terminal);

        for (int i = 0; i < this.resultadoColunaTerminal.count(); i++) {
            this.resultadoColunaTerminal.nth(i).scrollIntoViewIfNeeded();
            assertThat(this.resultadoColunaTerminal.nth(i)).containsText(terminal);
        }
    }

    public List<String> getTodosTerminais() {
        this.verificarMeusTerminais();
        List<String> listaTodosTerminais = new ArrayList<>();

        for (int i = 0; i < this.resultadoColunaTerminal.count(); i++) {
            this.resultadoColunaTerminal.nth(i).scrollIntoViewIfNeeded();

            listaTodosTerminais.add(
                "Terminal: " + getStringLocator(this.resultadoColunaTerminal.nth(i))
                + ";Tipo Terminal: " + getStringLocator(this.resultadoColunaTipoTerminal.nth(i))
                + ";Data de habilitação: " + getStringLocator(this.resultadoColunaDataHabilitacao.nth(i))
                + ";Valor do aluguel: " + getStringLocator(this.resultadoColunaValorAluguel.nth(i))
                + ";Status: " + getStringLocator(this.resultadoColunaStatus.nth(i))
            );
        }

        return listaTodosTerminais;
    }
}