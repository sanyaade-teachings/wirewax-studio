'use strict';

angular.module 'http.services'
.factory "HttpInterceptor", ($q, HttpHeaders, $log) ->
    request: (request) ->
        HttpHeaders.set(request)

        $log.debug 'req: ' + request.url, request

        request

    response: (response) ->
        $log.debug 'res: ' + response.status, response

        response

    responseError: (response) ->
        $log.error 'res: ' + response.status, response

        response