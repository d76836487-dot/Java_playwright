package com.fiserv.qabrazil;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.playwright.configuration.AuthenticatedPlaywrightConfiguration;
import io.cucumber.java.DefaultDataTableCellTransformer;
import io.cucumber.java.DefaultDataTableEntryTransformer;
import io.cucumber.java.DefaultParameterTransformer;
import io.cucumber.spring.CucumberContextConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.reflect.Type;

@SpringBootTest(classes = {AuthenticatedPlaywrightConfiguration.class, CommonsConfiguration.class})
@CucumberContextConfiguration
public class CucumberContext {

    @Autowired
    ObjectMapper objectMapper;

    @DefaultParameterTransformer
    @DefaultDataTableCellTransformer
    @DefaultDataTableEntryTransformer
    public Object transform(Object from, Type to) {
        return objectMapper.convertValue(from, objectMapper.constructType(to));
    }
}
