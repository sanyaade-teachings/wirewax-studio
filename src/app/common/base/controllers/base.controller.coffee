'use strict';

BaseController = () ->
    class BaseController

        @property = 'hello'

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
            )


angular.module 'app.bases'
.factory 'BaseController', BaseController