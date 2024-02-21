package com.fiserv.automation.api.dto;

import java.util.List;

public class PageReceivableDto {
    public static final PageReceivableDto NULL = new PageReceivableDto();

    public String codigoRetorno;
    public String descricaoRetorno;
    public int totalPages;
    public int totalElements;
    public int pageNumber;
    public int size;
    public List<SalesDto> vendas;
    public List<ReceivableSaleSummaryDto> sumarizacao;

    public PageReceivableDto() {
        size = 0;
        vendas = List.of();
        sumarizacao = List.of();
    }
}
