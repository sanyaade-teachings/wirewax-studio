'use strict';

UserAuthentication = ($cookieStore, TokenApi) ->
    authenticateUser: (data) ->
        TokenApi.getAccessToken(data)

    isAuthorised: (roles) ->

    isAuthenticated: ->
        cookie = $cookieStore.get("wirewax")
        if cookie
            if cookie.expires * 1000 > new Date().getTime()
                true
            else
                if @_hasRefreshToken(cookie)
                    @_refreshAccessToken()
                else
                    false
        else
            false

    getAccessToken: ->
        $cookieStore.get("wirewax").access_token

    _refreshAccessToken: ->
        promise = TokenApi.refreshAccessToken($cookieStore.get "wirewax")
        promise.success (data) ->
            $cookieStore.put 'wirewax', data
        .error (data) ->
            console.error 'refresh token: ', data

    _hasRefreshToken: (cookie) ->
        cookie.refresh_token

angular.module 'app.user'
.service 'UserAuthentication', UserAuthentication