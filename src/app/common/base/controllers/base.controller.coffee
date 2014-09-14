'use strict';

BaseController = () ->
    class BaseController

        constructor: (options) ->
            @$scope = options.$scope_dep
            @$state = options.$state_dep

            @route_state = options.route_state
            @name = options.name;

            @eventListeners = []

            @_bindEventListeners()
            @_navigateToState()


        _bindEventListeners: ->
            @$scope.$on('$destroy', =>
                _.each(@eventListeners, (event) ->
                    event()
                )
                @eventListeners.length = 0
            )

        _navigateToState: ->
            if @route_state
                @$state.transitionTo(@route_state);


angular.module 'app.bases'
.factory 'BaseController', BaseController