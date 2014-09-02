'use strict';


Intercepetor = ($q, $injector, $log, HttpHeaders, UserSession) ->
    request: (request) ->
        $log.debug 'req: ' + request.url, request

        deferred = $q.defer()
        if request.secure is true
            $q.when(UserSession.isAuthenticated()).then (->
                HttpHeaders.set(request)
                deferred.resolve(request)
                deferred.promise
            ), ->
                deferred.reject(request)
                deferred.promise
        else
            request

    response: (response) ->
        $log.debug 'res: ' + response.status, response

        response

    responseError: (response) ->
        $log.error 'res: ' + response.status, response

        $q.reject response

angular.module 'app.http'
.factory 'HttpInterceptor', Intercepetor