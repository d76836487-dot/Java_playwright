package com.fiserv.automation.api.dto;

import java.util.ArrayList;
import java.util.List;

public class PageRealizedSalesDto {
    public final static PageRealizedSalesDto NULL = new PageRealizedSalesDto();

    public String codigoRetorno;
    public String descricaoRetorno;
    public int totalPages;
    public int totalElements;
    public int pageNumber;
    public int size;
    public boolean first;
    public boolean last;
    public List<SalesDto> vendas;
    public List<RealizedSaleSummaryDto> sumarizacao;

    public PageRealizedSalesDto() {
        size = 0;
        vendas = List.of();
        sumarizacao = List.of();
    }
}
