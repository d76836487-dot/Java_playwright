package com.fiserv.automation.api.dto;

import java.util.List;

public class PagedPaymentDto {
    public String codigoRetorno;
    public String descricaoRetorno;
    public int totalPages;
    public int totalElements;
    public int pageNumber;
    public int size;
    public List<PaymentSummaryDto> sumarizacao;
}
