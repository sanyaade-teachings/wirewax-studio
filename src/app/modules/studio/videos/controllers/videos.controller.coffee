'use strict';


VideosController = ($scope, $log, VideosDataSource, AuthenticationService, UserSession) ->

    AuthenticationService.authenticateUser(
            username: 'twig2let'
            password: 'Tw1g2l3t!'
        ).success (data) ->
            $log.debug 'authenticated user'
            UserSession.create(data)


angular.module 'videos.controllers'
.controller 'VideosController', VideosController
