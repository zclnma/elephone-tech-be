const AWS = require('aws-sdk');

exports.handler = (event, context, callback) => {
    const cognitoidentityserviceprovider = new AWS.CognitoIdentityServiceProvider();
    const params = {
        GroupName: 'USER',
        UserPoolId: event.userPoolId,
        Username: event.userName
    };

    cognitoidentityserviceprovider.adminAddUserToGroup(params, (err, data) => {
        if (err) {
            callback(err, event)
        }
        callback(null, event);
    });
};