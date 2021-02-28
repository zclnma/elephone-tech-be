package com.elephone.management.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.cognitoidentityprovider.CognitoIdentityProviderClient;
import software.amazon.awssdk.services.cognitoidentityprovider.model.*;

@Service
public class CognitoService {

    @Value("${cloud.aws.cognito.userpoolId}")
    private String userpoolId;

    private final CognitoIdentityProviderClient cognitoClient;

    @Autowired
    public CognitoService(CognitoIdentityProviderClient cognitoClient) {
        this.cognitoClient = cognitoClient;
    }

    public void removeUserFromGroup(String username, String group) {
        AdminRemoveUserFromGroupRequest request = AdminRemoveUserFromGroupRequest.builder()
                .userPoolId(userpoolId)
                .username(username)
                .groupName(group)
                .build();

        cognitoClient.adminRemoveUserFromGroup(request);
    }

    public void addUserToGroup(String username, String group) {

        AdminAddUserToGroupRequest request = AdminAddUserToGroupRequest.builder()
                .userPoolId(userpoolId)
                .username(username)
                .groupName(group)
                .build();

        cognitoClient.adminAddUserToGroup(request);
    }

    public void setPassword(String username, String password) {
        AdminSetUserPasswordRequest adminSetUserPasswordRequest = AdminSetUserPasswordRequest.builder()
                .userPoolId(userpoolId)
                .username(username)
                .password(password)
                .permanent(true)
                .build();

        cognitoClient.adminSetUserPassword(adminSetUserPasswordRequest);
    }

    public UserType createUser(String username, String password, String group) {

        AdminCreateUserRequest request = AdminCreateUserRequest.builder()
                .userPoolId(userpoolId)
                .username(username)
                .temporaryPassword(password)
                .messageAction("SUPPRESS")
                .build();

        AdminCreateUserResponse response = cognitoClient.adminCreateUser(request);
        UserType cognitoUser = response.user();

        setPassword(username, password);
        addUserToGroup(username, group);

        return cognitoUser;
    }


    public void disableUser(String username) {
        AdminDisableUserRequest request = AdminDisableUserRequest.builder()
                .username(username)
                .userPoolId(userpoolId)
                .build();

        cognitoClient.adminDisableUser(request);
    }

    public void enableUser(String username) {
        AdminEnableUserRequest request = AdminEnableUserRequest.builder()
                .username(username)
                .userPoolId(userpoolId)
                .build();

        cognitoClient.adminEnableUser(request);
    }

    public void deleteUser(String username) {
        AdminDeleteUserRequest request = AdminDeleteUserRequest
                .builder()
                .username(username)
                .userPoolId(userpoolId)
                .build();

        cognitoClient.adminDeleteUser(request);
    }

}
