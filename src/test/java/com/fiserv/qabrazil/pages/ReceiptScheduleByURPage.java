package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Agenda de Recebimentos por UR")
public class ReceiptScheduleByURPage extends BasePage {

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").hoverOver();
        pageField.from("Menu Lateral - Agenda de Recebimentos UR").click();
        page.waitForURL(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }
}
