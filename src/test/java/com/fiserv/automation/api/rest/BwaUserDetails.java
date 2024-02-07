package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.util.BwaHeader;
import org.springframework.stereotype.Component;
import retrofit2.Response;

@Component
public class BwaUserDetails {
    public UserDetailDto getUserDetails(String apiAccessToken) throws Exception {
        BwaRest bwaSomething = BwaHeader.getBwaRest(apiAccessToken);
        Response<UserDetailDto> execute = bwaSomething.userDetail().execute();
        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter detalhes do usuário %s: %s", execute.code(), execute.message()));
        }
        return execute.body();
    }
}
