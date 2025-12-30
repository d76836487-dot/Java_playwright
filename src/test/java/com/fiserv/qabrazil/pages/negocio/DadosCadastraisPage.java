package com.fiserv.qabrazil.pages.negocio;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

@ScenarioComponent
public class DadosCadastraisPage extends GeneralUtils {
    @Autowired
    private Page page; 

    private Locator title;
    private Locator nomeFantasia;
    private Locator cpfCNPJ;
    private Locator numeroEstabelecimento;
    private Locator cNAE;
    private Locator endereco;
    private Locator telefone;
    private Locator email;
    private Locator btnFechar;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[contains(text(), 'Dados cadastrais do estabelecimento')]");
        this.nomeFantasia = page.locator("//div[span[text()='Nome Fantasia']]/following-sibling::div/span");
        this.cpfCNPJ = page.locator("//div[span[text()='CPF/CNPJ']]/following-sibling::div/span");
        this.numeroEstabelecimento = page.locator("//div[span[text()='Número do estabelecimento']]/following-sibling::div/span");
        this.cNAE = page.locator("//div[span[text()='CNAE']]/following-sibling::div/span");
        this.endereco = page.locator("//div[span[text()='Endereço']]/following-sibling::div/span");
        this.telefone = page.locator("//div[span[text()='Telefone']]/following-sibling::div/span");
        this.email = page.locator("//div[span[text()='E-mail']]/following-sibling::div/span");
        this.btnFechar = page.locator("//*[text()='Fechar']");
    }

    private void verificarDadosCadastrais() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }

    private void clickFechar() { click(this.btnFechar); }

    public void validarDadosCadastrais() {
        this.verificarDadosCadastrais();

        String nomeFantasia = getStringLocator(this.nomeFantasia);
        String cpfCNPJ = getStringLocator(this.cpfCNPJ);
        String numeroEstabelecimento = getStringLocator(this.numeroEstabelecimento);
        String cNAE = getStringLocator(this.cNAE);
        String endereco = getStringLocator(this.endereco);
        String telefone = getStringLocator(this.telefone);
        String email = getStringLocator(this.email);

        boolean validacaoDadosCadastrais = false;
        validacaoDadosCadastrais = (
            !nomeFantasia.equalsIgnoreCase("")
            && !cpfCNPJ.equalsIgnoreCase("")
            && !numeroEstabelecimento.equalsIgnoreCase("")
            && !cNAE.equalsIgnoreCase("")
            && !endereco.equalsIgnoreCase("")
            && !telefone.equalsIgnoreCase("")
            && !email.equalsIgnoreCase("")
        );
        Assert.assertTrue(validacaoDadosCadastrais);

        this.clickFechar();
    }
}