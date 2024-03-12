package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.UserDetailDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import retrofit2.Call;
import retrofit2.Response;

@Component
public class BwaUserDetails extends BwaBase {
    private static final Logger log = LoggerFactory.getLogger(BwaUserDetails.class);

    public UserDetailDto getUserDetails(String apiAccessToken) throws Exception {
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);
        Call<UserDetailDto> userDetailDtoCall = bwaRest.userDetail();
        Response<UserDetailDto> execute = userDetailDtoCall.execute();
        if (execute.code() != 200) {
            String errorBody = "";
            if (execute.errorBody() != null) {
                errorBody = execute.errorBody().string();
            }

            log.info("request url: %s".formatted(userDetailDtoCall.request().url()));
            log.info("request headers: %s".formatted(userDetailDtoCall.request().headers()));
            log.info("access_token: %s".formatted(apiAccessToken));
            log.info("headers: %s".formatted(execute.headers()));
            log.info("errorBody: %s".formatted(errorBody));

            throw new Exception(
                    String.format("Erro ao obter detalhes do usuário %s: %s. %s", execute.code(), execute.message(), errorBody));
        }
        return execute.body();
    }
}
