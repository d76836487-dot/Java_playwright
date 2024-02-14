package com.fiserv.automation.api.dto;

import java.util.List;

public class PageSalesDto {
    public String codigoRetorno;
    public String descricaoRetorno;
    public int totalPages;
    public int totalElements;
    public int pageNumber;
    public int size;
    public List<SalesDto> vendas;
    public List<SalesSummaryDto> sumarizacao;

    public PageSalesDto() {
        size = 0;
        vendas = List.of();
        sumarizacao = List.of();
    }
}
