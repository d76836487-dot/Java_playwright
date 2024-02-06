package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.AuthorizationsDto;
import com.fiserv.automation.api.dto.PagedSummaryDto;
import com.fiserv.automation.api.rest.BwaAuthorization;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class ApiAuthorizationsService {
    private static final Comparator<AuthorizationsDto> authorizationsDtoComparator =
            (i1, i2) -> String.format("%s%s", i2.data, i2.hora).compareTo(String.format("%s%s", i1.data, i1.hora));

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

    public List<AuthorizationsDto> getValueLastSales() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<AuthorizationsDto> authorizationsDtos = getAuthorizationsAllEcs(apiAccessToken);

        List<AuthorizationsDto> orderedSales = authorizationsDtos.stream()
                .sorted(authorizationsDtoComparator)
                .toList();

        List<String> firstThreeDateTime = orderedSales.subList(0, Math.min(3, orderedSales.size())).stream()
                .map(dto -> String.format("%s%s", dto.data, dto.hora))
                .toList();

        return  orderedSales.stream()
                .filter(dto -> firstThreeDateTime.contains(String.format("%s%s", dto.data, dto.hora)))
                .toList();
    }

    private List<AuthorizationsDto> getAuthorizationsAllEcs(String apiAccessToken) throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs();

        List<AuthorizationsDto> authorizationsDtos = ecs.parallelStream()
                .flatMap(merchant -> {
                    try {
                        List<AuthorizationsDto> r = bwaAuthorization.getLastAuthorizations(apiAccessToken, merchant).autorizacoes;
                        return r.stream();
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                })
                .toList();

        trimSecondsFromTime(authorizationsDtos);

        return authorizationsDtos;
    }

    private void trimSecondsFromTime(List<AuthorizationsDto> authorizationsDtos) {
        authorizationsDtos.forEach(dto -> dto.hora = dto.hora.substring(0, 4));
    }
}
