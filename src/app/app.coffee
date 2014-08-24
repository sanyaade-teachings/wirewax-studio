angular.module 'wirewaxStudio', [
    'app.core'

    #   Modules
    'videos.module'
]

.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise("/studio");

    $stateProvider
    .state "studio",
        url: '/studio'
        templateUrl: 'templates/studio/furniture/studioCore.html'
        controller: 'VideosController'
        controllerAs: 'Videos'