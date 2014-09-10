'use strict';

BaseDataSource = () ->
    class BaseDataSource
        constructor: (options) ->
            @name = options.name
            @model = options.model
            @initialised = false
            @inError = false

            @collection = []

            @_initialise()

        _createItems: (data) =>
            _.each(data, (dataItem) =>
                @collection.push new @model dataItem
            )
            @initialised = true
            @_hasInitialised()

        _error: (data) =>
            @initialised = true
            @inError = true
            @_hasErrored()

            console.error data

        destroy: ->
            @collection.length = 0
            @initialised = false;
            @inError = false;


angular.module 'app.dataSources'
.factory 'BaseDataSource', BaseDataSource