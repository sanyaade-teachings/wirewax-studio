'use strict';

VideosDataSource = ($rootScope, VideoModel, BaseDataSource, ApiService) ->
    class VideosDataSource extends BaseDataSource

        constructor: ->
            options =
                name: 'VIDEOS_DATA_SOURCE'
                model: VideoModel
            super(options)

        _initialise: ->
            ApiService.getVideoData()
                .success(@_createItems)
                .error(@_error)

        _hasInitialised: ->
            $rootScope.$emit 'videoDataSource.loaded'

        _hasErrored: ->
            $rootScope.$emit 'videoDataSource.error'


    new VideosDataSource()

angular.module 'app.dataSources'
.factory 'VideosDataSource', VideosDataSource
