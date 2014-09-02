'use strict';

AuthenticationService = (UserSession, TokenApi) ->

    authenticateUser: (data) ->
        TokenApi.getAccessToken(data)

    logout: ->
        UserSession.destroy()
        console.log 'logout'


angular.module 'app.user'
.service 'AuthenticationService', AuthenticationService