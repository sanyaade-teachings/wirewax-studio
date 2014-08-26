'use strict';


VideosController = ($scope, AuthenticationService, VideosDataSource) ->

    AuthenticationService.authenticateUser(
        username: 'twig2let'
        password: 'Tw1g2l3t!'
    )

    VideosDataSource.say();
    console.log VideosDataSource.collection


angular.module 'videos.controllers'
.controller 'VideosController', VideosController
