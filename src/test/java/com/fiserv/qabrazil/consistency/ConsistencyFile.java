package com.fiserv.qabrazil.consistency;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.swing.filechooser.FileSystemView;
import java.io.*;
import java.util.Arrays;
import java.util.List;

@ScenarioComponent
public class ConsistencyFile {
    private static final String PATH = FileSystemView.getFileSystemView().getDefaultDirectory().getPath() + "\\consistency-portal";
    private static final Logger log = LoggerFactory.getLogger(ConsistencyFile.class);

    private String filename;

    private SavedInfoForConsistency anyDayGeneralInfo;

    public SavedInfoForConsistency getAnyDayGeneralInfo() {
        return anyDayGeneralInfo;
    }

    @Autowired
    ContractConfig contractConfig;

    public void loadForOneDay(String screen, int weekdays) throws IOException {
        File directory = new File(PATH);
        File[] listFiles = directory.listFiles();

        if (listFiles == null) return;

        String dayFilename = DateUtil.addSubtractForWeekdays(weekdays, "yyyyMMdd");
        filename = "%s_%s_%s.json".formatted(contractConfig.getActiveProfiles(), screen, dayFilename);
        List<File> files = Arrays.stream(listFiles)
                .filter(file -> file.getName().equals(filename))
                .toList();

        log.info("Carregando %s. Encontrou '%s'".formatted(filename, files.isEmpty()? "Não": "Sim"));

        if (files.isEmpty()) {
            String day = DateUtil.addSubtractForWeekdays(weekdays, "dMyyyy");
            anyDayGeneralInfo = SavedInfoForConsistency.buildNull(day);
        } else {
            anyDayGeneralInfo = loadFile(files.get(0));
        }

    }

    private SavedInfoForConsistency loadFile(File file) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(file));
        return new Gson().fromJson(br, SavedInfoForConsistency.class);
    }

    public void saveFile() {
        Gson gson = new Gson();
        String json = gson.toJson(anyDayGeneralInfo);

        // Write JSON to a file
        try (FileWriter fileWriter = new FileWriter("%s\\%s".formatted(PATH, filename))) {
            fileWriter.write(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
