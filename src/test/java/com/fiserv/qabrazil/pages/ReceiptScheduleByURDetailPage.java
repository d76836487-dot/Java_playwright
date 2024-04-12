package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Detalhe da UR")
public class ReceiptScheduleByURDetailPage extends BasePage {


    public void ensureWeAreAtURDetailPage() {
        page.waitForURL(Pattern.compile("^.*/DetalheDaUR"));
    }
}
