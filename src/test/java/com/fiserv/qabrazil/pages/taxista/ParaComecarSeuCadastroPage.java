package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class ParaComecarSeuCadastroPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtNomeCompleto;
    private Locator txtDataNascimento;
    private Locator txtCelular;
    private Locator txtEmail;
    private Locator txtCpf;
    private Locator txtNomeFantasia;
    private Locator txtFaturamentoAnual;
    private Locator txtTicketMedio;
    private Locator btnProximo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b4-Titulo']");
        this.txtNomeCompleto = page.locator("//*[@id='b4-Input_Nome']");
        this.txtDataNascimento = page.locator("//*[@id='b4-Input_DataNascimento']");
        this.txtCelular = page.locator("//*[@id='b4-b9-InputMask']");
        this.txtEmail = page.locator("//*[@id='b4-Input_Email']");
        this.txtCpf = page.locator("//*[@id='b4-b14-InputMask']");
        this.txtNomeFantasia = page.locator("//*[@id='b4-Input_NomeFantasia']");
        this.txtFaturamentoAnual = page.locator("//*[@id='b4-Input_FaturamentoAnual']");
        this.txtTicketMedio = page.locator("//*[@id='b4-Input_TicketMedio']");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    public void preencherCamposParaComecarSeuCadastro(
     String nomeCompleto
    ,String dataNascimento
    ,String celular
    ,String email
    ,String cpf
    ,String nomeFantasia
    ,String faturamentoAnual
    ,String ticketMedio) {
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);
        pressValue(this.txtNomeCompleto, nomeCompleto);
        pressValue(this.txtDataNascimento, dataNascimento);
        pressValue(this.txtCelular, celular);
        pressValue(this.txtEmail, email);
        pressValue(this.txtCpf, cpf);
        pressValue(this.txtNomeFantasia, nomeFantasia);
        pressValue(this.txtFaturamentoAnual, faturamentoAnual);
        pressValue(this.txtTicketMedio, ticketMedio);
        click(this.btnProximo);
    }
}