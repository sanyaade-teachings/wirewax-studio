'use strict';

AuthenticationService = ($cookieStore, ApiService) ->
    authenticateUser: (credentials) ->
        ApiService.getAccessToken(credentials)
        .success (data) ->
            $cookieStore.put 'wireWax', data
        .error (data) ->
            console.log data

    isAuthenticated: ->

    login: ->

    logout: ->

    hasValidAccessToken: ->

    refreshAccessToken: ->


angular.module 'wirewaxStudio'
.service 'AuthenticationService', AuthenticationService