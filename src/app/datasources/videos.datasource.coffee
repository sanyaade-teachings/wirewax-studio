'use strict';

VideosDataSource = (BaseDataSource) ->
    class VideosDataSource extends BaseDataSource
        constructor: ->
            options =
                arr: [1, 2, 3]
                name: 'Videos DataSource'
            super(options)
            console.log 'VideosDataSource Init...'

    new VideosDataSource()

angular.module 'app.dataSources'
.factory 'VideosDataSource', VideosDataSource
