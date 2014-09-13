'use strict';


VideosController = ($rootScope, $scope, $state, VideosDataSource, BaseController) ->
    new class VideosController extends BaseController

        constructor: ->
            options =
                $scope_dep: $scope
                $state_dep: $state
                name: 'VIDEOS_CONTROLLER'
                route_state: 'studio.videos'
            super(options)


        _bindEventListeners: ->
            @eventListeners.push(
              $rootScope.$on('videoDataSource.loaded', ->
                  console.log 'videoDataSource.loaded'
              )
              $rootScope.$on('videoDataSource.error', ->
                  console.log 'videoDataSource.error'
              )
            )
            super()

angular.module 'videos.controllers'
.controller 'VideosController', VideosController

