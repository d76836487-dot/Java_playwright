package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;
import java.time.LocalDate;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class HomePage extends CheckedBasePage {
    public HomePage() {
        super(Pattern.compile("^.*/Home$"));
    }

    public void ensureWeAreAtHome() {
        ensureWeAreAtTheCorrectPage();
    }

    public boolean anticipationCardIsVisible() {
        // TODO: change for data-testid
        return waitUntilTrue(() -> page.locator("#LadoDireito").getByText("Antecipação", new Locator.GetByTextOptions().setExact(true)).count() == 1);
    }

    public void clickOnButtonSeeAllInSalesTodaySection() {
        // TODO: fix selector
        Locator btn = page.locator("//a[@href=\"/Hoje\"]/*/span");
        assertThat(btn).containsText("Ver tudo");
        btn.click();
    }

    public  void cheTextElementOnage(String arg0) {
        page.locator("//span[contains(text().'"+arg0+"']");
    }

    public void usuárioClicaEmVerTudoNoCardRecebimento(String arg0) {
        page.locator("xpath=/html/body/div[1]/div/div/div/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div/div[3]/div[1]/div[2]/div/div/div[6]/a/div").click();
    }

    public void usuárioClicaEmVerTudoNoCardultimasVendas(String arg0) {
        page.locator("xpath=/html/body/div[1]/div/div/div/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[4]/a/div").click();
    }

    public void usuárioClicaEmVerTudoNoCarAgRecSem(String arg0) {
        page.locator("xpath=/html/body/div[1]/div/div/div/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div/div[3]/div[1]/div[3]/div/div/div[4]/a/div").click();

    }

    // |INÍCIO| - Refatoração da Home
    @Autowired
    private Page page;

    private Locator title;
    private Locator verTudoVendasHoje;
    private Locator rodape;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Acesso rápido']");
        this.verTudoVendasHoje = page.locator("//*[@data-testid='home-card-vendas-hoje-link-ver-tudo']");
        this.rodape = page.locator("//*[@data-testid='footer-text']");
    }

    public void verificarHome() {
        WaitUtil.sleep(Duration.ofMillis(5000));

        assertThat(title).isVisible();
    }

    public void clickVerTudoVendasHoje() {
        this.verTudoVendasHoje.scrollIntoViewIfNeeded();
        this.verTudoVendasHoje.click();
    }

    public void acessarDashboard(String dashboard) {
        if (dashboard.equalsIgnoreCase("vendas"))
            this.clickVerTudoVendasHoje();
    }

    public void verificarTextoRodape() {
        this.rodape.scrollIntoViewIfNeeded();
        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));

        LocalDate now = LocalDate.now();
        int year = now.getYear();
        String textoRodape = "© " + year + " Fiserv do Brasil Instituição de Pagamento Ltda. Todos os direitos reservados.";
        assertThat(rodape).containsText(textoRodape);
    }
    // |FIM| - Refatoração da Home
}