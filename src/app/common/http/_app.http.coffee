'use strict';

angular.module 'app.http', []

.config ($httpProvider) ->
    $httpProvider.interceptors.push 'HTTPInterceptor'