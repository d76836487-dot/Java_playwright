package com.fiserv.automation.api.dto;

import java.util.ArrayList;
import java.util.List;

public class PagedSummaryDto {
    public static final PagedSummaryDto NULL = new PagedSummaryDto();
    public String codigoRetorno;
    public String descricaoRetorno;
    public int totalPages;
    public int totalElements;
    public int pageNumber;
    public int size;
    public boolean first;
    public boolean last;
    public List<AuthorizationsDto> autorizacoes;
    public List<SummaryDto> sumarizacao;

    public PagedSummaryDto() {
        autorizacoes = List.of();
        sumarizacao = List.of();
    }

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
