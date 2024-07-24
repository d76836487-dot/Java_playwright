package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.home.HomeCustomizeModal;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;

public class HomeCustomizeModalSteps {

    @Autowired
    HomeCustomizeModal homeCustomizeModal;

    @Then("devo visualizar a um modal com demais {csv} para escolher")
    public void modalHasCustomizationOptions(String[] features) {
        homeCustomizeModal.hasOptions(
                features
        );
    }

    @ParameterType(".*")
    public static String[] csv(String csv) {
        Scanner scanner = new Scanner(csv)
                .useDelimiter(Pattern.compile("\\s*,\\s*"));
        List<String> list = new ArrayList<>();
        while(scanner.hasNext()) {
            list.add(scanner.next());
        }
        return list.toArray(String[]::new);
    }

    @And("logout")
    public void logout() {
        homeCustomizeModal.logout();

    }
}
