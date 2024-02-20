package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Minhas Notificações")
public class NotificationsPage extends CheckedBasePage {

    public NotificationsPage() {
        super(Pattern.compile("^.*/Notificacao$"));
    }
}
