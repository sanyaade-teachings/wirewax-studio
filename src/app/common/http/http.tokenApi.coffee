'use strict';


# Use the injector here to avoid circular with $http

TokenApi = ($injector, WIREWAX_CONFIG) ->
    BASE_URL = WIREWAX_CONFIG.api_url

    getAccessToken: (data) ->
        $injector.invoke ($http) ->
            options =
                method: 'POST'
                url: 'access_token'
                data:
                    grant_type: 'password'
                    client_id: WIREWAX_CONFIG.client_id
                    client_secret: WIREWAX_CONFIG.client_secret
                    username: data.username
                    password: data.password

            return $http.post(BASE_URL + options.url, options.data);

    refreshAccessToken: (data) ->
        $injector.invoke ($http) ->
            options =
                method: 'POST'
                url: 'access_token'
                data:
                    grant_type: 'refresh_token'
                    refresh_token: data.refresh_token
                    client_id: WIREWAX_CONFIG.client_id
                    client_secret: WIREWAX_CONFIG.client_secret

            return $http.post(BASE_URL + options.url, options.data);

angular.module 'wirewaxStudio'
.factory 'TokenApi', TokenApi