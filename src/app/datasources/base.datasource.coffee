'use strict';

BaseDataSource = ($log)->
    class BaseDataSource
        constructor: (@options) ->
            @collection = @options.arr
            @name = @options.name

        say: ->
            alert @name;

angular.module 'app.dataSources'
.factory 'BaseDataSource', BaseDataSource