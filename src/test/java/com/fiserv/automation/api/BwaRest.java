package com.fiserv.automation.api;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

import java.util.List;

public interface BwaRest {

    @GET("autorizacoes/v2/{institution}/{merchant}/{fromDate}/{toDate}?tipoSumarizacao=D")
    Call<PagedSummaryDto> summarization(
            @Path("institution") String institution,
            @Path("merchant") String merchant,
            @Path("fromDate") String fromDate,
            @Path("toDate") String toDate);

    class PagedSummaryDto {
        public String codigoRetorno;
        public String descricaoRetorno;
        public int totalPages;
        public int totalElements;
        public int pageNumber;
        public int size;
        public List<SummaryDto> sumarizacao;

        @Override
        public String toString() {
            return "Dto{" +
                    "codigoRetorno='" + codigoRetorno + '\'' +
                    ", descricaoRetorno='" + descricaoRetorno + '\'' +
                    ", totalPages=" + totalPages +
                    ", totalElements=" + totalElements +
                    ", pageNumber=" + pageNumber +
                    ", size=" + size +
                    ", sumarizacao=" + sumarizacao +
                    '}';
        }
    }

    class SummaryDto {
        public String estabelecimento;
        public String tipoSumarizacao;
        public String quantidade;
        public String sumarizacao;
        public String sumarizacaoConfirmado;

        @Override
        public String toString() {
            return "SummaryDto{" +
                    "estabelecimento='" + estabelecimento + '\'' +
                    ", tipoSumarizacao='" + tipoSumarizacao + '\'' +
                    ", quantidade='" + quantidade + '\'' +
                    ", sumarizacao='" + sumarizacao + '\'' +
                    ", sumarizacaoConfirmado='" + sumarizacaoConfirmado + '\'' +
                    '}';
        }
    }
}
