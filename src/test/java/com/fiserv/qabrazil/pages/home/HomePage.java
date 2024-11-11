package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.microsoft.playwright.Locator;

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
}