package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

@ScenarioComponent
public class HomeTaxistaPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator btnQueroMinhaAzulzinha;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[contains(text(), 'você tem mais possibilidades')]");
        this.btnQueroMinhaAzulzinha = page.locator("//*[@class='btn btn-quero-azulzinha']");
    }

    @Value("${urls.taxista}")
    private String url;

    public void acessarCadastroCredenciamentoTaxista() {
        page.navigate(this.url);
        waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1);
        click(this.btnQueroMinhaAzulzinha);
    }
}