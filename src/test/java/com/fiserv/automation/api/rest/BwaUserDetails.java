package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.UserDetailDto;
import org.springframework.stereotype.Component;
import retrofit2.Response;

@Component
public class BwaUserDetails extends BwaBase {

    public UserDetailDto getUserDetails(String apiAccessToken) throws Exception {
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);
        Response<UserDetailDto> execute = bwaRest.userDetail().execute();
        if (execute.code() != 200) {
            String errorBody = "";
            if (execute.errorBody() != null) {
                errorBody = execute.errorBody().string();
            }

            throw new Exception(
                    String.format("Erro ao obter detalhes do usuário %s: %s. %s", execute.code(), execute.message(), errorBody));
        }
        return execute.body();
    }
}
