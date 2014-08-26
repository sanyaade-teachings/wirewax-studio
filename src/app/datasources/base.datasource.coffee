'use strict';

BaseDataSource = (ApiService) ->
    class BaseDataSource
        constructor: (options) ->
            @name = options.name

            @model = options.model
            @collection = []

            @inError = false

            @initialise()

        initialise: ->
            ApiService.getVideoData()
            .success @_createItems
            .error @_error

        _createItems: (data) =>
            @collection.push new @model(data)

        _error: (data) =>
            @collection.push new @model()
            @error = true
            console.error data

angular.module 'app.dataSources'
.factory 'BaseDataSource', BaseDataSource