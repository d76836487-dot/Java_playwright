package com.fiserv.qabrazil.enums;

import lombok.Getter;

@Getter
public enum PerfilAcessoEnum {
    BIN(
        "bin"
        ,setUrlPortal("bin")
        ,"master"
        ,"18711403829"
        ,"Fiserv@2025"
        ,"125"
        ,setInstituicao("7")
    )
    ,SICREDI(
        "sicredi"
        ,setUrlPortal("sicredi")
        ,"master"
        ,"79750866000170"
        ,"Fiserv@1234"
        ,"110"
        ,setInstituicao("4")
    )
    ,AZULZINHA(
        "azulzinha"
        ,setUrlPortal("azulzinha")
        ,"master"
        ,"31561999000171"
        ,"Fiserv@0987"
        ,"149"
        ,setInstituicao("7")
    )
    ,AFINZ(
        "afinz"
        ,setUrlPortal("afinz")
        ,"master"
        ,"72798336082"
        ,"Fiserv@456"
        ,"143"
        ,setInstituicao("10")
    )
    ,CLAROPAY(
        "claropay"
        ,setUrlPortal("portal239")
        ,"master"
        ,"33414095000149"
        ,"ClaroPay@123"
        ,"239"
        ,setInstituicao("7")
    )
    ,BIN_CEDIDOS(
        "bin"
        ,setUrlPortal("bin")
        ,"cedidos"
        ,"18711403829"
        ,"Fiserv@2025"
        ,"125"
        ,setInstituicao("7")
    )
    ,SICREDI_CEDIDOS(
        "sicredi"
        ,setUrlPortal("sicredi")
        ,"cedidos"
        ,"79750866000170"
        ,"Fiserv@1234"
        ,"110"
        ,setInstituicao("4")
    )
    ,AZULZINHA_CEDIDOS(
        "azulzinha"
        ,setUrlPortal("azulzinha")
        ,"cedidos"
        ,"31561999000171"
        ,"Fiserv@0987"
        ,"149"
        ,setInstituicao("7")
    )
    ,AFINZ_CEDIDOS(
        "afinz"
        ,setUrlPortal("afinz")
        ,"cedidos"
        ,"72798336082"
        ,"Fiserv@456"
        ,"143"
        ,setInstituicao("10")
    )
    ,CLAROPAY_CEDIDOS(
        "claropay"
        ,setUrlPortal("portal239")
        ,"cedidos"
        ,"33414095000149"
        ,"ClaroPay@123"
        ,"239"
        ,setInstituicao("7")
    );

    private final String alianca;
    private final String urlPortal;
    private final String perfil;
    private final String usuario;
    private final String senha;
    private final String contratoServico;
    private final String instituicao;

    PerfilAcessoEnum(
     String alianca
    ,String urlPortal
    ,String perfil
    ,String usuario
    ,String senha
    ,String contratoServico
    ,String instituicao){
        this.alianca = alianca;
        this.urlPortal = urlPortal;
        this.perfil = perfil;
        this.usuario = usuario;
        this.senha = senha;
        this.contratoServico = contratoServico;
        this.instituicao = instituicao;
    }

    private static String setUrlPortal(String alianca) {
        return "https://" + alianca + ".qa.portaldocliente.fiserv.com";
    }

    private static String setInstituicao(String instituicao) {
        return String.format("%08d", Integer.parseInt(instituicao));
    }
}