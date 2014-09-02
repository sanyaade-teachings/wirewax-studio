'use strict';

AuthenticationService = (UserSession, TokenApi) ->

    authenticateUser: (data) ->
        TokenApi.getAccessToken(data)

    logout: ->
        UserSession.destroy()
        console.log 'logout'

    isAuthorised: (roles) ->



angular.module 'app.user'
.service 'AuthenticationService', AuthenticationService