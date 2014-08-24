'use strict';


ApiService = ->
    name: 'ApiService'

    getData: ->
        [1, 2, 3]


angular.module 'wirewaxStudio'
.factory 'ApiService', ApiService