'use strict';

BaseController = () ->
    class BaseController

        constructor: (options) ->
            @$scope = options.$scope
            @name = options.name;

            @eventListeners = []

            @_bindEventListeners()


        _bindEventListeners: ->
            @$scope.$on('$destroy', =>
                _.each(@eventListeners, (event) ->
                    event()
                )
                @eventListeners.length = 0
            )

angular.module 'app.bases'
.factory 'BaseController', BaseController