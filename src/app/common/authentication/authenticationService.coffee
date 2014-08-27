'use strict';

AuthenticationService = ($cookieStore) ->
    authenticateUser: (credentials) ->
        ApiService.getAccessToken(credentials)
        .success (data) ->
            $cookieStore.put 'wireWax', data
        .error (data) ->
            console.log data

    isAuthenticated: ->


    getAccessToken: ->
        $cookieStore.get('wireWax')['access_token']

    login: ->

    logout: ->
        console.log 'logout!'

    hasValidAccessToken: ->
        cookie = $cookieStore.get 'wireWax'
        if cookie
            if cookie.expires * 1000 > new Date().getTime()
                true
            else
                if @_hasRefreshToken(cookie) then @refreshAccessToken() else @logout()
        else
            @logout()
            false

    refreshAccessToken: ->
        ApiService.refreshAccessToken($cookieStore.get 'wireWax')
        .success (data) ->
            $cookieStore.put 'wireWax', data
        .error (data) ->
            console.error data


    _hasRefreshToken: (cookie) ->
        cookie.refresh_token


angular.module 'wirewaxStudio'
.service 'AuthenticationService', AuthenticationService