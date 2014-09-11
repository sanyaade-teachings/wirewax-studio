'use strict';

ProjectsDataSource = ($rootScope, BaseDataSource) ->
    new class extends BaseDataSource
        constructor: ->
            options =
                arr: ['a', 'b', 'c']
                name: 'Projects DataSource'
            super(options)

        _initialise: ->

        _hasInitialised: ->
            $rootScope.$emit 'projectsDataSource.loaded'

        _hasErrored: ->
            $rootScope.$emit 'projectsDataSource.error'


angular.module 'app.dataSources'
.factory 'ProjectsDataSource', ProjectsDataSource
