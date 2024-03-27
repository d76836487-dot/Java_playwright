package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;

@ScenarioComponent
@Component("Gestão de Acessos")
public class AccessManagementPage extends CheckedBasePage {
    public AccessManagementPage() {
        super(Pattern.compile(".*/GestaoAcessos.*"));
    }

    public void ensureUserTabIsVisible() {
        assertThat(pageField.from("Gestão de Acessos - Abas - Usuários")).isVisible();
    }

    public void ensurePendingInvitesIsVisible() {
        assertThat(pageField.from("Gestão de Acessos - Abas - Convites pendentes")).isVisible();
    }

    public void ensureSearchFieldIsVisible() {
        assertThat(pageField.from("Gestão de Acessos - Campo pesquisar")).isVisible();
    }

    public void ensureInviteNewUserButtonIsVisible() {
        assertThat(pageField.from("Gestão de Acessos - Convidar novo usuário")).isVisible();
    }
}
