package com.fiserv.automation.api.dto;

public class SummaryDto {
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
