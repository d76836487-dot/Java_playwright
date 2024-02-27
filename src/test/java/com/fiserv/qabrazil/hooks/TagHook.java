package com.fiserv.qabrazil.hooks;

import com.fiserv.qabrazil.config.ContractConfig;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assumptions.assumeThat;

public class TagHook {
    static private final List<Set<String>> tagGroups = List.of(
            Set.of("@pt-br","@es-ar"),
            Set.of("@PermiteAdiantamento","@NaoPermiteAdiantamento"),
            Set.of("@PermiteSolicitações","@NaoPermiteSolicitações"),
            Set.of("@MDRPadrão","@MDRFlex"));

    @Autowired
    ContractConfig contractConfig;

    @Before("@playwright and not @ignore")
    public void checkTags(Scenario scenario) {
        List<String> tagsInTagGroup = scenario.getSourceTagNames().stream().filter(
                tag -> tagGroups.stream().anyMatch(
                        tagGroup -> tagGroup.contains(tag))).toList();

        boolean allTagsInGroupMatchInstitution = tagsInTagGroup.stream().allMatch(
                tag -> contractConfig.getActiveUserProfile().institutionTags().contains(tag) ||
                       contractConfig.getActiveUserProfile().clientTags().contains(tag));

        assumeThat(tagsInTagGroup.isEmpty() || allTagsInGroupMatchInstitution)
                .withFailMessage("Scenario " + scenario.getName() + " didn't match all necessary tags")
                .isTrue();
    }
}
