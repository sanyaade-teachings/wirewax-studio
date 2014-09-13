'use strict';

UserAuthentication = ($q, $cookieStore, UserSession, TokenApi) ->
    authenticateUser: (data) ->
        TokenApi.getAccessToken(data)

#    isAuthorised: (roles) ->

    isAuthenticated: ->
        deferred = $q.defer()
        cookie = $cookieStore.get("wirewax")
        if cookie
            if cookie.expires * 1000 > new Date().getTime()
                true
            else
                if @_hasRefreshToken(cookie)
                    @_refreshAccessToken()
                else
                    UserSession.destroy()

                    deferred.reject()
                    deferred.promise
        else
            UserSession.destroy()

            deferred.reject()
            deferred.promise


    getAccessToken: ->
        $cookieStore.get("wirewax").access_token

    _refreshAccessToken: ->
        promise = TokenApi.refreshAccessToken($cookieStore.get "wirewax")

        promise.then ((data)->
            $cookieStore.put 'wirewax', data
        ), (data) ->
            console.error 'refresh token: ', data

    _hasRefreshToken: (cookie) ->
        cookie.refresh_token

angular.module 'app.user'
.service 'UserAuthentication', UserAuthentication