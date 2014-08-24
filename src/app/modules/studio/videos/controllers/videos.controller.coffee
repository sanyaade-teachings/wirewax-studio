'use strict';


VideosController = ($scope, ApiService) ->
    console.log(ApiService.getData())

angular.module 'videos.controllers'
.controller 'VideosController', VideosController
