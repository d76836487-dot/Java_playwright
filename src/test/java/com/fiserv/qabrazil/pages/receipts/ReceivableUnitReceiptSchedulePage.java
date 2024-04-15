package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Agenda de Recebimentos por UR")
public class ReceivableUnitReceiptSchedulePage extends CheckedBasePage {

    public ReceivableUnitReceiptSchedulePage() {
        super(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").hoverOver();
        pageField.from("Menu Lateral - Agenda de Recebimentos UR").click();
        page.waitForURL(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }
}
