package com.fiserv.qabrazil.pages.sales.salesUnmade;

import java.io.IOException;
import java.util.List;

public sealed interface SalesUnmadeExport permits SalesUnmadeExportCsv, SalesUnmadeExportExcel {
    boolean hasHeader();

    boolean isNull();

    int getRefused() throws IOException;

    int getUnmade() throws IOException;

    List<String> getEcsFromCell() throws IOException;

    List<String> getEcFromColumn() throws IOException;

    int getRefusedDetailsCount() throws IOException;

    int getUnmadeDetailsCount() throws IOException;
}
