package com.fiserv.qabrazil.hooks;

import com.fiserv.qabrazil.config.ContractConfig;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.assertj.core.api.Assumptions.assumeThat;

public class TagHook {
    static private final List<Set<String>> tagGroups = List.of(
            Set.of("@pt-br","@es-ar"),
            Set.of("@afinz","@azulzinha","@bin","@sicredi"),
            Set.of("@PermiteAdiantamento","@NaoPermiteAdiantamento"),
            Set.of("@PermiteSolicitações","@NaoPermiteSolicitações"),
            Set.of("@MDRPadrão","@MDRFlex"),
            Set.of("@UsuárioMaster","@UsuárioNãoMaster"));

    @Autowired
    ContractConfig contractConfig;

    @Before("@playwright and not @ignore")
    public void checkTags(Scenario scenario) {
        Collection<String> scenarioTags = scenario.getSourceTagNames();
        List<Set<String>> filteredTagGroups = tagGroups.stream()
                .map(group -> group.stream().filter(scenarioTags::contains).collect(Collectors.toSet()))
                .filter(group -> !group.isEmpty())
                .toList();

        List<String> profileTags = Stream.concat(
                Arrays.stream(contractConfig.getActiveUserProfile().institutionTags().split(",")),
                Arrays.stream(contractConfig.getActiveUserProfile().clientTags().split(","))
        ).toList();

        boolean allTagsInGroupMatchInstitution = filteredTagGroups.stream()
                .allMatch(group -> group.stream().anyMatch(profileTags::contains));

        assumeThat(allTagsInGroupMatchInstitution)
                .withFailMessage("Scenario " + scenario.getName() + " didn't match all necessary tags")
                .isTrue();
    }
}
