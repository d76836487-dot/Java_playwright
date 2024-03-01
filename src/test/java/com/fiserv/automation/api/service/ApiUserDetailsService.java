package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.*;
import com.fiserv.automation.api.rest.BwaUserDetails;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    public List<MerchantGroup> getUserDetailGroupedByDocument() throws Exception {
        List<EcCodsDto> allEcCodsDtos = getUserDetail().ecCods;

        Map<String, List<EcCodsDto>> groupedDocument = allEcCodsDtos.stream()
                .collect(Collectors.groupingBy(EcCodsDto::getDocument));

        return getMerchantGroups(groupedDocument);
    }

    @NotNull
    private static ArrayList<MerchantGroup> getMerchantGroups(Map<String, List<EcCodsDto>> groupedDocument) {
        ArrayList<MerchantGroup> allMerchantGroups = new ArrayList<>();
        for(String document: groupedDocument.keySet()) {
            List<EcCodsDto> ecCodsDtos = groupedDocument.get(document);
            List<MerchantDetail> merchantDetails = new ArrayList<>();

            for(EcCodsDto ecCodsDto: ecCodsDtos) {
                merchantDetails.add(new MerchantDetail(ecCodsDto.ec, ecCodsDto.nomeFantasia, ecCodsDto.status));
            }

            EcCodsDto firstEcCod = ecCodsDtos.get(0);
            allMerchantGroups.add(new MerchantGroup(document, firstEcCod.nomeFantasia, firstEcCod.hierarchy, merchantDetails));
        }

        return allMerchantGroups;
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
