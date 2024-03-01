package com.fiserv.automation.api.dto;

import java.util.List;

public record MerchantGroup(String document, String nomeFantasia, String hierarchy,
                            List<MerchantDetail> merchantDetails) {

}
