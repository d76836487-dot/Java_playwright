package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.ConnectionToOracleDatabase;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class EnvioCodigoPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator optReceberPorEmail;
    private Locator optReceberPorSMS;
    private Locator btnConfirmar;

    @Autowired
    ConnectionToOracleDatabase connectionToOracleDatabase;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("(//*[contains(text(), 'código')])[1]");
        this.optReceberPorEmail = page.locator("(//*[(text()='Receber por E-mail') or (text()='Receber por e-mail')])[1]");
        this.optReceberPorSMS = page.locator("(//*[(text()='Receber por SMS')])[1]");
        this.btnConfirmar = page.locator("//*[(text()='Confirmar')]");
    }

    private void verificarEnvioCodigo() { waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1); }
    private void clickReceberPorEmail() { click(this.optReceberPorEmail); }
    private void clickReceberPorSMS() { click(this.optReceberPorSMS); }
    private void clickConfirmar() { click(this.btnConfirmar); }

    public void realizarEnvioCodigo(String fluxo, String receberPor) {
        this.verificarEnvioCodigo();

        if (receberPor.equalsIgnoreCase("E-mail"))
            this.clickReceberPorEmail();
        else if (receberPor.equalsIgnoreCase("SMS"))
            this.clickReceberPorSMS();

        String token = connectionToOracleDatabase.getTokenByTypeFlow(fluxo);
        for (int i = 1; i <= token.length(); i++) {
            pressValue(
                 page.locator("(//*[contains(@id, '-Input_Value')])[" + i + "]")
                ,String.valueOf(token.charAt(i-1))
            );
        }

        if (fluxo.equalsIgnoreCase("MFA"))
            this.clickConfirmar();
    }
}