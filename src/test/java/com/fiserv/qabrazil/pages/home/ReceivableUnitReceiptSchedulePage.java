package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Agenda de recebimentos por UR Unidade Recebível")
public class ReceivableUnitReceiptSchedulePage extends CheckedBasePage {

    public ReceivableUnitReceiptSchedulePage() {
        super(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }
}
