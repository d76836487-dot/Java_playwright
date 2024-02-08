package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.*;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface BwaRest {
    @GET("autorizacoes-historico/resources/v2/{institution}/{merchant}/{fromDate}/{toDate}?tipoSumarizacao=D&status=Autorizada")
    Call<PagedSummaryDto> summarization(
            @Path("institution") String institution,
            @Path("merchant") String merchant,
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);

    @GET("autorizacoes-historico/resources/v2/{institution}/{merchant}/{fromDate}/{toDate}?status=Autorizada")
    Call<PagedSummaryDto> authorizations(
            @Path("institution") String institution,
            @Path("merchant") String merchant,
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);

    @GET("pagamentos/resources/v1/{institution}/{merchant}/{fromDate}/{toDate}?tipoSumarizacao=D")
    Call<PagedPaymentDto> paymentSummarized(
            @Path("institution") String institution,
            @Path("merchant") String merchant,
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);

    @POST("vendas/resources/v3/receber/{fromDate}/{toDate}?tipoSumarizacao=D")
    Call<PageSalesDto> receivableSalesSummarized(
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);
    @POST("wsm/v2/prepayments/consultations/consultPrepayment")
    Call<PrepaymentDto> prepaymentConsultation();

    @GET("access-management-api-qa/v1/public/users/details")
    Call<UserDetailDto> userDetail();

}
