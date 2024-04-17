package com.fiserv.qabrazil.pages.receivables.paid;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public sealed interface ReceivablePaidExport permits ReceivablePaidExportCsvSimplified, ReceivablePaidExportExcelDetailed, ReceivablePaidExportExcelSimplified {
    boolean hasHeader();

    boolean isNull();

    double getSumPaid() throws IOException;

    double getSumScheduled() throws IOException;

    double getSumTransferred() throws IOException;


    int getCountQuantityPaid() throws IOException;

    int getCountQuantitySchedule() throws IOException;

    int getCountQuantityTransferred() throws IOException;

    double getPaid() throws IOException, ParseException;

    double getScheduled() throws IOException, ParseException;

    double getTransferred() throws IOException, ParseException;

    int getQuantityPaid() throws IOException;

    int getQuantityScheduled() throws IOException;

    int getQuantityTransferred() throws IOException;

    List<String> getEcsFromCell() throws IOException;

    List<String> getEcFromColumn() throws IOException;
}
