angular.module 'wirewaxStudio', [
    'app.core'
    'login.module'
    'videos.module'
    'projects.module'
]

.config ($stateProvider, $urlRouterProvider, USER_ROLES) ->
    $urlRouterProvider.otherwise("/studio");

    $stateProvider
        .state "login",
            url: '/'
            templateUrl: 'templates/login/studioLogin.html'
            controller: 'LoginController'
            data =
                authorised_roles: [USER_ROLES.all]

        .state "studio",
            url: '/studio'
            templateUrl: 'templates/studio/furniture/studioCore.html'
            controller: 'VideosController'
            data =
                authorised_roles: [USER_ROLES.all]

        .state "projects",
            url: '/projects'
            templateUrl: 'templates/studio/furniture/studioCore.html'
            controller: 'ProjectsController'
            data =
                authorised_roles: [USER_ROLES.all]