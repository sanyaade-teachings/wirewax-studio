'use strict';

ProjectsDataSource = (BaseDataSource) ->
    class ProjectsDataSource extends BaseDataSource
        constructor: ->
            options =
                arr: ['a', 'b', 'c']
                name: 'Projects DataSource'
            super(options)
            console.log 'ProjectsDataSource Init...'

    new ProjectsDataSource()

angular.module 'app.dataSources'
.factory 'ProjectsDataSource', ProjectsDataSource
