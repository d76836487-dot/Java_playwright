package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.EcCodsDto;
import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.rest.BwaUserDetails;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ApiUserDetailsService {
    private List<String> ecs = null;
    private UserDetailDto userDetailDto = null;

    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaUserDetails bwaUserDetails;

    public synchronized List<String> getEcs() throws Exception {
        if (userDetailDto == null) {
            getUserDetails();
        }

        return ecs;
    }

    public synchronized UserDetailDto getUserDetail() throws Exception {
        if (userDetailDto == null) {
            getUserDetails();
        }

        return userDetailDto;
    }

    public synchronized List<String> getFormattedEcsAndNames() throws Exception {
        if (userDetailDto == null) {
            getUserDetails();
        }

        return userDetailDto.ecCods
                .stream()
                .map(EcCodsDto::concatEcAndName)
                .toList();
    }


    private void getUserDetails() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        UserDetailDto dto = bwaUserDetails.getUserDetails(apiAccessToken);

        userDetailDto = dto;
        ecs = dto.ecCods.stream().map(ecCods -> ecCods.ec).toList();
    }
}
