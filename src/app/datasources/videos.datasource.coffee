'use strict';

VideosDataSource = (VideoModel, BaseDataSource) ->
    class VideosDataSource extends BaseDataSource
        constructor: ->
            options =
                name: 'VIDEOS_DATA_SOURCE'
                model: VideoModel
            super(options)

    new VideosDataSource()

angular.module 'app.dataSources'
.factory 'VideosDataSource', VideosDataSource
