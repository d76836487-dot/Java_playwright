package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.rest.BwaUserDetails;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ApiUserDetailsService {
    private List<String> ecs = null;

    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaUserDetails bwaUserDetails;

    public synchronized List<String> getEcs() throws Exception {
        if (ecs != null) return ecs;

        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        UserDetailDto dto = bwaUserDetails.getUserDetails(apiAccessToken);
        ecs = dto.ecCods.stream().map(ecCods -> ecCods.ec).toList();
        return ecs;
    }
}
