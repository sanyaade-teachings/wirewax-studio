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
        controllerAs: 'LoginCtrl'
        controller: 'LoginController'
        data =
            authorised_roles: [USER_ROLES.all]

    .state "studio",
        url: '/studio'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controllerAs: 'VideosCtrl'
        controller: 'VideosController'
        data:
            authorised_roles: [USER_ROLES.all]

    .state "studio.videos",
        templateUrl: 'templates/studio/videos/videosView.html'
        data:
            authorised_roles: [USER_ROLES.all]

    .state "projects",
        url: '/projects'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controllerAs: 'ProjectsCtrl'
        controller: 'ProjectsController'
        data =
            authorised_roles: [USER_ROLES.all]