package com.fiserv.qabrazil.browser;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.BrowserContext;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@ScenarioComponent
public class BrowserLocalStorage {
    private static final String ACCESS_TOKEN = "$OS_Users$Fiserv$ClientVars$AccessToken";

    @Autowired
    BrowserContext browserContext;

    public String getApiAccessToken() throws JsonProcessingException {
        String token = browserContext.storageState();

        TypeReference<HashMap<String,Object>> typeRef = new TypeReference<>() {};
        Map<String, Object> j = new ObjectMapper().readValue(token, typeRef);

        List<?> localStorage = ((List<?>) ((Map<?, ?>) ((List<?>) j.get("origins")).get(0)).get("localStorage"));
        return (String) localStorage.stream().filter(
                        k -> ((Map<?, ?>) k).get("name").equals(ACCESS_TOKEN)).
                map(k -> ((Map<?, ?>) k).get("value")).findFirst().orElse(null);
    }
}
