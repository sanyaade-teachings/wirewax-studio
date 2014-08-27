'use strict';


ApiService = ($http, WirewaxConstants) ->
    BASE_URL = WirewaxConstants.api_url

    getAccessToken: (data) ->
        options =
            method: 'POST'
            url: 'access_token'
            data:
                grant_type: 'password'
                client_id: WirewaxConstants.client_id
                client_secret: WirewaxConstants.client_secret
                username: data.username
                password: data.password

        return $http.post(BASE_URL + options.url, options.data);

    refreshAccessToken: (data) ->
        options =
            method: 'POST'
            url: 'access_token'
            data:
                grant_type: 'refresh_token'
                refresh_token: data.refresh_token
                client_id: WirewaxConstants.client_id
                client_secret: WirewaxConstants.client_secret

        return $http.post(BASE_URL + options.url, options.data);


    getVideoData: ->
        options =
            method: 'GET'
            url: 'videos'
            data:
                secure: true

        return $http.get(BASE_URL + options.url, options.data);

angular.module 'wirewaxStudio'
.factory 'ApiService', ApiService