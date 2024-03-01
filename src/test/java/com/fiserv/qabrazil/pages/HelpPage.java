package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static org.assertj.core.api.Assertions.assertThat;

@ScenarioComponent
public class HelpPage extends CheckedBasePage {

    public HelpPage() {
        super(Pattern.compile("^.*/Ajuda$"));
    }

    public void navigateTo() {
        pageField.from("Header - Ajuda").click();
        ensureWeAreAtTheCorrectPage();
    }

    public void shouldSeeWhatsAppChatButton(String expectedColor) {
        PageField button = pageField.from("Ajuda - Chat");
        button.fieldIsOneVisibleAndEnabled();
        assertThat(button).hasCSS("background-color", expectedColor);
    }

    public void whatsAppChatButtonShouldHavePositionFixed() {
        PageField button = pageField.from("Ajuda - Chat");
        assertThat(button).hasCSS("position", "fixed");
        assertThat(button).hasCSS("bottom", "50px");
        assertThat(button).hasCSS("right", "38px");
    }

    public void assertBottomWhatsAppText(String... expectedTexts) {
        PageField whatsAppCard = pageField.from("Ajuda - WhatsApp Card");
        List<String> allTexts = whatsAppCard.getAllAsText();
        assertThat(allTexts).containsExactly(expectedTexts);
    }
}
