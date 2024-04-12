package com.fiserv.qabrazil.pages.sales.salesToday;

import java.io.IOException;
import java.util.List;

public sealed interface SalesTodayExport permits SalesTodayExportExcel, SalesTodayExportCsv{
    String getGrossSales() throws IOException;

    String getUnpaidSales() throws IOException;

    List<String> getECs() throws IOException;

    Double getSumGrossValues() throws IOException;
}
