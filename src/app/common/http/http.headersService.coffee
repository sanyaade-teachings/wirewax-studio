'use strict';

HttpHeadersService = (UserAuthentication) ->
    set: (request) ->
        @_addTokenHeader(request) if request.secure is true

    _addTokenHeader: (req) ->
        req.headers['Authorization'] = 'Bearer ' + UserAuthentication.getAccessToken()


angular.module 'app.http'
.service "HttpHeaders", HttpHeadersService
