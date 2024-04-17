package com.fiserv.qabrazil.pages.sales.salesToday;

import java.io.IOException;
import java.util.List;

public sealed interface SalesTodayExport permits SalesTodayExportExcel, SalesTodayExportCsv{
    boolean hasHeader();

    boolean isNull();

    String getGrossSales() throws IOException;

    String getUnpaidSales() throws IOException;

    List<String> getEcFromColumn() throws IOException;

    Double getSumGrossValues() throws IOException;
}
