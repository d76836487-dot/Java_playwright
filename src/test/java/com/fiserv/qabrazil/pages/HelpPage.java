package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;

@ScenarioComponent
public class HelpPage extends CheckedBasePage {

    public HelpPage() {
        super(Pattern.compile("^.*/Ajuda$"));
    }

    public void navigateTo() {
        pageField.from("Header - Ajuda").click();
        ensureWeAreAtTheCorrectPage();
    }

    public void shouldSeeWhatsAppChatButton() {
        PageField button = pageField.from("Ajuda - Chat");
        button.fieldIsOneVisibleAndEnabled();
        assertThat(button).hasClass(Pattern.compile("fundo-azul-claro"));
    }

    public void whatsAppChatButtonShouldHavePositionFixed() {
        PageField button = pageField.from("Ajuda - Chat");
        assertThat(button).hasCSS("position", "fixed");
        assertThat(button).hasCSS("bottom", "50px");
        assertThat(button).hasCSS("right", "38px");
    }
}
