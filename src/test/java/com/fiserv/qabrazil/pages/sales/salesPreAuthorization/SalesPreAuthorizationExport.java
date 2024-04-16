package com.fiserv.qabrazil.pages.sales.salesPreAuthorization;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public interface SalesPreAuthorizationExport {
    boolean hasHead();

    boolean isNull();

    double getSumGrossAuthorized() throws IOException ;

    double getSumGrossToConfirm() throws IOException ;

    double getGrossAuthorized() throws IOException, ParseException ;

    double getGrossToConfirm() throws IOException, ParseException ;

    long getCountPre() throws IOException ;

    long getCount() throws IOException ;

    List<String> getEcsFromCell() throws IOException ;

    List<String> getEcFromColumn() throws IOException ;

}
