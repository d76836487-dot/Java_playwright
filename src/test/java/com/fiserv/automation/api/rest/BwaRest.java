package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PagedSummaryDto;
import com.fiserv.automation.api.dto.UserDetailDto;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface BwaRest {
    @GET("autorizacoes/v2/{institution}/{merchant}/{fromDate}/{toDate}?tipoSumarizacao=D&status=Autorizada")
    Call<PagedSummaryDto> summarization(
            @Path("institution") String institution,
            @Path("merchant") String merchant,
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);

    @GET("access-management-api-qa/v1/public/users/details")
    Call<UserDetailDto> userDetail();
}
