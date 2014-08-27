'use strict';

HttpHeadersService = ($log, AuthenticationService) ->
    set: (req) ->
        @_addTokenHeader(req) if req.secure is true

        req

    _addTokenHeader: (req) ->
        req.headers['Authorization'] = 'Bearer ' + AuthenticationService.getAccessToken()


angular.module 'http.services'
.service "HttpHeaders", HttpHeadersService
