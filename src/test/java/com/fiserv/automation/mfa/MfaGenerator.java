package com.fiserv.automation.mfa;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.util.Config;
import de.taimos.totp.TOTP;
import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MfaGenerator {

    @Autowired
    private ContractConfig contractConfig;

    public String getToken() {
        String secretKey = Config.SecretKey;//contractConfig.getActiveUserProfile().mfaSecretKey();

        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);

        return TOTP.getOTP(hexKey);
    }
}
