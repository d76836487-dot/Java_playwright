package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.EcCodsDto;
import com.fiserv.automation.api.dto.MerchantDetail;
import com.fiserv.automation.api.dto.MerchantGroup;
import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.rest.BwaUserDetails;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.Map.entry;

@Component
public class ApiUserDetailsService {
    private static final Logger log = LoggerFactory.getLogger(ApiUserDetailsService.class);
    @Autowired
    BrowserLocalStorage browserLocalStorage;
    @Autowired
    BwaUserDetails bwaUserDetails;
    private List<String> ecs = null;
    private UserDetailDto userDetailDto = null;

    private static ArrayList<MerchantGroup> getMerchantGroups(Map<String, List<EcCodsDto>> groupedDocument) {
        ArrayList<MerchantGroup> allMerchantGroups = new ArrayList<>();
        for (String document : groupedDocument.keySet()) {
            List<EcCodsDto> ecCodsDtos = groupedDocument.get(document);
            List<MerchantDetail> merchantDetails = new ArrayList<>();

            for (EcCodsDto ecCodsDto : ecCodsDtos) {
                merchantDetails.add(new MerchantDetail(ecCodsDto.ec, ecCodsDto.nomeFantasia, ecCodsDto.status));
            }

            EcCodsDto firstEcCod = ecCodsDtos.get(0);
            allMerchantGroups.add(new MerchantGroup(document, firstEcCod.nomeFantasia, firstEcCod.hierarchy, merchantDetails));
        }

        return allMerchantGroups;
    }

    public synchronized List<String> getEcs() throws Exception {
        if (userDetailDto == null) {
            getUserDetails();
        }

        return ecs;
    }

    public synchronized List<String> getEcsFromDoc(String document) throws Exception {
        return getUserDetail().ecCods.stream()
                .filter(dto -> document == null || dto.document.equals(document))
                .map(dto -> dto.ec)
                .toList();
    }

    public String getDocWithMostEcs() throws Exception {
        Map<String, List<EcCodsDto>> groupByDoc = getUserDetail().ecCods.stream()
                .collect(Collectors.groupingBy(EcCodsDto::getDocument));


        List<Map.Entry<String, Integer>> sorted = groupByDoc.keySet().stream()
                .map(key -> entry(key, groupByDoc.get(key).size()))
                .sorted(Map.Entry.comparingByValue())
                .toList();

        return sorted.get(sorted.size() - 1).getKey();
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

    public boolean tokenIsStillValid() {
        try {
            userDetailDto = null;
            getUserDetail();
            return true;
        } catch (Exception e) {
            log.info("Token aparentemente inválido.");
            return false;
        }
    }
}
