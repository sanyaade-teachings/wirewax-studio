'use strict';


ProjectsController = ($scope, ProjectsDataSource) ->

    console.log ProjectsDataSource.collection

angular.module 'projects.controllers'
.controller 'ProjectsController', ProjectsController
