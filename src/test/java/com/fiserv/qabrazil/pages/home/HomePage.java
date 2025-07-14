package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class HomePage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator rodape;

    // Dashboard
    private Locator vendasHoje;
    private Locator ultimasVendas;
    private Locator recebimentos;
    private Locator agendaRecebimentosSemana;

    // Personalize sua visualização
    private Locator titlePersonalizeVisualizacao;
    private Locator btnEstabelecimento;
    private Locator expandirEstabelecimento;
    private Locator rbPrmeiroEstabelecimento;
    private Locator cbDefinirPadrao;
    private Locator btnAcessar;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Acesso rápido']");
        this.rodape = page.locator("//*[@data-testid='footer-text']");

        // Dashboard
        this.vendasHoje = page.locator("//*[@data-testid='home-card-vendas-hoje-link-ver-tudo']");
        this.ultimasVendas = page.locator("//*[@data-testid='home-card-ultimas-vendas-hoje-link-ver-tudo']");
        this.recebimentos = page.locator("//*[@data-testid='home-card-recebimentos-link-ver-tudo']");
        this.agendaRecebimentosSemana = page.locator("//*[@data-testid='home-card-recebimentos-semana-link-ver-tudo']");

        // Personalize sua visualização
        this.titlePersonalizeVisualizacao = page.locator("//*[@data-testid='trocar-estabelecimento-title']");
        this.btnEstabelecimento = page.locator("//*[@data-testid='alterar-matriz-type-estabelecimento']");
        this.expandirEstabelecimento = page.locator("//*[@class='osui-accordion-item__icon osui-accordion-item__icon--caret']");
        this.rbPrmeiroEstabelecimento = page.locator("(//*[contains(@id, '-RadioButton_Estabelecimento-input')])[1]");
        this.cbDefinirPadrao = page.locator("//*[@data-testid='alterar-matriz-checkbox-definir-padrão']");
        this.btnAcessar = page.locator("//*[@data-testid='alterar-matriz-button-acessar']");
    }

    public void verificarHome() {
        this.isVisiblePersonalizarVisualizacao();
        waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_4);
    }

    public void acessarDashboard(@NotNull String dashboard) {
        Locator verTudo = page.locator("");

        if (dashboard.equalsIgnoreCase("vendasHoje"))
            verTudo = this.vendasHoje;
        else if (dashboard.equalsIgnoreCase("ultimasVendas"))
            verTudo = this.ultimasVendas;
        else if (dashboard.equalsIgnoreCase("recebimentos"))
            verTudo = this.recebimentos;
        else if (dashboard.equalsIgnoreCase("agendaRecebimentosSemana"))
            verTudo = this.agendaRecebimentosSemana;

        click(verTudo);
    }

    public void verificarTextoRodape() {
        waitIsVisibleForSeconds(this.rodape, Config.WAIT_LEVEL_1);

        LocalDate now = LocalDate.now();
        int year = now.getYear();
        String textoRodape = "© " + year + " Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados.";
        assertThat(rodape).containsText(textoRodape);
    }

    private void isVisiblePersonalizarVisualizacao() {
        waitForSeconds(Config.WAIT_LEVEL_1);
        if (this.titlePersonalizeVisualizacao.isVisible()) {
            this.btnEstabelecimento.click();
            this.expandirEstabelecimento.click();
            this.rbPrmeiroEstabelecimento.check();
            this.cbDefinirPadrao.check();
            this.btnAcessar.click();
        }
    }

    public void isVisibleDashboard(String dashboard, String visivel) {
        if (dashboard.equalsIgnoreCase("vendasHoje")) {
            if (visivel.equalsIgnoreCase("está visível")) {
                waitIsVisibleForSeconds(this.vendasHoje, Config.WAIT_LEVEL_3);
            } else if (visivel.equalsIgnoreCase("não está visível")) {
                waitIsNotVisibleForSeconds(this.vendasHoje, Config.WAIT_LEVEL_3);
            }
        } else if (dashboard.equalsIgnoreCase("ultimasVendas")) {
            if (visivel.equalsIgnoreCase("está visível")) {
                waitIsVisibleForSeconds(this.ultimasVendas, Config.WAIT_LEVEL_3);
            } else if (visivel.equalsIgnoreCase("não está visível")) {
                waitIsNotVisibleForSeconds(this.ultimasVendas, Config.WAIT_LEVEL_3);
            }
        }
    }
}