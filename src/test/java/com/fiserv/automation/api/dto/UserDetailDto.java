package com.fiserv.automation.api.dto;

import java.util.List;

public class UserDetailDto {
    public String userId;
    public String username;
    public String email;
    public String profileName;
    public String profileId;
    public String name;
    public String document;

    public String status;
    public String userType;

    public List<EcCodsDto> ecCods;

    @Override
    public String toString() {
        return "UserDetailDto{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", profileName='" + profileName + '\'' +
                ", profileId='" + profileId + '\'' +
                ", name='" + name + '\'' +
                ", document='" + document + '\'' +
                ", status='" + status + '\'' +
                ", userType='" + userType + '\'' +
                ", ecCods=" + ecCods +
                '}';
    }
}
