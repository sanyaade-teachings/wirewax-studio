'use strict';


ProjectsController = ($scope, ProjectsDataSource) ->

    ProjectsDataSource.say();
    console.log ProjectsDataSource.collection


angular.module 'projects.controllers'
.controller 'ProjectsController', ProjectsController
