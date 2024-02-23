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
            throw new Exception(
                    String.format("Erro ao obter detalhes do usuário %s: %s", execute.code(), execute.message()));
        }
        return execute.body();
    }
}
