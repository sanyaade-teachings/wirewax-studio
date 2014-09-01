'use strict';

AuthenticationService = ($http, TokenApi) ->

    authenticateUser: (data) ->
        TokenApi.getAccessToken(data)

    logout: ->
        TokenApi.destroy()
        console.log 'logout'


angular.module 'wirewaxStudio'
.service 'AuthenticationService', AuthenticationService