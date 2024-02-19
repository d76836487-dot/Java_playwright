package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.Request;
import com.microsoft.playwright.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@Component
public class RequestMonitoring {
    private static int requestsWithoutResponse = 0;
    private static final Set<String> monitoredRequests = new HashSet<>();
    private static long startMonitoringRequests;
    private static String hostToMonitor;
    private static final Logger log = LoggerFactory.getLogger(RequestMonitoring.class);

    public static void startMonitoringRequests(Page page, ContractConfig contractConfig) {
        hostToMonitor = contractConfig.getUrl();
        startMonitoringRequests = (new Date()).getTime();
        requestsWithoutResponse = 0;
        page.onRequest(RequestMonitoring::newRequest);
        page.onResponse(RequestMonitoring::gotResponse);
    }

    private static synchronized void newRequest(Request request) {
        if (!request.url().startsWith(hostToMonitor)) return;

        monitoredRequests.add(request.url());
        requestsWithoutResponse++;

        long lapseTime = ((new Date()).getTime() - startMonitoringRequests) / 1000;
        log.debug(">> %s %s at %d seg".formatted(request.method(), request.url(), lapseTime));
    }

    private static synchronized  void gotResponse(Response response) {
        if (!monitoredRequests.contains(response.url())) return;

        requestsWithoutResponse--;

        long lapseTime = ((new Date()).getTime() - startMonitoringRequests) / 1000;
        log.debug("<<%d %s at %d seg".formatted(response.status(), response.url(), lapseTime));
    }

    public static void ensureNoFlyingRequests() {
        if (!waitUntilTrue(() -> requestsWithoutResponse == 0)) {
            log.warn(String.format("Ainda existem %d requisições HTTP sem respostas. Seus testes podem ter variação e falsos positivos", requestsWithoutResponse));
        }
        log.debug("Saindo do monitor com %d requisições HTTP sem respostas".formatted(requestsWithoutResponse));
    }
}
