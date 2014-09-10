'use strict';


VideosController = ($scope, VideosDataSource) ->

    eventListeners = []

    $scope.$on('$destroy', ->
        _.each(eventListeners, (event) ->
            event()
        )
    )

angular.module 'videos.controllers'
.controller 'VideosController', VideosController
