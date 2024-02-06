package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.PagedSummaryDto;
import com.fiserv.automation.api.rest.BwaAuthorization;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class ApiAuthorizationsService {
    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaAuthorization bwaAuthorization;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    public Number getSalesTodayAllEcs() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        return ecs.stream()
                .mapToLong(ec -> getSalesEcToday(apiAccessToken, ec))
                .sum();
    }

    private long getSalesEcToday(String apiAccessToken, String ec) {
        String today = formattedDate(0);
        PagedSummaryDto answer;
        try {
            answer = bwaAuthorization.getSummarySevenDays(apiAccessToken, ec);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return answer.sumarizacao.stream()
                .filter(summary -> summary.tipoSumarizacao.equals(today))
                .mapToLong(summary -> {
                    System.out.printf("sumarização em %s para EC %s: %s\n", today, ec, summary.sumarizacao);
                    return Long.parseLong(summary.sumarizacao);
                })
                .sum();
    }
}
