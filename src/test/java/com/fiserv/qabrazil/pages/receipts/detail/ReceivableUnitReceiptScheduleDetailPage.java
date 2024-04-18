package com.fiserv.qabrazil.pages.receipts.detail;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.regex.Pattern;

@ScenarioComponent
@Component("Detalhe da UR")
public class ReceivableUnitReceiptScheduleDetailPage extends BasePage {

    public void ensureWeAreAtURDetailPage() {
        page.waitForURL(Pattern.compile("^.*/DetalheDaUR"));
    }

    public ReceivableUnitReceiptScheduleDetailExportExcel downloadExport() throws IOException {
        Download download = page.waitForDownload(() ->
                pageField.from("Detalhe da UR - Resumo - Botão Exportar").click());

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return new ReceivableUnitReceiptScheduleDetailExportExcel(
                new ExcelWrapper(download.createReadStream(), 0));

    }
}
