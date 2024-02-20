package com.fiserv.automation.api.dto;

public class SummaryDto {
    public String estabelecimento;
    public String tipoSumarizacao;
    public String quantidade;
    public long sumarizacao;
    public String sumarizacaoConfirmado;

    public long getSumarizacao() {
        return sumarizacao;
    }

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
