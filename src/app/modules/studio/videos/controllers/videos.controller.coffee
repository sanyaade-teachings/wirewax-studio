'use strict';


VideosController = (AuthenticationService) ->

    AuthenticationService.authenticateUser(
        username: 'twig2let'
        password: 'Tw1g2l3t!'
    )

angular.module 'videos.controllers'
.controller 'VideosController', VideosController
