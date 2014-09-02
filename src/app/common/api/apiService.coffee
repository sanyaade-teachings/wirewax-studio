'use strict';


ApiService = ($http, WIREWAX_CONFIG) ->
    BASE_URL = WIREWAX_CONFIG.api_url

    getVideoData: ->
        options =
            method: 'GET'
            url: 'videos'
            data:
                secure: true

        return $http.get(BASE_URL + options.url, options.data);

angular.module 'app.api'
.factory 'ApiService', ApiService