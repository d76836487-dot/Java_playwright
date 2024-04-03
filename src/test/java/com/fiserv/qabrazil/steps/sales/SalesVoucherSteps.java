package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.SalesVoucherPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;

public class SalesVoucherSteps extends BasePage {
    @Autowired
    SalesVoucherPage salesVoucherPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesVoucherPage.SalesVoucherExportExcel salesVoucherExportExcel;

    @Given("Usuário acessou Vendas - Voucher")
    public void goTo() {
        salesVoucherPage.navigateTo();
    }

    @Then("A exportação do relatório 'Voucher' terá somente o EC selecionado")
    public void exportWillHaveOnlySelectedEc() throws Exception {
        salesVoucherExportExcel = salesVoucherPage.getDownloadAsExcel();
        List<String> exportedEcColumn = salesVoucherExportExcel.getEcFromColumn();
        List<String> exportedEcCell = salesVoucherExportExcel.getEcsFromCell();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();
        boolean exportedOnlySelectedEc = selectedEcs.containsAll(exportedEcColumn);
        String[] uniqueEcsFromColum = exportedEcColumn.stream()
                .distinct()
                .sorted()
                .toList()
                .toArray(new String[0]);
        String[] ecsFromCell = exportedEcCell.stream()
                .filter(m -> !m.isEmpty())
                .sorted()
                .toList()
                .toArray(new String[0]);

        assertTrue("Existem ECS na coluna gerados no excel que não são iguais ao selecionado '%s': '%s'.".formatted(selectedEcs, uniqueEcsFromColum),
                exportedOnlySelectedEc);
        assertArrayEquals("Valores da célula com EC é diferente dos ECs selecionados. Column: '%s', cell: '%s'".formatted(selectedEcs.toArray(new String[0]), Arrays.toString(ecsFromCell)),
                selectedEcs.toArray(new String[0]), ecsFromCell);
    }

    @Then("A soma de vendas voucher é igual ao valor bruto autorizado")
    public void grossValueAuthorizedMatchesScreen() throws IOException, ParseException {
        double sumGross = salesVoucherExportExcel.getSumGross();
        double gross = salesVoucherExportExcel.getGross();
        double grossValuePage = pageField.from("Vendas - Voucher - Valor Bruto").getAsCurrency().doubleValue();

        assertEquals("Valor vendas voucher da tela não é igual à planilha.",
                grossValuePage, sumGross);
        assertEquals("Valor vendas voucher da tela não é igual à contagem da planilha.",
                grossValuePage, gross);
    }

    @Then("A contagem de vendas voucher é igual a Total de Vendas")
    public void countMatchesScreen() throws IOException {
        long countQuantityPre = salesVoucherExportExcel.getCountPre();
        long quantityPre = salesVoucherExportExcel.getCount();
        int quantitySalesFromPage = pageField.from("Vendas - Voucher - Total Vendas").getAsNumber();

        assertEquals("Quantidade vendas voucher da tela não é igual à planilha.",
                quantitySalesFromPage, quantityPre);
        assertEquals("Quantidade vendas voucher da tela não é igual à contagem da planilha.",
                quantitySalesFromPage, countQuantityPre);
    }
}
