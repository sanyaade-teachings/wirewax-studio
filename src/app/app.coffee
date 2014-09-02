angular.module 'wirewaxStudio', [
    'app.core'

    #   Modules  #
    'videos.module'
    'projects.module'
]

.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise("/studio");

    $stateProvider
    .state "studio",
        url: '/studio'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controller: 'VideosController'

    .state "projects",
        url: '/projects'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controller: 'ProjectsController'


#       Add the HTTP interceptor
.config ($httpProvider) ->
    $httpProvider.interceptors.push "HttpInterceptor"