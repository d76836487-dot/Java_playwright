package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.RegexUtil;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Informe de rendimento")
public class IncomeReportPage extends CheckedBasePage {

    public IncomeReportPage() {
        super(Pattern.compile(RegexUtil.escape("https://cat-webfarm.1dc.com/informederendimentos/")));
    }
}
