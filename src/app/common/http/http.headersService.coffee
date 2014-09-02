'use strict';

HttpHeadersService = (UserSession) ->
    set: (request) ->
        @_addTokenHeader(request) if request.secure is true

    _addTokenHeader: (req) ->
        req.headers['Authorization'] = 'Bearer ' + UserSession.getAccessToken()


angular.module 'app.http'
.service "HttpHeaders", HttpHeadersService
