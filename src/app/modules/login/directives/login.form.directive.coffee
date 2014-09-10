"use strict"


Controller = (UserAuthentication, UserSession)->
    submit: ->
        data =
            username: this.username
            password: this.password

        promise = UserAuthentication.authenticateUser(data)
        promise.success((data) ->
            UserSession.create(data)
        )
        promise.error ((data) ->
            alert 'login failed'
        )

LoginForm = ->
    link = () ->

    link: link
    restrict: 'E'
    templateUrl: 'templates/login/loginForm.html'
    controllerAs: 'Login'
    controller: Controller


angular.module("login.directives")
.directive "wwLoginFormDirective", LoginForm