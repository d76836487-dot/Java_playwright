package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Relatórios")
public class ReportsPage extends CheckedBasePage {

    public ReportsPage() {
        super(Pattern.compile("^.*/Relatorios$"));
    }
}
