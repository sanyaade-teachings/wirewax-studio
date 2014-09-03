"use strict"


Controller = (UserSession)->
    submit: ->
        data =
            username: this.username
            password: this.password

        promise = UserSession.authenticateUser(data)

        promise.success((data, status, headers, config) ->
            UserSession.create(data)
        )
        promise.error ((data, status, headers, config) ->
            alert 'login failed'
        )

LoginForm = ->
    link = (scope, element, attrs) ->

    link: link
    restrict: 'E'
    templateUrl: 'templates/login/loginForm.html'
    controllerAs: 'Login'
    controller: Controller


angular.module("login.directives")
.directive "wwLoginFormDirective", LoginForm