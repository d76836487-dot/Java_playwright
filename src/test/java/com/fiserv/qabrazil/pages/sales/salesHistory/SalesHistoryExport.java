package com.fiserv.qabrazil.pages.sales.salesHistory;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public interface SalesHistoryExport {
    boolean hasHeader();

    boolean isNull();

    double getGrossSales() throws IOException, ParseException ;

    double getNetSales() throws IOException, ParseException ;

    double getCancelledSales() throws IOException, ParseException;

    List<String> getEcsFromCell() throws IOException ;

    List<String> getEcFromColumn() throws IOException ;

    Double getSumGrossValues() throws IOException, ParseException;

    Double getSumNetValues() throws IOException, ParseException;

    Double getSumCancelledValues() throws IOException, ParseException;

}
