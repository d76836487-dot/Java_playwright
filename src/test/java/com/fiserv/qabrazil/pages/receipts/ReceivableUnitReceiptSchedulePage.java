package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
@Component("Agenda de Recebimentos por UR")
public class ReceivableUnitReceiptSchedulePage extends CheckedBasePage {

    public ReceivableUnitReceiptSchedulePage() {
        super(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").hoverOver();
        pageField.from("Menu Lateral - Agenda de Recebimentos UR").click();
        page.waitForURL(Pattern.compile("^.*/AgendaRecebimentosUR$"));
        waitUntilTrue(360, this::hasNoLoadingBars);
    }

    public double sumFutureValueAllBrands() {
        pageField.from("Agenda de Recebimentos por UR - Botão Detalhe totais por bandeira").click();

        PageField valuesAllBrands = pageField.from("Agenda de Recebimentos por UR - Modal Detalhe totais por bandeira - Valores");
        waitUntilTrue(() -> valuesAllBrands.getCount() > 0);

        List<Currency> valuesAsCurrency = valuesAllBrands.getAllAsCurrency();

        if (valuesAsCurrency.size() % 3 != 0) {
            throw new RuntimeException("O teste esperava que bandeiras fossem múltiplas de três. Um para soma, outro débito e outro crédito. É necessário corrigir este teste");
        }

        return Stream.iterate(0, n -> n < valuesAsCurrency.size(), i -> i + 3)
                .map(valuesAsCurrency::get)
                .mapToDouble(Currency::doubleValue)
                .sum();
    }
}
