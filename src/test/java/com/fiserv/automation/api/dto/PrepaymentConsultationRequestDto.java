package com.fiserv.automation.api.dto;

import java.util.List;

public class PrepaymentConsultationRequestDto {
    public List<ItemDto> consultPrepayments;

    public PrepaymentConsultationRequestDto() {
    }

    public PrepaymentConsultationRequestDto(List<ItemDto> consultPrepayments) {
        this.consultPrepayments = consultPrepayments;
    }

    public static class ItemDto {
        public String institutionNumber;
        public String merchantID;
        public String userID;

        public ItemDto() {
        }

        public ItemDto(String institutionNumber, String merchantID, String userID) {
            this.institutionNumber = institutionNumber;
            this.merchantID = merchantID;
            this.userID = userID;
        }
    }
}
