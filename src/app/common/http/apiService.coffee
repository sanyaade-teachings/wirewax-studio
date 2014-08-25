'use strict';


ApiService = ($http, wirewaxConstants) ->
    base_url = wirewaxConstants.api_url

    getAccessToken: (data) ->
        options =
            method: 'POST'
            url: 'access_token'
            data:
                grant_type: 'password'
                client_id: wirewaxConstants.client_id
                client_secret: wirewaxConstants.client_secret
                username: data.username
                password: data.password

        return $http.post(base_url + options.url, options.data);


angular.module 'wirewaxStudio'
.factory 'ApiService', ApiService