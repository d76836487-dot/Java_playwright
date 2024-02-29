package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;

@ScenarioComponent
public class HelpPage extends BasePage {

    public void shouldSeeWhatsAppChatButton() {
        PageField button = pageField.from("Ajuda - Chat");
        button.fieldIsOneVisibleAndEnabled();
        assertThat(button).hasClass(Pattern.compile("fundo-azul-claro"));
    }
}
