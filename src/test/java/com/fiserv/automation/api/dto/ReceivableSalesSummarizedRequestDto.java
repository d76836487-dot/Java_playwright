package com.fiserv.automation.api.dto;

import java.util.List;

public class ReceivableSalesSummarizedRequestDto {
    List<String> merchants;

    public ReceivableSalesSummarizedRequestDto() {
    }

    public ReceivableSalesSummarizedRequestDto(List<String> merchants) {
        this.merchants = merchants;
    }
}
