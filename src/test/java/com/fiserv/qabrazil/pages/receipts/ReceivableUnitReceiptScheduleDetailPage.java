package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Detalhe da UR")
public class ReceivableUnitReceiptScheduleDetailPage extends BasePage {

    public void ensureWeAreAtURDetailPage() {
        page.waitForURL(Pattern.compile("^.*/DetalheDaUR"));
    }
}
