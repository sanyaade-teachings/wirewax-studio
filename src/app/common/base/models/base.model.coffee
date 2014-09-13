'use strict';

BaseModel = () ->
    class BaseModel

        constructor: () ->
            @_inError = false
            @_isLoading = false # set is loading true when requesting additional model data e.g. external video data

        _setInError: ->
            @_inError = true

        _setIsLoading: ->
            @_isLoading = true

angular.module 'app.bases'
.factory 'BaseModel', BaseModel