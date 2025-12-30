package com.fiserv.qabrazil.pages.negocio;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class NegocioPage extends GeneralUtils {
    @Autowired
    private Page page;
 
    @Autowired
    TrocarEstabelecimentoPage trocarEstabelecimentoPage;
    @Autowired
    DadosCadastraisPage dadosCadastraisPage;
    @Autowired
    MeusDomiciliosPage meusDomiciliosPage;
    @Autowired
    MeusTerminaisPage meusTerminaisPage;

    private Locator title;
    private Locator btnTrocarEstabelecimento;
    private Locator cardDadosCadastrais;
    private Locator cardMeusDomicilios;
    private Locator cardInteligenciaFinanceira;
    private Locator linkVerTodosOsTerminais;
    private Locator resultadoColunaTerminal;
    private Locator resultadoColunaDataHabilitacao;
    private Locator resultadoColunaValorAluguel;
    private Locator slcBandeira;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//h1/span[text()='Negócio']");
        this.btnTrocarEstabelecimento = page.locator("//*[@data-testid='negocio-trocar-estabelecimentos']");
        this.cardDadosCadastrais = page.locator("//*[text()='Dados Cadastrais']");
        this.cardMeusDomicilios = page.locator("//*[text()='Meus Domicílios']");
        this.cardInteligenciaFinanceira = page.locator("//*[text()='Inteligência financeira']");
        this.linkVerTodosOsTerminais = page.locator("//*[text()='Ver todos os terminais']");
        this.resultadoColunaTerminal = page.locator("//div[span[text()='Terminal']]/following-sibling::div/span");
        this.resultadoColunaDataHabilitacao = page.locator("//div[span[text()='Data de habilitação']]/following-sibling::div/span");
        this.resultadoColunaValorAluguel = page.locator("//div[span[text()='Valor aluguel']]/following-sibling::div/span");
        this.slcBandeira = page.locator("//*[@data-testid='simple-dropdown-select-']");
    }

    private void verificarNegocio() {
        waitForSeconds(Config.WAIT_15_SECONDS);
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);
    }

    private void clickTrocarEstabelecimento() { click(this.btnTrocarEstabelecimento); }

    private void clickDadosCadastrais() { click(this.cardDadosCadastrais); }

    private void clickMeusDomicilios() { click(this.cardMeusDomicilios); }

    private void clickInteligenciaFinanceira() {
        click(this.cardInteligenciaFinanceira);
        waitForSeconds(Config.WAIT_5_SECONDS);
    }

    private void clickVerTodosOsTerminais() { click(this.linkVerTodosOsTerminais); }

    private void selectBandeira(String bandeira) {
        this.slcBandeira.scrollIntoViewIfNeeded();
        this.slcBandeira.hover();
        page.locator("//*[contains(@data-testid, 'simple-dropdown-select--item-')]/following-sibling::div/span[text()='"+bandeira+"']").click();
    }

    public void validarTrocaEstabelecimento() {
        this.verificarNegocio();
        this.clickTrocarEstabelecimento();
        trocarEstabelecimentoPage.realizarTrocaEstabelecimento();
    }

    public void validarDadosCadastrais() {
        this.verificarNegocio();
        this.clickDadosCadastrais();
        dadosCadastraisPage.validarDadosCadastrais();
    }

    public void validarFiltroMeusDomicilios(@NotNull String filtro, String valor) {
        this.verificarNegocio();
        this.clickMeusDomicilios();
        meusDomiciliosPage.validarFiltroMeusDomicilios(filtro, valor);
    }

    public void validarInteligenciaFinanceira() {
        this.verificarNegocio();
        this.clickInteligenciaFinanceira();
    }

    public void validarBuscaTerminal() {
        this.verificarNegocio();
        this.clickVerTodosOsTerminais();
        meusTerminaisPage.validarBuscaTerminal();
    }

    public void validarMeusTerminais() {
        this.verificarNegocio();
        this.clickVerTodosOsTerminais();

        List<String> listaTodosTerminais = meusTerminaisPage.getTodosTerminais();
        meusTerminaisPage.clickVoltar();

        String terminal = "";
        String tipoTerminal = "";
        String dataHabitacao = "";
        String valorAluguel = "";
        String status = "";
        for (String terminais : listaTodosTerminais) {
            String[] camposTerminais = terminais.split(";");
            for (String campoTerminal : camposTerminais) {
                if (campoTerminal.contains("Terminal: "))
                    terminal = campoTerminal.replace("Terminal: ", "");
                else if (campoTerminal.contains("Tipo Terminal: "))
                    tipoTerminal = campoTerminal.replace("Tipo Terminal: ", "");
                else if (campoTerminal.contains("Data de habilitação: "))
                    dataHabitacao = campoTerminal.replace("Data de habilitação: ", "");
                else if (campoTerminal.contains("Valor do aluguel: "))
                    valorAluguel = campoTerminal.replace("Valor do aluguel: ", "");
                else if (campoTerminal.contains("Status: "))
                    status = campoTerminal.replace("Status: ", "");
            }

            assertThat(page.locator("//*[text()='"+tipoTerminal+"']")).isVisible();
            assertThat(page.locator("//*[text()='"+status+"']")).isVisible();
            assertThat(this.resultadoColunaTerminal).containsText(terminal);
            assertThat(this.resultadoColunaDataHabilitacao).containsText(dataHabitacao);
            assertThat(this.resultadoColunaValorAluguel).containsText(valorAluguel);
        }
    }

    public void validarTaxasTarifasPorBandeira(String bandeira) {
        this.verificarNegocio();
        this.selectBandeira(bandeira);
        assertThat(page.locator("//h5/span[text()='"+bandeira+"']")).isVisible();
    }
}