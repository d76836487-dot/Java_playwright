package com.fiserv.automation.api.dto;

import java.util.List;

public class PagedSummaryDto {
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
