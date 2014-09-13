'use strict';


VideosController = ($rootScope, $scope, VideosDataSource, BaseController) ->
    new class VideosController extends BaseController

        constructor: ->
            options =
                $scope: $scope
                name: 'VIDEOS_CONTROLLER'
            super(options)

        _bindEventListeners: ->
            @eventListeners.push(
                $rootScope.$on('videoDataSource.loaded', ->

                )
                $rootScope.$on('videoDataSource.error', ->

                )
            )
            super()

angular.module 'videos.controllers'
.controller 'VideosController', VideosController

